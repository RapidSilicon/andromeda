module t4 (
    input wire clk,
    input wire reset,
    input wire [3*9-1:0] s_axis_data,
    input wire s_axis_tvalid,
    input wire s_axis_tlast,
    output wire s_axis_tready,
    output wire [1*9-1:0] m_axis_data,
    output wire m_axis_tvalid,
    output wire m_axis_tlast,
    input wire m_axis_tready
);

wire [16*9-1:0] axis_data_1;
wire [16*9-1:0] axis_data_2;
wire [32*9-1:0] axis_data_3;
wire [32*9-1:0] axis_data_4;
wire [64*9-1:0] axis_data_5;
wire [64*9-1:0] axis_data_6;
wire [64*9-1:0] axis_data_7;
wire [64*9-1:0] axis_data_8;
wire [64*9-1:0] axis_data_9;
wire [64*9-1:0] axis_data_10;
wire [64*9-1:0] axis_data_11;
wire [1*9-1:0] axis_data_12;
wire axis_tvalid_0;
wire axis_tlast_0;
wire axis_tready_0;
wire axis_tvalid_1;
wire axis_tlast_1;
wire axis_tready_1;
wire axis_tvalid_2;
wire axis_tlast_2;
wire axis_tready_2;
wire axis_tvalid_3;
wire axis_tlast_3;
wire axis_tready_3;
wire axis_tvalid_4;
wire axis_tlast_4;
wire axis_tready_4;
wire axis_tvalid_5;
wire axis_tlast_5;
wire axis_tready_5;
wire axis_tvalid_6;
wire axis_tlast_6;
wire axis_tready_6;
wire axis_tvalid_7;
wire axis_tlast_7;
wire axis_tready_7;
wire axis_tvalid_8;
wire axis_tlast_8;
wire axis_tready_8;
wire axis_tvalid_9;
wire axis_tlast_9;
wire axis_tready_9;
wire axis_tvalid_10;
wire axis_tlast_10;
wire axis_tready_10;
wire axis_tvalid_11;
wire axis_tlast_11;
wire axis_tready_11;
wire [16*9-1:0] weight_rd_0;
wire [1*5-1:0] weight_ra_0;
wire [16*32-1:0] bias_rd_0;
wire [16*32-1:0] scale_rd_0;
wire [16*9-1:0] weight_rd_1;
wire [1*8-1:0] weight_ra_1;
wire [16*32-1:0] bias_rd_1;
wire [16*32-1:0] scale_rd_1;
wire [32*9-1:0] weight_rd_2;
wire [1*8-1:0] weight_ra_2;
wire [32*32-1:0] bias_rd_2;
wire [32*32-1:0] scale_rd_2;
wire [32*9-1:0] weight_rd_3;
wire [1*9-1:0] weight_ra_3;
wire [32*32-1:0] bias_rd_3;
wire [32*32-1:0] scale_rd_3;
wire [64*9-1:0] weight_rd_4;
wire [1*9-1:0] weight_ra_4;
wire [64*32-1:0] bias_rd_4;
wire [64*32-1:0] scale_rd_4;
wire [64*9-1:0] weight_rd_5;
wire [1*10-1:0] weight_ra_5;
wire [64*32-1:0] bias_rd_5;
wire [64*32-1:0] scale_rd_5;
wire [64*9-1:0] weight_rd_6;
wire [1*10-1:0] weight_ra_6;
wire [64*32-1:0] bias_rd_6;
wire [64*32-1:0] scale_rd_6;
wire [64*9-1:0] weight_rd_7;
wire [1*10-1:0] weight_ra_7;
wire [64*32-1:0] bias_rd_7;
wire [64*32-1:0] scale_rd_7;
wire [64*9-1:0] weight_rd_8;
wire [1*10-1:0] weight_ra_8;
wire [64*32-1:0] bias_rd_8;
wire [64*32-1:0] scale_rd_8;
wire [64*9-1:0] weight_rd_9;
wire [1*10-1:0] weight_ra_9;
wire [64*32-1:0] bias_rd_9;
wire [64*32-1:0] scale_rd_9;
wire [64*9-1:0] weight_rd_10;
wire [1*10-1:0] weight_ra_10;
wire [64*32-1:0] bias_rd_10;
wire [64*32-1:0] scale_rd_10;
wire [1*9-1:0] weight_rd_11;
wire [1*10-1:0] weight_ra_11;
wire [1*32-1:0] bias_rd_11;
wire [1*32-1:0] scale_rd_11;

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_SWIDTH,NROW,NCOL,OVERLAP,REGA,REGB
conv2d #(9,14,1108,27,2160,3840,3,2158,3838,16,3,3,1,14,277,4,277,2,9,8) u0 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_0),
.weight_ra(weight_ra_0),
.bias_rd(bias_rd_0),
.scale_rd(scale_rd_0),
.s_axis_data(s_axis_data),
.s_axis_tvalid(s_axis_tvalid),
.s_axis_tlast(s_axis_tlast),
.s_axis_tready(s_axis_tready),
.m_axis_data(axis_data_1),
.m_axis_tvalid(axis_tvalid_1),
.m_axis_tlast(axis_tlast_1),
.m_axis_tready(axis_tready_1)
);
// weight_rom
weight_rom_0 rom0 (
.clk(clk),
.addr(weight_ra_0),
.data(weight_rd_0)
);

// bias_rom
bias_rom_0 bias0 (
.data(bias_rd_0)
);

// scale_rom
scale_rom_0 scale0 (
.data(scale_rd_0)
);

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_SWIDTH,NROW,NCOL,OVERLAP,REGA,REGB
conv2d #(9,18,1075,144,2158,3838,16,1078,1918,16,3,3,2,14,277,5,215,1,9,8) u1 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_1),
.weight_ra(weight_ra_1),
.bias_rd(bias_rd_1),
.scale_rd(scale_rd_1),
.s_axis_data(axis_data_1),
.s_axis_tvalid(axis_tvalid_1),
.s_axis_tlast(axis_tlast_1),
.s_axis_tready(axis_tready_1),
.m_axis_data(axis_data_2),
.m_axis_tvalid(axis_tvalid_2),
.m_axis_tlast(axis_tlast_2),
.m_axis_tready(axis_tready_2)
);
// weight_rom
weight_rom_1 rom1 (
.clk(clk),
.addr(weight_ra_1),
.data(weight_rd_1)
);

// bias_rom
bias_rom_1 bias1 (
.data(bias_rd_1)
);

// scale_rom
scale_rom_1 scale1 (
.data(scale_rd_1)
);

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_SWIDTH,NROW,NCOL,OVERLAP,REGA,REGB
conv2d #(9,18,436,144,1078,1918,16,1076,1916,32,3,3,1,18,215,4,109,2,9,8) u2 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_2),
.weight_ra(weight_ra_2),
.bias_rd(bias_rd_2),
.scale_rd(scale_rd_2),
.s_axis_data(axis_data_2),
.s_axis_tvalid(axis_tvalid_2),
.s_axis_tlast(axis_tlast_2),
.s_axis_tready(axis_tready_2),
.m_axis_data(axis_data_3),
.m_axis_tvalid(axis_tvalid_3),
.m_axis_tlast(axis_tlast_3),
.m_axis_tready(axis_tready_3)
);
// weight_rom
weight_rom_2 rom2 (
.clk(clk),
.addr(weight_ra_2),
.data(weight_rd_2)
);

// bias_rom
bias_rom_2 bias2 (
.data(bias_rd_2)
);

// scale_rom
scale_rom_2 scale2 (
.data(scale_rd_2)
);

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_SWIDTH,NROW,NCOL,OVERLAP,REGA,REGB
conv2d #(9,9,1075,288,1076,1916,32,537,957,32,3,3,2,18,109,5,215,1,9,8) u3 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_3),
.weight_ra(weight_ra_3),
.bias_rd(bias_rd_3),
.scale_rd(scale_rd_3),
.s_axis_data(axis_data_3),
.s_axis_tvalid(axis_tvalid_3),
.s_axis_tlast(axis_tlast_3),
.s_axis_tready(axis_tready_3),
.m_axis_data(axis_data_4),
.m_axis_tvalid(axis_tvalid_4),
.m_axis_tlast(axis_tlast_4),
.m_axis_tready(axis_tready_4)
);
// weight_rom
weight_rom_3 rom3 (
.clk(clk),
.addr(weight_ra_3),
.data(weight_rd_3)
);

// bias_rom
bias_rom_3 bias3 (
.data(bias_rd_3)
);

// scale_rom
scale_rom_3 scale3 (
.data(scale_rd_3)
);

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_SWIDTH,NROW,NCOL,OVERLAP,REGA,REGB
conv2d #(9,9,436,288,537,957,32,535,955,64,3,3,1,9,215,4,109,2,9,8) u4 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_4),
.weight_ra(weight_ra_4),
.bias_rd(bias_rd_4),
.scale_rd(scale_rd_4),
.s_axis_data(axis_data_4),
.s_axis_tvalid(axis_tvalid_4),
.s_axis_tlast(axis_tlast_4),
.s_axis_tready(axis_tready_4),
.m_axis_data(axis_data_5),
.m_axis_tvalid(axis_tvalid_5),
.m_axis_tlast(axis_tlast_5),
.m_axis_tready(axis_tready_5)
);
// weight_rom
weight_rom_4 rom4 (
.clk(clk),
.addr(weight_ra_4),
.data(weight_rd_4)
);

// bias_rom
bias_rom_4 bias4 (
.data(bias_rd_4)
);

// scale_rom
scale_rom_4 scale4 (
.data(scale_rd_4)
);

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_SWIDTH,NROW,NCOL,OVERLAP,REGA,REGB
conv2d #(9,5,965,576,535,955,64,267,477,64,3,3,2,9,109,5,193,1,9,8) u5 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_5),
.weight_ra(weight_ra_5),
.bias_rd(bias_rd_5),
.scale_rd(scale_rd_5),
.s_axis_data(axis_data_5),
.s_axis_tvalid(axis_tvalid_5),
.s_axis_tlast(axis_tlast_5),
.s_axis_tready(axis_tready_5),
.m_axis_data(axis_data_6),
.m_axis_tvalid(axis_tvalid_6),
.m_axis_tlast(axis_tlast_6),
.m_axis_tready(axis_tready_6)
);
// weight_rom
weight_rom_5 rom5 (
.clk(clk),
.addr(weight_ra_5),
.data(weight_rd_5)
);

// bias_rom
bias_rom_5 bias5 (
.data(bias_rd_5)
);

// scale_rom
scale_rom_5 scale5 (
.data(scale_rd_5)
);

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_SWIDTH,NROW,NCOL,OVERLAP,REGA,REGB
conv2d #(9,5,388,576,267,477,64,265,475,64,3,3,1,5,193,4,97,2,9,8) u6 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_6),
.weight_ra(weight_ra_6),
.bias_rd(bias_rd_6),
.scale_rd(scale_rd_6),
.s_axis_data(axis_data_6),
.s_axis_tvalid(axis_tvalid_6),
.s_axis_tlast(axis_tlast_6),
.s_axis_tready(axis_tready_6),
.m_axis_data(axis_data_7),
.m_axis_tvalid(axis_tvalid_7),
.m_axis_tlast(axis_tlast_7),
.m_axis_tready(axis_tready_7)
);
// weight_rom
weight_rom_6 rom6 (
.clk(clk),
.addr(weight_ra_6),
.data(weight_rd_6)
);

// bias_rom
bias_rom_6 bias6 (
.data(bias_rd_6)
);

// scale_rom
scale_rom_6 scale6 (
.data(scale_rd_6)
);

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_SWIDTH,NROW,NCOL,OVERLAP,REGA,REGB
conv2d #(9,2,1195,576,265,475,64,132,237,64,3,3,2,5,97,5,239,1,9,8) u7 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_7),
.weight_ra(weight_ra_7),
.bias_rd(bias_rd_7),
.scale_rd(scale_rd_7),
.s_axis_data(axis_data_7),
.s_axis_tvalid(axis_tvalid_7),
.s_axis_tlast(axis_tlast_7),
.s_axis_tready(axis_tready_7),
.m_axis_data(axis_data_8),
.m_axis_tvalid(axis_tvalid_8),
.m_axis_tlast(axis_tlast_8),
.m_axis_tready(axis_tready_8)
);
// weight_rom
weight_rom_7 rom7 (
.clk(clk),
.addr(weight_ra_7),
.data(weight_rd_7)
);

// bias_rom
bias_rom_7 bias7 (
.data(bias_rd_7)
);

// scale_rom
scale_rom_7 scale7 (
.data(scale_rd_7)
);

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_SWIDTH,NROW,NCOL,OVERLAP,REGA,REGB
conv2d #(9,2,480,576,132,237,64,130,235,64,3,3,1,2,239,4,120,2,9,8) u8 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_8),
.weight_ra(weight_ra_8),
.bias_rd(bias_rd_8),
.scale_rd(scale_rd_8),
.s_axis_data(axis_data_8),
.s_axis_tvalid(axis_tvalid_8),
.s_axis_tlast(axis_tlast_8),
.s_axis_tready(axis_tready_8),
.m_axis_data(axis_data_9),
.m_axis_tvalid(axis_tvalid_9),
.m_axis_tlast(axis_tlast_9),
.m_axis_tready(axis_tready_9)
);
// weight_rom
weight_rom_8 rom8 (
.clk(clk),
.addr(weight_ra_8),
.data(weight_rd_8)
);

// bias_rom
bias_rom_8 bias8 (
.data(bias_rd_8)
);

// scale_rom
scale_rom_8 scale8 (
.data(scale_rd_8)
);

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_SWIDTH,NROW,NCOL,OVERLAP,REGA,REGB
conv2d #(9,2,476,576,130,235,64,128,233,64,3,3,1,2,120,4,119,2,9,8) u9 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_9),
.weight_ra(weight_ra_9),
.bias_rd(bias_rd_9),
.scale_rd(scale_rd_9),
.s_axis_data(axis_data_9),
.s_axis_tvalid(axis_tvalid_9),
.s_axis_tlast(axis_tlast_9),
.s_axis_tready(axis_tready_9),
.m_axis_data(axis_data_10),
.m_axis_tvalid(axis_tvalid_10),
.m_axis_tlast(axis_tlast_10),
.m_axis_tready(axis_tready_10)
);
// weight_rom
weight_rom_9 rom9 (
.clk(clk),
.addr(weight_ra_9),
.data(weight_rd_9)
);

// bias_rom
bias_rom_9 bias9 (
.data(bias_rd_9)
);

// scale_rom
scale_rom_9 scale9 (
.data(scale_rd_9)
);

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_SWIDTH,NROW,NCOL,OVERLAP,REGA,REGB
conv2d #(9,2,472,576,128,233,64,126,231,64,3,3,1,2,119,4,118,2,9,8) u10 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_10),
.weight_ra(weight_ra_10),
.bias_rd(bias_rd_10),
.scale_rd(scale_rd_10),
.s_axis_data(axis_data_10),
.s_axis_tvalid(axis_tvalid_10),
.s_axis_tlast(axis_tlast_10),
.s_axis_tready(axis_tready_10),
.m_axis_data(axis_data_11),
.m_axis_tvalid(axis_tvalid_11),
.m_axis_tlast(axis_tlast_11),
.m_axis_tready(axis_tready_11)
);
// weight_rom
weight_rom_10 rom10 (
.clk(clk),
.addr(weight_ra_10),
.data(weight_rd_10)
);

// bias_rom
bias_rom_10 bias10 (
.data(bias_rd_10)
);

// scale_rom
scale_rom_10 scale10 (
.data(scale_rd_10)
);

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_SWIDTH,NROW,NCOL,OVERLAP,REGA,REGB
conv2d #(9,1,924,576,126,231,64,124,229,1,3,3,1,2,118,4,231,2,9,8) u11 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_11),
.weight_ra(weight_ra_11),
.bias_rd(bias_rd_11),
.scale_rd(scale_rd_11),
.s_axis_data(axis_data_11),
.s_axis_tvalid(axis_tvalid_11),
.s_axis_tlast(axis_tlast_11),
.s_axis_tready(axis_tready_11),
.m_axis_data(m_axis_data),
.m_axis_tvalid(m_axis_tvalid),
.m_axis_tlast(m_axis_tlast),
.m_axis_tready(m_axis_tready)
);
// weight_rom
weight_rom_11 rom11 (
.clk(clk),
.addr(weight_ra_11),
.data(weight_rd_11)
);

// bias_rom
bias_rom_11 bias11 (
.data(bias_rd_11)
);

// scale_rom
scale_rom_11 scale11 (
.data(scale_rd_11)
);

endmodule

