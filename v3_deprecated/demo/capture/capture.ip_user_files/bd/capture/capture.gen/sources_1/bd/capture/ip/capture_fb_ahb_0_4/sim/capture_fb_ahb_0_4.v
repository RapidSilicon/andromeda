// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2023 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:fb_ahb:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module capture_fb_ahb_0_4 (
  clk,
  resetn,
  o_axi_awvalid,
  i_axi_awready,
  o_axi_awaddr,
  o_axi_awprot,
  o_axi_wvalid,
  i_axi_wready,
  o_axi_wdata,
  o_axi_wstrb,
  i_axi_bvalid,
  o_axi_bready,
  i_axi_bresp,
  o_axi_arvalid,
  i_axi_arready,
  o_axi_araddr,
  o_axi_arprot,
  i_axi_rvalid,
  o_axi_rready,
  i_axi_rdata,
  i_axi_rresp,
  wirein00,
  wirein01,
  wirein02,
  wirein03,
  wirein04,
  wirein05,
  triggerin40,
  wireout20,
  wireout21,
  wireout22,
  wireout23,
  global_resetn
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET resetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN capture_clk_wiz_0_0_clk_out1, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 resetn RST" *)
input wire resetn;
output wire o_axi_awvalid;
input wire i_axi_awready;
output wire [31 : 0] o_axi_awaddr;
output wire [2 : 0] o_axi_awprot;
output wire o_axi_wvalid;
input wire i_axi_wready;
output wire [31 : 0] o_axi_wdata;
output wire [3 : 0] o_axi_wstrb;
input wire i_axi_bvalid;
output wire o_axi_bready;
input wire [1 : 0] i_axi_bresp;
output wire o_axi_arvalid;
input wire i_axi_arready;
output wire [31 : 0] o_axi_araddr;
output wire [2 : 0] o_axi_arprot;
input wire i_axi_rvalid;
output wire o_axi_rready;
input wire [31 : 0] i_axi_rdata;
input wire [1 : 0] i_axi_rresp;
input wire [31 : 0] wirein00;
input wire [31 : 0] wirein01;
input wire [31 : 0] wirein02;
input wire [31 : 0] wirein03;
input wire [31 : 0] wirein04;
input wire [31 : 0] wirein05;
input wire [31 : 0] triggerin40;
output wire [31 : 0] wireout20;
output wire [31 : 0] wireout21;
output wire [31 : 0] wireout22;
output wire [31 : 0] wireout23;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME global_resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 global_resetn RST" *)
output wire global_resetn;

  fb_ahb #(
    .DW(32),
    .AW(32)
  ) inst (
    .clk(clk),
    .resetn(resetn),
    .o_axi_awvalid(o_axi_awvalid),
    .i_axi_awready(i_axi_awready),
    .o_axi_awaddr(o_axi_awaddr),
    .o_axi_awprot(o_axi_awprot),
    .o_axi_wvalid(o_axi_wvalid),
    .i_axi_wready(i_axi_wready),
    .o_axi_wdata(o_axi_wdata),
    .o_axi_wstrb(o_axi_wstrb),
    .i_axi_bvalid(i_axi_bvalid),
    .o_axi_bready(o_axi_bready),
    .i_axi_bresp(i_axi_bresp),
    .o_axi_arvalid(o_axi_arvalid),
    .i_axi_arready(i_axi_arready),
    .o_axi_araddr(o_axi_araddr),
    .o_axi_arprot(o_axi_arprot),
    .i_axi_rvalid(i_axi_rvalid),
    .o_axi_rready(o_axi_rready),
    .i_axi_rdata(i_axi_rdata),
    .i_axi_rresp(i_axi_rresp),
    .wirein00(wirein00),
    .wirein01(wirein01),
    .wirein02(wirein02),
    .wirein03(wirein03),
    .wirein04(wirein04),
    .wirein05(wirein05),
    .triggerin40(triggerin40),
    .wireout20(wireout20),
    .wireout21(wireout21),
    .wireout22(wireout22),
    .wireout23(wireout23),
    .global_resetn(global_resetn)
  );
endmodule
