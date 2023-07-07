module t2 (
    input wire clk,
    input wire reset,
    input wire [3*8-1:0] s_axis_data,
    input wire s_axis_tvalid,
    input wire s_axis_tlast,
    output wire s_axis_tready,
    output wire [10*8-1:0] m_axis_data,
    output wire m_axis_tvalid,
    output wire m_axis_tlast,
    input wire m_axis_tready
);

wire [32*8-1:0] axis_data_1;
wire [32*8-1:0] axis_data_2;
wire [32*8-1:0] axis_data_3;
wire [32*8-1:0] axis_data_4;
wire [32*8-1:0] axis_data_5;
wire [32*8-1:0] axis_data_6;
wire [32*8-1:0] axis_data_7;
wire [32*8-1:0] axis_data_8;
wire [32*8-1:0] axis_data_9;
wire [32*8-1:0] axis_data_10;
wire [32*8-1:0] axis_data_11;
wire [32*8-1:0] axis_data_12;
wire [32*8-1:0] axis_data_13;
wire [10*8-1:0] axis_data_14;
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
wire [32*8-1:0] weight_rd_0;
wire [32*10-1:0] weight_ra_0;
wire [32*8-1:0] weight_rd_1;
wire [32*14-1:0] weight_ra_1;
wire [32*8-1:0] weight_rd_2;
wire [32*14-1:0] weight_ra_2;
wire [32*8-1:0] weight_rd_3;
wire [32*14-1:0] weight_ra_3;
wire [32*8-1:0] weight_rd_4;
wire [32*14-1:0] weight_ra_4;
wire [32*8-1:0] weight_rd_5;
wire [32*14-1:0] weight_ra_5;
wire [32*8-1:0] weight_rd_6;
wire [32*14-1:0] weight_ra_6;
wire [32*8-1:0] weight_rd_7;
wire [32*14-1:0] weight_ra_7;
wire [32*8-1:0] weight_rd_8;
wire [32*14-1:0] weight_ra_8;
wire [32*8-1:0] weight_rd_9;
wire [32*14-1:0] weight_ra_9;
wire [32*8-1:0] weight_rd_10;
wire [32*14-1:0] weight_ra_10;
wire [32*8-1:0] weight_rd_11;
wire [32*14-1:0] weight_ra_11;
wire [32*8-1:0] weight_rd_12;
wire [32*14-1:0] weight_ra_12;
wire [10*8-1:0] weight_rd_13;
wire [10*13-1:0] weight_ra_13;

// conv2d #(TDATA,OCHAN,NSTRIPE,ICHAN,SADDR,WADDR,IWIDTH,IHEIGHT,KWIDTH,KHEIGHT,STRIDE)
conv2d #(8,32,1,3,14,10,728,544,3,3,1) u0 (
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

// conv2d #(TDATA,OCHAN,NSTRIPE,ICHAN,SADDR,WADDR,IWIDTH,IHEIGHT,KWIDTH,KHEIGHT,STRIDE)
conv2d #(8,32,1,32,17,14,726,542,3,3,2) u1 (
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

// conv2d #(TDATA,OCHAN,NSTRIPE,ICHAN,SADDR,WADDR,IWIDTH,IHEIGHT,KWIDTH,KHEIGHT,STRIDE)
conv2d #(8,32,1,32,16,14,362,270,3,3,1) u2 (
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

// conv2d #(TDATA,OCHAN,NSTRIPE,ICHAN,SADDR,WADDR,IWIDTH,IHEIGHT,KWIDTH,KHEIGHT,STRIDE)
conv2d #(8,32,1,32,16,14,360,268,3,3,2) u3 (
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

// conv2d #(TDATA,OCHAN,NSTRIPE,ICHAN,SADDR,WADDR,IWIDTH,IHEIGHT,KWIDTH,KHEIGHT,STRIDE)
conv2d #(8,32,1,32,15,14,179,133,3,3,1) u4 (
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

// conv2d #(TDATA,OCHAN,NSTRIPE,ICHAN,SADDR,WADDR,IWIDTH,IHEIGHT,KWIDTH,KHEIGHT,STRIDE)
conv2d #(8,32,1,32,15,14,177,131,3,3,1) u5 (
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

// conv2d #(TDATA,OCHAN,NSTRIPE,ICHAN,SADDR,WADDR,IWIDTH,IHEIGHT,KWIDTH,KHEIGHT,STRIDE)
conv2d #(8,32,1,32,14,14,88,65,3,3,1) u6 (
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

// conv2d #(TDATA,OCHAN,NSTRIPE,ICHAN,SADDR,WADDR,IWIDTH,IHEIGHT,KWIDTH,KHEIGHT,STRIDE)
conv2d #(8,32,1,32,14,14,86,63,3,3,1) u7 (
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

// conv2d #(TDATA,OCHAN,NSTRIPE,ICHAN,SADDR,WADDR,IWIDTH,IHEIGHT,KWIDTH,KHEIGHT,STRIDE)
conv2d #(8,32,1,32,13,14,42,31,3,3,1) u8 (
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

// conv2d #(TDATA,OCHAN,NSTRIPE,ICHAN,SADDR,WADDR,IWIDTH,IHEIGHT,KWIDTH,KHEIGHT,STRIDE)
conv2d #(8,32,1,32,13,14,40,29,3,3,1) u9 (
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

// conv2d #(TDATA,OCHAN,NSTRIPE,ICHAN,SADDR,WADDR,IWIDTH,IHEIGHT,KWIDTH,KHEIGHT,STRIDE)
conv2d #(8,32,1,32,12,14,19,14,3,3,1) u10 (
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

// conv2d #(TDATA,OCHAN,NSTRIPE,ICHAN,SADDR,WADDR,IWIDTH,IHEIGHT,KWIDTH,KHEIGHT,STRIDE)
conv2d #(8,32,1,32,12,14,17,12,3,3,1) u11 (
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

// conv2d #(TDATA,OCHAN,NSTRIPE,ICHAN,SADDR,WADDR,IWIDTH,IHEIGHT,KWIDTH,KHEIGHT,STRIDE)
conv2d #(8,32,1,32,11,14,8,5,3,3,1) u12 (
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

// conv2d #(TDATA,OCHAN,NSTRIPE,ICHAN,SADDR,WADDR,IWIDTH,IHEIGHT,KWIDTH,KHEIGHT,STRIDE)
conv2d #(8,10,1,32,11,13,6,3,6,3,1) u13 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_13),
.weight_ra(weight_ra_13),
.s_axis_data(axis_data_13),
.s_axis_tvalid(axis_tvalid_13),
.s_axis_tlast(axis_tlast_13),
.s_axis_tready(axis_tready_13),
.m_axis_data(m_axis_data),
.m_axis_tvalid(m_axis_tvalid),
.m_axis_tlast(m_axis_tlast),
.m_axis_tready(m_axis_tready)
);
// weight_rom
weight_rom_13 rom13 (
.clk(clk),
.addr(weight_ra_13),
.data(weight_rd_13)
);

endmodule

