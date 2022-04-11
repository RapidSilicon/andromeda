// andromeda verilog code
//
module ibuf (
	input wire [31:0] ctrl,
	output wire [31:0] stat
);

assign stat=ctrl;

endmodule
