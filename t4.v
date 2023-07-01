module t4 (
    input wire clk,
    input wire reset,
    input wire [3*8-1:0] s_axis_data,
    input wire s_axis_tvalid,
    input wire s_axis_tlast,
    output wire s_axis_tready,
    output wire [128*8-1:0] m_axis_data,
    output wire m_axis_tvalid,
    output wire m_axis_tlast,
    input wire m_axis_tready
);

wire [8*8-1:0] axis_data_1;
wire [8*8-1:0] axis_data_2;
wire [16*8-1:0] axis_data_3;
wire [16*8-1:0] axis_data_4;
wire [32*8-1:0] axis_data_5;
wire [32*8-1:0] axis_data_6;
wire [64*8-1:0] axis_data_7;
wire [64*8-1:0] axis_data_8;
wire [128*8-1:0] axis_data_9;
wire [128*8-1:0] axis_data_10;
wire [128*8-1:0] axis_data_11;
wire [128*8-1:0] axis_data_12;
wire [128*8-1:0] axis_data_13;
wire [128*8-1:0] axis_data_14;
wire [128*8-1:0] axis_data_15;
wire [128*8-1:0] axis_data_16;
wire [128*8-1:0] axis_data_17;
wire [128*8-1:0] axis_data_18;
wire [128*8-1:0] axis_data_19;
wire [128*8-1:0] axis_data_20;
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
wire axis_tvalid_12;
wire axis_tlast_12;
wire axis_tready_12;
wire axis_tvalid_13;
wire axis_tlast_13;
wire axis_tready_13;
wire axis_tvalid_14;
wire axis_tlast_14;
wire axis_tready_14;
wire axis_tvalid_15;
wire axis_tlast_15;
wire axis_tready_15;
wire axis_tvalid_16;
wire axis_tlast_16;
wire axis_tready_16;
wire axis_tvalid_17;
wire axis_tlast_17;
wire axis_tready_17;
wire axis_tvalid_18;
wire axis_tlast_18;
wire axis_tready_18;
wire axis_tvalid_19;
wire axis_tlast_19;
wire axis_tready_19;
wire [8*8-1:0] weight_rd_0;
wire [8*5-1:0] weight_ra_0;
wire [8*8-1:0] weight_rd_1;
wire [8*7-1:0] weight_ra_1;
wire [16*8-1:0] weight_rd_2;
wire [16*7-1:0] weight_ra_2;
wire [16*8-1:0] weight_rd_3;
wire [16*8-1:0] weight_ra_3;
wire [32*8-1:0] weight_rd_4;
wire [32*8-1:0] weight_ra_4;
wire [32*8-1:0] weight_rd_5;
wire [32*9-1:0] weight_ra_5;
wire [64*8-1:0] weight_rd_6;
wire [64*9-1:0] weight_ra_6;
wire [64*8-1:0] weight_rd_7;
wire [64*10-1:0] weight_ra_7;
wire [128*8-1:0] weight_rd_8;
wire [128*10-1:0] weight_ra_8;
wire [128*8-1:0] weight_rd_9;
wire [128*11-1:0] weight_ra_9;
wire [128*8-1:0] weight_rd_10;
wire [128*11-1:0] weight_ra_10;
wire [128*8-1:0] weight_rd_11;
wire [128*11-1:0] weight_ra_11;
wire [128*8-1:0] weight_rd_12;
wire [128*11-1:0] weight_ra_12;
wire [128*8-1:0] weight_rd_13;
wire [128*11-1:0] weight_ra_13;
wire [128*8-1:0] weight_rd_14;
wire [128*11-1:0] weight_ra_14;
wire [128*8-1:0] weight_rd_15;
wire [128*11-1:0] weight_ra_15;
wire [128*8-1:0] weight_rd_16;
wire [128*11-1:0] weight_ra_16;
wire [128*8-1:0] weight_rd_17;
wire [128*11-1:0] weight_ra_17;
wire [128*8-1:0] weight_rd_18;
wire [128*13-1:0] weight_ra_18;
wire [128*8-1:0] weight_rd_19;
wire [128*11-1:0] weight_ra_19;

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE
conv2d #(8,14,3850,31,2160,3840,3,2158,3838,8,3,3,1) u0 (
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

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE
conv2d #(8,9,3843,76,2158,3838,8,1078,1918,8,3,3,2) u1 (
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

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE
conv2d #(8,9,1926,76,1078,1918,8,1076,1916,16,3,3,1) u2 (
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

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE
conv2d #(8,5,1920,148,1076,1916,16,537,957,16,3,3,2) u3 (
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

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE
conv2d #(8,5,960,148,537,957,16,535,955,32,3,3,1) u4 (
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

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE
conv2d #(8,3,957,292,535,955,32,267,477,32,3,3,2) u5 (
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

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE
conv2d #(8,3,477,292,267,477,32,265,475,64,3,3,1) u6 (
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

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE
conv2d #(8,2,476,580,265,475,64,132,237,64,3,3,2) u7 (
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

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE
conv2d #(8,2,238,580,132,237,64,130,235,128,3,3,1) u8 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_8),
.weight_ra(weight_ra_8),
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

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE
conv2d #(8,1,235,1156,130,235,128,64,117,128,3,3,2) u9 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_9),
.weight_ra(weight_ra_9),
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

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE
conv2d #(8,1,117,1156,64,117,128,62,115,128,3,3,1) u10 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_10),
.weight_ra(weight_ra_10),
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

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE
conv2d #(8,1,115,1156,62,115,128,30,57,128,3,3,2) u11 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_11),
.weight_ra(weight_ra_11),
.s_axis_data(axis_data_11),
.s_axis_tvalid(axis_tvalid_11),
.s_axis_tlast(axis_tlast_11),
.s_axis_tready(axis_tready_11),
.m_axis_data(axis_data_12),
.m_axis_tvalid(axis_tvalid_12),
.m_axis_tlast(axis_tlast_12),
.m_axis_tready(axis_tready_12)
);
// weight_rom
weight_rom_11 rom11 (
.clk(clk),
.addr(weight_ra_11),
.data(weight_rd_11)
);

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE
conv2d #(8,1,57,1156,30,57,128,28,55,128,3,3,1) u12 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_12),
.weight_ra(weight_ra_12),
.s_axis_data(axis_data_12),
.s_axis_tvalid(axis_tvalid_12),
.s_axis_tlast(axis_tlast_12),
.s_axis_tready(axis_tready_12),
.m_axis_data(axis_data_13),
.m_axis_tvalid(axis_tvalid_13),
.m_axis_tlast(axis_tlast_13),
.m_axis_tready(axis_tready_13)
);
// weight_rom
weight_rom_12 rom12 (
.clk(clk),
.addr(weight_ra_12),
.data(weight_rd_12)
);

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE
conv2d #(8,1,55,1156,28,55,128,13,27,128,3,3,2) u13 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_13),
.weight_ra(weight_ra_13),
.s_axis_data(axis_data_13),
.s_axis_tvalid(axis_tvalid_13),
.s_axis_tlast(axis_tlast_13),
.s_axis_tready(axis_tready_13),
.m_axis_data(axis_data_14),
.m_axis_tvalid(axis_tvalid_14),
.m_axis_tlast(axis_tlast_14),
.m_axis_tready(axis_tready_14)
);
// weight_rom
weight_rom_13 rom13 (
.clk(clk),
.addr(weight_ra_13),
.data(weight_rd_13)
);

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE
conv2d #(8,1,27,1156,13,27,128,11,25,128,3,3,1) u14 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_14),
.weight_ra(weight_ra_14),
.s_axis_data(axis_data_14),
.s_axis_tvalid(axis_tvalid_14),
.s_axis_tlast(axis_tlast_14),
.s_axis_tready(axis_tready_14),
.m_axis_data(axis_data_15),
.m_axis_tvalid(axis_tvalid_15),
.m_axis_tlast(axis_tlast_15),
.m_axis_tready(axis_tready_15)
);
// weight_rom
weight_rom_14 rom14 (
.clk(clk),
.addr(weight_ra_14),
.data(weight_rd_14)
);

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE
conv2d #(8,1,25,1156,11,25,128,9,23,128,3,3,1) u15 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_15),
.weight_ra(weight_ra_15),
.s_axis_data(axis_data_15),
.s_axis_tvalid(axis_tvalid_15),
.s_axis_tlast(axis_tlast_15),
.s_axis_tready(axis_tready_15),
.m_axis_data(axis_data_16),
.m_axis_tvalid(axis_tvalid_16),
.m_axis_tlast(axis_tlast_16),
.m_axis_tready(axis_tready_16)
);
// weight_rom
weight_rom_15 rom15 (
.clk(clk),
.addr(weight_ra_15),
.data(weight_rd_15)
);

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE
conv2d #(8,1,23,1156,9,23,128,7,21,128,3,3,1) u16 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_16),
.weight_ra(weight_ra_16),
.s_axis_data(axis_data_16),
.s_axis_tvalid(axis_tvalid_16),
.s_axis_tlast(axis_tlast_16),
.s_axis_tready(axis_tready_16),
.m_axis_data(axis_data_17),
.m_axis_tvalid(axis_tvalid_17),
.m_axis_tlast(axis_tlast_17),
.m_axis_tready(axis_tready_17)
);
// weight_rom
weight_rom_16 rom16 (
.clk(clk),
.addr(weight_ra_16),
.data(weight_rd_16)
);

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE
conv2d #(8,1,21,1156,7,21,128,5,19,128,3,3,1) u17 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_17),
.weight_ra(weight_ra_17),
.s_axis_data(axis_data_17),
.s_axis_tvalid(axis_tvalid_17),
.s_axis_tlast(axis_tlast_17),
.s_axis_tready(axis_tready_17),
.m_axis_data(axis_data_18),
.m_axis_tvalid(axis_tvalid_18),
.m_axis_tlast(axis_tlast_18),
.m_axis_tready(axis_tready_18)
);
// weight_rom
weight_rom_17 rom17 (
.clk(clk),
.addr(weight_ra_17),
.data(weight_rd_17)
);

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE
conv2d #(8,1,19,6532,5,19,128,3,3,128,3,17,6) u18 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_18),
.weight_ra(weight_ra_18),
.s_axis_data(axis_data_18),
.s_axis_tvalid(axis_tvalid_18),
.s_axis_tlast(axis_tlast_18),
.s_axis_tready(axis_tready_18),
.m_axis_data(axis_data_19),
.m_axis_tvalid(axis_tvalid_19),
.m_axis_tlast(axis_tlast_19),
.m_axis_tready(axis_tready_19)
);
// weight_rom
weight_rom_18 rom18 (
.clk(clk),
.addr(weight_ra_18),
.data(weight_rd_18)
);

// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE
conv2d #(8,1,3,1156,3,3,128,1,1,128,3,3,3) u19 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_19),
.weight_ra(weight_ra_19),
.s_axis_data(axis_data_19),
.s_axis_tvalid(axis_tvalid_19),
.s_axis_tlast(axis_tlast_19),
.s_axis_tready(axis_tready_19),
.m_axis_data(m_axis_data),
.m_axis_tvalid(m_axis_tvalid),
.m_axis_tlast(m_axis_tlast),
.m_axis_tready(m_axis_tready)
);
// weight_rom
weight_rom_19 rom19 (
.clk(clk),
.addr(weight_ra_19),
.data(weight_rd_19)
);

endmodule

