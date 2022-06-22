module soc_if #(
    parameter S_COUNT=1,                // Number of AXI inputs (slave interfaces)
    parameter S_SIZE=20,                // size of memory map = 2^S_SIZE
    parameter C_AXI_ADDR_WIDTH = 32,    
	parameter C_AXI_DATA_WIDTH = 32,
	parameter WISHBONE_DATA_WIDTH= 32,
	parameter WISHBONE_ADDR_WIDTH= 32
)
(
	// wishbone slave interface
	input wire								WB_CLK_I,
    input wire								WB_RST_I,

    input wire								WBS_STB_I,
    input wire			 					WBS_CYC_I,
    input wire								WBS_WE_I,
    input wire [WISHBONE_DATA_WIDTH/8-1:0]	WBS_SEL_I,
    input wire [WISHBONE_DATA_WIDTH-1:0] 	WBS_DAT_I,
    input wire [WISHBONE_ADDR_WIDTH-1:0] 	WBS_ADR_I,

    output reg								WBS_ACK_O,
    output reg [WISHBONE_DATA_WIDTH-1:0] 	WBS_DAT_O,

	// axi 
	output							        M_AXI_ACLK,
	output							        M_AXI_ARESETN,
	// write address channel
	output	reg	 [S_COUNT-1:0]	            M_AXI_AWVALID,
	input	wire [S_COUNT-1:0]		        M_AXI_AWREADY,
	output	reg	[C_AXI_ADDR_WIDTH-1:0]	    M_AXI_AWADDR,
	output	reg	[2:0]				        M_AXI_AWPROT,
	// write data channel
	output	reg	 [S_COUNT-1:0]	        	M_AXI_WVALID,
	input	wire [S_COUNT-1:0]		        M_AXI_WREADY,
	output	reg	[C_AXI_DATA_WIDTH-1:0]		M_AXI_WDATA,
	output	reg	[C_AXI_DATA_WIDTH/8-1:0]	M_AXI_WSTRB,
	// write response channel
	input	wire [S_COUNT-1:0]		        M_AXI_BVALID,
	output	reg	 [S_COUNT-1:0]	            M_AXI_BREADY,
	input	wire [1:0]				        M_AXI_BRESP,
	// read address channel 
	output	reg	 [S_COUNT-1:0]              M_AXI_ARVALID,
	input	wire [S_COUNT-1:0]		        M_AXI_ARREADY,
	output	reg	[C_AXI_ADDR_WIDTH-1:0]		M_AXI_ARADDR,
	output	reg	[2:0]				        M_AXI_ARPROT,
	// read data channel
	input	wire [S_COUNT-1:0]	        	M_AXI_RVALID,
	output	reg	 [S_COUNT-1:0]           	M_AXI_RREADY,
	input	wire [C_AXI_DATA_WIDTH-1:0]		M_AXI_RDATA,
	input	wire [1:0]				    	M_AXI_RRESP,

	// interupt signals
	input	wire					        ib_intrpt,
	input	wire					        ob_intrpt,
	output	reg 							soc_if_intrpt

);

  // Wb data out
always @(posedge WB_CLK_I or posedge WB_RST_I)
begin
  if (WB_RST_I)
	WBS_DAT_O <= 'b0;
//  else
//	WBS_DAT_O <= wb_dat;
end

// Wb 
always @(posedge WB_CLK_I or posedge WB_RST_I)
begin
  if (WB_RST_I)
	WBS_ACK_O <=  1'b0;
  else
	WBS_ACK_O <= WBS_CYC_I & WBS_STB_I & ~WBS_ACK_O;
end


endmodule
