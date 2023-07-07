module mnist_model (
    input wire clk,
    input wire reset,
    input wire [1*8-1:0] s_axis_data,
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
wire [10*8-1:0] axis_data_6;
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
wire [32*8-1:0] weight_rd_0;
wire [32*9-1:0] weight_ra_0;
wire [32*8-1:0] weight_rd_1;
wire [32*14-1:0] weight_ra_1;
wire [32*8-1:0] weight_rd_2;
wire [32*14-1:0] weight_ra_2;
wire [32*8-1:0] weight_rd_3;
wire [32*14-1:0] weight_ra_3;
wire [32*8-1:0] weight_rd_4;
wire [32*14-1:0] weight_ra_4;
wire [10*8-1:0] weight_rd_5;
wire [10*11-1:0] weight_ra_5;

// conv2d #(TDATA,OCHAN,NSTRIPE,ICHAN,SADDR,WADDR,IWIDTH,IHEIGHT,KWIDTH,KHEIGHT,STRIDE)
conv2d #(8,32,3,1,6,9,28,28,3,3,1) u0 (
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
conv2d #(8,32,16,32,10,14,26,26,3,3,2) u1 (
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
conv2d #(8,32,13,32,9,14,12,12,3,3,1) u2 (
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
conv2d #(8,32,3,32,11,14,10,10,3,3,2) u3 (
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
conv2d #(8,32,2,32,9,14,4,4,3,3,1) u4 (
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
conv2d #(8,10,1,32,9,11,2,2,2,2,1) u5 (
.clk(clk),
.reset(reset),
.weight_rd(weight_rd_5),
.weight_ra(weight_ra_5),
.s_axis_data(axis_data_5),
.s_axis_tvalid(axis_tvalid_5),
.s_axis_tlast(axis_tlast_5),
.s_axis_tready(axis_tready_5),
.m_axis_data(m_axis_data),
.m_axis_tvalid(m_axis_tvalid),
.m_axis_tlast(m_axis_tlast),
.m_axis_tready(m_axis_tready)
);
// weight_rom
weight_rom_5 rom5 (
.clk(clk),
.addr(weight_ra_5),
.data(weight_rd_5)
);

endmodule

