// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Dec  4 12:27:24 2023
// Host        : LAPTOP-FEFLDCST running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ capture_mipi_csi2_rx_subsyst_0_0_stub.v
// Design      : capture_mipi_csi2_rx_subsyst_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcau25p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "bd_d757,Vivado 2023.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(lite_aclk, lite_aresetn, dphy_clk_200M, 
  rxbyteclkhs, clkoutphy_out, system_rst_out, pll_lock_out, csirxss_csi_irq, video_aclk, 
  video_aresetn, frame_rcvd_pulse_out, csirxss_s_axi_awaddr, csirxss_s_axi_awprot, 
  csirxss_s_axi_awvalid, csirxss_s_axi_awready, csirxss_s_axi_wdata, csirxss_s_axi_wstrb, 
  csirxss_s_axi_wvalid, csirxss_s_axi_wready, csirxss_s_axi_bresp, csirxss_s_axi_bvalid, 
  csirxss_s_axi_bready, csirxss_s_axi_araddr, csirxss_s_axi_arprot, 
  csirxss_s_axi_arvalid, csirxss_s_axi_arready, csirxss_s_axi_rdata, csirxss_s_axi_rresp, 
  csirxss_s_axi_rvalid, csirxss_s_axi_rready, video_out_tdata, video_out_tdest, 
  video_out_tlast, video_out_tready, video_out_tuser, video_out_tvalid, emb_nonimg_tdata, 
  emb_nonimg_tdest, emb_nonimg_tkeep, emb_nonimg_tlast, emb_nonimg_tready, 
  emb_nonimg_tuser, emb_nonimg_tvalid, mipi_phy_if_clk_n, mipi_phy_if_clk_p, 
  mipi_phy_if_data_n, mipi_phy_if_data_p)
/* synthesis syn_black_box black_box_pad_pin="lite_aclk,lite_aresetn,dphy_clk_200M,rxbyteclkhs,clkoutphy_out,system_rst_out,pll_lock_out,csirxss_csi_irq,video_aclk,video_aresetn,frame_rcvd_pulse_out,csirxss_s_axi_awaddr[12:0],csirxss_s_axi_awprot[2:0],csirxss_s_axi_awvalid[0:0],csirxss_s_axi_awready[0:0],csirxss_s_axi_wdata[31:0],csirxss_s_axi_wstrb[3:0],csirxss_s_axi_wvalid[0:0],csirxss_s_axi_wready[0:0],csirxss_s_axi_bresp[1:0],csirxss_s_axi_bvalid[0:0],csirxss_s_axi_bready[0:0],csirxss_s_axi_araddr[12:0],csirxss_s_axi_arprot[2:0],csirxss_s_axi_arvalid[0:0],csirxss_s_axi_arready[0:0],csirxss_s_axi_rdata[31:0],csirxss_s_axi_rresp[1:0],csirxss_s_axi_rvalid[0:0],csirxss_s_axi_rready[0:0],video_out_tdata[31:0],video_out_tdest[9:0],video_out_tlast,video_out_tready,video_out_tuser[31:0],video_out_tvalid,emb_nonimg_tdata[31:0],emb_nonimg_tdest[3:0],emb_nonimg_tkeep[3:0],emb_nonimg_tlast,emb_nonimg_tready,emb_nonimg_tuser[95:0],emb_nonimg_tvalid,mipi_phy_if_clk_n,mipi_phy_if_clk_p,mipi_phy_if_data_n[1:0],mipi_phy_if_data_p[1:0]" */;
  input lite_aclk;
  input lite_aresetn;
  input dphy_clk_200M;
  output rxbyteclkhs;
  output clkoutphy_out;
  output system_rst_out;
  output pll_lock_out;
  output csirxss_csi_irq;
  input video_aclk;
  input video_aresetn;
  output frame_rcvd_pulse_out;
  input [12:0]csirxss_s_axi_awaddr;
  input [2:0]csirxss_s_axi_awprot;
  input [0:0]csirxss_s_axi_awvalid;
  output [0:0]csirxss_s_axi_awready;
  input [31:0]csirxss_s_axi_wdata;
  input [3:0]csirxss_s_axi_wstrb;
  input [0:0]csirxss_s_axi_wvalid;
  output [0:0]csirxss_s_axi_wready;
  output [1:0]csirxss_s_axi_bresp;
  output [0:0]csirxss_s_axi_bvalid;
  input [0:0]csirxss_s_axi_bready;
  input [12:0]csirxss_s_axi_araddr;
  input [2:0]csirxss_s_axi_arprot;
  input [0:0]csirxss_s_axi_arvalid;
  output [0:0]csirxss_s_axi_arready;
  output [31:0]csirxss_s_axi_rdata;
  output [1:0]csirxss_s_axi_rresp;
  output [0:0]csirxss_s_axi_rvalid;
  input [0:0]csirxss_s_axi_rready;
  output [31:0]video_out_tdata;
  output [9:0]video_out_tdest;
  output video_out_tlast;
  input video_out_tready;
  output [31:0]video_out_tuser;
  output video_out_tvalid;
  output [31:0]emb_nonimg_tdata;
  output [3:0]emb_nonimg_tdest;
  output [3:0]emb_nonimg_tkeep;
  output emb_nonimg_tlast;
  input emb_nonimg_tready;
  output [95:0]emb_nonimg_tuser;
  output emb_nonimg_tvalid;
  input mipi_phy_if_clk_n;
  input mipi_phy_if_clk_p;
  input [1:0]mipi_phy_if_data_n;
  input [1:0]mipi_phy_if_data_p;
endmodule
