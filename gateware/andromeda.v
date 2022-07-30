//////////////////////////////////////////////////////////////////////////////////
// Company: Rapid Silicon
// Engineer: Zafar Ali
//
// Create Date: 07/22/2022 06:31:52 PM
// Design Name: andromeda
// Module Name: andromeda
// Project Name: Andromeda AI Reference Application for Gemini
// Target Devices: Artix 7 100t, Gemini (Caster)
// Tool Versions: Vivado 2017, Raptor, litex
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module andromeda (
    input  wire        clk,
    input  wire        reset,
    input  wire        wb_CYC,
    input  wire        wb_STB,
    output wire        wb_ACK,
    input  wire        wb_WE,
    input  wire [29:0] wb_ADR,
    output wire [31:0] wb_DAT_MISO,
    input  wire [31:0] wb_DAT_MOSI,
    input  wire [ 3:0] wb_SEL,

    inout  wire I2C_SDA,
    output wire I2C_SCL,

    output wire                          M_AXIS_TVALID,
    output wire [AXIS_TDATA_WIDTH-1 : 0] M_AXIS_TDATA,
    output wire                          M_AXIS_TLAST,
    output wire                          F_GRAB_INT
);

  // WB to axi-lite converter and decoder
  parameter S_COUNT = 1;  // Number of AXI inputs (slave interfaces)
  parameter S_SIZE = 20;  // size of memory map = 2^S_SIZE
  parameter AXI_ADDR_WIDTH = 32;
  parameter AXI_DATA_WIDTH = 32;
  parameter WB_DATA_WIDTH = 32;
  parameter WB_ADDR_WIDTH = 32;
  parameter AXIS_TDATA_WIDTH = 32;

  wire [                      31:0] addr;
  wire [               S_COUNT-1:0] stb;  // one strobe per slave
  wire                              we;
  wire [                      31:0] wdata;
  wire [            S_COUNT*32-1:0] rdata;  // rdata[31:0] per slave
  wire [               S_COUNT-1:0] ack;  // one ack per slave


  wire                              M_AXI_ACLK;
  wire                              M_AXI_ARESETN;

  wire [               S_COUNT-1:0] M_AXI_AWVALID;
  wire [               S_COUNT-1:0] M_AXI_AWREADY;
  wire [        AXI_ADDR_WIDTH-1:0] M_AXI_AWADDR;
  wire [                       2:0] M_AXI_AWPROT;

  wire [               S_COUNT-1:0] M_AXI_WVALID;
  wire [               S_COUNT-1:0] M_AXI_WREADY;
  wire [        AXI_DATA_WIDTH-1:0] M_AXI_WDATA;
  wire [      AXI_DATA_WIDTH/8-1:0] M_AXI_WSTRB;

  wire [               S_COUNT-1:0] M_AXI_BVALID;
  wire [               S_COUNT-1:0] M_AXI_BREADY;
  wire [             S_COUNT*2-1:0] M_AXI_BRESP;

  wire [               S_COUNT-1:0] M_AXI_ARVALID;
  wire [               S_COUNT-1:0] M_AXI_ARREADY;
  wire [        AXI_ADDR_WIDTH-1:0] M_AXI_ARADDR;
  wire [                       2:0] M_AXI_ARPROT;

  wire [               S_COUNT-1:0] M_AXI_RVALID;
  wire [               S_COUNT-1:0] M_AXI_RREADY;
  wire [S_COUNT*AXI_DATA_WIDTH-1:0] M_AXI_RDATA;
  wire [             S_COUNT*2-1:0] M_AXI_RRESP;

  wire                              ib_intrpt;
  wire                              ob_intrpt;
  wire                              soc_if_intrpt;

  soc_if #(
      .S_COUNT(S_COUNT),
      .S_SIZE(S_SIZE),
      .AXI_ADDR_WIDTH(AXI_ADDR_WIDTH),
      .AXI_DATA_WIDTH(AXI_DATA_WIDTH),
      .WB_DATA_WIDTH(WB_DATA_WIDTH),
      .WB_ADDR_WIDTH(WB_ADDR_WIDTH)
  ) soc_if_dut (
      .WB_CLK_I (clk),
      .WB_RST_I (reset),
      .WBS_STB_I(wb_STB),
      .WBS_CYC_I(wb_CYC),
      .WBS_WE_I (wb_WE),
      .WBS_SEL_I(wb_SEL),
      .WBS_DAT_I(wb_DAT_MOSI),
      .WBS_ADR_I({2'b0, wb_ADR}),

      .WBS_ACK_O(wb_ACK),
      .WBS_DAT_O(wb_DAT_MISO),

      .M_AXI_ACLK(M_AXI_ACLK),
      .M_AXI_ARESETN(M_AXI_ARESETN),

      .M_AXI_AWVALID(M_AXI_AWVALID),
      .M_AXI_AWREADY(M_AXI_AWREADY),
      .M_AXI_AWADDR (M_AXI_AWADDR),
      .M_AXI_AWPROT (M_AXI_AWPROT),

      .M_AXI_WVALID(M_AXI_WVALID),
      .M_AXI_WREADY(M_AXI_WREADY),
      .M_AXI_WDATA (M_AXI_WDATA),
      .M_AXI_WSTRB (M_AXI_WSTRB),

      .M_AXI_BVALID(M_AXI_BVALID),
      .M_AXI_BREADY(M_AXI_BREADY),
      .M_AXI_BRESP (M_AXI_BRESP),

      .M_AXI_ARVALID(M_AXI_ARVALID),
      .M_AXI_ARREADY(M_AXI_ARREADY),
      .M_AXI_ARADDR (M_AXI_ARADDR),
      .M_AXI_ARPROT (M_AXI_ARPROT),

      .M_AXI_RVALID(M_AXI_RVALID),
      .M_AXI_RREADY(M_AXI_RREADY),
      .M_AXI_RDATA (M_AXI_RDATA),
      .M_AXI_RRESP (M_AXI_RRESP),

      .ib_intrpt(ib_intrpt),
      .ob_intrpt(ob_intrpt),
      .soc_if_intrpt(soc_if_intrpt)
  );


  ibuf #(
      .C_S_AXI_DATA_WIDTH  (AXI_DATA_WIDTH),
      .C_S_AXI_ADDR_WIDTH  (AXI_ADDR_WIDTH),
      .C_M_AXIS_TDATA_WIDTH(AXIS_TDATA_WIDTH)
  ) ibuf_dut (
      .S_AXI_ACLK(M_AXI_ACLK),
      .S_AXI_ARESETN(M_AXI_ARESETN),
      .S_AXI_AWADDR(M_AXI_AWADDR),
      .S_AXI_AWPROT(M_AXI_AWPROT),
      .S_AXI_AWVALID(M_AXI_AWVALID[0]),
      .S_AXI_AWREADY(M_AXI_AWREADY[0]),
      .S_AXI_WDATA(M_AXI_WDATA),
      .S_AXI_WSTRB(M_AXI_WSTRB),
      .S_AXI_WVALID(M_AXI_WVALID[0]),
      .S_AXI_WREADY(M_AXI_WREADY[0]),
      .S_AXI_BRESP(M_AXI_BRESP[1:0]),
      .S_AXI_BVALID(M_AXI_BVALID[0]),
      .S_AXI_BREADY(M_AXI_BREADY[0]),
      .S_AXI_ARADDR(M_AXI_ARADDR),
      .S_AXI_ARPROT(M_AXI_ARPROT),
      .S_AXI_ARVALID(M_AXI_ARVALID[0]),
      .S_AXI_ARREADY(M_AXI_ARREADY[0]),
      .S_AXI_RDATA(M_AXI_RDATA[31:0]),
      .S_AXI_RRESP(M_AXI_RRESP[1:0]),
      .S_AXI_RVALID(M_AXI_RVALID[0]),
      .S_AXI_RREADY(M_AXI_RREADY[0]),
      .I2C_SDA(I2C_SDA),
      .I2C_SCL(I2C_SCL),
      .M_AXIS_ACLK(M_AXIS_ACLK),
      .M_AXIS_ARESETN(M_AXIS_ARESETN),
      .M_AXIS_TVALID(M_AXIS_TVALID),
      .M_AXIS_TDATA(M_AXIS_TDATA),
      .M_AXIS_TLAST(M_AXIS_TLAST),
      .F_GRAB_INT(ib_intrpt)
  );

endmodule
