//////////////////////////////////////////////////////////////////////////////////
// Company: Rapid Silicon
// Engineer: Zafar Ali
//
// Create Date: 07/22/2022 06:31:52 PM
// Design Name: andromeda
// Module Name: soc_if
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


//////////////////////////////////////////////////////////////////////////////////
// TODO:
// -> add interrupt logic
// -> add interrupt masking logic
// -> RRESP and BRESP signals not used
// ->
// ->


`define MEM_MAPPED_ADDR 12'h000
`define AXI_ADDR_SPACE 12'h001

module soc_if #(
    parameter S_COUNT        = 1,   // Number of AXI inputs (slave interfaces)
    parameter S_SIZE         = 20,  // size of memory map = 2^S_SIZE
    parameter AXI_ADDR_WIDTH = 32,
    parameter AXI_DATA_WIDTH = 32,
    parameter WB_DATA_WIDTH  = 32,
    parameter WB_ADDR_WIDTH  = 32
) (
    // wishbone slave interface
    input wire WB_CLK_I,
    input wire WB_RST_I,

    input wire                       WBS_STB_I,
    input wire                       WBS_CYC_I,
    input wire                       WBS_WE_I,
    input wire [WB_DATA_WIDTH/8-1:0] WBS_SEL_I,
    input wire [  WB_DATA_WIDTH-1:0] WBS_DAT_I,
    input wire [  WB_ADDR_WIDTH-1:0] WBS_ADR_I,

    output reg                     WBS_ACK_O,
    output reg [WB_DATA_WIDTH-1:0] WBS_DAT_O,

    // axi
    output                                   M_AXI_ACLK,
    output                                   M_AXI_ARESETN,
    // write address channel
    output reg  [               S_COUNT-1:0] M_AXI_AWVALID,
    input  wire [               S_COUNT-1:0] M_AXI_AWREADY,
    output reg  [        AXI_ADDR_WIDTH-1:0] M_AXI_AWADDR,
    output reg  [                       2:0] M_AXI_AWPROT,
    // write data channel
    output reg  [               S_COUNT-1:0] M_AXI_WVALID,
    input  wire [               S_COUNT-1:0] M_AXI_WREADY,
    output reg  [        AXI_DATA_WIDTH-1:0] M_AXI_WDATA,
    output reg  [      AXI_DATA_WIDTH/8-1:0] M_AXI_WSTRB,
    // write response channel
    input  wire [               S_COUNT-1:0] M_AXI_BVALID,
    output reg  [               S_COUNT-1:0] M_AXI_BREADY,
    input  wire [             S_COUNT*2-1:0] M_AXI_BRESP,    // logic to be implemented
    // read address channel
    output reg  [               S_COUNT-1:0] M_AXI_ARVALID,
    input  wire [               S_COUNT-1:0] M_AXI_ARREADY,
    output reg  [        AXI_ADDR_WIDTH-1:0] M_AXI_ARADDR,
    output reg  [                       2:0] M_AXI_ARPROT,
    // read data channel
    input  wire [               S_COUNT-1:0] M_AXI_RVALID,
    output reg  [               S_COUNT-1:0] M_AXI_RREADY,
    input  wire [S_COUNT*AXI_DATA_WIDTH-1:0] M_AXI_RDATA,
    input  wire [             S_COUNT*2-1:0] M_AXI_RRESP,    // logic to be implemented

    // interupt signals
    input  wire ib_intrpt,
    input  wire ob_intrpt,
    output wire soc_if_intrpt

);

  // Registers
  reg [S_COUNT-1:0] select_intrf;
  reg [31:0] INTRP_REG;

  reg adr;
  reg dat;
  reg resp;

  reg wb_we_reg;
  reg mm_reg;

  //
  wire   AXI_SPACE_FLG;
  wire    MEM_MAPPED_REG;


  // axi clock and reset

  assign M_AXI_ACLK = WB_CLK_I;
  assign M_AXI_ARESETN = !WB_RST_I;

  // Address Decoder
  integer i;
  always @(posedge WB_CLK_I) begin
    if (WB_RST_I) begin
      select_intrf <= 'b0;
    end else begin
      if (WBS_CYC_I && WBS_STB_I) begin
        for (i = 1; i < S_COUNT + 1; i = i + 1) begin
          select_intrf[i-1] <= WBS_ADR_I[S_SIZE+:8] == i[7:0] ? 'b1 : 'b0;
        end
      end

    end
  end

  // wb dat out 
  integer j;
  always @(posedge WB_CLK_I) begin
    if (WB_RST_I) begin
      WBS_DAT_O <= 'b0;
      WBS_ACK_O <= 1'b0;
    end else begin
      if (WBS_STB_I) begin
        if (|(M_AXI_RVALID & select_intrf)) begin
          for (j = 0; j < S_COUNT; j = j + 1) begin
            if (select_intrf[j]) begin
              WBS_DAT_O <= M_AXI_RDATA[j*AXI_DATA_WIDTH+:32];
              WBS_ACK_O <= 1'b1;
            end
          end
        end else if ((mm_reg || MEM_MAPPED_REG) && !WBS_WE_I) begin
          // address decoding can be added here
          WBS_DAT_O <= INTRP_REG;
          WBS_ACK_O <= 1'b1;
        end else if ((wb_we_reg && resp) || mm_reg) begin
          WBS_ACK_O <= 1'b1;
        end
      end else WBS_ACK_O <= 1'b0;

    end
  end

  // address space decode
  assign AXI_SPACE_FLG  = (WBS_STB_I && WBS_ADR_I[31:20] >= `AXI_ADDR_SPACE) ? 1'b1 : 1'b0;
  assign MEM_MAPPED_REG = (WBS_STB_I && WBS_ADR_I[31:20] == `MEM_MAPPED_ADDR) ? 1'b1 : 1'b0;

  // Interrupt Registor
  always @(posedge WB_CLK_I) begin
    if (WB_RST_I) begin
      INTRP_REG <= 'b0;
    end else begin
      INTRP_REG <= {30'hAFAF000, ob_intrpt, ib_intrpt};
    end
  end

  assign soc_if_intrpt = |INTRP_REG[1:0];

  // channels handshaking response capture
  always @(posedge WB_CLK_I) begin
    if (WB_RST_I) begin
      adr  <= 1'b0;
      dat  <= 1'b0;
      resp <= 1'b0;

    end else begin
      if (WBS_STB_I) begin
        if (WBS_WE_I) begin
          adr  <= ((|(M_AXI_AWREADY & select_intrf)) || adr);
          dat  <= (((|(M_AXI_WREADY & select_intrf))) || dat);
          resp <= (((|(M_AXI_BVALID & select_intrf)) && dat && adr) || resp);
        end else begin
          adr  <= (|(M_AXI_ARREADY & select_intrf) || adr);
          dat  <= (|(M_AXI_RVALID & select_intrf) || dat);
          resp <= 1'b0;
        end
      end else begin
        adr  <= 1'b0;
        dat  <= 1'b0;
        resp <= 1'b0;
      end
    end
  end

  //
  always @(WBS_SEL_I) begin

    M_AXI_AWPROT = 'b0;
    M_AXI_WSTRB  = WBS_SEL_I;
    M_AXI_ARPROT = 'b0;
  end


  always @(posedge WB_CLK_I) begin
    if (WB_RST_I) begin
      M_AXI_AWVALID <= 'b0;
      M_AXI_WVALID  <= 'b0;
      M_AXI_BREADY  <= 'b0;

    end else begin

      if (WBS_STB_I) begin
        if (|(M_AXI_BVALID & select_intrf)) begin
          M_AXI_BREADY  <= select_intrf;
          M_AXI_AWVALID <= 'b0;
          M_AXI_WVALID  <= 'b0;
        end else begin
          if (WBS_WE_I) begin
            M_AXI_AWVALID <= select_intrf;
          end
          if (|(M_AXI_AWVALID & select_intrf)) begin
            M_AXI_WVALID <= select_intrf;

          end
        end
      end else begin
        M_AXI_AWVALID <= 'b0;
        M_AXI_WVALID  <= 'b0;
        M_AXI_BREADY  <= 'b0;

      end

    end
  end

  always @(posedge WB_CLK_I) begin
    if (WB_RST_I) begin
      M_AXI_RREADY  <= 'b0;
      M_AXI_ARVALID <= 'b0;
    end else begin
      if (WBS_CYC_I && WBS_STB_I && !WBS_WE_I && AXI_SPACE_FLG) begin
        M_AXI_RREADY  <= select_intrf;
        M_AXI_ARVALID <= select_intrf;
      end else if (M_AXI_RVALID) begin
        M_AXI_RREADY  <= 'b0;
        M_AXI_ARVALID <= 'b0;
      end
    end
  end


  // Flopping signals
  always @(posedge WB_CLK_I) begin
    if (WB_RST_I) begin
      wb_we_reg <= 1'b0;
      mm_reg <= 1'b0;
      M_AXI_AWADDR <= 'b0;
      M_AXI_WDATA <= 'b0;
      M_AXI_ARADDR <= 'b0;

    end else begin
      if (WBS_STB_I) begin
        wb_we_reg <= WBS_WE_I;
        mm_reg    <= MEM_MAPPED_REG;
        if (WBS_WE_I) begin
          M_AXI_WDATA  <= WBS_DAT_I;
          M_AXI_AWADDR <= WBS_ADR_I;
        end else begin
          M_AXI_WDATA  <= 'b0;
          M_AXI_AWADDR <= 'b0;
          M_AXI_ARADDR <= WBS_ADR_I;
        end
      end else begin
        wb_we_reg <= 1'b0;
        mm_reg <= 1'b0;
        M_AXI_AWADDR <= 'b0;
        M_AXI_ARADDR <= 'b0;
        M_AXI_WDATA <= 'b0;
      end

    end
  end

endmodule

