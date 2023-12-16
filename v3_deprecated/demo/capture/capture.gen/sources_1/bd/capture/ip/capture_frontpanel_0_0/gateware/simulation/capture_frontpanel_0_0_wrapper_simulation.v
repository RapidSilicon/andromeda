//------------------------------------------------------------------------
// File: capture_frontpanel_0_0_wrapper_simulation.v
// Creation Date: Thu 11/30/2023 at 15:10:28 -0800
// IP Version: opalkelly.com:ip:frontpanel:1.0 (Rev: 3)
// Tool Version: Vivado v2023.2 (64-bit)
// Opal Kelly Board: XEM8320-AU25P (Part: xcau25p-ffvb676-2-e)
// 
// Copyright (c) 2022-2023 Opal Kelly Incorporated
//------------------------------------------------------------------------

`default_nettype none

module capture_frontpanel_0_0_wrapper_simulation(
    // Precompiler directive to inline ports and define interfaces for all requested endpoints
    `include "generated_ports.vh"
	);


// Target interface bus:
wire [112:0] okHE;
wire [64:0]  okEH;

// Instantiate the okHost and connect endpoints.
wire [65*5-1:0]  okEHx;

okHost okHI(
	.okUH(okUH),
	.okHU(okHU),
	.okUHU(okUHU),
	.okAA(okAA),
	.okClk(okClk),
	.okHE(okHE), 
	.okEH(okEH)
);

okWireOR # (.N(5)) wireOR (okEH, okEHx);

okWireIn     wi00   (.okHE(okHE),                             .ep_addr(8'h00), .ep_dataout(wi00_ep_dataout));
okWireIn     wi01   (.okHE(okHE),                             .ep_addr(8'h01), .ep_dataout(wi01_ep_dataout));
okWireIn     wi02   (.okHE(okHE),                             .ep_addr(8'h02), .ep_dataout(wi02_ep_dataout));
okWireIn     wi03   (.okHE(okHE),                             .ep_addr(8'h03), .ep_dataout(wi03_ep_dataout));
okWireIn     wi04   (.okHE(okHE),                             .ep_addr(8'h04), .ep_dataout(wi04_ep_dataout));
okWireIn     wi05   (.okHE(okHE),                             .ep_addr(8'h05), .ep_dataout(wi05_ep_dataout));
okWireOut    wo20   (.okHE(okHE), .okEH(okEHx[ 0*65 +: 65 ]), .ep_addr(8'h20), .ep_datain(wo20_ep_datain));
okWireOut    wo21   (.okHE(okHE), .okEH(okEHx[ 1*65 +: 65 ]), .ep_addr(8'h21), .ep_datain(wo21_ep_datain));
okWireOut    wo22   (.okHE(okHE), .okEH(okEHx[ 2*65 +: 65 ]), .ep_addr(8'h22), .ep_datain(wo22_ep_datain));
okWireOut    wo23   (.okHE(okHE), .okEH(okEHx[ 3*65 +: 65 ]), .ep_addr(8'h23), .ep_datain(wo23_ep_datain));
okTriggerIn  ti40   (.okHE(okHE),                             .ep_addr(8'h40), .ep_clk(ti40_ep_clk), .ep_trigger(ti40_ep_trigger));
okBTPipeOut  btpoa0 (.okHE(okHE), .okEH(okEHx[ 4*65 +: 65 ]), .ep_addr(8'ha0), .ep_read(btpoa0_ep_read),  .ep_blockstrobe(btpoa0_ep_blockstrobe), .ep_datain(btpoa0_ep_datain), .ep_ready(btpoa0_ep_ready));

endmodule
`default_nettype wire
