// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Thu Nov 30 15:14:40 2023
// Host        : LAPTOP-FEFLDCST running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ capture_frontpanel_0_0_stub.v
// Design      : capture_frontpanel_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcau25p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(wi00_ep_dataout, wi01_ep_dataout, 
  wi02_ep_dataout, wi03_ep_dataout, wi04_ep_dataout, wi05_ep_dataout, wo20_ep_datain, 
  wo21_ep_datain, wo22_ep_datain, wo23_ep_datain, ti40_ep_trigger, ti40_ep_clk, 
  btpoa0_ep_datain, btpoa0_ep_read, btpoa0_ep_blockstrobe, btpoa0_ep_ready, okUH, okHU, okUHU, 
  okAA, okClk)
/* synthesis syn_black_box black_box_pad_pin="wi00_ep_dataout[31:0],wi01_ep_dataout[31:0],wi02_ep_dataout[31:0],wi03_ep_dataout[31:0],wi04_ep_dataout[31:0],wi05_ep_dataout[31:0],wo20_ep_datain[31:0],wo21_ep_datain[31:0],wo22_ep_datain[31:0],wo23_ep_datain[31:0],ti40_ep_trigger[31:0],btpoa0_ep_datain[31:0],btpoa0_ep_read,btpoa0_ep_blockstrobe,btpoa0_ep_ready,okUH[4:0],okHU[2:0],okUHU[31:0],okAA" */
/* synthesis syn_force_seq_prim="ti40_ep_clk" */
/* synthesis syn_force_seq_prim="okClk" */;
  output [31:0]wi00_ep_dataout;
  output [31:0]wi01_ep_dataout;
  output [31:0]wi02_ep_dataout;
  output [31:0]wi03_ep_dataout;
  output [31:0]wi04_ep_dataout;
  output [31:0]wi05_ep_dataout;
  input [31:0]wo20_ep_datain;
  input [31:0]wo21_ep_datain;
  input [31:0]wo22_ep_datain;
  input [31:0]wo23_ep_datain;
  output [31:0]ti40_ep_trigger;
  input ti40_ep_clk /* synthesis syn_isclock = 1 */;
  input [31:0]btpoa0_ep_datain;
  output btpoa0_ep_read;
  output btpoa0_ep_blockstrobe;
  input btpoa0_ep_ready;
  input [4:0]okUH;
  output [2:0]okHU;
  inout [31:0]okUHU;
  inout okAA;
  output okClk /* synthesis syn_isclock = 1 */;
endmodule
