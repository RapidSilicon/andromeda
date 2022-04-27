// andromeda verilog code
//
module andromeda (
	input wire clk,
	input wire reset,
	input wire wb_CYC,
	input wire wb_STB,
	output wire wb_ACK,
	input wire wb_WE,
	input wire [29:0] wb_ADR,
	output wire [31:0] wb_DAT_MISO,
	input wire [31:0] wb_DAT_MOSI,
	input wire [3:0] wb_SEL
);

// WB to axi-lite converter and decoder
parameter S_COUNT = 2; // Number of AXI inputs (slave interfaces)
parameter S_SIZE=20; // size of memory map = 2^S_SIZE
wire [31:0] addr;
wire [S_COUNT-1:0] stb; // one strobe per slave
wire we;
wire [31:0] wdata;
wire [S_COUNT*32-1:0] rdata; // rdata[31:0] per slave
wire [S_COUNT-1:0] ack; // one ack per slave

wb_decoder #(S_COUNT,S_SIZE) u0 (
	.clk(clk),
	.reset(reset),
	.wb_CYC(wb_CYC),
	.wb_STB(wb_STB),
	.wb_ACK(wb_ACK),
	.wb_WE(wb_WE),
	.wb_ADR(wb_ADR),
	.wb_DAT_MISO(wb_DAT_MISO),
	.wb_DAT_MOSI(wb_DAT_MOSI),
	.wb_SEL(wb_SEL),
	.addr(addr),
	.stb(stb),
	.we(we),
	.wdata(wdata),
	.rdata(rdata),
	.ack(ack)
);

ibuf u1 (
	.clk(clk),
	.reset(reset),
	.addr(addr),
	.stb(stb[0]),
	.we(we),
	.wdata(wdata),
	.rdata(rdata[31:0]),
	.ack(ack[0])
);

ibuf u2 (
	.clk(clk),
	.reset(reset),
	.addr(addr),
	.stb(stb[1]),
	.we(we),
	.wdata(wdata),
	.rdata(rdata[63:32]),
	.ack(ack[1])
);

endmodule
