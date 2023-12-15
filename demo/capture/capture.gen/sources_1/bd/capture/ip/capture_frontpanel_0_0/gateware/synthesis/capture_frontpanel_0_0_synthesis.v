//------------------------------------------------------------------------
// File: capture_frontpanel_0_0_synthesis.v
// Creation Date: Thu 11/30/2023 at 15:10:28 -0800
// IP Version: opalkelly.com:ip:frontpanel:1.0 (Rev: 3)
// Tool Version: Vivado v2023.2 (64-bit)
// Opal Kelly Board: XEM8320-AU25P (Part: xcau25p-ffvb676-2-e)
// 
// Copyright (c) 2022-2023 Opal Kelly Incorporated
//------------------------------------------------------------------------

`default_nettype none

module capture_frontpanel_0_0(
//----------------------------------------------------------------------------------------------------------------------------------
// WireIns
//----------------------------------------------------------------------------------------------------------------------------------
    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein00 EP_DATAOUT" *)
    output wire [31:0] wi00_ep_dataout,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein01 EP_DATAOUT" *)
    output wire [31:0] wi01_ep_dataout,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein02 EP_DATAOUT" *)
    output wire [31:0] wi02_ep_dataout,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein03 EP_DATAOUT" *)
    output wire [31:0] wi03_ep_dataout,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein04 EP_DATAOUT" *)
    output wire [31:0] wi04_ep_dataout,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein05 EP_DATAOUT" *)
    output wire [31:0] wi05_ep_dataout,

//----------------------------------------------------------------------------------------------------------------------------------
// WireOuts
//----------------------------------------------------------------------------------------------------------------------------------
    (* X_INTERFACE_INFO = "opalkelly.com:interface:wireout:1.0 wireout20 EP_DATAIN" *)
    input  wire [31:0] wo20_ep_datain,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wireout:1.0 wireout21 EP_DATAIN" *)
    input  wire [31:0] wo21_ep_datain,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wireout:1.0 wireout22 EP_DATAIN" *)
    input  wire [31:0] wo22_ep_datain,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wireout:1.0 wireout23 EP_DATAIN" *)
    input  wire [31:0] wo23_ep_datain,

//----------------------------------------------------------------------------------------------------------------------------------
// TriggerIns
//----------------------------------------------------------------------------------------------------------------------------------
    (* X_INTERFACE_INFO = "opalkelly.com:interface:triggerin:1.0 triggerin40 EP_TRIGGER" *)
    output wire [31:0] ti40_ep_trigger,
    (* X_INTERFACE_INFO = "opalkelly.com:interface:triggerin:1.0 triggerin40 EP_CLK" *)
    input  wire        ti40_ep_clk,

//----------------------------------------------------------------------------------------------------------------------------------
// Block Throttle PipeOuts
//----------------------------------------------------------------------------------------------------------------------------------
    (* X_INTERFACE_INFO = "opalkelly.com:interface:btpipeout:1.0 btpipeouta0 EP_DATAIN" *)
    input  wire [31:0] btpoa0_ep_datain,
    (* X_INTERFACE_INFO = "opalkelly.com:interface:btpipeout:1.0 btpipeouta0 EP_READ" *)
    output wire        btpoa0_ep_read,
    (* X_INTERFACE_INFO = "opalkelly.com:interface:btpipeout:1.0 btpipeouta0 EP_BLOCKSTROBE" *)
    output wire        btpoa0_ep_blockstrobe,
    (* X_INTERFACE_INFO = "opalkelly.com:interface:btpipeout:1.0 btpipeouta0 EP_READY" *)
    input  wire        btpoa0_ep_ready,

//----------------------------------------------------------------------------------------------------------------------------------
// Host Interface
//----------------------------------------------------------------------------------------------------------------------------------
    (* X_INTERFACE_INFO = "opalkelly.com:interface:host_interface:1.0 host_interface okUH" *)
    input  wire [4 : 0] okUH,
    (* X_INTERFACE_INFO = "opalkelly.com:interface:host_interface:1.0 host_interface okHU" *)
    output wire [2 : 0] okHU,
    (* X_INTERFACE_INFO = "opalkelly.com:interface:host_interface:1.0 host_interface okUHU" *)
    inout  wire [31 : 0] okUHU,
    (* X_INTERFACE_INFO = "opalkelly.com:interface:host_interface:1.0 host_interface okAA" *)
    inout  wire okAA,
    output wire okClk
);

capture_frontpanel_0_0_wrapper_synthesis inst (
    .wi00_ep_dataout(wi00_ep_dataout),
    .wi01_ep_dataout(wi01_ep_dataout),
    .wi02_ep_dataout(wi02_ep_dataout),
    .wi03_ep_dataout(wi03_ep_dataout),
    .wi04_ep_dataout(wi04_ep_dataout),
    .wi05_ep_dataout(wi05_ep_dataout),
    .wo20_ep_datain(wo20_ep_datain),
    .wo21_ep_datain(wo21_ep_datain),
    .wo22_ep_datain(wo22_ep_datain),
    .wo23_ep_datain(wo23_ep_datain),
    .ti40_ep_trigger(ti40_ep_trigger),
    .ti40_ep_clk(ti40_ep_clk),
    .btpoa0_ep_datain(btpoa0_ep_datain),
    .btpoa0_ep_read(btpoa0_ep_read),
    .btpoa0_ep_blockstrobe(btpoa0_ep_blockstrobe),
    .btpoa0_ep_ready(btpoa0_ep_ready),
    .okUH(okUH),
    .okHU(okHU),
    .okUHU(okUHU),
    .okAA(okAA),
    .okClk(okClk)   
);

endmodule
`default_nettype wire
