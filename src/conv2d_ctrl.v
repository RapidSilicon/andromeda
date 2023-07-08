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
    parameter SADDR=$clog2(SDEPTH)
) (
    input clk, reset,
    output reg clr_acc,
    output reg [2:0] alu_op, // 0=NOP, 
    output reg [NSTRIPE*$clog2(SDEPTH)-1:0] stripe_wa,
    output reg [NSTRIPE-1:0] stripe_wen,
    output reg [$clog2(SDEPTH)-1:0] stripe_ra,
    output reg [ICHAN-1:0] ichan_sel, // 1-hot channel select
    output reg [NSTRIPE-1:0] stripe_sel, // 1-hot select for tdata_o
    input s_axis_tvalid,
    input s_axis_tlast, // unused (?)
    output reg s_axis_tready, // not required
    output reg m_axis_tvalid,
    output reg m_axis_tlast,
    input m_axis_tready, // not required
    output reg [$clog2(WDEPTH)-1:0] weight_ra
);

reg [$clog2(IHEIGHT)-1:0] row;
reg [$clog2(IWIDTH)-1:0] col;
reg [$clog2(PREV_NSTRIPE)-1:0] stripe;
reg [$clog2(NROW)-1:0] srow;
reg [$clog2(NCOL)-1:0] scol;
reg [$clog2(IWIDTH)-1:0] icol;
reg start_dot, start_alu;

// write incoming features into the stripe buffers
always @(posedge clk) begin
    if (reset||s_axis_tlast) begin
        row <= 'd0;
        col <= 'd0;
        stripe <= 'd0;
        scol <= 'd0;
        srow <= 'd0;
        start_dot <= 1'b0;
    end
    else if (s_axis_tvalid) begin
        if (stripe==PREV_NSTRIPE-1) begin
            stripe <= 'd0;
            scol <= scol + 'd1;
        end
        else begin
            stripe <= stripe + 'd1;
        end
        icol <= stripe*PREV_SWIDTH+scol; // "unstriped" input column

        if (col==IWIDTH-1) begin
            if (row >= KHEIGHT-1)
                if ((STRIDE==1) || ((STRIDE==2)&&((row%2)==0)))
                    start_dot <= 1'b1;
            col <= 'd0;
            if (row==IHEIGHT-1) begin
                m_axis_tlast <= 1'b1;
                row <= 'd0;
                col <= 'd0;
                stripe <= 'd0;
                scol <= 'd0;
                srow <= 'd0;
                start_dot <= 1'b0;
            end
            else begin
                row <= row+'d1;
                m_axis_tlast <= 1'b0;
            end

            scol <= 'd0;
            if (srow==NROW-1)
                srow <= 'd0;
            else
                srow <= srow+'d1;
        end
        else begin
            col <= col+'d1;
            start_dot <= 1'b0;
        end
    end
end

genvar i;
generate
    for (i=0;i<NSTRIPE;i=i+1) begin
        always @ (posedge clk) begin
            stripe_wa[i*SADDR+SADDR-1:i*SADDR] = icol-i*NCOL+srow*NCOL;
            if ((icol >= i*NCOL) && (icol < i*NCOL+NCOL+OVERLAP))
                stripe_wen[i] <= s_axis_tvalid;
            else
                stripe_wen[i] <= 1'b0;
        end
    end
endgenerate

// dot product FSM
reg [2:0] state;
reg [$clog2(KHEIGHT)-1:0] ky;
reg [$clog2(KWIDTH)-1:0] kx;
reg [$clog2(ICHAN)-1:0] ic;
localparam DP_IDLE = 'd0;
localparam DP_RUN = 'd1;
localparam DP_FINISH = 'd2;
always @(posedge clk) begin
    if (reset) begin
        state <= 'd0;
        weight_ra <= 'd0;
        clr_acc <= 1'b0;
        ky <= 'd0;
        kx <= 'd0;
        ic <= 'd0;
    end
    else begin
        case (state)
        DP_IDLE: begin
            weight_ra <= 'd0;
            clr_acc <= 1'b1;
            ky <= 'd0;
            kx <= 'd0;
            ic <= 'd0;
            start_alu <= 1'b0;
            if (start_dot) begin
                state <= DP_RUN;
            end
        end
        DP_RUN: begin
            clr_acc <= 1'b0;
            weight_ra <= weight_ra+'d1;
            stripe_ra <= ((ky*NCOL+srow)%NROW) + kx;
            ichan_sel <= 'b1 << ic;
            if (ic==ICHAN-1) begin
                if (kx==KWIDTH-1) begin
                    if (ky==KHEIGHT-1) begin
                        state <= DP_FINISH;
                    end
                    else
                        ky <= ky+'d1;
                end
                else
                    kx <= kx+'d1;
            end
            else
                ic <= ic+'d1;
        end
        DP_FINISH: begin
            start_alu <= 'b1;
            state <= DP_IDLE;
        end
        default:
            state <= 'bx;
        endcase
    end
end

// alu FSM
reg [2:0] alu_state;
reg [$clog2(NSTRIPE)-1:0] os; // process output stripes sequentially
localparam ALU_IDLE = 'd0;
localparam ALU_1 = 'd1;
localparam ALU_2 = 'd2;
localparam ALU_3 = 'd3;
localparam ALU_ITER = 'd4;
always @(posedge clk) begin
    if (reset) begin
        alu_state <= 'd0;
    end
    else begin
        case (alu_state)
        ALU_IDLE: begin
            m_axis_tvalid <= 1'b0;
            os <= 'd0;
            alu_op <= 'd0;
            if (start_alu)
                alu_state <= ALU_1;
        end
        ALU_1: begin
            m_axis_tvalid <= 1'b0;
            stripe_sel <= 1'b1 << os;
            alu_op <= 'd0;
            alu_state <= ALU_2;
        end
        ALU_2: begin
            m_axis_tvalid <= 1'b0;
            alu_op <= 'd1;
            alu_state <= ALU_3;
        end
        ALU_3: begin
            m_axis_tvalid <= 1'b0;
            alu_op <= 'd2;
            alu_state <= ALU_ITER;
        end
        ALU_ITER: begin
            m_axis_tvalid <= 1'b1;
            alu_op <= 'd3;
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
