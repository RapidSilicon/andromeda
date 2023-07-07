module t4 (
    input wire clk,
    input wire reset,
    input wire [3*8-1:0] s_axis_data,
    input wire s_axis_tvalid,
    input wire s_axis_tlast,
    output wire s_axis_tready,
    output wire [1*8-1:0] m_axis_data,
    output wire m_axis_tvalid,
    output wire m_axis_tlast,
    input wire m_axis_tready
);

wire [16*8-1:0] axis_data_1;
wire [16*8-1:0] axis_data_2;
wire [32*8-1:0] axis_data_3;
wire [32*8-1:0] axis_data_4;
wire [64*8-1:0] axis_data_5;
wire [64*8-1:0] axis_data_6;
wire [128*8-1:0] axis_data_7;
wire [128*8-1:0] axis_data_8;
wire [1*8-1:0] axis_data_9;
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
wire [16*8-1:0] weight_rd_0;
wire [16*5-1:0] weight_ra_0;
wire [16*8-1:0] weight_rd_1;
wire [16*8-1:0] weight_ra_1;
wire [32*8-1:0] weight_rd_2;
wire [32*8-1:0] weight_ra_2;
wire [32*8-1:0] weight_rd_3;
wire [32*9-1:0] weight_ra_3;
wire [64*8-1:0] weight_rd_4;
wire [64*9-1:0] weight_ra_4;
wire [64*8-1:0] weight_rd_5;
wire [64*10-1:0] weight_ra_5;
wire [128*8-1:0] weight_rd_6;
wire [128*10-1:0] weight_ra_6;
wire [128*8-1:0] weight_rd_7;
wire [128*11-1:0] weight_ra_7;
wire [1*8-1:0] weight_rd_8;
wire [1*11-1:0] weight_ra_8;

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_SWIDTH,NCOL,OVERLAP
conv2d #(8,14,1108,31,2160,3840,3,2158,3838,16,3,3,1,14,277,277,2) u0 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_0),
.weight_ra(weight_ra_0),
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

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_SWIDTH,NCOL,OVERLAP
conv2d #(8,18,1075,148,2158,3838,16,1078,1918,16,3,3,2,14,277,215,1) u1 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_1),
.weight_ra(weight_ra_1),
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

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_SWIDTH,NCOL,OVERLAP
conv2d #(8,18,436,148,1078,1918,16,1076,1916,32,3,3,1,18,215,109,2) u2 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_2),
.weight_ra(weight_ra_2),
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

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_SWIDTH,NCOL,OVERLAP
conv2d #(8,9,1075,292,1076,1916,32,537,957,32,3,3,2,18,109,215,1) u3 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_3),
.weight_ra(weight_ra_3),
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

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_SWIDTH,NCOL,OVERLAP
conv2d #(8,9,436,292,537,957,32,535,955,64,3,3,1,9,215,109,2) u4 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_4),
.weight_ra(weight_ra_4),
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

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_SWIDTH,NCOL,OVERLAP
conv2d #(8,5,965,580,535,955,64,267,477,64,3,3,2,9,109,193,1) u5 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_5),
.weight_ra(weight_ra_5),
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

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_SWIDTH,NCOL,OVERLAP
conv2d #(8,5,388,580,267,477,64,265,475,128,3,3,1,5,193,97,2) u6 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_6),
.weight_ra(weight_ra_6),
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

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_SWIDTH,NCOL,OVERLAP
conv2d #(8,3,795,1156,265,475,128,132,237,128,3,3,2,5,97,159,1) u7 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_7),
.weight_ra(weight_ra_7),
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

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_SWIDTH,NCOL,OVERLAP
conv2d #(8,3,324,1156,132,237,128,130,235,1,3,3,1,3,159,81,2) u8 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_8),
.weight_ra(weight_ra_8),
.s_axis_data(axis_data_8),
.s_axis_tvalid(axis_tvalid_8),
.s_axis_tlast(axis_tlast_8),
.s_axis_tready(axis_tready_8),
.m_axis_data(m_axis_data),
.m_axis_tvalid(m_axis_tvalid),
.m_axis_tlast(m_axis_tlast),
.m_axis_tready(m_axis_tready)
);
// weight_rom
weight_rom_8 rom8 (
.clk(clk),
.addr(weight_ra_8),
.data(weight_rd_8)
);

endmodule

