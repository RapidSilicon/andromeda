module mira220 (
    input wire clk,
    input wire reset,
    input wire [11-1:0] s_0_row,
    input wire [11-1:0] s_0_col,
    input wire [3*16-1:0] s_0_data,
    input wire s_0_valid,
    output wire [4-1:0] m_0_row,
    output wire [5-1:0] m_0_col,
    output wire [512*16-1:0] m_0_data,
    output wire m_0_valid
);

wire [3*16-1:0] T0_data;
wire [11-1:0] T0_col;
wire [11-1:0] T0_row;
wire T0_valid;
wire [16*16-1:0] T25_data;
wire [11-1:0] T25_col;
wire [11-1:0] T25_row;
wire T25_valid;
wire [16*16-1:0] T26_data;
wire [10-1:0] T26_col;
wire [10-1:0] T26_row;
wire T26_valid;
wire [16*16-1:0] T27_data;
wire [10-1:0] T27_col;
wire [10-1:0] T27_row;
wire T27_valid;
wire [32*16-1:0] T28_data;
wire [10-1:0] T28_col;
wire [10-1:0] T28_row;
wire T28_valid;
wire [32*16-1:0] T29_data;
wire [9-1:0] T29_col;
wire [9-1:0] T29_row;
wire T29_valid;
wire [32*16-1:0] T30_data;
wire [9-1:0] T30_col;
wire [9-1:0] T30_row;
wire T30_valid;
wire [64*16-1:0] T31_data;
wire [9-1:0] T31_col;
wire [9-1:0] T31_row;
wire T31_valid;
wire [64*16-1:0] T32_data;
wire [8-1:0] T32_col;
wire [8-1:0] T32_row;
wire T32_valid;
wire [64*16-1:0] T33_data;
wire [8-1:0] T33_col;
wire [8-1:0] T33_row;
wire T33_valid;
wire [128*16-1:0] T34_data;
wire [8-1:0] T34_col;
wire [8-1:0] T34_row;
wire T34_valid;
wire [128*16-1:0] T35_data;
wire [7-1:0] T35_col;
wire [7-1:0] T35_row;
wire T35_valid;
wire [128*16-1:0] T36_data;
wire [7-1:0] T36_col;
wire [7-1:0] T36_row;
wire T36_valid;
wire [256*16-1:0] T37_data;
wire [7-1:0] T37_col;
wire [7-1:0] T37_row;
wire T37_valid;
wire [256*16-1:0] T38_data;
wire [6-1:0] T38_col;
wire [6-1:0] T38_row;
wire T38_valid;
wire [256*16-1:0] T39_data;
wire [6-1:0] T39_col;
wire [6-1:0] T39_row;
wire T39_valid;
wire [512*16-1:0] T40_data;
wire [6-1:0] T40_col;
wire [6-1:0] T40_row;
wire T40_valid;
wire [512*16-1:0] T41_data;
wire [5-1:0] T41_col;
wire [4-1:0] T41_row;
wire T41_valid;
wire [512*16-1:0] T42_data;
wire [5-1:0] T42_col;
wire [4-1:0] T42_row;
wire T42_valid;
assign T0_data=s_0_data;
assign T0_row=s_0_row;
assign T0_col=s_0_col;
assign T0_valid=s_0_valid;
assign m_0_data=T42_data;
assign m_0_row=T42_row;
assign m_0_col=T42_col;
assign m_0_valid=T42_valid;

wire [16*8-1:0] OP0_weight_rd;
wire [1*5-1:0] OP0_weight_ra;
wire [16*64-1:0] OP0_bias_rd;
wire [16*32-1:0] OP0_scale_rd;
wire [16*6-1:0] OP0_shift_rd;
// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_NCOL,NROW,NCOL,OCOL,OVERLAP,REGZ,REGB,RELU
conv2d #(16,4,1608,27,1400,1600,3,1398,1598,16,3,3,1,0,0,4,400,400,2,64,8,1) u0 (
.clk(clk),
.reset(reset),
.weight_rd(OP0_weight_rd),
.weight_ra(OP0_weight_ra),
.bias_rd(OP0_bias_rd),
.scale_rd(OP0_scale_rd),
.shift_rd(OP0_shift_rd),
.s_0_data(T0_data),
.s_0_col(T0_col),
.s_0_row(T0_row),
.s_0_valid(T0_valid),
.m_0_data(T25_data),
.m_0_col(T25_col),
.m_0_row(T25_row),
.m_0_valid(T25_valid)
);
// weight_rom
weight_rom_0 rom0 (
.clk(clk),
.addr(OP0_weight_ra),
.data(OP0_weight_rd)
);

// bias_rom
bias_rom_0 bias0 (
.data(OP0_bias_rd)
);

// scale_rom
scale_rom_0 scale0 (
.scale(OP0_scale_rd),
.shift(OP0_shift_rd)
);

wire [16*8-1:0] OP1_weight_rd;
wire [1*8-1:0] OP1_weight_ra;
wire [16*64-1:0] OP1_bias_rd;
wire [16*32-1:0] OP1_scale_rd;
wire [16*6-1:0] OP1_shift_rd;
// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_NCOL,NROW,NCOL,OCOL,OVERLAP,REGZ,REGB,RELU
conv2d #(16,5,1600,144,1398,1598,16,698,798,16,3,3,2,0,0,5,319,160,1,64,8,1) u1 (
.clk(clk),
.reset(reset),
.weight_rd(OP1_weight_rd),
.weight_ra(OP1_weight_ra),
.bias_rd(OP1_bias_rd),
.scale_rd(OP1_scale_rd),
.shift_rd(OP1_shift_rd),
.s_0_data(T25_data),
.s_0_col(T25_col),
.s_0_row(T25_row),
.s_0_valid(T25_valid),
.m_0_data(T26_data),
.m_0_col(T26_col),
.m_0_row(T26_row),
.m_0_valid(T26_valid)
);
// weight_rom
weight_rom_1 rom1 (
.clk(clk),
.addr(OP1_weight_ra),
.data(OP1_weight_rd)
);

// bias_rom
bias_rom_1 bias1 (
.data(OP1_bias_rd)
);

// scale_rom
scale_rom_1 scale1 (
.scale(OP1_scale_rd),
.shift(OP1_shift_rd)
);

wire [16*8-1:0] OP2_weight_rd;
wire [1*8-1:0] OP2_weight_ra;
wire [16*64-1:0] OP2_bias_rd;
wire [16*32-1:0] OP2_scale_rd;
wire [16*6-1:0] OP2_shift_rd;
// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_NCOL,NROW,NCOL,OCOL,OVERLAP,REGZ,REGB,RELU
conv2d #(16,5,644,144,698,798,16,696,796,16,3,3,1,0,0,4,159,160,2,64,8,1) u2 (
.clk(clk),
.reset(reset),
.weight_rd(OP2_weight_rd),
.weight_ra(OP2_weight_ra),
.bias_rd(OP2_bias_rd),
.scale_rd(OP2_scale_rd),
.shift_rd(OP2_shift_rd),
.s_0_data(T26_data),
.s_0_col(T26_col),
.s_0_row(T26_row),
.s_0_valid(T26_valid),
.m_0_data(T27_data),
.m_0_col(T27_col),
.m_0_row(T27_row),
.m_0_valid(T27_valid)
);
// weight_rom
weight_rom_2 rom2 (
.clk(clk),
.addr(OP2_weight_ra),
.data(OP2_weight_rd)
);

// bias_rom
bias_rom_2 bias2 (
.data(OP2_bias_rd)
);

// scale_rom
scale_rom_2 scale2 (
.scale(OP2_scale_rd),
.shift(OP2_shift_rd)
);

wire [32*8-1:0] OP3_weight_rd;
wire [1*8-1:0] OP3_weight_ra;
wire [32*64-1:0] OP3_bias_rd;
wire [32*32-1:0] OP3_scale_rd;
wire [32*6-1:0] OP3_shift_rd;
// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_NCOL,NROW,NCOL,OCOL,OVERLAP,REGZ,REGB,RELU
conv2d #(16,5,644,144,696,796,16,694,794,32,3,3,1,0,0,4,159,159,2,64,8,1) u3 (
.clk(clk),
.reset(reset),
.weight_rd(OP3_weight_rd),
.weight_ra(OP3_weight_ra),
.bias_rd(OP3_bias_rd),
.scale_rd(OP3_scale_rd),
.shift_rd(OP3_shift_rd),
.s_0_data(T27_data),
.s_0_col(T27_col),
.s_0_row(T27_row),
.s_0_valid(T27_valid),
.m_0_data(T28_data),
.m_0_col(T28_col),
.m_0_row(T28_row),
.m_0_valid(T28_valid)
);
// weight_rom
weight_rom_3 rom3 (
.clk(clk),
.addr(OP3_weight_ra),
.data(OP3_weight_rd)
);

// bias_rom
bias_rom_3 bias3 (
.data(OP3_bias_rd)
);

// scale_rom
scale_rom_3 scale3 (
.scale(OP3_scale_rd),
.shift(OP3_shift_rd)
);

wire [32*8-1:0] OP4_weight_rd;
wire [1*9-1:0] OP4_weight_ra;
wire [32*64-1:0] OP4_bias_rd;
wire [32*32-1:0] OP4_scale_rd;
wire [32*6-1:0] OP4_shift_rd;
// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_NCOL,NROW,NCOL,OCOL,OVERLAP,REGZ,REGB,RELU
conv2d #(16,3,1325,288,694,794,32,346,396,32,3,3,2,0,0,5,264,132,1,64,8,1) u4 (
.clk(clk),
.reset(reset),
.weight_rd(OP4_weight_rd),
.weight_ra(OP4_weight_ra),
.bias_rd(OP4_bias_rd),
.scale_rd(OP4_scale_rd),
.shift_rd(OP4_shift_rd),
.s_0_data(T28_data),
.s_0_col(T28_col),
.s_0_row(T28_row),
.s_0_valid(T28_valid),
.m_0_data(T29_data),
.m_0_col(T29_col),
.m_0_row(T29_row),
.m_0_valid(T29_valid)
);
// weight_rom
weight_rom_4 rom4 (
.clk(clk),
.addr(OP4_weight_ra),
.data(OP4_weight_rd)
);

// bias_rom
bias_rom_4 bias4 (
.data(OP4_bias_rd)
);

// scale_rom
scale_rom_4 scale4 (
.scale(OP4_scale_rd),
.shift(OP4_shift_rd)
);

wire [32*8-1:0] OP5_weight_rd;
wire [1*9-1:0] OP5_weight_ra;
wire [32*64-1:0] OP5_bias_rd;
wire [32*32-1:0] OP5_scale_rd;
wire [32*6-1:0] OP5_shift_rd;
// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_NCOL,NROW,NCOL,OCOL,OVERLAP,REGZ,REGB,RELU
conv2d #(16,3,536,288,346,396,32,344,394,32,3,3,1,0,0,4,132,132,2,64,8,1) u5 (
.clk(clk),
.reset(reset),
.weight_rd(OP5_weight_rd),
.weight_ra(OP5_weight_ra),
.bias_rd(OP5_bias_rd),
.scale_rd(OP5_scale_rd),
.shift_rd(OP5_shift_rd),
.s_0_data(T29_data),
.s_0_col(T29_col),
.s_0_row(T29_row),
.s_0_valid(T29_valid),
.m_0_data(T30_data),
.m_0_col(T30_col),
.m_0_row(T30_row),
.m_0_valid(T30_valid)
);
// weight_rom
weight_rom_5 rom5 (
.clk(clk),
.addr(OP5_weight_ra),
.data(OP5_weight_rd)
);

// bias_rom
bias_rom_5 bias5 (
.data(OP5_bias_rd)
);

// scale_rom
scale_rom_5 scale5 (
.scale(OP5_scale_rd),
.shift(OP5_shift_rd)
);

wire [64*8-1:0] OP6_weight_rd;
wire [1*9-1:0] OP6_weight_ra;
wire [64*64-1:0] OP6_bias_rd;
wire [64*32-1:0] OP6_scale_rd;
wire [64*6-1:0] OP6_shift_rd;
// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_NCOL,NROW,NCOL,OCOL,OVERLAP,REGZ,REGB,RELU
conv2d #(16,3,532,288,344,394,32,342,392,64,3,3,1,0,0,4,131,131,2,64,8,1) u6 (
.clk(clk),
.reset(reset),
.weight_rd(OP6_weight_rd),
.weight_ra(OP6_weight_ra),
.bias_rd(OP6_bias_rd),
.scale_rd(OP6_scale_rd),
.shift_rd(OP6_shift_rd),
.s_0_data(T30_data),
.s_0_col(T30_col),
.s_0_row(T30_row),
.s_0_valid(T30_valid),
.m_0_data(T31_data),
.m_0_col(T31_col),
.m_0_row(T31_row),
.m_0_valid(T31_valid)
);
// weight_rom
weight_rom_6 rom6 (
.clk(clk),
.addr(OP6_weight_ra),
.data(OP6_weight_rd)
);

// bias_rom
bias_rom_6 bias6 (
.data(OP6_bias_rd)
);

// scale_rom
scale_rom_6 scale6 (
.scale(OP6_scale_rd),
.shift(OP6_shift_rd)
);

wire [64*8-1:0] OP7_weight_rd;
wire [1*10-1:0] OP7_weight_ra;
wire [64*64-1:0] OP7_bias_rd;
wire [64*32-1:0] OP7_scale_rd;
wire [64*6-1:0] OP7_shift_rd;
// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_NCOL,NROW,NCOL,OCOL,OVERLAP,REGZ,REGB,RELU
conv2d #(16,2,980,576,342,392,64,170,195,64,3,3,2,0,0,5,195,98,1,64,8,1) u7 (
.clk(clk),
.reset(reset),
.weight_rd(OP7_weight_rd),
.weight_ra(OP7_weight_ra),
.bias_rd(OP7_bias_rd),
.scale_rd(OP7_scale_rd),
.shift_rd(OP7_shift_rd),
.s_0_data(T31_data),
.s_0_col(T31_col),
.s_0_row(T31_row),
.s_0_valid(T31_valid),
.m_0_data(T32_data),
.m_0_col(T32_col),
.m_0_row(T32_row),
.m_0_valid(T32_valid)
);
// weight_rom
weight_rom_7 rom7 (
.clk(clk),
.addr(OP7_weight_ra),
.data(OP7_weight_rd)
);

// bias_rom
bias_rom_7 bias7 (
.data(OP7_bias_rd)
);

// scale_rom
scale_rom_7 scale7 (
.scale(OP7_scale_rd),
.shift(OP7_shift_rd)
);

wire [64*8-1:0] OP8_weight_rd;
wire [1*10-1:0] OP8_weight_ra;
wire [64*64-1:0] OP8_bias_rd;
wire [64*32-1:0] OP8_scale_rd;
wire [64*6-1:0] OP8_shift_rd;
// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_NCOL,NROW,NCOL,OCOL,OVERLAP,REGZ,REGB,RELU
conv2d #(16,2,396,576,170,195,64,168,193,64,3,3,1,0,0,4,97,97,2,64,8,1) u8 (
.clk(clk),
.reset(reset),
.weight_rd(OP8_weight_rd),
.weight_ra(OP8_weight_ra),
.bias_rd(OP8_bias_rd),
.scale_rd(OP8_scale_rd),
.shift_rd(OP8_shift_rd),
.s_0_data(T32_data),
.s_0_col(T32_col),
.s_0_row(T32_row),
.s_0_valid(T32_valid),
.m_0_data(T33_data),
.m_0_col(T33_col),
.m_0_row(T33_row),
.m_0_valid(T33_valid)
);
// weight_rom
weight_rom_8 rom8 (
.clk(clk),
.addr(OP8_weight_ra),
.data(OP8_weight_rd)
);

// bias_rom
bias_rom_8 bias8 (
.data(OP8_bias_rd)
);

// scale_rom
scale_rom_8 scale8 (
.scale(OP8_scale_rd),
.shift(OP8_shift_rd)
);

wire [128*8-1:0] OP9_weight_rd;
wire [1*10-1:0] OP9_weight_ra;
wire [128*64-1:0] OP9_bias_rd;
wire [128*32-1:0] OP9_scale_rd;
wire [128*6-1:0] OP9_shift_rd;
// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_NCOL,NROW,NCOL,OCOL,OVERLAP,REGZ,REGB,RELU
conv2d #(16,2,392,576,168,193,64,166,191,128,3,3,1,0,0,4,96,96,2,64,8,1) u9 (
.clk(clk),
.reset(reset),
.weight_rd(OP9_weight_rd),
.weight_ra(OP9_weight_ra),
.bias_rd(OP9_bias_rd),
.scale_rd(OP9_scale_rd),
.shift_rd(OP9_shift_rd),
.s_0_data(T33_data),
.s_0_col(T33_col),
.s_0_row(T33_row),
.s_0_valid(T33_valid),
.m_0_data(T34_data),
.m_0_col(T34_col),
.m_0_row(T34_row),
.m_0_valid(T34_valid)
);
// weight_rom
weight_rom_9 rom9 (
.clk(clk),
.addr(OP9_weight_ra),
.data(OP9_weight_rd)
);

// bias_rom
bias_rom_9 bias9 (
.data(OP9_bias_rd)
);

// scale_rom
scale_rom_9 scale9 (
.scale(OP9_scale_rd),
.shift(OP9_shift_rd)
);

wire [128*8-1:0] OP10_weight_rd;
wire [1*11-1:0] OP10_weight_ra;
wire [128*64-1:0] OP10_bias_rd;
wire [128*32-1:0] OP10_scale_rd;
wire [128*6-1:0] OP10_shift_rd;
// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_NCOL,NROW,NCOL,OCOL,OVERLAP,REGZ,REGB,RELU
conv2d #(16,1,955,1152,166,191,128,82,95,128,3,3,2,0,0,5,191,95,0,64,8,1) u10 (
.clk(clk),
.reset(reset),
.weight_rd(OP10_weight_rd),
.weight_ra(OP10_weight_ra),
.bias_rd(OP10_bias_rd),
.scale_rd(OP10_scale_rd),
.shift_rd(OP10_shift_rd),
.s_0_data(T34_data),
.s_0_col(T34_col),
.s_0_row(T34_row),
.s_0_valid(T34_valid),
.m_0_data(T35_data),
.m_0_col(T35_col),
.m_0_row(T35_row),
.m_0_valid(T35_valid)
);
// weight_rom
weight_rom_10 rom10 (
.clk(clk),
.addr(OP10_weight_ra),
.data(OP10_weight_rd)
);

// bias_rom
bias_rom_10 bias10 (
.data(OP10_bias_rd)
);

// scale_rom
scale_rom_10 scale10 (
.scale(OP10_scale_rd),
.shift(OP10_shift_rd)
);

wire [128*8-1:0] OP11_weight_rd;
wire [1*11-1:0] OP11_weight_ra;
wire [128*64-1:0] OP11_bias_rd;
wire [128*32-1:0] OP11_scale_rd;
wire [128*6-1:0] OP11_shift_rd;
// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_NCOL,NROW,NCOL,OCOL,OVERLAP,REGZ,REGB,RELU
conv2d #(16,1,380,1152,82,95,128,80,93,128,3,3,1,0,0,4,95,93,0,64,8,1) u11 (
.clk(clk),
.reset(reset),
.weight_rd(OP11_weight_rd),
.weight_ra(OP11_weight_ra),
.bias_rd(OP11_bias_rd),
.scale_rd(OP11_scale_rd),
.shift_rd(OP11_shift_rd),
.s_0_data(T35_data),
.s_0_col(T35_col),
.s_0_row(T35_row),
.s_0_valid(T35_valid),
.m_0_data(T36_data),
.m_0_col(T36_col),
.m_0_row(T36_row),
.m_0_valid(T36_valid)
);
// weight_rom
weight_rom_11 rom11 (
.clk(clk),
.addr(OP11_weight_ra),
.data(OP11_weight_rd)
);

// bias_rom
bias_rom_11 bias11 (
.data(OP11_bias_rd)
);

// scale_rom
scale_rom_11 scale11 (
.scale(OP11_scale_rd),
.shift(OP11_shift_rd)
);

wire [256*8-1:0] OP12_weight_rd;
wire [1*11-1:0] OP12_weight_ra;
wire [256*64-1:0] OP12_bias_rd;
wire [256*32-1:0] OP12_scale_rd;
wire [256*6-1:0] OP12_shift_rd;
// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_NCOL,NROW,NCOL,OCOL,OVERLAP,REGZ,REGB,RELU
conv2d #(16,1,372,1152,80,93,128,78,91,256,3,3,1,0,0,4,93,91,0,64,8,1) u12 (
.clk(clk),
.reset(reset),
.weight_rd(OP12_weight_rd),
.weight_ra(OP12_weight_ra),
.bias_rd(OP12_bias_rd),
.scale_rd(OP12_scale_rd),
.shift_rd(OP12_shift_rd),
.s_0_data(T36_data),
.s_0_col(T36_col),
.s_0_row(T36_row),
.s_0_valid(T36_valid),
.m_0_data(T37_data),
.m_0_col(T37_col),
.m_0_row(T37_row),
.m_0_valid(T37_valid)
);
// weight_rom
weight_rom_12 rom12 (
.clk(clk),
.addr(OP12_weight_ra),
.data(OP12_weight_rd)
);

// bias_rom
bias_rom_12 bias12 (
.data(OP12_bias_rd)
);

// scale_rom
scale_rom_12 scale12 (
.scale(OP12_scale_rd),
.shift(OP12_shift_rd)
);

wire [256*8-1:0] OP13_weight_rd;
wire [1*12-1:0] OP13_weight_ra;
wire [256*64-1:0] OP13_bias_rd;
wire [256*32-1:0] OP13_scale_rd;
wire [256*6-1:0] OP13_shift_rd;
// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_NCOL,NROW,NCOL,OCOL,OVERLAP,REGZ,REGB,RELU
conv2d #(16,1,455,2304,78,91,256,38,45,256,3,3,2,0,0,5,91,45,0,64,8,1) u13 (
.clk(clk),
.reset(reset),
.weight_rd(OP13_weight_rd),
.weight_ra(OP13_weight_ra),
.bias_rd(OP13_bias_rd),
.scale_rd(OP13_scale_rd),
.shift_rd(OP13_shift_rd),
.s_0_data(T37_data),
.s_0_col(T37_col),
.s_0_row(T37_row),
.s_0_valid(T37_valid),
.m_0_data(T38_data),
.m_0_col(T38_col),
.m_0_row(T38_row),
.m_0_valid(T38_valid)
);
// weight_rom
weight_rom_13 rom13 (
.clk(clk),
.addr(OP13_weight_ra),
.data(OP13_weight_rd)
);

// bias_rom
bias_rom_13 bias13 (
.data(OP13_bias_rd)
);

// scale_rom
scale_rom_13 scale13 (
.scale(OP13_scale_rd),
.shift(OP13_shift_rd)
);

wire [256*8-1:0] OP14_weight_rd;
wire [1*12-1:0] OP14_weight_ra;
wire [256*64-1:0] OP14_bias_rd;
wire [256*32-1:0] OP14_scale_rd;
wire [256*6-1:0] OP14_shift_rd;
// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_NCOL,NROW,NCOL,OCOL,OVERLAP,REGZ,REGB,RELU
conv2d #(16,1,180,2304,38,45,256,36,43,256,3,3,1,0,0,4,45,43,0,64,8,1) u14 (
.clk(clk),
.reset(reset),
.weight_rd(OP14_weight_rd),
.weight_ra(OP14_weight_ra),
.bias_rd(OP14_bias_rd),
.scale_rd(OP14_scale_rd),
.shift_rd(OP14_shift_rd),
.s_0_data(T38_data),
.s_0_col(T38_col),
.s_0_row(T38_row),
.s_0_valid(T38_valid),
.m_0_data(T39_data),
.m_0_col(T39_col),
.m_0_row(T39_row),
.m_0_valid(T39_valid)
);
// weight_rom
weight_rom_14 rom14 (
.clk(clk),
.addr(OP14_weight_ra),
.data(OP14_weight_rd)
);

// bias_rom
bias_rom_14 bias14 (
.data(OP14_bias_rd)
);

// scale_rom
scale_rom_14 scale14 (
.scale(OP14_scale_rd),
.shift(OP14_shift_rd)
);

wire [512*8-1:0] OP15_weight_rd;
wire [1*12-1:0] OP15_weight_ra;
wire [512*64-1:0] OP15_bias_rd;
wire [512*32-1:0] OP15_scale_rd;
wire [512*6-1:0] OP15_shift_rd;
// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_NCOL,NROW,NCOL,OCOL,OVERLAP,REGZ,REGB,RELU
conv2d #(16,1,172,2304,36,43,256,34,41,512,3,3,1,0,0,4,43,41,0,64,8,1) u15 (
.clk(clk),
.reset(reset),
.weight_rd(OP15_weight_rd),
.weight_ra(OP15_weight_ra),
.bias_rd(OP15_bias_rd),
.scale_rd(OP15_scale_rd),
.shift_rd(OP15_shift_rd),
.s_0_data(T39_data),
.s_0_col(T39_col),
.s_0_row(T39_row),
.s_0_valid(T39_valid),
.m_0_data(T40_data),
.m_0_col(T40_col),
.m_0_row(T40_row),
.m_0_valid(T40_valid)
);
// weight_rom
weight_rom_15 rom15 (
.clk(clk),
.addr(OP15_weight_ra),
.data(OP15_weight_rd)
);

// bias_rom
bias_rom_15 bias15 (
.data(OP15_bias_rd)
);

// scale_rom
scale_rom_15 scale15 (
.scale(OP15_scale_rd),
.shift(OP15_shift_rd)
);

wire [512*8-1:0] OP16_weight_rd;
wire [1*13-1:0] OP16_weight_ra;
wire [512*64-1:0] OP16_bias_rd;
wire [512*32-1:0] OP16_scale_rd;
wire [512*6-1:0] OP16_shift_rd;
// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_NCOL,NROW,NCOL,OCOL,OVERLAP,REGZ,REGB,RELU
conv2d #(16,1,205,4608,34,41,512,16,20,512,3,3,2,0,0,5,41,20,0,64,8,1) u16 (
.clk(clk),
.reset(reset),
.weight_rd(OP16_weight_rd),
.weight_ra(OP16_weight_ra),
.bias_rd(OP16_bias_rd),
.scale_rd(OP16_scale_rd),
.shift_rd(OP16_shift_rd),
.s_0_data(T40_data),
.s_0_col(T40_col),
.s_0_row(T40_row),
.s_0_valid(T40_valid),
.m_0_data(T41_data),
.m_0_col(T41_col),
.m_0_row(T41_row),
.m_0_valid(T41_valid)
);
// weight_rom
weight_rom_16 rom16 (
.clk(clk),
.addr(OP16_weight_ra),
.data(OP16_weight_rd)
);

// bias_rom
bias_rom_16 bias16 (
.data(OP16_bias_rd)
);

// scale_rom
scale_rom_16 scale16 (
.scale(OP16_scale_rd),
.shift(OP16_shift_rd)
);

wire [512*8-1:0] OP17_weight_rd;
wire [1*13-1:0] OP17_weight_ra;
wire [512*64-1:0] OP17_bias_rd;
wire [512*32-1:0] OP17_scale_rd;
wire [512*6-1:0] OP17_shift_rd;
// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_NCOL,NROW,NCOL,OCOL,OVERLAP,REGZ,REGB,RELU
conv2d #(16,1,80,4608,16,20,512,14,18,512,3,3,1,0,0,4,20,18,0,64,8,1) u17 (
.clk(clk),
.reset(reset),
.weight_rd(OP17_weight_rd),
.weight_ra(OP17_weight_ra),
.bias_rd(OP17_bias_rd),
.scale_rd(OP17_scale_rd),
.shift_rd(OP17_shift_rd),
.s_0_data(T41_data),
.s_0_col(T41_col),
.s_0_row(T41_row),
.s_0_valid(T41_valid),
.m_0_data(T42_data),
.m_0_col(T42_col),
.m_0_row(T42_row),
.m_0_valid(T42_valid)
);
// weight_rom
weight_rom_17 rom17 (
.clk(clk),
.addr(OP17_weight_ra),
.data(OP17_weight_rd)
);

// bias_rom
bias_rom_17 bias17 (
.data(OP17_bias_rd)
);

// scale_rom
scale_rom_17 scale17 (
.scale(OP17_scale_rd),
.shift(OP17_shift_rd)
);

endmodule

