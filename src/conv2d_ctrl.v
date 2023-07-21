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
    parameter PREV_SWIDTH=1,
    parameter NROW=1,
    parameter NCOL=1,
    parameter OVERLAP=1,
    parameter RELU=1,
    parameter SADDR=$clog2(SDEPTH)
) (
    input clk, reset,
    output reg clr_acc,
    output reg [3:0] alu_op,
    output reg [NSTRIPE*$clog2(SDEPTH)-1:0] stripe_wa,
    output reg [NSTRIPE-1:0] stripe_wen,
    output reg [$clog2(SDEPTH)-1:0] stripe_ra,
    output reg [ICHAN-1:0] ichan_sel, // 1-hot channel select
    output reg [NSTRIPE-1:0] stripe_sel, // 1-hot select for tdata_o
    input s_axis_tvalid,
    output reg m_axis_tvalid,
    output reg [$clog2(WDEPTH)-1:0] weight_ra
);

reg [$clog2(IHEIGHT):0] row;
reg [$clog2(PREV_NSTRIPE):0] stripe;
reg [$clog2(NROW):0] irow, irow_q;
reg [$clog2(NCOL):0] scol;
reg [$clog2(IWIDTH):0] icol;
reg start_dot, start_alu;

// write incoming features into the stripe buffers
always @(posedge clk) begin
    icol <= stripe*PREV_SWIDTH+scol; // "unstriped" input column
end
always @(posedge clk) begin
    irow_q <= irow;
end
always @(posedge clk) begin
    start_dot = 1'b0;
    if (reset) begin
        row <= 'd0;
        stripe <= 'd0;
        scol <= 'd0;
        irow <= 'd0;
    end
    else if (s_axis_tvalid) begin
        if (stripe==PREV_NSTRIPE-1) begin
            stripe <= 'd0;
            scol <= scol + 'd1;
        end
        else begin
            stripe <= stripe + 'd1;
        end

        if (icol==IWIDTH-1) begin
            if ((STRIDE==1) && (row >= KHEIGHT-1))
                    start_dot = 1'b1;
            if ((STRIDE==2) && ((row >= KHEIGHT-1) && ((row%2)!=(KHEIGHT%2))))
                    start_dot = 1'b1;
            if (row==IHEIGHT-1) begin
                row <= 'd0;
                irow <= 'd0;
                stripe <= 'd0;
                scol <= 'd0;
            end
            else begin
                row <= row+'d1;
                if (irow==NROW-1)
                    irow <= 'd0;
                else
                    irow <= irow+'d1;
            end
            scol <= 'd0;
        end
    end
end

reg s_axis_tvalid_q;
always @(posedge clk) begin
    s_axis_tvalid_q <= s_axis_tvalid;
end

genvar i;
generate
    for (i=0;i<NSTRIPE;i=i+1) begin
        always @ (posedge clk) begin
            stripe_wa[i*SADDR+SADDR-1:i*SADDR] = icol-i*NCOL+irow_q*NCOL;
            if ((icol >= i*NCOL) && (icol < i*NCOL+NCOL+OVERLAP))
                stripe_wen[i] <= s_axis_tvalid_q;
            else
                stripe_wen[i] <= 1'b0;
        end
    end
endgenerate

// dot product FSM
reg clr_acc0,clr_acc1,clr_acc2,clr_acc3,clr_acc4;
always @(posedge clk) begin
    clr_acc1 <= clr_acc0;
    clr_acc2 <= clr_acc1;
    clr_acc3 <= clr_acc2;
    clr_acc4 <= clr_acc3;
    clr_acc <= clr_acc4;
end

reg start_alu0,start_alu1,start_alu2,start_alu3;
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
reg [$clog2(NROW):0] srow;
reg [$clog2(OWIDTH):0] ocol;
reg [ICHAN-1:0] ichan_sel0, ichan_sel1;
reg [4:0] wait_state;
localparam DP_IDLE = 'd0;
localparam DP_INIT = 'd1;
localparam DP_RUN = 'd2;
localparam DP_FINISH = 'd3;
always @(posedge clk) begin
    start_alu0 = 1'b0;
    clr_acc0 = 1'b0;
    if (reset) begin
        state <= 'd0;
        ky <= 'd0;
        kx <= 'd0;
        ic <= 'd0;
        srow <= 'd0;
        ocol <= 'd0;
        wait_state <= 'd0;
    end
    else begin
        case (state)
        DP_IDLE: begin
            ky <= 'd0;
            kx <= 'd0;
            ic <= 'd0;
            if (start_dot) begin
                state <= DP_INIT;
            end
        end
        DP_INIT: begin
            clr_acc0 = 1'b1;
            state <= DP_RUN;
            wait_state <= 'd0;
        end
        DP_RUN: begin
            wait_state <= wait_state + 'd1;
            weight_ra <= ky*KWIDTH*ICHAN+kx*ICHAN+ic;
            stripe_ra <= ((ky+srow)%NROW)*NCOL + kx + ocol*STRIDE;
            ichan_sel0 <= 'b1 << ic;
            if (ic==ICHAN-1) begin
                if (kx==KWIDTH-1) begin
                    if (ky==KHEIGHT-1) begin
                        if (wait_state > 'd13) begin
                            wait_state <= 'd0;
                            start_alu0 = 1'b1;
                            if (ocol==OWIDTH-1) begin
                                ocol <= 'd0;
                                state <= DP_FINISH;
                            end
                            else begin
                                ocol <= ocol+'d1;
                                ky <= 'd0;
                                kx <= 'd0;
                                ic <= 'd0;
                                clr_acc0 = 1'b1;
                            end
                        end
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
                end
            end
            else
                ic <= ic+'d1;
        end
        DP_FINISH: begin
            srow <= (srow+STRIDE)%NROW;
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
reg [3:0] alu_state;
reg [$clog2(NSTRIPE):0] os; // process output stripes sequentially
reg m_axis_tvalid0, m_axis_tvalid1;
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
localparam ALU_ITER = 'd11;

always @(posedge clk) begin
    m_axis_tvalid1 <= m_axis_tvalid0;
    m_axis_tvalid <= m_axis_tvalid1;
end

always @(posedge clk) begin
    if (reset) begin
        alu_state <= 'd0;
    end
    else begin
        case (alu_state)
        ALU_IDLE: begin
            m_axis_tvalid0 <= 1'b0;
            os <= 'd0;
            alu_op <= 'd0;
            if (start_alu)
                alu_state <= ALU_1;
        end
        ALU_1: begin
            m_axis_tvalid0 <= 1'b0;
            stripe_sel <= 1'b1 << os;
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
            alu_state <= ALU_9;
        end
        ALU_9: begin
            alu_op <= 'd9;
            alu_state <= ALU_10;
        end
        ALU_10: begin
            m_axis_tvalid0 <= 1'b0;
            alu_op <= 'd10;
            alu_state <= ALU_ITER;
        end
        ALU_ITER: begin
            m_axis_tvalid0 <= 1'b1;
            if (RELU)
                alu_op <= 'd11;
            else
                alu_op <= 'd12;
            if (os==NSTRIPE-1)
                alu_state <= ALU_IDLE;
            else begin
                os <= os+'d1;
                alu_state <= ALU_1;
            end
        end
        default:
            alu_state <= 'bx;
        endcase
    end
end

endmodule
