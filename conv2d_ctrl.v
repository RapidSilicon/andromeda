// conv2d.v control path
module conv2d_ctrl #(
    parameter TDATA=8,      // width of model dtype (int8, bfloat16)
    parameter OCHAN=64,     // number of output channels, evaluated in parallel
    parameter NSTRIPE=16,   // number of vertical stripes to evaluate in parallel
    parameter ICHAN=64,     // number of input channels
    parameter SDEPTH=1024,     // stripe data input buffer address width
    parameter WDEPTH=1024,     // weight ROM address width
    parameter IWIDTH=28,    // input tensor width
    parameter IHEIGHT=28,   // input tensor height
    parameter KWIDTH=3,     // filter kernel width
    parameter KHEIGHT=3,    // filter kernel height
    parameter STRIDE=1     // x and y stride
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
    output reg [OCHAN*$clog2(WDEPTH)-1:0] weight_ra
);

// dummy implementation
reg [$clog2(SDEPTH)-1:0] sa0,sa1;
always @(posedge clk) begin
    if (reset) begin
        dsp_op <= 'd0;
        dsp_arg <= 'd12345;
        stripe_wen <= 'd1;
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
        stripe_wen <= (stripe_wen<<1)|stripe_wen[NSTRIPE-1];
        ichan_sel <= (ichan_sel<<1)|ichan_sel[ICHAN-1];
        stripe_sel <= (stripe_sel<<1)|stripe_sel[NSTRIPE-1];
        sa0 <= sa0+'d1;
        sa1 <= sa1+'d1;
    end
end
assign stripe_wa = {NSTRIPE*{sa0}};
assign stripe_ra = {NSTRIPE*{sa1}};

endmodule
