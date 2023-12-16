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
	
	output	reg	[31:0]	o_axi_awaddr,	// Write address
	output	wire	[7:0]		o_axi_awlen,	// Write Burst Length
	output	wire	[2:0]		o_axi_awsize,	// Write Burst size
	output	wire	[1:0]		o_axi_awburst,	// Write Burst type
	output	wire	[0:0]		o_axi_awlock,	// Write lock type
	output	wire	[3:0]		o_axi_awcache,	// Write Cache type
	output	wire	[2:0]		o_axi_awprot,	// Write Protection type
	//output	wire	[3:0]		o_axi_awqos,	// Write Quality of Svc

// AXI write data channel signals
	output	reg			o_axi_wvalid,	// Write valid
	input	wire			i_axi_wready,  // Write data ready
	output	reg	[31:0]	o_axi_wdata,	// Write data
	output	reg	[3:0] o_axi_wstrb,	// Write strobes
	output	wire			o_axi_wlast,	// Last write transaction

// AXI write response channel signals
	input	wire			i_axi_bvalid,  // Write reponse valid
	output	wire			o_axi_bready,  // Response ready
	
	input	wire [1:0]		i_axi_bresp,	// Write response

// AXI read address channel signals
	output	reg			o_axi_arvalid,	// Read address valid
	input	wire			i_axi_arready,	// Read address ready
	
	output	reg	[31:0]	o_axi_araddr,	// Read address
	output	wire	[7:0]		o_axi_arlen,	// Read Burst Length
	output	wire	[2:0]		o_axi_arsize,	// Read Burst size
	output	wire	[1:0]		o_axi_arburst,	// Read Burst type
	output	wire	[0:0]		o_axi_arlock,	// Read lock type
	output	wire	[3:0]		o_axi_arcache,	// Read Cache type
	output	wire	[2:0]		o_axi_arprot,	// Read Protection type
	//output	wire	[3:0]		o_axi_arqos,	// Read Protection type

// AXI read data channel signals
	input	wire			i_axi_rvalid,  // Read reponse valid
	output	wire			o_axi_rready,  // Read Response ready
	
	input wire [31:0] i_axi_rdata,    // Read data
	input	wire	[1:0]		i_axi_rresp,   // Read response
	input	wire			i_axi_rlast,    // Read last

    input wire [31:0] wirein00, // address
    input wire [31:0] wirein01, // write data
    input wire [31:0] triggerin40, // read,write,reset
    output reg [31:0] triggerout60, // ack
    output reg [31:0] wireout20, // read data

    output reg global_resetn
);

reg [7:0] rcnt;
always @(posedge clk) begin
	if (triggerin40[2]) begin
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

/*
assign m_ahb_haddr = wirein00;
assign m_ahb_hwdata = wirein01;

assign m_ahb_hburst = 3'b000; // single
assign m_ahb_hprot = 4'b0011; // non-cacheable, non-bufferable, privileged, data access
assign m_ahb_hsize = 3'b010; // word
//assign m_ahb_hsel = 1'b1;
assign m_ahb_hready_out = 1'b1;

reg [1:0] state;
localparam IDLE=0;
localparam ADDR=1;
localparam DATA=2;
always @(posedge clk) begin
	if (~resetn) begin
		state <= IDLE;
		m_ahb_hsel <= 1'b0;
		m_ahb_hwrite <= 1'b0;
	    m_ahb_htrans <= 2'b00; // IDLE
		triggerout60 <= 'b0;
	end
	else if (state==IDLE) begin
		m_ahb_hsel <= 1'b0;
	    m_ahb_htrans <= 2'b00; // IDLE
		triggerout60 <= 'b0;
		if (triggerin40[0]) begin
			m_ahb_hwrite <= 1'b0;
			state <= ADDR;
	    end
		else if (triggerin40[1]) begin
			m_ahb_hwrite <= 1'b1;
			state <= ADDR;
		end
	end
	else if (state==ADDR) begin
		if (m_ahb_hready_in) begin
			m_ahb_hsel <= 1'b1;
	    	m_ahb_htrans <= 2'b10; // NONSEQ
			state <= DATA;
		end
	end
	else if (state==DATA) begin
		if (m_ahb_hready_in) begin
			wireout20 <= m_ahb_hrdata;
			m_ahb_hsel <= 1'b0;
	    	m_ahb_htrans <= 2'b00; // IDLE
			triggerout60 <= 'b1;
			state <= IDLE;
		end
	end
end
*/

endmodule
