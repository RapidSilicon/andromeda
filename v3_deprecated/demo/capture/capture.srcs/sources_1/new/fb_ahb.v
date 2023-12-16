`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2023 02:30:40 PM
// Design Name: 
// Module Name: fb_ahb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fb_ahb #(
	parameter DW			=  32,	// Wishbone data width
	parameter AW			=  32	// Wishbone address width (log wordsize)
) (
    input wire clk,
    input wire resetn,

		// AXI write address channel signals
	output	reg			o_axi_awvalid,	// Write address valid
	input	wire			i_axi_awready, // Slave is ready to accept
	
	output	wire	[31:0]	o_axi_awaddr,	// Write address
	//output	wire	[7:0]		o_axi_awlen,	// Write Burst Length
	//output	wire	[2:0]		o_axi_awsize,	// Write Burst size
	//output	wire	[1:0]		o_axi_awburst,	// Write Burst type
	//output	wire	[0:0]		o_axi_awlock,	// Write lock type
	//output	wire	[3:0]		o_axi_awcache,	// Write Cache type
	output	wire	[2:0]		o_axi_awprot,	// Write Protection type
	//output	wire	[3:0]		o_axi_awqos,	// Write Quality of Svc

// AXI write data channel signals
	output	reg			o_axi_wvalid,	// Write valid
	input	wire			i_axi_wready,  // Write data ready
	output	wire	[31:0]	o_axi_wdata,	// Write data
	output	wire	[3:0] o_axi_wstrb,	// Write strobes
	//output	wire			o_axi_wlast,	// Last write transaction

// AXI write response channel signals
	input	wire			i_axi_bvalid,  // Write reponse valid
	output	wire			o_axi_bready,  // Response ready
	
	input	wire [1:0]		i_axi_bresp,	// Write response

// AXI read address channel signals
	output	reg			o_axi_arvalid,	// Read address valid
	input	wire			i_axi_arready,	// Read address ready
	
	output	wire	[31:0]	o_axi_araddr,	// Read address
	//output	wire	[7:0]		o_axi_arlen,	// Read Burst Length
	//output	wire	[2:0]		o_axi_arsize,	// Read Burst size
	//output	wire	[1:0]		o_axi_arburst,	// Read Burst type
	//output	wire	[0:0]		o_axi_arlock,	// Read lock type
	//output	wire	[3:0]		o_axi_arcache,	// Read Cache type
	output	wire	[2:0]		o_axi_arprot,	// Read Protection type
	//output	wire	[3:0]		o_axi_arqos,	// Read Protection type

// AXI read data channel signals
	input	wire			i_axi_rvalid,  // Read reponse valid
	output	wire			o_axi_rready,  // Read Response ready
	
	input wire [31:0] i_axi_rdata,    // Read data
	input	wire	[1:0]		i_axi_rresp,   // Read response
	//input	wire			i_axi_rlast,    // Read last

    input wire [31:0] wirein00,
    input wire [31:0] wirein01,
    input wire [31:0] wirein02,
    input wire [31:0] wirein03,
    input wire [31:0] wirein04,
    input wire [31:0] wirein05,
    input wire [31:0] triggerin40,
    output wire [31:0] wireout20,
    output wire [31:0] wireout21,
    output wire [31:0] wireout22,
    output wire [31:0] wireout23,

    output reg global_resetn
);

reg [7:0] rcnt;
always @(posedge clk) begin
	if (triggerin40[5]) begin
		global_resetn <= 1'b0;
		rcnt <= 'd0;
	end
	else if (rcnt=='d100) begin
		global_resetn <= 1'b1;
	end
	else begin
		global_resetn <= 1'b0;
		rcnt <= rcnt+'d1;
	end
end

always @(posedge clk) begin
	if (~resetn) begin
		o_axi_awvalid <= 1'b0;
	end
	else if (triggerin40[0]) begin
		o_axi_awvalid <= 1'b1;
	end
	else if (i_axi_awready) begin
		o_axi_awvalid <= 1'b0;
	end
end

always @(posedge clk) begin
	if (~resetn) begin
		o_axi_wvalid <= 1'b0;
	end
	else if (triggerin40[1]) begin
		o_axi_wvalid <= 1'b1;
	end
	else if (i_axi_wready) begin
		o_axi_wvalid <= 1'b0;
	end
end

always @(posedge clk) begin
	if (~resetn) begin
		o_axi_arvalid <= 1'b0;
	end
	else if (triggerin40[3]) begin
		o_axi_arvalid <= 1'b1;
	end
	else if (i_axi_arready) begin
		o_axi_arvalid <= 1'b0;
	end
end

assign o_axi_awaddr = wirein00;
//assign o_axi_awlen = wirein03[7:0];
//assign o_axi_awsize = wirein03[10:8];
//assign o_axi_awburst = wirein03[12:11];
//assign o_axi_awlock = wirein03[13];
//assign o_axi_awcache = wirein03[17:14];
assign o_axi_awprot = wirein03[20:18];
//assign o_axi_awqos = wirein03[24:21];
assign o_axi_wdata = wirein01[31:0];
assign o_axi_wstrb = wirein04[3:0];
//assign o_axi_wlast = wirein04[4];

assign wireout20[0] = o_axi_awvalid;
assign wireout20[1] = o_axi_wvalid;
assign wireout20[2] = i_axi_bvalid;
assign wireout20[3] = o_axi_arvalid;
assign wireout20[4] = i_axi_rvalid;
assign wireout21 = i_axi_rdata;
assign wireout22[1:0] = i_axi_bresp;
assign wireout23[1:0] = i_axi_rresp;
//assign wireout23[2] = i_axi_rlast;

assign o_axi_bready = triggerin40[2];
assign o_axi_rready = triggerin40[4];

assign o_axi_araddr = wirein02;
//assign o_axi_arlen = wirein05[7:0];
//assign o_axi_arsize = wirein05[10:8];
//assign o_axi_arburst = wirein05[12:11];
//assign o_axi_arlock = wirein05[13];
//assign o_axi_arcache = wirein05[17:14];
assign o_axi_arprot = wirein05[20:18];
//assign o_axi_arqos = wirein05[24:21];

endmodule
