// conv2d.v control path
module conv2d_ctrl #(
    parameter DTYPE=8,      // width of model dtype (int8, bfloat16)
    parameter NSTRIPE=3,   // number of vertical stripes to evaluate in parallel
    parameter SDEPTH=1024,    // stripe data input buffer depth, address width = $clog2(SDEPTH)
    parameter WDEPTH=1024,     // weight ROM depth
    parameter IHEIGHT=28,   // input tensor height
    parameter IWIDTH=28,    // input tensor width
    parameter ICHAN=8,     // number of input channels
    parameter OHEIGHT=21,   // output tensor height
    parameter OWIDTH=26,    // output tensor width
    parameter OCHAN=8,     // number of output channels, evaluated in parallel
    parameter KHEIGHT=3,    // filter kernel height
    parameter KWIDTH=3,     // filter kernel width
    parameter STRIDE=1,     // x and y stride
    parameter PREV_NSTRIPE=1,
    parameter PREV_NCOL=1,
    parameter NROW=1,
    parameter NCOL=1,
    parameter OCOL=1,
    parameter OVERLAP=1,
    parameter RELU=1,
    parameter REGZ=32,
    parameter SADDR=$clog2(SDEPTH)
) (
    input clk, reset,
    output reg clr_acc,
    output reg [4:0] alu_op,
    output reg [NSTRIPE*$clog2(SDEPTH)-1:0] stripe_wa,
    output reg [NSTRIPE-1:0] stripe_wen,
    output reg [$clog2(SDEPTH)-1:0] stripe_ra,
    output reg [ICHAN-1:0] ichan_sel, // 1-hot channel select
    output reg [NSTRIPE-1:0] stripe_sel, // 1-hot select for tdata_o
    input s_axis_tvalid,
    input [$clog2(IWIDTH)-1:0] s_col,
    input [$clog2(IHEIGHT)-1:0] s_row,
    output reg [$clog2(OWIDTH)-1:0] m_col,
    output reg [$clog2(OHEIGHT)-1:0] m_row,
    output reg m_axis_tvalid,
    output reg [$clog2(WDEPTH)-1:0] weight_ra
);

reg s_valid_q;
reg [$clog2(IWIDTH)-1:0] s_col_q;
reg [$clog2(IHEIGHT)-1:0] s_row_q;
always @(posedge clk) begin
    s_valid_q <= s_axis_tvalid;
    s_col_q <= s_col;
    s_row_q <= s_row;
end

genvar i;
wire [SADDR-1:0] stripe_waddr[NSTRIPE-1:0];
generate
    for (i=0;i<NSTRIPE;i=i+1) begin
        assign stripe_waddr[i] = stripe_wa[i*SADDR +: SADDR];
        always @ (posedge clk) begin
            stripe_wa[i*SADDR+SADDR-1:i*SADDR] <= (s_row_q%NROW)*(NCOL+OVERLAP)+(s_col_q-i*NCOL);
            if ((s_col_q >= i*NCOL) && (s_col_q < i*NCOL+NCOL+OVERLAP))
                stripe_wen[i] <= s_valid_q;
            else
                stripe_wen[i] <= 1'b0;
        end
    end
endgenerate

reg [$clog2(IWIDTH)-1:0] icount;
reg start_row;
always @ (posedge clk) begin
    if (reset) begin
        icount <= 'd0;
        start_row <= 'd0;
    end
    else if (s_valid_q) begin
        if (icount==IWIDTH-1) begin
            icount <= 'd0;
            if ((STRIDE==1) && (s_row_q>=KHEIGHT-1))
                start_row <= 1'b1;
            else if ((STRIDE==2) && ((s_row_q>=KHEIGHT-1) && ((s_row_q%2)!=(KHEIGHT%2))))
                start_row <= 1'b1;
            else
                start_row <= 1'b0;
        end
        else begin
            icount <= icount+'d1;
            start_row <= 1'b0;
        end
    end
    else begin
        start_row <= 1'b0;
    end
end

// dot product FSM
reg clr_acc0,clr_acc1,clr_acc2,clr_acc3,clr_acc4;
always @(posedge clk) begin
    clr_acc1 <= clr_acc0;
    clr_acc2 <= clr_acc1;
    clr_acc3 <= clr_acc2;
    clr_acc4 <= clr_acc3;
    clr_acc <= clr_acc4;
end

reg start_alu,start_alu0,start_alu1,start_alu2,start_alu3;
always @(posedge clk) begin
    start_alu1 <= start_alu0;
    start_alu2 <= start_alu1;
    start_alu3 <= start_alu2;
    start_alu <= start_alu3;
end

reg [2:0] state;
reg [$clog2(KHEIGHT):0] ky;
reg [$clog2(KWIDTH):0] kx;
reg [$clog2(ICHAN):0] ic;
reg [$clog2(OWIDTH):0] ocol,ocol_pipe;
reg [$clog2(OHEIGHT):0] orow,orow_pipe;
reg [ICHAN-1:0] ichan_sel0, ichan_sel1;
reg [4:0] wait_state;
localparam DP_IDLE = 'd0;
localparam DP_INIT = 'd1;
localparam DP_RUN = 'd2;
localparam DP_FINISH = 'd3;
always @(posedge clk) begin
    if (reset) begin
        state <= 'd0;
        ky <= 'd0;
        kx <= 'd0;
        ic <= 'd0;
        ocol <= 'd0;
        orow <= 'd0;
        wait_state <= 'd0;
        start_alu0 <= 1'b0;
        clr_acc0 <= 1'b0;
    end
    else begin
        case (state)
        DP_IDLE: begin
            ky <= 'd0;
            kx <= 'd0;
            ic <= 'd0;
            clr_acc0 <= 1'b0;
            if (start_row) begin
                state <= DP_INIT;
            end
        end
        DP_INIT: begin
            clr_acc0 <= 1'b1;
            wait_state <= 'd0;
            state <= DP_RUN;
        end
        DP_RUN: begin
            weight_ra <= ky*KWIDTH*ICHAN+kx*ICHAN+ic;
            stripe_ra <= ((ky+(orow*STRIDE))%NROW)*(NCOL+OVERLAP) + kx + ocol*STRIDE;
            ichan_sel0 <= 'b1 << ic;
            if (ic==ICHAN-1) begin
                if (kx==KWIDTH-1) begin
                    if (ky==KHEIGHT-1) begin
                        if (wait_state > 'd20) begin // if dot product is faster than alu ops, wait for it
                            wait_state <= 'd0;
                            clr_acc0 <= 1'b1;
                            if (ocol==(OCOL-1)) begin
                                ocol <= 'd0;
                                orow <= orow+'d1;
                                state <= DP_FINISH;
                            end
                            else
                                ocol <= ocol+'d1;

                            ky <= 'd0;
                            kx <= 'd0;
                            ic <= 'd0;
                            start_alu0 <= 1'b1;
                            ocol_pipe <= ocol;
                            orow_pipe <= orow;
                        end
                        else
                            wait_state <= wait_state + 'd1;
                    end
                    else begin
                        ky <= ky+'d1;
                        kx <= 'd0;
                        ic <= 'd0;
                    end
                end
                else begin
                    kx <= kx+'d1;
                    ic <= 'd0;
                    start_alu0 <= 1'b0;
                    wait_state <= wait_state + 'd1;
                    clr_acc0 <= 1'b0;
                end
            end
            else begin
                ic <= ic+'d1;
                start_alu0 <= 1'b0;
                clr_acc0 <= 1'b0;
                wait_state <= wait_state + 'd1;
            end
        end
        DP_FINISH: begin
            start_alu0 <= 1'b0;
            state <= DP_IDLE;
        end
        default:
            state <= 'bx;
        endcase
    end
end

always @(posedge clk) begin
    ichan_sel1 <= ichan_sel0;
    ichan_sel <= ichan_sel1;
end

// alu FSM
reg [4:0] alu_state;
reg [$clog2(NSTRIPE):0] osel; // output stripes sequentially (interleaved)
reg m_axis_tvalid0;
reg [$clog2(OWIDTH)-1:0] m_col0;
reg [$clog2(OHEIGHT)-1:0] m_row0;
localparam ALU_IDLE = 'd0;
localparam ALU_1 = 'd1;
localparam ALU_2 = 'd2;
localparam ALU_3 = 'd3;
localparam ALU_4 = 'd4;
localparam ALU_5 = 'd5;
localparam ALU_6 = 'd6;
localparam ALU_7 = 'd7;
localparam ALU_8 = 'd8;
localparam ALU_9 = 'd9;
localparam ALU_10 = 'd10;
localparam ALU_11 = 'd11;
localparam ALU_12 = 'd12;
localparam ALU_13 = 'd13;
localparam ALU_14 = 'd14;
localparam ALU_15 = 'd15;
localparam ALU_EMIT = 'd16;

always @(posedge clk) begin
    m_axis_tvalid <= m_axis_tvalid0;
    m_col <= m_col0;
    m_row <= m_row0;
end

always @(posedge clk) begin
    stripe_sel <= 1'b1 << osel;
    if (reset) begin
        alu_state <= 'd0;
    end
    else begin
        case (alu_state)
        ALU_IDLE: begin
            m_axis_tvalid0 <= 1'b0;
            alu_op <= 'd0;
            if (start_alu)
                alu_state <= ALU_1;
        end
        ALU_1: begin
            alu_op <= 'd1;
            alu_state <= ALU_2;
        end
        ALU_2: begin
            alu_op <= 'd2;
            alu_state <= ALU_3;
        end
        ALU_3: begin
            alu_op <= 'd3;
            alu_state <= ALU_4;
        end
        ALU_4: begin
            alu_op <= 'd4;
            alu_state <= ALU_5;
        end
        ALU_5: begin
            alu_op <= 'd5;
            alu_state <= ALU_6;
        end
        ALU_6: begin
            alu_op <= 'd6;
            alu_state <= ALU_7;
        end
        ALU_7: begin
            alu_op <= 'd7;
            alu_state <= ALU_8;
        end
        ALU_8: begin
            alu_op <= 'd8;
            if (REGZ==32)
                alu_state <= ALU_13;
            if (REGZ==64)
                alu_state <= ALU_9;
        end
        ALU_9: begin
            alu_op <= 'd9;
            alu_state <= ALU_10;
        end
        ALU_10: begin
            alu_op <= 'd10;
            alu_state <= ALU_11;
        end
        ALU_11: begin
            alu_op <= 'd11;
            alu_state <= ALU_12;
        end
        ALU_12: begin
            alu_op <= 'd12;
            alu_state <= ALU_13;
        end
        ALU_13: begin
            alu_op <= 'd13;
            alu_state <= ALU_14;
        end
        ALU_14: begin
            alu_op <= 'd14;
            alu_state <= ALU_15;
        end
        ALU_15: begin
            alu_state <= ALU_EMIT;
            osel <= 'd0;
            if (RELU)
                alu_op <= 'd15;
            else
                alu_op <= 'd16;
        end
        ALU_EMIT: begin
            alu_op <= 'd16; // z <= z
            if (osel<NSTRIPE) begin
                osel <= osel+'d1;
                if (osel*OCOL+ocol_pipe < OWIDTH) begin // truncate if < nstripes remainder
                    m_axis_tvalid0 <= 1'b1;
                    m_col0 <= osel*OCOL+ocol_pipe;
                    m_row0 <= orow_pipe;
                end
                else
                    m_axis_tvalid0 <= 1'b0;
            end
            else begin
                m_axis_tvalid0 <= 1'b0;
                alu_op <= 'd16; // z <= z
                osel <= 'd0;
                alu_state <= ALU_IDLE;
            end
        end
        default:
            alu_state <= 'bx;
        endcase
    end
end
endmodule
