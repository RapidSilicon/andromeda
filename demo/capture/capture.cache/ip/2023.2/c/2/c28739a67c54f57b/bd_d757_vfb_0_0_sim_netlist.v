// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sun Dec  3 11:30:51 2023
// Host        : LAPTOP-FEFLDCST running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_d757_vfb_0_0_sim_netlist.v
// Design      : bd_d757_vfb_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcau25p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* AXIS_TDATA_WIDTH = "32" *) (* AXIS_TDEST_WIDTH = "4" *) (* AXIS_TUSER_WIDTH = "96" *) 
(* C_HS_LINE_RATE = "1500" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* VFB_4PXL_W = "32" *) 
(* VFB_BYPASS_WC = "1" *) (* VFB_DATA_TYPE = "42" *) (* VFB_DCONV_OWIDTH = "32" *) 
(* VFB_EN_VCX = "1" *) (* VFB_FIFO_DEPTH = "16384" *) (* VFB_FIFO_WIDTH = "32" *) 
(* VFB_FILTER_VC = "0" *) (* VFB_OP_DWIDTH = "32" *) (* VFB_OP_PIXELS = "4" *) 
(* VFB_PXL_W = "8" *) (* VFB_PXL_W_BB = "8" *) (* VFB_REQ_BUFFER = "0" *) 
(* VFB_REQ_REORDER = "0" *) (* VFB_TU_WIDTH = "1" *) (* VFB_VC = "0" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (s_axis_aclk,
    s_axis_aresetn,
    s_axis_tready,
    s_axis_tvalid,
    s_axis_tlast,
    s_axis_tdata,
    s_axis_tkeep,
    s_axis_tuser,
    s_axis_tdest,
    mdt_tv,
    mdt_tr,
    sdt_tv,
    sdt_tr,
    vfb_tv,
    vfb_tr,
    vfb_arstn,
    vfb_clk,
    vfb_ready,
    core_men_vfb,
    vfb_full,
    vfb_wc_full,
    core_men_ack_vfb,
    vfb_valid,
    vfb_eol,
    vfb_sof,
    vfb_vcdt,
    vfb_data);
  input s_axis_aclk;
  input s_axis_aresetn;
  output s_axis_tready;
  input s_axis_tvalid;
  input s_axis_tlast;
  input [31:0]s_axis_tdata;
  input [3:0]s_axis_tkeep;
  input [95:0]s_axis_tuser;
  input [3:0]s_axis_tdest;
  output mdt_tv;
  output mdt_tr;
  output sdt_tv;
  output sdt_tr;
  output vfb_tv;
  output vfb_tr;
  input vfb_arstn;
  input vfb_clk;
  input vfb_ready;
  input core_men_vfb;
  output vfb_full;
  output vfb_wc_full;
  output core_men_ack_vfb;
  output vfb_valid;
  output vfb_eol;
  output [0:0]vfb_sof;
  output [9:0]vfb_vcdt;
  output [31:0]vfb_data;

  wire \<const0> ;
  wire \<const1> ;
  wire mdt_tr;
  wire s_axis_aclk;
  wire s_axis_aresetn;
  wire [31:0]s_axis_tdata;
  wire [3:0]s_axis_tdest;
  wire s_axis_tlast;
  wire s_axis_tready;
  wire [95:0]s_axis_tuser;
  wire s_axis_tvalid;
  wire sdt_tr;
  wire sdt_tv;
  wire vfb_arstn;
  wire vfb_clk;
  wire [31:0]vfb_data;
  wire vfb_eol;
  wire vfb_ready;
  wire [0:0]vfb_sof;
  wire vfb_tr;
  wire vfb_tv;
  wire vfb_valid;
  wire [9:0]vfb_vcdt;
  wire NLW_inst_core_men_ack_vfb_UNCONNECTED;
  wire NLW_inst_mdt_tv_UNCONNECTED;
  wire NLW_inst_vfb_full_UNCONNECTED;
  wire NLW_inst_vfb_wc_full_UNCONNECTED;

  assign core_men_ack_vfb = \<const1> ;
  assign mdt_tv = \<const0> ;
  assign vfb_full = \<const0> ;
  assign vfb_wc_full = \<const0> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* AXIS_TDATA_WIDTH = "32" *) 
  (* AXIS_TDEST_WIDTH = "4" *) 
  (* AXIS_TUSER_WIDTH = "96" *) 
  (* C_HS_LINE_RATE = "1500" *) 
  (* DowngradeIPIdentifiedWarnings = "yes" *) 
  (* VFB_4PXL_W = "32" *) 
  (* VFB_BYPASS_WC = "1" *) 
  (* VFB_DATA_TYPE = "42" *) 
  (* VFB_DCONV_OWIDTH = "32" *) 
  (* VFB_DCONV_TUW = "12" *) 
  (* VFB_EN_VCX = "1" *) 
  (* VFB_FIFO_DEPTH = "16384" *) 
  (* VFB_FIFO_WIDTH = "32" *) 
  (* VFB_FILTER_VC = "0" *) 
  (* VFB_OP_DWIDTH = "32" *) 
  (* VFB_OP_PIXELS = "4" *) 
  (* VFB_PXL_W = "8" *) 
  (* VFB_PXL_W_BB = "8" *) 
  (* VFB_REQ_BUFFER = "0" *) 
  (* VFB_REQ_REORDER = "0" *) 
  (* VFB_TSB0_WIDTH = "32" *) 
  (* VFB_TSB1_WIDTH = "0" *) 
  (* VFB_TSB2_WIDTH = "3" *) 
  (* VFB_TU_WIDTH = "1" *) 
  (* VFB_VC = "0" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_d757_vfb_0_0_core inst
       (.core_men_ack_vfb(NLW_inst_core_men_ack_vfb_UNCONNECTED),
        .core_men_vfb(1'b0),
        .mdt_tr(mdt_tr),
        .mdt_tv(NLW_inst_mdt_tv_UNCONNECTED),
        .s_axis_aclk(s_axis_aclk),
        .s_axis_aresetn(s_axis_aresetn),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tdest(s_axis_tdest),
        .s_axis_tkeep({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tready(s_axis_tready),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,s_axis_tuser[69:64],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,s_axis_tuser[0]}),
        .s_axis_tvalid(s_axis_tvalid),
        .sdt_tr(sdt_tr),
        .sdt_tv(sdt_tv),
        .vfb_arstn(vfb_arstn),
        .vfb_clk(vfb_clk),
        .vfb_data(vfb_data),
        .vfb_eol(vfb_eol),
        .vfb_full(NLW_inst_vfb_full_UNCONNECTED),
        .vfb_ready(vfb_ready),
        .vfb_sof(vfb_sof),
        .vfb_tr(vfb_tr),
        .vfb_tv(vfb_tv),
        .vfb_valid(vfb_valid),
        .vfb_vcdt(vfb_vcdt),
        .vfb_wc_full(NLW_inst_vfb_wc_full_UNCONNECTED));
endmodule

(* AXIS_TDATA_WIDTH = "32" *) (* AXIS_TDEST_WIDTH = "4" *) (* AXIS_TUSER_WIDTH = "96" *) 
(* C_HS_LINE_RATE = "1500" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* VFB_4PXL_W = "32" *) 
(* VFB_BYPASS_WC = "1" *) (* VFB_DATA_TYPE = "42" *) (* VFB_DCONV_OWIDTH = "32" *) 
(* VFB_DCONV_TUW = "12" *) (* VFB_EN_VCX = "1" *) (* VFB_FIFO_DEPTH = "16384" *) 
(* VFB_FIFO_WIDTH = "32" *) (* VFB_FILTER_VC = "0" *) (* VFB_OP_DWIDTH = "32" *) 
(* VFB_OP_PIXELS = "4" *) (* VFB_PXL_W = "8" *) (* VFB_PXL_W_BB = "8" *) 
(* VFB_REQ_BUFFER = "0" *) (* VFB_REQ_REORDER = "0" *) (* VFB_TSB0_WIDTH = "32" *) 
(* VFB_TSB1_WIDTH = "0" *) (* VFB_TSB2_WIDTH = "3" *) (* VFB_TU_WIDTH = "1" *) 
(* VFB_VC = "0" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_d757_vfb_0_0_core
   (s_axis_aclk,
    s_axis_aresetn,
    s_axis_tready,
    s_axis_tvalid,
    s_axis_tlast,
    s_axis_tdata,
    s_axis_tkeep,
    s_axis_tuser,
    s_axis_tdest,
    mdt_tv,
    mdt_tr,
    sdt_tv,
    sdt_tr,
    vfb_tv,
    vfb_tr,
    vfb_arstn,
    vfb_clk,
    vfb_ready,
    core_men_vfb,
    vfb_full,
    vfb_wc_full,
    core_men_ack_vfb,
    vfb_valid,
    vfb_eol,
    vfb_sof,
    vfb_vcdt,
    vfb_data);
  input s_axis_aclk;
  input s_axis_aresetn;
  output s_axis_tready;
  input s_axis_tvalid;
  input s_axis_tlast;
  input [31:0]s_axis_tdata;
  input [3:0]s_axis_tkeep;
  input [95:0]s_axis_tuser;
  input [3:0]s_axis_tdest;
  output mdt_tv;
  output mdt_tr;
  output sdt_tv;
  output sdt_tr;
  output vfb_tv;
  output vfb_tr;
  input vfb_arstn;
  input vfb_clk;
  input vfb_ready;
  input core_men_vfb;
  output vfb_full;
  output vfb_wc_full;
  output core_men_ack_vfb;
  output vfb_valid;
  output vfb_eol;
  output [0:0]vfb_sof;
  output [9:0]vfb_vcdt;
  output [31:0]vfb_data;

  wire \<const0> ;
  wire \VFB_MIN.reorder_n_14 ;
  wire \VFB_MIN.reorder_n_16 ;
  wire \VFB_MIN.reorder_n_18 ;
  wire \VFB_MIN.reorder_n_19 ;
  wire \VFB_MIN.reorder_n_20 ;
  wire \VFB_MIN.reorder_n_21 ;
  wire \VFB_MIN.reorder_n_22 ;
  wire \VFB_MIN.reorder_n_23 ;
  wire \VFB_MIN.reorder_n_24 ;
  wire \VFB_MIN.reorder_n_25 ;
  wire \VFB_MIN.reorder_n_26 ;
  wire \VFB_MIN.reorder_n_27 ;
  wire \VFB_MIN.reorder_n_28 ;
  wire \VFB_MIN.reorder_n_29 ;
  wire \VFB_MIN.reorder_n_30 ;
  wire \VFB_MIN.reorder_n_31 ;
  wire \VFB_MIN.reorder_n_32 ;
  wire \VFB_MIN.reorder_n_33 ;
  wire \VFB_MIN.reorder_n_34 ;
  wire \VFB_MIN.reorder_n_35 ;
  wire \VFB_MIN.reorder_n_36 ;
  wire \VFB_MIN.reorder_n_37 ;
  wire \VFB_MIN.reorder_n_38 ;
  wire \VFB_MIN.reorder_n_39 ;
  wire \VFB_MIN.reorder_n_40 ;
  wire \VFB_MIN.reorder_n_41 ;
  wire \VFB_MIN.reorder_n_42 ;
  wire \VFB_MIN.reorder_n_43 ;
  wire \VFB_MIN.reorder_n_44 ;
  wire \VFB_MIN.reorder_n_45 ;
  wire \VFB_MIN.reorder_n_46 ;
  wire \VFB_MIN.reorder_n_47 ;
  wire \VFB_MIN.reorder_n_48 ;
  wire cur_dtype_pxls1;
  wire mdt_tr;
  wire n_0_120;
  wire [9:0]p_1_in;
  wire s_axis_aclk;
  wire s_axis_aresetn;
  wire [31:0]s_axis_tdata;
  wire [3:0]s_axis_tdest;
  wire s_axis_tlast;
  wire s_axis_tlast_0;
  wire s_axis_tready;
  wire [95:0]s_axis_tuser;
  wire s_axis_tvalid;
  wire sband_tact0;
  wire sband_tl;
  wire [9:4]sband_ts;
  wire [3:0]sband_ts__0;
  wire [9:0]sband_ts_r;
  wire sband_tu;
  wire sband_tu_r;
  wire sdt_tr;
  wire sdt_tv;
  wire vfb_arstn;
  wire vfb_clk;
  wire [31:0]vfb_data;
  wire vfb_eol;
  wire vfb_ready;
  wire [0:0]vfb_sof;
  wire vfb_valid;
  wire [9:0]vfb_vcdt;

  assign core_men_ack_vfb = \<const0> ;
  assign mdt_tv = \<const0> ;
  assign vfb_full = \<const0> ;
  assign vfb_tr = vfb_ready;
  assign vfb_tv = vfb_valid;
  assign vfb_wc_full = \<const0> ;
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_vfb_v1_0_23_reorder \VFB_MIN.reorder 
       (.D(p_1_in),
        .Q({s_axis_tlast_0,sband_ts,sband_tu,sband_ts__0}),
        .\buf_data_reg[0][104]_0 (\VFB_MIN.reorder_n_48 ),
        .\buf_data_reg[0][105]_0 (\VFB_MIN.reorder_n_47 ),
        .\buf_data_reg[0][106]_0 (\VFB_MIN.reorder_n_46 ),
        .\buf_data_reg[0][107]_0 (\VFB_MIN.reorder_n_45 ),
        .\buf_data_reg[0][108]_0 (\VFB_MIN.reorder_n_44 ),
        .\buf_data_reg[0][109]_0 (\VFB_MIN.reorder_n_43 ),
        .\buf_data_reg[0][110]_0 (\VFB_MIN.reorder_n_42 ),
        .\buf_data_reg[0][111]_0 (\VFB_MIN.reorder_n_41 ),
        .\buf_data_reg[0][112]_0 (\VFB_MIN.reorder_n_40 ),
        .\buf_data_reg[0][113]_0 (\VFB_MIN.reorder_n_39 ),
        .\buf_data_reg[0][114]_0 (\VFB_MIN.reorder_n_38 ),
        .\buf_data_reg[0][115]_0 (\VFB_MIN.reorder_n_37 ),
        .\buf_data_reg[0][116]_0 (\VFB_MIN.reorder_n_36 ),
        .\buf_data_reg[0][117]_0 (\VFB_MIN.reorder_n_35 ),
        .\buf_data_reg[0][118]_0 (\VFB_MIN.reorder_n_34 ),
        .\buf_data_reg[0][119]_0 (\VFB_MIN.reorder_n_33 ),
        .\buf_data_reg[0][120]_0 (\VFB_MIN.reorder_n_32 ),
        .\buf_data_reg[0][121]_0 (\VFB_MIN.reorder_n_31 ),
        .\buf_data_reg[0][122]_0 (\VFB_MIN.reorder_n_30 ),
        .\buf_data_reg[0][123]_0 (\VFB_MIN.reorder_n_29 ),
        .\buf_data_reg[0][124]_0 (\VFB_MIN.reorder_n_28 ),
        .\buf_data_reg[0][125]_0 (\VFB_MIN.reorder_n_27 ),
        .\buf_data_reg[0][126]_0 (\VFB_MIN.reorder_n_26 ),
        .\buf_data_reg[0][127]_0 (\VFB_MIN.reorder_n_25 ),
        .\buf_data_reg[0][128]_0 (\VFB_MIN.reorder_n_24 ),
        .\buf_data_reg[0][129]_0 (\VFB_MIN.reorder_n_23 ),
        .\buf_data_reg[0][130]_0 (\VFB_MIN.reorder_n_22 ),
        .\buf_data_reg[0][131]_0 (\VFB_MIN.reorder_n_21 ),
        .\buf_data_reg[0][132]_0 (\VFB_MIN.reorder_n_20 ),
        .\buf_data_reg[0][133]_0 (\VFB_MIN.reorder_n_19 ),
        .\buf_data_reg[0][134]_0 (\VFB_MIN.reorder_n_18 ),
        .\buf_data_reg[0][135]_0 (\VFB_MIN.reorder_n_16 ),
        .\buf_data_reg[0][4]_0 (\VFB_MIN.reorder_n_14 ),
        .\buf_data_reg[1][136]_0 ({s_axis_tlast,s_axis_tdata,s_axis_tuser[69:64],s_axis_tuser[0],s_axis_tdest}),
        .cur_dtype_pxls1(cur_dtype_pxls1),
        .s_axis_aclk(s_axis_aclk),
        .s_axis_aresetn(s_axis_aresetn),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid),
        .sband_tact0(sband_tact0),
        .sband_tl(sband_tl),
        .sband_tl_r_reg(sdt_tr),
        .sband_tu_r(sband_tu_r),
        .sdt_tv(sdt_tv),
        .\vfb_vcdt_reg[9] (sband_ts_r));
  LUT1 #(
    .INIT(2'h1)) 
    i_120
       (.I0(vfb_arstn),
        .O(n_0_120));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_vfb_v1_0_23_op_inf op_inf
       (.D(p_1_in),
        .Q({s_axis_tlast_0,sband_ts,sband_tu,sband_ts__0}),
        .cur_dtype_pxls1(cur_dtype_pxls1),
        .sband_tact0(sband_tact0),
        .sband_tl(sband_tl),
        .\sband_ts_r_reg[9]_0 (sband_ts_r),
        .sband_tu_r(sband_tu_r),
        .sdt_tr(sdt_tr),
        .vfb_arstn(vfb_arstn),
        .vfb_clk(vfb_clk),
        .vfb_data(vfb_data),
        .\vfb_data_reg[0]_0 (\VFB_MIN.reorder_n_48 ),
        .\vfb_data_reg[10]_0 (\VFB_MIN.reorder_n_38 ),
        .\vfb_data_reg[11]_0 (\VFB_MIN.reorder_n_37 ),
        .\vfb_data_reg[12]_0 (\VFB_MIN.reorder_n_36 ),
        .\vfb_data_reg[13]_0 (\VFB_MIN.reorder_n_35 ),
        .\vfb_data_reg[14]_0 (\VFB_MIN.reorder_n_34 ),
        .\vfb_data_reg[15]_0 (\VFB_MIN.reorder_n_33 ),
        .\vfb_data_reg[16]_0 (\VFB_MIN.reorder_n_32 ),
        .\vfb_data_reg[17]_0 (\VFB_MIN.reorder_n_31 ),
        .\vfb_data_reg[18]_0 (\VFB_MIN.reorder_n_30 ),
        .\vfb_data_reg[19]_0 (\VFB_MIN.reorder_n_29 ),
        .\vfb_data_reg[1]_0 (\VFB_MIN.reorder_n_47 ),
        .\vfb_data_reg[20]_0 (\VFB_MIN.reorder_n_28 ),
        .\vfb_data_reg[21]_0 (\VFB_MIN.reorder_n_27 ),
        .\vfb_data_reg[22]_0 (\VFB_MIN.reorder_n_26 ),
        .\vfb_data_reg[23]_0 (\VFB_MIN.reorder_n_25 ),
        .\vfb_data_reg[24]_0 (\VFB_MIN.reorder_n_24 ),
        .\vfb_data_reg[25]_0 (\VFB_MIN.reorder_n_23 ),
        .\vfb_data_reg[26]_0 (\VFB_MIN.reorder_n_22 ),
        .\vfb_data_reg[27]_0 (\VFB_MIN.reorder_n_21 ),
        .\vfb_data_reg[28]_0 (\VFB_MIN.reorder_n_20 ),
        .\vfb_data_reg[29]_0 (\VFB_MIN.reorder_n_19 ),
        .\vfb_data_reg[2]_0 (\VFB_MIN.reorder_n_46 ),
        .\vfb_data_reg[30]_0 (\VFB_MIN.reorder_n_18 ),
        .\vfb_data_reg[31]_0 (\VFB_MIN.reorder_n_16 ),
        .\vfb_data_reg[3]_0 (\VFB_MIN.reorder_n_45 ),
        .\vfb_data_reg[4]_0 (\VFB_MIN.reorder_n_44 ),
        .\vfb_data_reg[5]_0 (\VFB_MIN.reorder_n_43 ),
        .\vfb_data_reg[6]_0 (\VFB_MIN.reorder_n_42 ),
        .\vfb_data_reg[7]_0 (\VFB_MIN.reorder_n_41 ),
        .\vfb_data_reg[8]_0 (\VFB_MIN.reorder_n_40 ),
        .\vfb_data_reg[9]_0 (\VFB_MIN.reorder_n_39 ),
        .vfb_eol_reg_0(vfb_eol),
        .vfb_ready(vfb_ready),
        .vfb_ready_0(mdt_tr),
        .\vfb_sof_reg[0]_0 (vfb_sof),
        .\vfb_sof_reg[0]_1 (\VFB_MIN.reorder_n_14 ),
        .vfb_valid_reg_0(vfb_valid),
        .vfb_vcdt(vfb_vcdt));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_vfb_v1_0_23_op_inf
   (vfb_eol_reg_0,
    vfb_ready_0,
    vfb_valid_reg_0,
    sband_tu_r,
    \vfb_sof_reg[0]_0 ,
    sdt_tr,
    \sband_ts_r_reg[9]_0 ,
    vfb_vcdt,
    vfb_data,
    sband_tact0,
    sband_tl,
    vfb_clk,
    Q,
    \vfb_sof_reg[0]_1 ,
    vfb_ready,
    vfb_arstn,
    cur_dtype_pxls1,
    D,
    \vfb_data_reg[31]_0 ,
    \vfb_data_reg[30]_0 ,
    \vfb_data_reg[29]_0 ,
    \vfb_data_reg[28]_0 ,
    \vfb_data_reg[27]_0 ,
    \vfb_data_reg[26]_0 ,
    \vfb_data_reg[25]_0 ,
    \vfb_data_reg[24]_0 ,
    \vfb_data_reg[23]_0 ,
    \vfb_data_reg[22]_0 ,
    \vfb_data_reg[21]_0 ,
    \vfb_data_reg[20]_0 ,
    \vfb_data_reg[19]_0 ,
    \vfb_data_reg[18]_0 ,
    \vfb_data_reg[17]_0 ,
    \vfb_data_reg[16]_0 ,
    \vfb_data_reg[15]_0 ,
    \vfb_data_reg[14]_0 ,
    \vfb_data_reg[13]_0 ,
    \vfb_data_reg[12]_0 ,
    \vfb_data_reg[11]_0 ,
    \vfb_data_reg[10]_0 ,
    \vfb_data_reg[9]_0 ,
    \vfb_data_reg[8]_0 ,
    \vfb_data_reg[7]_0 ,
    \vfb_data_reg[6]_0 ,
    \vfb_data_reg[5]_0 ,
    \vfb_data_reg[4]_0 ,
    \vfb_data_reg[3]_0 ,
    \vfb_data_reg[2]_0 ,
    \vfb_data_reg[1]_0 ,
    \vfb_data_reg[0]_0 );
  output vfb_eol_reg_0;
  output vfb_ready_0;
  output vfb_valid_reg_0;
  output sband_tu_r;
  output \vfb_sof_reg[0]_0 ;
  output sdt_tr;
  output [9:0]\sband_ts_r_reg[9]_0 ;
  output [9:0]vfb_vcdt;
  output [31:0]vfb_data;
  input sband_tact0;
  input sband_tl;
  input vfb_clk;
  input [11:0]Q;
  input \vfb_sof_reg[0]_1 ;
  input vfb_ready;
  input vfb_arstn;
  input cur_dtype_pxls1;
  input [9:0]D;
  input \vfb_data_reg[31]_0 ;
  input \vfb_data_reg[30]_0 ;
  input \vfb_data_reg[29]_0 ;
  input \vfb_data_reg[28]_0 ;
  input \vfb_data_reg[27]_0 ;
  input \vfb_data_reg[26]_0 ;
  input \vfb_data_reg[25]_0 ;
  input \vfb_data_reg[24]_0 ;
  input \vfb_data_reg[23]_0 ;
  input \vfb_data_reg[22]_0 ;
  input \vfb_data_reg[21]_0 ;
  input \vfb_data_reg[20]_0 ;
  input \vfb_data_reg[19]_0 ;
  input \vfb_data_reg[18]_0 ;
  input \vfb_data_reg[17]_0 ;
  input \vfb_data_reg[16]_0 ;
  input \vfb_data_reg[15]_0 ;
  input \vfb_data_reg[14]_0 ;
  input \vfb_data_reg[13]_0 ;
  input \vfb_data_reg[12]_0 ;
  input \vfb_data_reg[11]_0 ;
  input \vfb_data_reg[10]_0 ;
  input \vfb_data_reg[9]_0 ;
  input \vfb_data_reg[8]_0 ;
  input \vfb_data_reg[7]_0 ;
  input \vfb_data_reg[6]_0 ;
  input \vfb_data_reg[5]_0 ;
  input \vfb_data_reg[4]_0 ;
  input \vfb_data_reg[3]_0 ;
  input \vfb_data_reg[2]_0 ;
  input \vfb_data_reg[1]_0 ;
  input \vfb_data_reg[0]_0 ;

  wire [9:0]D;
  wire [11:0]Q;
  wire [3:2]cnt_done0;
  wire cur_dtype_pxls1;
  wire sband_tact;
  wire sband_tact0;
  wire sband_tact1__0;
  wire sband_tact_i_1_n_0;
  wire sband_tl;
  wire sband_tl_r;
  wire sband_tr2;
  wire [9:0]\sband_ts_r_reg[9]_0 ;
  wire sband_tu_r;
  wire sdt_tr;
  wire vfb_arstn;
  wire vfb_clk;
  wire \vfb_cnt[3]_i_1_n_0 ;
  wire [3:2]vfb_cnt_reg;
  wire [31:0]vfb_data;
  wire \vfb_data[31]_i_1_n_0 ;
  wire \vfb_data_reg[0]_0 ;
  wire \vfb_data_reg[10]_0 ;
  wire \vfb_data_reg[11]_0 ;
  wire \vfb_data_reg[12]_0 ;
  wire \vfb_data_reg[13]_0 ;
  wire \vfb_data_reg[14]_0 ;
  wire \vfb_data_reg[15]_0 ;
  wire \vfb_data_reg[16]_0 ;
  wire \vfb_data_reg[17]_0 ;
  wire \vfb_data_reg[18]_0 ;
  wire \vfb_data_reg[19]_0 ;
  wire \vfb_data_reg[1]_0 ;
  wire \vfb_data_reg[20]_0 ;
  wire \vfb_data_reg[21]_0 ;
  wire \vfb_data_reg[22]_0 ;
  wire \vfb_data_reg[23]_0 ;
  wire \vfb_data_reg[24]_0 ;
  wire \vfb_data_reg[25]_0 ;
  wire \vfb_data_reg[26]_0 ;
  wire \vfb_data_reg[27]_0 ;
  wire \vfb_data_reg[28]_0 ;
  wire \vfb_data_reg[29]_0 ;
  wire \vfb_data_reg[2]_0 ;
  wire \vfb_data_reg[30]_0 ;
  wire \vfb_data_reg[31]_0 ;
  wire \vfb_data_reg[3]_0 ;
  wire \vfb_data_reg[4]_0 ;
  wire \vfb_data_reg[5]_0 ;
  wire \vfb_data_reg[6]_0 ;
  wire \vfb_data_reg[7]_0 ;
  wire \vfb_data_reg[8]_0 ;
  wire \vfb_data_reg[9]_0 ;
  wire vfb_eol_i_1_n_0;
  wire vfb_eol_reg_0;
  wire vfb_ready;
  wire vfb_ready_0;
  wire vfb_sof7_in;
  wire \vfb_sof[0]_i_1_n_0 ;
  wire \vfb_sof[0]_i_4_n_0 ;
  wire \vfb_sof_reg[0]_0 ;
  wire \vfb_sof_reg[0]_1 ;
  wire vfb_tu0;
  wire vfb_tu0_i_1_n_0;
  wire vfb_valid0__0;
  wire vfb_valid_i_1_n_0;
  wire vfb_valid_i_2_n_0;
  wire vfb_valid_reg_0;
  wire [9:0]vfb_vcdt;
  wire \vfb_vcdt[9]_i_1_n_0 ;

  LUT2 #(
    .INIT(4'hB)) 
    mdt_tr_INST_0
       (.I0(vfb_ready),
        .I1(vfb_valid_reg_0),
        .O(vfb_ready_0));
  LUT6 #(
    .INIT(64'hBBBBFFFBAAAAAAAA)) 
    sband_tact_i_1
       (.I0(sband_tact0),
        .I1(sband_tr2),
        .I2(vfb_cnt_reg[2]),
        .I3(vfb_cnt_reg[3]),
        .I4(vfb_eol_reg_0),
        .I5(sband_tact),
        .O(sband_tact_i_1_n_0));
  FDRE sband_tact_reg
       (.C(vfb_clk),
        .CE(1'b1),
        .D(sband_tact_i_1_n_0),
        .Q(sband_tact),
        .R(vfb_valid_i_1_n_0));
  FDRE sband_tl_r_reg
       (.C(vfb_clk),
        .CE(sband_tact0),
        .D(sband_tl),
        .Q(sband_tl_r),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_ts_r_reg[0] 
       (.C(vfb_clk),
        .CE(sband_tact0),
        .D(Q[0]),
        .Q(\sband_ts_r_reg[9]_0 [0]),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_ts_r_reg[1] 
       (.C(vfb_clk),
        .CE(sband_tact0),
        .D(Q[1]),
        .Q(\sband_ts_r_reg[9]_0 [1]),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_ts_r_reg[2] 
       (.C(vfb_clk),
        .CE(sband_tact0),
        .D(Q[2]),
        .Q(\sband_ts_r_reg[9]_0 [2]),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_ts_r_reg[3] 
       (.C(vfb_clk),
        .CE(sband_tact0),
        .D(Q[3]),
        .Q(\sband_ts_r_reg[9]_0 [3]),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_ts_r_reg[4] 
       (.C(vfb_clk),
        .CE(sband_tact0),
        .D(Q[5]),
        .Q(\sband_ts_r_reg[9]_0 [4]),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_ts_r_reg[5] 
       (.C(vfb_clk),
        .CE(sband_tact0),
        .D(Q[6]),
        .Q(\sband_ts_r_reg[9]_0 [5]),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_ts_r_reg[6] 
       (.C(vfb_clk),
        .CE(sband_tact0),
        .D(Q[7]),
        .Q(\sband_ts_r_reg[9]_0 [6]),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_ts_r_reg[7] 
       (.C(vfb_clk),
        .CE(sband_tact0),
        .D(Q[8]),
        .Q(\sband_ts_r_reg[9]_0 [7]),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_ts_r_reg[8] 
       (.C(vfb_clk),
        .CE(sband_tact0),
        .D(Q[9]),
        .Q(\sband_ts_r_reg[9]_0 [8]),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_ts_r_reg[9] 
       (.C(vfb_clk),
        .CE(sband_tact0),
        .D(Q[10]),
        .Q(\sband_ts_r_reg[9]_0 [9]),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_tu_r_reg[0] 
       (.C(vfb_clk),
        .CE(sband_tact0),
        .D(Q[4]),
        .Q(sband_tu_r),
        .R(vfb_valid_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT5 #(
    .INIT(32'h0000555D)) 
    sdt_tr_INST_0
       (.I0(vfb_valid_reg_0),
        .I1(vfb_ready),
        .I2(vfb_cnt_reg[2]),
        .I3(vfb_cnt_reg[3]),
        .I4(vfb_eol_reg_0),
        .O(sdt_tr));
  LUT1 #(
    .INIT(2'h1)) 
    \vfb_cnt[2]_i_1 
       (.I0(vfb_cnt_reg[2]),
        .O(cnt_done0[2]));
  LUT6 #(
    .INIT(64'h88880008FFFFFFFF)) 
    \vfb_cnt[3]_i_1 
       (.I0(vfb_ready),
        .I1(vfb_valid_reg_0),
        .I2(vfb_cnt_reg[2]),
        .I3(vfb_cnt_reg[3]),
        .I4(vfb_eol_reg_0),
        .I5(vfb_arstn),
        .O(\vfb_cnt[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_cnt[3]_i_2 
       (.I0(vfb_valid_reg_0),
        .I1(vfb_ready),
        .O(sband_tr2));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \vfb_cnt[3]_i_3 
       (.I0(vfb_cnt_reg[2]),
        .I1(vfb_cnt_reg[3]),
        .O(cnt_done0[3]));
  FDRE \vfb_cnt_reg[2] 
       (.C(vfb_clk),
        .CE(sband_tr2),
        .D(cnt_done0[2]),
        .Q(vfb_cnt_reg[2]),
        .R(\vfb_cnt[3]_i_1_n_0 ));
  FDRE \vfb_cnt_reg[3] 
       (.C(vfb_clk),
        .CE(sband_tr2),
        .D(cnt_done0[3]),
        .Q(vfb_cnt_reg[3]),
        .R(\vfb_cnt[3]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h3B)) 
    \vfb_data[31]_i_1 
       (.I0(vfb_ready),
        .I1(vfb_valid_reg_0),
        .I2(vfb_eol_reg_0),
        .O(\vfb_data[31]_i_1_n_0 ));
  FDRE \vfb_data_reg[0] 
       (.C(vfb_clk),
        .CE(\vfb_data[31]_i_1_n_0 ),
        .D(\vfb_data_reg[0]_0 ),
        .Q(vfb_data[0]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_data_reg[10] 
       (.C(vfb_clk),
        .CE(\vfb_data[31]_i_1_n_0 ),
        .D(\vfb_data_reg[10]_0 ),
        .Q(vfb_data[10]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_data_reg[11] 
       (.C(vfb_clk),
        .CE(\vfb_data[31]_i_1_n_0 ),
        .D(\vfb_data_reg[11]_0 ),
        .Q(vfb_data[11]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_data_reg[12] 
       (.C(vfb_clk),
        .CE(\vfb_data[31]_i_1_n_0 ),
        .D(\vfb_data_reg[12]_0 ),
        .Q(vfb_data[12]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_data_reg[13] 
       (.C(vfb_clk),
        .CE(\vfb_data[31]_i_1_n_0 ),
        .D(\vfb_data_reg[13]_0 ),
        .Q(vfb_data[13]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_data_reg[14] 
       (.C(vfb_clk),
        .CE(\vfb_data[31]_i_1_n_0 ),
        .D(\vfb_data_reg[14]_0 ),
        .Q(vfb_data[14]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_data_reg[15] 
       (.C(vfb_clk),
        .CE(\vfb_data[31]_i_1_n_0 ),
        .D(\vfb_data_reg[15]_0 ),
        .Q(vfb_data[15]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_data_reg[16] 
       (.C(vfb_clk),
        .CE(\vfb_data[31]_i_1_n_0 ),
        .D(\vfb_data_reg[16]_0 ),
        .Q(vfb_data[16]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_data_reg[17] 
       (.C(vfb_clk),
        .CE(\vfb_data[31]_i_1_n_0 ),
        .D(\vfb_data_reg[17]_0 ),
        .Q(vfb_data[17]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_data_reg[18] 
       (.C(vfb_clk),
        .CE(\vfb_data[31]_i_1_n_0 ),
        .D(\vfb_data_reg[18]_0 ),
        .Q(vfb_data[18]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_data_reg[19] 
       (.C(vfb_clk),
        .CE(\vfb_data[31]_i_1_n_0 ),
        .D(\vfb_data_reg[19]_0 ),
        .Q(vfb_data[19]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_data_reg[1] 
       (.C(vfb_clk),
        .CE(\vfb_data[31]_i_1_n_0 ),
        .D(\vfb_data_reg[1]_0 ),
        .Q(vfb_data[1]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_data_reg[20] 
       (.C(vfb_clk),
        .CE(\vfb_data[31]_i_1_n_0 ),
        .D(\vfb_data_reg[20]_0 ),
        .Q(vfb_data[20]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_data_reg[21] 
       (.C(vfb_clk),
        .CE(\vfb_data[31]_i_1_n_0 ),
        .D(\vfb_data_reg[21]_0 ),
        .Q(vfb_data[21]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_data_reg[22] 
       (.C(vfb_clk),
        .CE(\vfb_data[31]_i_1_n_0 ),
        .D(\vfb_data_reg[22]_0 ),
        .Q(vfb_data[22]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_data_reg[23] 
       (.C(vfb_clk),
        .CE(\vfb_data[31]_i_1_n_0 ),
        .D(\vfb_data_reg[23]_0 ),
        .Q(vfb_data[23]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_data_reg[24] 
       (.C(vfb_clk),
        .CE(\vfb_data[31]_i_1_n_0 ),
        .D(\vfb_data_reg[24]_0 ),
        .Q(vfb_data[24]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_data_reg[25] 
       (.C(vfb_clk),
        .CE(\vfb_data[31]_i_1_n_0 ),
        .D(\vfb_data_reg[25]_0 ),
        .Q(vfb_data[25]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_data_reg[26] 
       (.C(vfb_clk),
        .CE(\vfb_data[31]_i_1_n_0 ),
        .D(\vfb_data_reg[26]_0 ),
        .Q(vfb_data[26]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_data_reg[27] 
       (.C(vfb_clk),
        .CE(\vfb_data[31]_i_1_n_0 ),
        .D(\vfb_data_reg[27]_0 ),
        .Q(vfb_data[27]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_data_reg[28] 
       (.C(vfb_clk),
        .CE(\vfb_data[31]_i_1_n_0 ),
        .D(\vfb_data_reg[28]_0 ),
        .Q(vfb_data[28]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_data_reg[29] 
       (.C(vfb_clk),
        .CE(\vfb_data[31]_i_1_n_0 ),
        .D(\vfb_data_reg[29]_0 ),
        .Q(vfb_data[29]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_data_reg[2] 
       (.C(vfb_clk),
        .CE(\vfb_data[31]_i_1_n_0 ),
        .D(\vfb_data_reg[2]_0 ),
        .Q(vfb_data[2]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_data_reg[30] 
       (.C(vfb_clk),
        .CE(\vfb_data[31]_i_1_n_0 ),
        .D(\vfb_data_reg[30]_0 ),
        .Q(vfb_data[30]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_data_reg[31] 
       (.C(vfb_clk),
        .CE(\vfb_data[31]_i_1_n_0 ),
        .D(\vfb_data_reg[31]_0 ),
        .Q(vfb_data[31]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_data_reg[3] 
       (.C(vfb_clk),
        .CE(\vfb_data[31]_i_1_n_0 ),
        .D(\vfb_data_reg[3]_0 ),
        .Q(vfb_data[3]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_data_reg[4] 
       (.C(vfb_clk),
        .CE(\vfb_data[31]_i_1_n_0 ),
        .D(\vfb_data_reg[4]_0 ),
        .Q(vfb_data[4]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_data_reg[5] 
       (.C(vfb_clk),
        .CE(\vfb_data[31]_i_1_n_0 ),
        .D(\vfb_data_reg[5]_0 ),
        .Q(vfb_data[5]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_data_reg[6] 
       (.C(vfb_clk),
        .CE(\vfb_data[31]_i_1_n_0 ),
        .D(\vfb_data_reg[6]_0 ),
        .Q(vfb_data[6]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_data_reg[7] 
       (.C(vfb_clk),
        .CE(\vfb_data[31]_i_1_n_0 ),
        .D(\vfb_data_reg[7]_0 ),
        .Q(vfb_data[7]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_data_reg[8] 
       (.C(vfb_clk),
        .CE(\vfb_data[31]_i_1_n_0 ),
        .D(\vfb_data_reg[8]_0 ),
        .Q(vfb_data[8]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_data_reg[9] 
       (.C(vfb_clk),
        .CE(\vfb_data[31]_i_1_n_0 ),
        .D(\vfb_data_reg[9]_0 ),
        .Q(vfb_data[9]),
        .R(vfb_valid_i_1_n_0));
  LUT6 #(
    .INIT(64'h00000000F8080808)) 
    vfb_eol_i_1
       (.I0(sband_tl_r),
        .I1(vfb_valid0__0),
        .I2(sband_tact0),
        .I3(cur_dtype_pxls1),
        .I4(Q[11]),
        .I5(sband_tact1__0),
        .O(vfb_eol_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    vfb_eol_i_2
       (.I0(sband_tact),
        .I1(vfb_cnt_reg[2]),
        .I2(vfb_cnt_reg[3]),
        .O(vfb_valid0__0));
  FDRE vfb_eol_reg
       (.C(vfb_clk),
        .CE(vfb_ready_0),
        .D(vfb_eol_i_1_n_0),
        .Q(vfb_eol_reg_0),
        .R(vfb_valid_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000032AA02AA)) 
    \vfb_sof[0]_i_1 
       (.I0(\vfb_sof_reg[0]_0 ),
        .I1(sband_tact1__0),
        .I2(vfb_sof7_in),
        .I3(vfb_ready_0),
        .I4(\vfb_sof_reg[0]_1 ),
        .I5(\vfb_sof[0]_i_4_n_0 ),
        .O(\vfb_sof[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'hFEAA)) 
    \vfb_sof[0]_i_2 
       (.I0(sband_tact0),
        .I1(vfb_cnt_reg[3]),
        .I2(vfb_cnt_reg[2]),
        .I3(sband_tact),
        .O(vfb_sof7_in));
  LUT6 #(
    .INIT(64'h80F38080FFFFFFFF)) 
    \vfb_sof[0]_i_4 
       (.I0(\vfb_sof_reg[0]_0 ),
        .I1(vfb_valid_reg_0),
        .I2(vfb_ready),
        .I3(vfb_eol_reg_0),
        .I4(vfb_tu0),
        .I5(vfb_arstn),
        .O(\vfb_sof[0]_i_4_n_0 ));
  FDRE \vfb_sof_reg[0] 
       (.C(vfb_clk),
        .CE(1'b1),
        .D(\vfb_sof[0]_i_1_n_0 ),
        .Q(\vfb_sof_reg[0]_0 ),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h3FFF2000)) 
    vfb_tu0_i_1
       (.I0(\vfb_sof_reg[0]_0 ),
        .I1(vfb_eol_reg_0),
        .I2(vfb_valid_reg_0),
        .I3(vfb_ready),
        .I4(vfb_tu0),
        .O(vfb_tu0_i_1_n_0));
  FDRE vfb_tu0_reg
       (.C(vfb_clk),
        .CE(1'b1),
        .D(vfb_tu0_i_1_n_0),
        .Q(vfb_tu0),
        .R(vfb_valid_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    vfb_valid_i_1
       (.I0(vfb_arstn),
        .O(vfb_valid_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'h0000FFA8)) 
    vfb_valid_i_2
       (.I0(sband_tact),
        .I1(vfb_cnt_reg[2]),
        .I2(vfb_cnt_reg[3]),
        .I3(sband_tact0),
        .I4(sband_tact1__0),
        .O(vfb_valid_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h80)) 
    vfb_valid_i_3
       (.I0(vfb_ready),
        .I1(vfb_valid_reg_0),
        .I2(vfb_eol_reg_0),
        .O(sband_tact1__0));
  FDRE vfb_valid_reg
       (.C(vfb_clk),
        .CE(vfb_ready_0),
        .D(vfb_valid_i_2_n_0),
        .Q(vfb_valid_reg_0),
        .R(vfb_valid_i_1_n_0));
  LUT4 #(
    .INIT(16'hDDD0)) 
    \vfb_vcdt[9]_i_1 
       (.I0(vfb_valid_reg_0),
        .I1(vfb_ready),
        .I2(sband_tact),
        .I3(sband_tact0),
        .O(\vfb_vcdt[9]_i_1_n_0 ));
  FDRE \vfb_vcdt_reg[0] 
       (.C(vfb_clk),
        .CE(\vfb_vcdt[9]_i_1_n_0 ),
        .D(D[0]),
        .Q(vfb_vcdt[0]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_vcdt_reg[1] 
       (.C(vfb_clk),
        .CE(\vfb_vcdt[9]_i_1_n_0 ),
        .D(D[1]),
        .Q(vfb_vcdt[1]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_vcdt_reg[2] 
       (.C(vfb_clk),
        .CE(\vfb_vcdt[9]_i_1_n_0 ),
        .D(D[2]),
        .Q(vfb_vcdt[2]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_vcdt_reg[3] 
       (.C(vfb_clk),
        .CE(\vfb_vcdt[9]_i_1_n_0 ),
        .D(D[3]),
        .Q(vfb_vcdt[3]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_vcdt_reg[4] 
       (.C(vfb_clk),
        .CE(\vfb_vcdt[9]_i_1_n_0 ),
        .D(D[4]),
        .Q(vfb_vcdt[4]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_vcdt_reg[5] 
       (.C(vfb_clk),
        .CE(\vfb_vcdt[9]_i_1_n_0 ),
        .D(D[5]),
        .Q(vfb_vcdt[5]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_vcdt_reg[6] 
       (.C(vfb_clk),
        .CE(\vfb_vcdt[9]_i_1_n_0 ),
        .D(D[6]),
        .Q(vfb_vcdt[6]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_vcdt_reg[7] 
       (.C(vfb_clk),
        .CE(\vfb_vcdt[9]_i_1_n_0 ),
        .D(D[7]),
        .Q(vfb_vcdt[7]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_vcdt_reg[8] 
       (.C(vfb_clk),
        .CE(\vfb_vcdt[9]_i_1_n_0 ),
        .D(D[8]),
        .Q(vfb_vcdt[8]),
        .R(vfb_valid_i_1_n_0));
  FDRE \vfb_vcdt_reg[9] 
       (.C(vfb_clk),
        .CE(\vfb_vcdt[9]_i_1_n_0 ),
        .D(D[9]),
        .Q(vfb_vcdt[9]),
        .R(vfb_valid_i_1_n_0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_vfb_v1_0_23_reorder
   (cur_dtype_pxls1,
    sband_tl,
    Q,
    \buf_data_reg[0][4]_0 ,
    sdt_tv,
    \buf_data_reg[0][135]_0 ,
    sband_tact0,
    \buf_data_reg[0][134]_0 ,
    \buf_data_reg[0][133]_0 ,
    \buf_data_reg[0][132]_0 ,
    \buf_data_reg[0][131]_0 ,
    \buf_data_reg[0][130]_0 ,
    \buf_data_reg[0][129]_0 ,
    \buf_data_reg[0][128]_0 ,
    \buf_data_reg[0][127]_0 ,
    \buf_data_reg[0][126]_0 ,
    \buf_data_reg[0][125]_0 ,
    \buf_data_reg[0][124]_0 ,
    \buf_data_reg[0][123]_0 ,
    \buf_data_reg[0][122]_0 ,
    \buf_data_reg[0][121]_0 ,
    \buf_data_reg[0][120]_0 ,
    \buf_data_reg[0][119]_0 ,
    \buf_data_reg[0][118]_0 ,
    \buf_data_reg[0][117]_0 ,
    \buf_data_reg[0][116]_0 ,
    \buf_data_reg[0][115]_0 ,
    \buf_data_reg[0][114]_0 ,
    \buf_data_reg[0][113]_0 ,
    \buf_data_reg[0][112]_0 ,
    \buf_data_reg[0][111]_0 ,
    \buf_data_reg[0][110]_0 ,
    \buf_data_reg[0][109]_0 ,
    \buf_data_reg[0][108]_0 ,
    \buf_data_reg[0][107]_0 ,
    \buf_data_reg[0][106]_0 ,
    \buf_data_reg[0][105]_0 ,
    \buf_data_reg[0][104]_0 ,
    D,
    s_axis_tready,
    s_axis_tvalid,
    sband_tl_r_reg,
    sband_tu_r,
    \vfb_vcdt_reg[9] ,
    \buf_data_reg[1][136]_0 ,
    s_axis_aresetn,
    s_axis_aclk);
  output cur_dtype_pxls1;
  output sband_tl;
  output [11:0]Q;
  output \buf_data_reg[0][4]_0 ;
  output sdt_tv;
  output \buf_data_reg[0][135]_0 ;
  output sband_tact0;
  output \buf_data_reg[0][134]_0 ;
  output \buf_data_reg[0][133]_0 ;
  output \buf_data_reg[0][132]_0 ;
  output \buf_data_reg[0][131]_0 ;
  output \buf_data_reg[0][130]_0 ;
  output \buf_data_reg[0][129]_0 ;
  output \buf_data_reg[0][128]_0 ;
  output \buf_data_reg[0][127]_0 ;
  output \buf_data_reg[0][126]_0 ;
  output \buf_data_reg[0][125]_0 ;
  output \buf_data_reg[0][124]_0 ;
  output \buf_data_reg[0][123]_0 ;
  output \buf_data_reg[0][122]_0 ;
  output \buf_data_reg[0][121]_0 ;
  output \buf_data_reg[0][120]_0 ;
  output \buf_data_reg[0][119]_0 ;
  output \buf_data_reg[0][118]_0 ;
  output \buf_data_reg[0][117]_0 ;
  output \buf_data_reg[0][116]_0 ;
  output \buf_data_reg[0][115]_0 ;
  output \buf_data_reg[0][114]_0 ;
  output \buf_data_reg[0][113]_0 ;
  output \buf_data_reg[0][112]_0 ;
  output \buf_data_reg[0][111]_0 ;
  output \buf_data_reg[0][110]_0 ;
  output \buf_data_reg[0][109]_0 ;
  output \buf_data_reg[0][108]_0 ;
  output \buf_data_reg[0][107]_0 ;
  output \buf_data_reg[0][106]_0 ;
  output \buf_data_reg[0][105]_0 ;
  output \buf_data_reg[0][104]_0 ;
  output [9:0]D;
  output s_axis_tready;
  input s_axis_tvalid;
  input sband_tl_r_reg;
  input sband_tu_r;
  input [9:0]\vfb_vcdt_reg[9] ;
  input [43:0]\buf_data_reg[1][136]_0 ;
  input s_axis_aresetn;
  input s_axis_aclk;

  wire [9:0]D;
  wire [11:0]Q;
  wire \buf_data[0][136]_i_1_n_0 ;
  wire \buf_data[1][136]_i_1_n_0 ;
  wire \buf_data_reg[0][104]_0 ;
  wire \buf_data_reg[0][105]_0 ;
  wire \buf_data_reg[0][106]_0 ;
  wire \buf_data_reg[0][107]_0 ;
  wire \buf_data_reg[0][108]_0 ;
  wire \buf_data_reg[0][109]_0 ;
  wire \buf_data_reg[0][110]_0 ;
  wire \buf_data_reg[0][111]_0 ;
  wire \buf_data_reg[0][112]_0 ;
  wire \buf_data_reg[0][113]_0 ;
  wire \buf_data_reg[0][114]_0 ;
  wire \buf_data_reg[0][115]_0 ;
  wire \buf_data_reg[0][116]_0 ;
  wire \buf_data_reg[0][117]_0 ;
  wire \buf_data_reg[0][118]_0 ;
  wire \buf_data_reg[0][119]_0 ;
  wire \buf_data_reg[0][120]_0 ;
  wire \buf_data_reg[0][121]_0 ;
  wire \buf_data_reg[0][122]_0 ;
  wire \buf_data_reg[0][123]_0 ;
  wire \buf_data_reg[0][124]_0 ;
  wire \buf_data_reg[0][125]_0 ;
  wire \buf_data_reg[0][126]_0 ;
  wire \buf_data_reg[0][127]_0 ;
  wire \buf_data_reg[0][128]_0 ;
  wire \buf_data_reg[0][129]_0 ;
  wire \buf_data_reg[0][130]_0 ;
  wire \buf_data_reg[0][131]_0 ;
  wire \buf_data_reg[0][132]_0 ;
  wire \buf_data_reg[0][133]_0 ;
  wire \buf_data_reg[0][134]_0 ;
  wire \buf_data_reg[0][135]_0 ;
  wire \buf_data_reg[0][4]_0 ;
  wire [136:0]\buf_data_reg[1] ;
  wire [43:0]\buf_data_reg[1][136]_0 ;
  wire \buf_valid[0]_i_1_n_0 ;
  wire \buf_valid[1]_i_1_n_0 ;
  wire \buf_valid[1]_i_2_n_0 ;
  wire \buf_valid_reg_n_0_[0] ;
  wire cur_dtype_pxls1;
  wire cur_dtype_sink_i_1_n_0;
  wire cur_dtype_sink_reg_n_0;
  wire cur_dtype_udef;
  wire cur_dtype_udef_i_1_n_0;
  wire cur_dtype_udef_i_2_n_0;
  wire main_dtvc;
  wire p_0_in;
  wire [136:0]p_2_in;
  wire s_axis_aclk;
  wire s_axis_aresetn;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire sban_dtvc;
  wire sband_tact0;
  wire sband_tl;
  wire sband_tl_r_reg;
  wire sband_tu_r;
  wire sdt_tv;
  wire [31:0]tdata_s0;
  wire [9:0]\vfb_vcdt_reg[9] ;

  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][0]_i_1 
       (.I0(\buf_data_reg[1] [0]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [0]),
        .O(p_2_in[0]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][104]_i_1 
       (.I0(\buf_data_reg[1] [104]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [11]),
        .O(p_2_in[104]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][105]_i_1 
       (.I0(\buf_data_reg[1] [105]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [12]),
        .O(p_2_in[105]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][106]_i_1 
       (.I0(\buf_data_reg[1] [106]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [13]),
        .O(p_2_in[106]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][107]_i_1 
       (.I0(\buf_data_reg[1] [107]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [14]),
        .O(p_2_in[107]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][108]_i_1 
       (.I0(\buf_data_reg[1] [108]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [15]),
        .O(p_2_in[108]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][109]_i_1 
       (.I0(\buf_data_reg[1] [109]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [16]),
        .O(p_2_in[109]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][110]_i_1 
       (.I0(\buf_data_reg[1] [110]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [17]),
        .O(p_2_in[110]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][111]_i_1 
       (.I0(\buf_data_reg[1] [111]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [18]),
        .O(p_2_in[111]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][112]_i_1 
       (.I0(\buf_data_reg[1] [112]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [19]),
        .O(p_2_in[112]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][113]_i_1 
       (.I0(\buf_data_reg[1] [113]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [20]),
        .O(p_2_in[113]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][114]_i_1 
       (.I0(\buf_data_reg[1] [114]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [21]),
        .O(p_2_in[114]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][115]_i_1 
       (.I0(\buf_data_reg[1] [115]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [22]),
        .O(p_2_in[115]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][116]_i_1 
       (.I0(\buf_data_reg[1] [116]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [23]),
        .O(p_2_in[116]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][117]_i_1 
       (.I0(\buf_data_reg[1] [117]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [24]),
        .O(p_2_in[117]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][118]_i_1 
       (.I0(\buf_data_reg[1] [118]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [25]),
        .O(p_2_in[118]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][119]_i_1 
       (.I0(\buf_data_reg[1] [119]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [26]),
        .O(p_2_in[119]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][120]_i_1 
       (.I0(\buf_data_reg[1] [120]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [27]),
        .O(p_2_in[120]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][121]_i_1 
       (.I0(\buf_data_reg[1] [121]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [28]),
        .O(p_2_in[121]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][122]_i_1 
       (.I0(\buf_data_reg[1] [122]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [29]),
        .O(p_2_in[122]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][123]_i_1 
       (.I0(\buf_data_reg[1] [123]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [30]),
        .O(p_2_in[123]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][124]_i_1 
       (.I0(\buf_data_reg[1] [124]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [31]),
        .O(p_2_in[124]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][125]_i_1 
       (.I0(\buf_data_reg[1] [125]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [32]),
        .O(p_2_in[125]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][126]_i_1 
       (.I0(\buf_data_reg[1] [126]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [33]),
        .O(p_2_in[126]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][127]_i_1 
       (.I0(\buf_data_reg[1] [127]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [34]),
        .O(p_2_in[127]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][128]_i_1 
       (.I0(\buf_data_reg[1] [128]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [35]),
        .O(p_2_in[128]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][129]_i_1 
       (.I0(\buf_data_reg[1] [129]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [36]),
        .O(p_2_in[129]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][130]_i_1 
       (.I0(\buf_data_reg[1] [130]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [37]),
        .O(p_2_in[130]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][131]_i_1 
       (.I0(\buf_data_reg[1] [131]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [38]),
        .O(p_2_in[131]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][132]_i_1 
       (.I0(\buf_data_reg[1] [132]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [39]),
        .O(p_2_in[132]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][133]_i_1 
       (.I0(\buf_data_reg[1] [133]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [40]),
        .O(p_2_in[133]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][134]_i_1 
       (.I0(\buf_data_reg[1] [134]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [41]),
        .O(p_2_in[134]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][135]_i_1 
       (.I0(\buf_data_reg[1] [135]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [42]),
        .O(p_2_in[135]));
  LUT4 #(
    .INIT(16'hA8B8)) 
    \buf_data[0][136]_i_1 
       (.I0(cur_dtype_pxls1),
        .I1(p_0_in),
        .I2(s_axis_tvalid),
        .I3(\buf_valid_reg_n_0_[0] ),
        .O(\buf_data[0][136]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][136]_i_2 
       (.I0(\buf_data_reg[1] [136]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [43]),
        .O(p_2_in[136]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][1]_i_1 
       (.I0(\buf_data_reg[1] [1]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [1]),
        .O(p_2_in[1]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][2]_i_1 
       (.I0(\buf_data_reg[1] [2]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [2]),
        .O(p_2_in[2]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][3]_i_1 
       (.I0(\buf_data_reg[1] [3]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [3]),
        .O(p_2_in[3]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][4]_i_1 
       (.I0(\buf_data_reg[1] [4]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [4]),
        .O(p_2_in[4]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][68]_i_1 
       (.I0(\buf_data_reg[1] [68]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [5]),
        .O(p_2_in[68]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][69]_i_1 
       (.I0(\buf_data_reg[1] [69]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [6]),
        .O(p_2_in[69]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][70]_i_1 
       (.I0(\buf_data_reg[1] [70]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [7]),
        .O(p_2_in[70]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][71]_i_1 
       (.I0(\buf_data_reg[1] [71]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [8]),
        .O(p_2_in[71]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][72]_i_1 
       (.I0(\buf_data_reg[1] [72]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [9]),
        .O(p_2_in[72]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][73]_i_1 
       (.I0(\buf_data_reg[1] [73]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [10]),
        .O(p_2_in[73]));
  LUT4 #(
    .INIT(16'h0040)) 
    \buf_data[1][136]_i_1 
       (.I0(p_0_in),
        .I1(s_axis_tvalid),
        .I2(\buf_valid_reg_n_0_[0] ),
        .I3(cur_dtype_pxls1),
        .O(\buf_data[1][136]_i_1_n_0 ));
  FDRE \buf_data_reg[0][0] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[0]),
        .Q(Q[0]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][104] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[104]),
        .Q(tdata_s0[0]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][105] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[105]),
        .Q(tdata_s0[1]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][106] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[106]),
        .Q(tdata_s0[2]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][107] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[107]),
        .Q(tdata_s0[3]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][108] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[108]),
        .Q(tdata_s0[4]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][109] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[109]),
        .Q(tdata_s0[5]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][110] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[110]),
        .Q(tdata_s0[6]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][111] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[111]),
        .Q(tdata_s0[7]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][112] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[112]),
        .Q(tdata_s0[8]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][113] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[113]),
        .Q(tdata_s0[9]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][114] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[114]),
        .Q(tdata_s0[10]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][115] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[115]),
        .Q(tdata_s0[11]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][116] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[116]),
        .Q(tdata_s0[12]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][117] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[117]),
        .Q(tdata_s0[13]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][118] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[118]),
        .Q(tdata_s0[14]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][119] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[119]),
        .Q(tdata_s0[15]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][120] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[120]),
        .Q(tdata_s0[16]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][121] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[121]),
        .Q(tdata_s0[17]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][122] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[122]),
        .Q(tdata_s0[18]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][123] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[123]),
        .Q(tdata_s0[19]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][124] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[124]),
        .Q(tdata_s0[20]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][125] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[125]),
        .Q(tdata_s0[21]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][126] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[126]),
        .Q(tdata_s0[22]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][127] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[127]),
        .Q(tdata_s0[23]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][128] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[128]),
        .Q(tdata_s0[24]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][129] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[129]),
        .Q(tdata_s0[25]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][130] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[130]),
        .Q(tdata_s0[26]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][131] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[131]),
        .Q(tdata_s0[27]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][132] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[132]),
        .Q(tdata_s0[28]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][133] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[133]),
        .Q(tdata_s0[29]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][134] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[134]),
        .Q(tdata_s0[30]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][135] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[135]),
        .Q(tdata_s0[31]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][136] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[136]),
        .Q(Q[11]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][1] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[1]),
        .Q(Q[1]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][2] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[2]),
        .Q(Q[2]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][3] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[3]),
        .Q(Q[3]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][4] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[4]),
        .Q(Q[4]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][68] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[68]),
        .Q(Q[5]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][69] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[69]),
        .Q(Q[6]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][70] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[70]),
        .Q(Q[7]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][71] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[71]),
        .Q(Q[8]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][72] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[72]),
        .Q(Q[9]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][73] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[73]),
        .Q(Q[10]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][0] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [0]),
        .Q(\buf_data_reg[1] [0]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][104] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [11]),
        .Q(\buf_data_reg[1] [104]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][105] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [12]),
        .Q(\buf_data_reg[1] [105]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][106] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [13]),
        .Q(\buf_data_reg[1] [106]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][107] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [14]),
        .Q(\buf_data_reg[1] [107]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][108] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [15]),
        .Q(\buf_data_reg[1] [108]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][109] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [16]),
        .Q(\buf_data_reg[1] [109]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][110] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [17]),
        .Q(\buf_data_reg[1] [110]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][111] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [18]),
        .Q(\buf_data_reg[1] [111]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][112] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [19]),
        .Q(\buf_data_reg[1] [112]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][113] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [20]),
        .Q(\buf_data_reg[1] [113]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][114] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [21]),
        .Q(\buf_data_reg[1] [114]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][115] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [22]),
        .Q(\buf_data_reg[1] [115]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][116] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [23]),
        .Q(\buf_data_reg[1] [116]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][117] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [24]),
        .Q(\buf_data_reg[1] [117]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][118] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [25]),
        .Q(\buf_data_reg[1] [118]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][119] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [26]),
        .Q(\buf_data_reg[1] [119]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][120] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [27]),
        .Q(\buf_data_reg[1] [120]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][121] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [28]),
        .Q(\buf_data_reg[1] [121]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][122] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [29]),
        .Q(\buf_data_reg[1] [122]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][123] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [30]),
        .Q(\buf_data_reg[1] [123]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][124] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [31]),
        .Q(\buf_data_reg[1] [124]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][125] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [32]),
        .Q(\buf_data_reg[1] [125]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][126] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [33]),
        .Q(\buf_data_reg[1] [126]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][127] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [34]),
        .Q(\buf_data_reg[1] [127]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][128] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [35]),
        .Q(\buf_data_reg[1] [128]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][129] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [36]),
        .Q(\buf_data_reg[1] [129]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][130] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [37]),
        .Q(\buf_data_reg[1] [130]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][131] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [38]),
        .Q(\buf_data_reg[1] [131]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][132] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [39]),
        .Q(\buf_data_reg[1] [132]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][133] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [40]),
        .Q(\buf_data_reg[1] [133]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][134] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [41]),
        .Q(\buf_data_reg[1] [134]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][135] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [42]),
        .Q(\buf_data_reg[1] [135]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][136] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [43]),
        .Q(\buf_data_reg[1] [136]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][1] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [1]),
        .Q(\buf_data_reg[1] [1]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][2] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [2]),
        .Q(\buf_data_reg[1] [2]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][3] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [3]),
        .Q(\buf_data_reg[1] [3]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][4] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [4]),
        .Q(\buf_data_reg[1] [4]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][68] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [5]),
        .Q(\buf_data_reg[1] [68]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][69] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [6]),
        .Q(\buf_data_reg[1] [69]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][70] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [7]),
        .Q(\buf_data_reg[1] [70]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][71] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [8]),
        .Q(\buf_data_reg[1] [71]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][72] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [9]),
        .Q(\buf_data_reg[1] [72]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][73] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [10]),
        .Q(\buf_data_reg[1] [73]),
        .R(\buf_valid[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hFDB8)) 
    \buf_valid[0]_i_1 
       (.I0(cur_dtype_pxls1),
        .I1(p_0_in),
        .I2(s_axis_tvalid),
        .I3(\buf_valid_reg_n_0_[0] ),
        .O(\buf_valid[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \buf_valid[1]_i_1 
       (.I0(s_axis_aresetn),
        .O(\buf_valid[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h5540)) 
    \buf_valid[1]_i_2 
       (.I0(cur_dtype_pxls1),
        .I1(\buf_valid_reg_n_0_[0] ),
        .I2(s_axis_tvalid),
        .I3(p_0_in),
        .O(\buf_valid[1]_i_2_n_0 ));
  FDRE \buf_valid_reg[0] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\buf_valid[0]_i_1_n_0 ),
        .Q(\buf_valid_reg_n_0_[0] ),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_valid_reg[1] 
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(\buf_valid[1]_i_2_n_0 ),
        .Q(p_0_in),
        .R(\buf_valid[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00BF0000)) 
    cur_dtype_sink_i_1
       (.I0(Q[8]),
        .I1(Q[9]),
        .I2(Q[10]),
        .I3(main_dtvc),
        .I4(\buf_valid_reg_n_0_[0] ),
        .I5(cur_dtype_sink_reg_n_0),
        .O(cur_dtype_sink_i_1_n_0));
  LUT6 #(
    .INIT(64'h0100000000000000)) 
    cur_dtype_sink_i_2
       (.I0(Q[9]),
        .I1(Q[5]),
        .I2(Q[7]),
        .I3(Q[10]),
        .I4(Q[6]),
        .I5(Q[8]),
        .O(main_dtvc));
  FDRE cur_dtype_sink_reg
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(cur_dtype_sink_i_1_n_0),
        .Q(cur_dtype_sink_reg_n_0),
        .R(cur_dtype_udef_i_1_n_0));
  LUT3 #(
    .INIT(8'h8F)) 
    cur_dtype_udef_i_1
       (.I0(cur_dtype_pxls1),
        .I1(Q[11]),
        .I2(s_axis_aresetn),
        .O(cur_dtype_udef_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    cur_dtype_udef_i_2
       (.I0(sban_dtvc),
        .I1(\buf_valid_reg_n_0_[0] ),
        .I2(cur_dtype_udef),
        .O(cur_dtype_udef_i_2_n_0));
  FDRE cur_dtype_udef_reg
       (.C(s_axis_aclk),
        .CE(1'b1),
        .D(cur_dtype_udef_i_2_n_0),
        .Q(cur_dtype_udef),
        .R(cur_dtype_udef_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT1 #(
    .INIT(2'h1)) 
    s_axis_tready_INST_0
       (.I0(p_0_in),
        .O(s_axis_tready));
  LUT4 #(
    .INIT(16'h8000)) 
    sband_tl_r_i_1
       (.I0(cur_dtype_udef),
        .I1(\buf_valid_reg_n_0_[0] ),
        .I2(sban_dtvc),
        .I3(sband_tl_r_reg),
        .O(sband_tact0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    sband_tl_r_i_2
       (.I0(Q[11]),
        .I1(cur_dtype_pxls1),
        .O(sband_tl));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h80)) 
    sdt_tv_INST_0
       (.I0(sban_dtvc),
        .I1(\buf_valid_reg_n_0_[0] ),
        .I2(cur_dtype_udef),
        .O(sdt_tv));
  LUT6 #(
    .INIT(64'h5050505000000080)) 
    sdt_tv_INST_0_i_1
       (.I0(Q[8]),
        .I1(Q[6]),
        .I2(Q[10]),
        .I3(Q[7]),
        .I4(Q[5]),
        .I5(Q[9]),
        .O(sban_dtvc));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[0]_i_1 
       (.I0(sband_tact0),
        .I1(tdata_s0[0]),
        .O(\buf_data_reg[0][104]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[10]_i_1 
       (.I0(sband_tact0),
        .I1(tdata_s0[10]),
        .O(\buf_data_reg[0][114]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[11]_i_1 
       (.I0(sband_tact0),
        .I1(tdata_s0[11]),
        .O(\buf_data_reg[0][115]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[12]_i_1 
       (.I0(sband_tact0),
        .I1(tdata_s0[12]),
        .O(\buf_data_reg[0][116]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[13]_i_1 
       (.I0(sband_tact0),
        .I1(tdata_s0[13]),
        .O(\buf_data_reg[0][117]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[14]_i_1 
       (.I0(sband_tact0),
        .I1(tdata_s0[14]),
        .O(\buf_data_reg[0][118]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[15]_i_1 
       (.I0(sband_tact0),
        .I1(tdata_s0[15]),
        .O(\buf_data_reg[0][119]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[16]_i_1 
       (.I0(sband_tact0),
        .I1(tdata_s0[16]),
        .O(\buf_data_reg[0][120]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[17]_i_1 
       (.I0(sband_tact0),
        .I1(tdata_s0[17]),
        .O(\buf_data_reg[0][121]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[18]_i_1 
       (.I0(sband_tact0),
        .I1(tdata_s0[18]),
        .O(\buf_data_reg[0][122]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[19]_i_1 
       (.I0(sband_tact0),
        .I1(tdata_s0[19]),
        .O(\buf_data_reg[0][123]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[1]_i_1 
       (.I0(sband_tact0),
        .I1(tdata_s0[1]),
        .O(\buf_data_reg[0][105]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[20]_i_1 
       (.I0(sband_tact0),
        .I1(tdata_s0[20]),
        .O(\buf_data_reg[0][124]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[21]_i_1 
       (.I0(sband_tact0),
        .I1(tdata_s0[21]),
        .O(\buf_data_reg[0][125]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[22]_i_1 
       (.I0(sband_tact0),
        .I1(tdata_s0[22]),
        .O(\buf_data_reg[0][126]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[23]_i_1 
       (.I0(sband_tact0),
        .I1(tdata_s0[23]),
        .O(\buf_data_reg[0][127]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[24]_i_1 
       (.I0(sband_tact0),
        .I1(tdata_s0[24]),
        .O(\buf_data_reg[0][128]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[25]_i_1 
       (.I0(sband_tact0),
        .I1(tdata_s0[25]),
        .O(\buf_data_reg[0][129]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[26]_i_1 
       (.I0(sband_tact0),
        .I1(tdata_s0[26]),
        .O(\buf_data_reg[0][130]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[27]_i_1 
       (.I0(sband_tact0),
        .I1(tdata_s0[27]),
        .O(\buf_data_reg[0][131]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[28]_i_1 
       (.I0(sband_tact0),
        .I1(tdata_s0[28]),
        .O(\buf_data_reg[0][132]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[29]_i_1 
       (.I0(sband_tact0),
        .I1(tdata_s0[29]),
        .O(\buf_data_reg[0][133]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[2]_i_1 
       (.I0(sband_tact0),
        .I1(tdata_s0[2]),
        .O(\buf_data_reg[0][106]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[30]_i_1 
       (.I0(sband_tact0),
        .I1(tdata_s0[30]),
        .O(\buf_data_reg[0][134]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[31]_i_2 
       (.I0(sband_tact0),
        .I1(tdata_s0[31]),
        .O(\buf_data_reg[0][135]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[3]_i_1 
       (.I0(sband_tact0),
        .I1(tdata_s0[3]),
        .O(\buf_data_reg[0][107]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[4]_i_1 
       (.I0(sband_tact0),
        .I1(tdata_s0[4]),
        .O(\buf_data_reg[0][108]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[5]_i_1 
       (.I0(sband_tact0),
        .I1(tdata_s0[5]),
        .O(\buf_data_reg[0][109]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[6]_i_1 
       (.I0(sband_tact0),
        .I1(tdata_s0[6]),
        .O(\buf_data_reg[0][110]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[7]_i_1 
       (.I0(sband_tact0),
        .I1(tdata_s0[7]),
        .O(\buf_data_reg[0][111]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[8]_i_1 
       (.I0(sband_tact0),
        .I1(tdata_s0[8]),
        .O(\buf_data_reg[0][112]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[9]_i_1 
       (.I0(sband_tact0),
        .I1(tdata_s0[9]),
        .O(\buf_data_reg[0][113]_0 ));
  LUT4 #(
    .INIT(16'hF800)) 
    vfb_eol_i_3
       (.I0(cur_dtype_udef),
        .I1(sband_tl_r_reg),
        .I2(cur_dtype_sink_reg_n_0),
        .I3(\buf_valid_reg_n_0_[0] ),
        .O(cur_dtype_pxls1));
  LUT6 #(
    .INIT(64'hA8FFFFFFA8000000)) 
    \vfb_sof[0]_i_3 
       (.I0(Q[4]),
        .I1(cur_dtype_sink_reg_n_0),
        .I2(cur_dtype_udef),
        .I3(sdt_tv),
        .I4(sband_tl_r_reg),
        .I5(sband_tu_r),
        .O(\buf_data_reg[0][4]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vfb_vcdt[0]_i_1 
       (.I0(Q[0]),
        .I1(sband_tact0),
        .I2(\vfb_vcdt_reg[9] [0]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vfb_vcdt[1]_i_1 
       (.I0(Q[1]),
        .I1(sband_tact0),
        .I2(\vfb_vcdt_reg[9] [1]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vfb_vcdt[2]_i_1 
       (.I0(Q[2]),
        .I1(sband_tact0),
        .I2(\vfb_vcdt_reg[9] [2]),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vfb_vcdt[3]_i_1 
       (.I0(Q[3]),
        .I1(sband_tact0),
        .I2(\vfb_vcdt_reg[9] [3]),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vfb_vcdt[4]_i_1 
       (.I0(Q[5]),
        .I1(sband_tact0),
        .I2(\vfb_vcdt_reg[9] [4]),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vfb_vcdt[5]_i_1 
       (.I0(Q[6]),
        .I1(sband_tact0),
        .I2(\vfb_vcdt_reg[9] [5]),
        .O(D[5]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vfb_vcdt[6]_i_1 
       (.I0(Q[7]),
        .I1(sband_tact0),
        .I2(\vfb_vcdt_reg[9] [6]),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vfb_vcdt[7]_i_1 
       (.I0(Q[8]),
        .I1(sband_tact0),
        .I2(\vfb_vcdt_reg[9] [7]),
        .O(D[7]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vfb_vcdt[8]_i_1 
       (.I0(Q[9]),
        .I1(sband_tact0),
        .I2(\vfb_vcdt_reg[9] [8]),
        .O(D[8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vfb_vcdt[9]_i_2 
       (.I0(Q[10]),
        .I1(sband_tact0),
        .I2(\vfb_vcdt_reg[9] [9]),
        .O(D[9]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
