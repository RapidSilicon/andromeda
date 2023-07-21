module conv2d #(
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
    parameter REGZ=32,       // width of Z register in bits
    parameter REGB=8,       // width of B register in bits
    parameter RELU=1
) (
    input wire clk,
    input wire reset,
    input wire [OCHAN*REGB-1:0] weight_rd,
    output [$clog2(WDEPTH)-1:0] weight_ra,
    input wire [OCHAN*REGZ-1:0] bias_rd,
    input wire [OCHAN*32-1:0] scale_rd,
    input wire [ICHAN*DTYPE-1:0] s_axis_data,
    input wire s_axis_tvalid,
    output wire [OCHAN*DTYPE-1:0] m_axis_data,
    output wire m_axis_tvalid
);

wire clr_acc;
wire [3:0] alu_op;
wire [NSTRIPE*$clog2(SDEPTH)-1:0] stripe_wa;
wire [NSTRIPE-1:0] stripe_wen;
wire [$clog2(SDEPTH)-1:0] stripe_ra;
wire [ICHAN-1:0] ichan_sel; // 1-hot channel select
wire [NSTRIPE-1:0] stripe_sel; // 1-hot select for tdata_o

conv2d_data #(DTYPE,NSTRIPE,ICHAN,OCHAN,SDEPTH,REGZ,REGB) u0 (
    .clk(clk),
    .reset(reset),
    .clr_acc(clr_acc),
    .alu_op(alu_op),
    .stripe_wa(stripe_wa),
    .stripe_wen(stripe_wen),
    .stripe_ra(stripe_ra),
    .weight_rd(weight_rd),
    .bias_rd(bias_rd),
    .scale_rd(scale_rd),
    .ichan_sel(ichan_sel),
    .stripe_sel(stripe_sel),
    .tdata_i(s_axis_data),
    .tdata_o(m_axis_data)
);

conv2d_ctrl #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_SWIDTH,NROW,NCOL,OVERLAP,RELU) u1 (
    .clk(clk),
    .reset(reset),
    .clr_acc(clr_acc),
    .alu_op(alu_op),
    .stripe_wa(stripe_wa),
    .stripe_wen(stripe_wen),
    .stripe_ra(stripe_ra),
    .weight_ra(weight_ra),
    .ichan_sel(ichan_sel),
    .stripe_sel(stripe_sel),
    .s_axis_tvalid(s_axis_tvalid),
    .m_axis_tvalid(m_axis_tvalid)
);
endmodule
