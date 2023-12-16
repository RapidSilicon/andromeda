// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Thu Oct 26 15:31:46 2023
// Host        : LAPTOP-FEFLDCST running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ capture_fb_ahb_0_4_stub.v
// Design      : capture_fb_ahb_0_4
// Purpose     : Stub declaration of top-level module interface
// Device      : xcau25p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "fb_ahb,Vivado 2023.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, resetn, o_axi_awvalid, i_axi_awready, 
  o_axi_awaddr, o_axi_awprot, o_axi_wvalid, i_axi_wready, o_axi_wdata, o_axi_wstrb, 
  i_axi_bvalid, o_axi_bready, i_axi_bresp, o_axi_arvalid, i_axi_arready, o_axi_araddr, 
  o_axi_arprot, i_axi_rvalid, o_axi_rready, i_axi_rdata, i_axi_rresp, wirein00, wirein01, 
  wirein02, wirein03, wirein04, wirein05, triggerin40, wireout20, wireout21, wireout22, wireout23, 
  global_resetn)
/* synthesis syn_black_box black_box_pad_pin="resetn,o_axi_awvalid,i_axi_awready,o_axi_awaddr[31:0],o_axi_awprot[2:0],o_axi_wvalid,i_axi_wready,o_axi_wdata[31:0],o_axi_wstrb[3:0],i_axi_bvalid,o_axi_bready,i_axi_bresp[1:0],o_axi_arvalid,i_axi_arready,o_axi_araddr[31:0],o_axi_arprot[2:0],i_axi_rvalid,o_axi_rready,i_axi_rdata[31:0],i_axi_rresp[1:0],wirein00[31:0],wirein01[31:0],wirein02[31:0],wirein03[31:0],wirein04[31:0],wirein05[31:0],triggerin40[31:0],wireout20[31:0],wireout21[31:0],wireout22[31:0],wireout23[31:0],global_resetn" */
/* synthesis syn_force_seq_prim="clk" */;
  input clk /* synthesis syn_isclock = 1 */;
  input resetn;
  output o_axi_awvalid;
  input i_axi_awready;
  output [31:0]o_axi_awaddr;
  output [2:0]o_axi_awprot;
  output o_axi_wvalid;
  input i_axi_wready;
  output [31:0]o_axi_wdata;
  output [3:0]o_axi_wstrb;
  input i_axi_bvalid;
  output o_axi_bready;
  input [1:0]i_axi_bresp;
  output o_axi_arvalid;
  input i_axi_arready;
  output [31:0]o_axi_araddr;
  output [2:0]o_axi_arprot;
  input i_axi_rvalid;
  output o_axi_rready;
  input [31:0]i_axi_rdata;
  input [1:0]i_axi_rresp;
  input [31:0]wirein00;
  input [31:0]wirein01;
  input [31:0]wirein02;
  input [31:0]wirein03;
  input [31:0]wirein04;
  input [31:0]wirein05;
  input [31:0]triggerin40;
  output [31:0]wireout20;
  output [31:0]wireout21;
  output [31:0]wireout22;
  output [31:0]wireout23;
  output global_resetn;
endmodule
