// wishbone decoder and multiplexer
// generates S_COUNT slaves memory mapped starting at 0x80000000
// memory map = 0x80000000+i*2^S_SIZE for i in range(0,S_COUNT)
//
module wb_decoder #
(
    	parameter S_COUNT=1, // Number of AXI inputs (slave interfaces)
    	parameter S_SIZE=20 // size of memory map = 2^S_SIZE
)
(
	input wire clk,
	input wire reset,
	input wire wb_CYC,
	input wire wb_STB,
	output reg wb_ACK,
	input wire wb_WE,
	input wire [29:0] wb_ADR,
	output reg [31:0] wb_DAT_MISO,
	input wire [31:0] wb_DAT_MOSI,
	input wire [3:0] wb_SEL,

	output reg [31:0] addr,
	output reg [S_COUNT-1:0] stb, // one strobe per slave
	output reg we,
	output reg [31:0] wdata,
	input wire [S_COUNT*32-1:0] rdata, // rdata[31:0] per slave
	input wire [S_COUNT-1:0] ack // one ack per slave
);
// wb slave
// register/sram
parameter IDLE = 'd1;
parameter ACK = 'd2;
reg [1:0] state;
integer i;

always @(posedge clk) begin
	if (reset) begin
		state <= IDLE;
		stb <= 'b0;
		wb_ACK <= 'b0;
	end
	else begin
		case(state)
    		IDLE : begin
			wb_ACK <= 'b0;
			if (wb_CYC & wb_STB) begin
				addr <= {wb_ADR,2'b00};
				wdata <= wb_DAT_MOSI;
				we <= wb_WE;
				for (i=0; i < S_COUNT; i=i+1)
					stb[i] = {wb_ADR,2'b00}[S_SIZE+:8] == i ? 'b1 : 'b0;
				state <= ACK;
			end
		end

    		ACK : begin
			if (stb=='b0) begin // failed to decode
				wb_ACK <= 'b1;
				wb_DAT_MISO <= 32'hdeadbeef;
				state <= IDLE;
			end
			else begin
				for (i=0; i < S_COUNT; i=i+1) begin
					if (ack[i]) begin
						stb <= 'b0;
						wb_ACK <= 'b1;
						wb_DAT_MISO <= rdata[i*32 +: 32];
						state <= IDLE;
					end
				end
			end
		end
		endcase
	end
end
endmodule
