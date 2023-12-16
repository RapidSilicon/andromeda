// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Tue Oct 24 12:04:56 2023
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
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, resetn, m_ahb_haddr, m_ahb_hburst, 
  m_ahb_hprot, m_ahb_hrdata, m_ahb_hready_in, m_ahb_hready_out, m_ahb_hresp, m_ahb_hsize, 
  m_ahb_htrans, m_ahb_hwdata, m_ahb_hwrite, m_ahb_hsel, wirein00, wirein01, triggerin40, 
  triggerout60, wireout20, global_resetn)
/* synthesis syn_black_box black_box_pad_pin="resetn,m_ahb_haddr[31:0],m_ahb_hburst[2:0],m_ahb_hprot[3:0],m_ahb_hrdata[31:0],m_ahb_hready_in,m_ahb_hready_out,m_ahb_hresp,m_ahb_hsize[2:0],m_ahb_htrans[1:0],m_ahb_hwdata[31:0],m_ahb_hwrite,m_ahb_hsel,wirein00[31:0],wirein01[31:0],triggerin40[31:0],triggerout60[31:0],wireout20[31:0],global_resetn" */
/* synthesis syn_force_seq_prim="clk" */;
  input clk /* synthesis syn_isclock = 1 */;
  input resetn;
  output [31:0]m_ahb_haddr;
  output [2:0]m_ahb_hburst;
  output [3:0]m_ahb_hprot;
  input [31:0]m_ahb_hrdata;
  input m_ahb_hready_in;
  output m_ahb_hready_out;
  input m_ahb_hresp;
  output [2:0]m_ahb_hsize;
  output [1:0]m_ahb_htrans;
  output [31:0]m_ahb_hwdata;
  output m_ahb_hwrite;
  output m_ahb_hsel;
  input [31:0]wirein00;
  input [31:0]wirein01;
  input [31:0]triggerin40;
  output [31:0]triggerout60;
  output [31:0]wireout20;
  output global_resetn;
endmodule
