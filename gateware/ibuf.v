module ibuf (
	input wire clk,
	input wire reset,
	input wire [31:0] addr,
	input wire stb, // one strobe per slave
	input wire we,
	input wire [31:0] wdata,
	output reg [31:0] rdata, // rdata[31:0] per slave
	output reg ack // one ack per slave
);
// wb slave
// register/sram
reg [31:0] myreg;
always @(posedge clk)
	if (stb&we) begin
		if (addr[15:0]=='h0000) begin
			myreg <= wdata;
		end
	end

always @(posedge clk)
	//
	// Basically o_wb_data <= memory[i_wb_addr];
	//
	// If you aren't implementing a memory, your
	// result will instead look like ...
	case(addr[15:0])
		'h0000: rdata <= myreg;
		// ...
		default: rdata <= 32'hf00dbabe;
	endcase

always @(posedge clk)
	ack <= stb;

endmodule
