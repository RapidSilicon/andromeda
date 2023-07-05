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
    output reg [2:0] dsp_op, // 0=NOP, 1=CLEAR, 2=MAC, 3=RELU, 4=MULT, 5=RSHIFT, 6=EMIT
    output reg [31:0] dsp_arg, // m0 = normalized scaling factor, 0.5 to 1.0
    output reg [NSTRIPE*$clog2(SDEPTH)-1:0] stripe_wa,
    output reg [NSTRIPE-1:0] stripe_wen,
    output reg [NSTRIPE*$clog2(SDEPTH)-1:0] stripe_ra,
    output reg [ICHAN-1:0] ichan_sel, // 1-hot channel select
    output reg [NSTRIPE-1:0] stripe_sel, // 1-hot select for tdata_o
    input s_axis_tvalid,
    input s_axis_tlast,
    output s_axis_tready,
    output m_axis_tvalid,
    output m_axis_tlast,
    input m_axis_tready,
    output reg [$clog2(WDEPTH)-1:0] weight_ra
);

reg [31:0] row, col, stripe, srow, scol, icol;
reg start_dot, start_alu, start_emit;
always @(posedge clk) begin
    if (reset || s_axis_tlast) begin
        row <= 'd0;
        col <= 'd0;
        stripe <= 'd0;
        scol <= 'd0;
        srow <= 'd0;
    end
    else if (s_axis_tvalid) begin
        if (stripe==PREV_NSTRIPE-1) begin
            stripe <= 'd0;
            scol <= scol + 'd1;
        end
        else begin
            stripe <= stripe + 'd1;
        end
        icol <= stripe*PREV_SWIDTH+scol;

        if (col==IWIDTH-1) begin
            start_dot <= 1'b1;
            scol <= 'd0;
            col <= 'd0;
            row <= row+'d1;
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
                stripe_wen[i] <= 1'b1;
            else
                stripe_wen[i] <= 1'b0;
        end
    end
endgenerate

// dummy implementation
reg [$clog2(SDEPTH)-1:0] sa0,sa1;
always @(posedge clk) begin
    if (reset) begin
        dsp_op <= 'd0;
        dsp_arg <= 'd12345;
        //stripe_wen <= 'd1;
        ichan_sel <= 'd1;
        stripe_sel <= 'd1;
        sa0 <= 'd1;
        sa1 <= 'd2;
        weight_ra <= 'd1;
    end
    else begin
        weight_ra <= weight_ra+'d1;
        dsp_op <= dsp_op+'d1;
        dsp_arg <= dsp_arg+'d1;
        //stripe_wen <= (stripe_wen<<1)|stripe_wen[NSTRIPE-1];
        ichan_sel <= (ichan_sel<<1)|ichan_sel[ICHAN-1];
        stripe_sel <= (stripe_sel<<1)|stripe_sel[NSTRIPE-1];
        sa0 <= sa0+'d1;
        sa1 <= sa1+'d1;
    end
end
//assign stripe_wa = {NSTRIPE*{sa0}};
assign stripe_ra = {NSTRIPE*{sa1}};

endmodule
