// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sun Dec  3 13:20:03 2023
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
(* VFB_REQ_REORDER = "0" *) (* VFB_TU_WIDTH = "32" *) (* VFB_VC = "0" *) 
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
  output [31:0]vfb_sof;
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
  wire [31:0]vfb_sof;
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
  (* VFB_TU_WIDTH = "32" *) 
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
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,s_axis_tuser[69:64],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,s_axis_tuser[31:0]}),
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
(* VFB_TSB1_WIDTH = "0" *) (* VFB_TSB2_WIDTH = "3" *) (* VFB_TU_WIDTH = "32" *) 
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
  output [31:0]vfb_sof;
  output [9:0]vfb_vcdt;
  output [31:0]vfb_data;

  wire \<const0> ;
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
  wire \VFB_MIN.reorder_n_45 ;
  wire \VFB_MIN.reorder_n_47 ;
  wire \VFB_MIN.reorder_n_49 ;
  wire \VFB_MIN.reorder_n_50 ;
  wire \VFB_MIN.reorder_n_51 ;
  wire \VFB_MIN.reorder_n_52 ;
  wire \VFB_MIN.reorder_n_53 ;
  wire \VFB_MIN.reorder_n_54 ;
  wire \VFB_MIN.reorder_n_55 ;
  wire \VFB_MIN.reorder_n_56 ;
  wire \VFB_MIN.reorder_n_57 ;
  wire \VFB_MIN.reorder_n_58 ;
  wire \VFB_MIN.reorder_n_59 ;
  wire \VFB_MIN.reorder_n_60 ;
  wire \VFB_MIN.reorder_n_61 ;
  wire \VFB_MIN.reorder_n_62 ;
  wire \VFB_MIN.reorder_n_63 ;
  wire \VFB_MIN.reorder_n_64 ;
  wire \VFB_MIN.reorder_n_65 ;
  wire \VFB_MIN.reorder_n_66 ;
  wire \VFB_MIN.reorder_n_67 ;
  wire \VFB_MIN.reorder_n_68 ;
  wire \VFB_MIN.reorder_n_69 ;
  wire \VFB_MIN.reorder_n_70 ;
  wire \VFB_MIN.reorder_n_71 ;
  wire \VFB_MIN.reorder_n_72 ;
  wire \VFB_MIN.reorder_n_73 ;
  wire \VFB_MIN.reorder_n_74 ;
  wire \VFB_MIN.reorder_n_75 ;
  wire \VFB_MIN.reorder_n_76 ;
  wire \VFB_MIN.reorder_n_77 ;
  wire \VFB_MIN.reorder_n_78 ;
  wire \VFB_MIN.reorder_n_79 ;
  wire \VFB_MIN.reorder_n_80 ;
  wire \VFB_MIN.reorder_n_81 ;
  wire \VFB_MIN.reorder_n_82 ;
  wire \VFB_MIN.reorder_n_83 ;
  wire \VFB_MIN.reorder_n_84 ;
  wire \VFB_MIN.reorder_n_85 ;
  wire \VFB_MIN.reorder_n_86 ;
  wire \VFB_MIN.reorder_n_87 ;
  wire \VFB_MIN.reorder_n_88 ;
  wire \VFB_MIN.reorder_n_89 ;
  wire cur_dtype_pxls1;
  wire [15:0]frmnum;
  wire mdt_tr;
  wire n_0_184;
  wire n_0_185;
  wire p_0_in12_in;
  wire s_axis_aclk;
  wire s_axis_aresetn;
  wire [31:0]s_axis_tdata;
  wire [3:0]s_axis_tdest;
  wire s_axis_tlast;
  wire s_axis_tlast_0;
  wire s_axis_tready;
  wire [95:0]s_axis_tuser;
  wire s_axis_tvalid;
  wire sband_tl;
  wire [9:4]sband_ts;
  wire [3:0]sband_ts__0;
  wire [9:0]sband_ts_r;
  wire [0:0]sband_tu;
  wire [0:0]sband_tu_r;
  wire sdt_tr;
  wire sdt_tv;
  wire vfb_arstn;
  wire vfb_clk;
  wire [31:0]vfb_data;
  wire vfb_eol;
  wire vfb_ready;
  wire [31:0]vfb_sof;
  wire vfb_sof119_out;
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
       (.D({\VFB_MIN.reorder_n_80 ,\VFB_MIN.reorder_n_81 ,\VFB_MIN.reorder_n_82 ,\VFB_MIN.reorder_n_83 ,\VFB_MIN.reorder_n_84 ,\VFB_MIN.reorder_n_85 ,\VFB_MIN.reorder_n_86 ,\VFB_MIN.reorder_n_87 ,\VFB_MIN.reorder_n_88 ,\VFB_MIN.reorder_n_89 }),
        .Q({s_axis_tlast_0,sband_ts,frmnum,\VFB_MIN.reorder_n_25 ,\VFB_MIN.reorder_n_26 ,\VFB_MIN.reorder_n_27 ,\VFB_MIN.reorder_n_28 ,\VFB_MIN.reorder_n_29 ,\VFB_MIN.reorder_n_30 ,\VFB_MIN.reorder_n_31 ,\VFB_MIN.reorder_n_32 ,\VFB_MIN.reorder_n_33 ,\VFB_MIN.reorder_n_34 ,\VFB_MIN.reorder_n_35 ,\VFB_MIN.reorder_n_36 ,\VFB_MIN.reorder_n_37 ,\VFB_MIN.reorder_n_38 ,p_0_in12_in,sband_tu,sband_ts__0}),
        .\buf_data_reg[0][104]_0 (\VFB_MIN.reorder_n_79 ),
        .\buf_data_reg[0][105]_0 (\VFB_MIN.reorder_n_78 ),
        .\buf_data_reg[0][106]_0 (\VFB_MIN.reorder_n_77 ),
        .\buf_data_reg[0][107]_0 (\VFB_MIN.reorder_n_76 ),
        .\buf_data_reg[0][108]_0 (\VFB_MIN.reorder_n_75 ),
        .\buf_data_reg[0][109]_0 (\VFB_MIN.reorder_n_74 ),
        .\buf_data_reg[0][110]_0 (\VFB_MIN.reorder_n_73 ),
        .\buf_data_reg[0][111]_0 (\VFB_MIN.reorder_n_72 ),
        .\buf_data_reg[0][112]_0 (\VFB_MIN.reorder_n_71 ),
        .\buf_data_reg[0][113]_0 (\VFB_MIN.reorder_n_70 ),
        .\buf_data_reg[0][114]_0 (\VFB_MIN.reorder_n_69 ),
        .\buf_data_reg[0][115]_0 (\VFB_MIN.reorder_n_68 ),
        .\buf_data_reg[0][116]_0 (\VFB_MIN.reorder_n_67 ),
        .\buf_data_reg[0][117]_0 (\VFB_MIN.reorder_n_66 ),
        .\buf_data_reg[0][118]_0 (\VFB_MIN.reorder_n_65 ),
        .\buf_data_reg[0][119]_0 (\VFB_MIN.reorder_n_64 ),
        .\buf_data_reg[0][120]_0 (\VFB_MIN.reorder_n_63 ),
        .\buf_data_reg[0][121]_0 (\VFB_MIN.reorder_n_62 ),
        .\buf_data_reg[0][122]_0 (\VFB_MIN.reorder_n_61 ),
        .\buf_data_reg[0][123]_0 (\VFB_MIN.reorder_n_60 ),
        .\buf_data_reg[0][124]_0 (\VFB_MIN.reorder_n_59 ),
        .\buf_data_reg[0][125]_0 (\VFB_MIN.reorder_n_58 ),
        .\buf_data_reg[0][126]_0 (\VFB_MIN.reorder_n_57 ),
        .\buf_data_reg[0][127]_0 (\VFB_MIN.reorder_n_56 ),
        .\buf_data_reg[0][128]_0 (\VFB_MIN.reorder_n_55 ),
        .\buf_data_reg[0][129]_0 (\VFB_MIN.reorder_n_54 ),
        .\buf_data_reg[0][130]_0 (\VFB_MIN.reorder_n_53 ),
        .\buf_data_reg[0][131]_0 (\VFB_MIN.reorder_n_52 ),
        .\buf_data_reg[0][132]_0 (\VFB_MIN.reorder_n_51 ),
        .\buf_data_reg[0][133]_0 (\VFB_MIN.reorder_n_50 ),
        .\buf_data_reg[0][134]_0 (\VFB_MIN.reorder_n_49 ),
        .\buf_data_reg[0][135]_0 (\VFB_MIN.reorder_n_47 ),
        .\buf_data_reg[0][4]_0 (\VFB_MIN.reorder_n_45 ),
        .\buf_data_reg[1][136]_0 ({s_axis_tlast,s_axis_tdata,s_axis_tuser[69:64],s_axis_tuser[31:0],s_axis_tdest}),
        .cur_dtype_pxls1(cur_dtype_pxls1),
        .s_axis_aclk(s_axis_aclk),
        .s_axis_aresetn(s_axis_aresetn),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid),
        .sband_tl(sband_tl),
        .sband_tl_r_reg(sdt_tr),
        .sdt_tv(sdt_tv),
        .vfb_sof119_out(vfb_sof119_out),
        .\vfb_sof_reg[0] (sband_tu_r),
        .\vfb_vcdt_reg[9] (sband_ts_r));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT1 #(
    .INIT(2'h1)) 
    i_184
       (.I0(vfb_arstn),
        .O(n_0_184));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT1 #(
    .INIT(2'h1)) 
    i_185
       (.I0(vfb_arstn),
        .O(n_0_185));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_vfb_v1_0_23_op_inf op_inf
       (.D({\VFB_MIN.reorder_n_80 ,\VFB_MIN.reorder_n_81 ,\VFB_MIN.reorder_n_82 ,\VFB_MIN.reorder_n_83 ,\VFB_MIN.reorder_n_84 ,\VFB_MIN.reorder_n_85 ,\VFB_MIN.reorder_n_86 ,\VFB_MIN.reorder_n_87 ,\VFB_MIN.reorder_n_88 ,\VFB_MIN.reorder_n_89 }),
        .Q({s_axis_tlast_0,sband_ts,frmnum,\VFB_MIN.reorder_n_25 ,\VFB_MIN.reorder_n_26 ,\VFB_MIN.reorder_n_27 ,\VFB_MIN.reorder_n_28 ,\VFB_MIN.reorder_n_29 ,\VFB_MIN.reorder_n_30 ,\VFB_MIN.reorder_n_31 ,\VFB_MIN.reorder_n_32 ,\VFB_MIN.reorder_n_33 ,\VFB_MIN.reorder_n_34 ,\VFB_MIN.reorder_n_35 ,\VFB_MIN.reorder_n_36 ,\VFB_MIN.reorder_n_37 ,\VFB_MIN.reorder_n_38 ,p_0_in12_in,sband_tu,sband_ts__0}),
        .cur_dtype_pxls1(cur_dtype_pxls1),
        .sband_tl(sband_tl),
        .\sband_ts_r_reg[9]_0 (sband_ts_r),
        .\sband_tu_r_reg[0]_0 (sband_tu_r),
        .sdt_tr(sdt_tr),
        .vfb_arstn(vfb_arstn),
        .vfb_clk(vfb_clk),
        .vfb_data(vfb_data),
        .\vfb_data_reg[0]_0 (\VFB_MIN.reorder_n_79 ),
        .\vfb_data_reg[10]_0 (\VFB_MIN.reorder_n_69 ),
        .\vfb_data_reg[11]_0 (\VFB_MIN.reorder_n_68 ),
        .\vfb_data_reg[12]_0 (\VFB_MIN.reorder_n_67 ),
        .\vfb_data_reg[13]_0 (\VFB_MIN.reorder_n_66 ),
        .\vfb_data_reg[14]_0 (\VFB_MIN.reorder_n_65 ),
        .\vfb_data_reg[15]_0 (\VFB_MIN.reorder_n_64 ),
        .\vfb_data_reg[16]_0 (\VFB_MIN.reorder_n_63 ),
        .\vfb_data_reg[17]_0 (\VFB_MIN.reorder_n_62 ),
        .\vfb_data_reg[18]_0 (\VFB_MIN.reorder_n_61 ),
        .\vfb_data_reg[19]_0 (\VFB_MIN.reorder_n_60 ),
        .\vfb_data_reg[1]_0 (\VFB_MIN.reorder_n_78 ),
        .\vfb_data_reg[20]_0 (\VFB_MIN.reorder_n_59 ),
        .\vfb_data_reg[21]_0 (\VFB_MIN.reorder_n_58 ),
        .\vfb_data_reg[22]_0 (\VFB_MIN.reorder_n_57 ),
        .\vfb_data_reg[23]_0 (\VFB_MIN.reorder_n_56 ),
        .\vfb_data_reg[24]_0 (\VFB_MIN.reorder_n_55 ),
        .\vfb_data_reg[25]_0 (\VFB_MIN.reorder_n_54 ),
        .\vfb_data_reg[26]_0 (\VFB_MIN.reorder_n_53 ),
        .\vfb_data_reg[27]_0 (\VFB_MIN.reorder_n_52 ),
        .\vfb_data_reg[28]_0 (\VFB_MIN.reorder_n_51 ),
        .\vfb_data_reg[29]_0 (\VFB_MIN.reorder_n_50 ),
        .\vfb_data_reg[2]_0 (\VFB_MIN.reorder_n_77 ),
        .\vfb_data_reg[30]_0 (\VFB_MIN.reorder_n_49 ),
        .\vfb_data_reg[31]_0 (\VFB_MIN.reorder_n_47 ),
        .\vfb_data_reg[3]_0 (\VFB_MIN.reorder_n_76 ),
        .\vfb_data_reg[4]_0 (\VFB_MIN.reorder_n_75 ),
        .\vfb_data_reg[5]_0 (\VFB_MIN.reorder_n_74 ),
        .\vfb_data_reg[6]_0 (\VFB_MIN.reorder_n_73 ),
        .\vfb_data_reg[7]_0 (\VFB_MIN.reorder_n_72 ),
        .\vfb_data_reg[8]_0 (\VFB_MIN.reorder_n_71 ),
        .\vfb_data_reg[9]_0 (\VFB_MIN.reorder_n_70 ),
        .vfb_eol_reg_0(vfb_eol),
        .vfb_ready(vfb_ready),
        .vfb_ready_0(mdt_tr),
        .vfb_sof(vfb_sof[31:1]),
        .vfb_sof119_out(vfb_sof119_out),
        .\vfb_sof_reg[0]_0 (vfb_sof[0]),
        .\vfb_sof_reg[0]_1 (\VFB_MIN.reorder_n_45 ),
        .vfb_valid_reg_0(vfb_valid),
        .vfb_vcdt(vfb_vcdt));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_vfb_v1_0_23_op_inf
   (vfb_eol_reg_0,
    vfb_ready_0,
    vfb_valid_reg_0,
    \vfb_sof_reg[0]_0 ,
    sdt_tr,
    \sband_tu_r_reg[0]_0 ,
    vfb_sof,
    \sband_ts_r_reg[9]_0 ,
    vfb_vcdt,
    vfb_data,
    vfb_sof119_out,
    sband_tl,
    vfb_clk,
    \vfb_sof_reg[0]_1 ,
    vfb_ready,
    vfb_arstn,
    cur_dtype_pxls1,
    Q,
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
  output \vfb_sof_reg[0]_0 ;
  output sdt_tr;
  output [0:0]\sband_tu_r_reg[0]_0 ;
  output [30:0]vfb_sof;
  output [9:0]\sband_ts_r_reg[9]_0 ;
  output [9:0]vfb_vcdt;
  output [31:0]vfb_data;
  input vfb_sof119_out;
  input sband_tl;
  input vfb_clk;
  input \vfb_sof_reg[0]_1 ;
  input vfb_ready;
  input vfb_arstn;
  input cur_dtype_pxls1;
  input [42:0]Q;
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
  wire [42:0]Q;
  wire \TUSR0.vfb_sof[10]_i_1_n_0 ;
  wire \TUSR0.vfb_sof[11]_i_1_n_0 ;
  wire \TUSR0.vfb_sof[12]_i_1_n_0 ;
  wire \TUSR0.vfb_sof[13]_i_1_n_0 ;
  wire \TUSR0.vfb_sof[14]_i_1_n_0 ;
  wire \TUSR0.vfb_sof[15]_i_1_n_0 ;
  wire \TUSR0.vfb_sof[16]_i_1_n_0 ;
  wire \TUSR0.vfb_sof[17]_i_1_n_0 ;
  wire \TUSR0.vfb_sof[18]_i_1_n_0 ;
  wire \TUSR0.vfb_sof[19]_i_1_n_0 ;
  wire \TUSR0.vfb_sof[1]_i_1_n_0 ;
  wire \TUSR0.vfb_sof[20]_i_1_n_0 ;
  wire \TUSR0.vfb_sof[21]_i_1_n_0 ;
  wire \TUSR0.vfb_sof[22]_i_1_n_0 ;
  wire \TUSR0.vfb_sof[23]_i_1_n_0 ;
  wire \TUSR0.vfb_sof[24]_i_1_n_0 ;
  wire \TUSR0.vfb_sof[25]_i_1_n_0 ;
  wire \TUSR0.vfb_sof[26]_i_1_n_0 ;
  wire \TUSR0.vfb_sof[27]_i_1_n_0 ;
  wire \TUSR0.vfb_sof[28]_i_1_n_0 ;
  wire \TUSR0.vfb_sof[29]_i_1_n_0 ;
  wire \TUSR0.vfb_sof[2]_i_1_n_0 ;
  wire \TUSR0.vfb_sof[30]_i_1_n_0 ;
  wire \TUSR0.vfb_sof[31]_i_1_n_0 ;
  wire \TUSR0.vfb_sof[31]_i_2_n_0 ;
  wire \TUSR0.vfb_sof[3]_i_1_n_0 ;
  wire \TUSR0.vfb_sof[4]_i_1_n_0 ;
  wire \TUSR0.vfb_sof[5]_i_1_n_0 ;
  wire \TUSR0.vfb_sof[6]_i_1_n_0 ;
  wire \TUSR0.vfb_sof[7]_i_1_n_0 ;
  wire \TUSR0.vfb_sof[8]_i_1_n_0 ;
  wire \TUSR0.vfb_sof[9]_i_1_n_0 ;
  wire [3:2]cnt_done0;
  wire cur_dtype_pxls1;
  wire sband_tact;
  wire sband_tact_i_1_n_0;
  wire sband_tl;
  wire sband_tl_r;
  wire [9:0]\sband_ts_r_reg[9]_0 ;
  wire [0:0]\sband_tu_r_reg[0]_0 ;
  wire \sband_tu_r_reg_n_0_[10] ;
  wire \sband_tu_r_reg_n_0_[11] ;
  wire \sband_tu_r_reg_n_0_[12] ;
  wire \sband_tu_r_reg_n_0_[13] ;
  wire \sband_tu_r_reg_n_0_[14] ;
  wire \sband_tu_r_reg_n_0_[15] ;
  wire \sband_tu_r_reg_n_0_[16] ;
  wire \sband_tu_r_reg_n_0_[17] ;
  wire \sband_tu_r_reg_n_0_[18] ;
  wire \sband_tu_r_reg_n_0_[19] ;
  wire \sband_tu_r_reg_n_0_[1] ;
  wire \sband_tu_r_reg_n_0_[20] ;
  wire \sband_tu_r_reg_n_0_[21] ;
  wire \sband_tu_r_reg_n_0_[22] ;
  wire \sband_tu_r_reg_n_0_[23] ;
  wire \sband_tu_r_reg_n_0_[24] ;
  wire \sband_tu_r_reg_n_0_[25] ;
  wire \sband_tu_r_reg_n_0_[26] ;
  wire \sband_tu_r_reg_n_0_[27] ;
  wire \sband_tu_r_reg_n_0_[28] ;
  wire \sband_tu_r_reg_n_0_[29] ;
  wire \sband_tu_r_reg_n_0_[2] ;
  wire \sband_tu_r_reg_n_0_[30] ;
  wire \sband_tu_r_reg_n_0_[31] ;
  wire \sband_tu_r_reg_n_0_[3] ;
  wire \sband_tu_r_reg_n_0_[4] ;
  wire \sband_tu_r_reg_n_0_[5] ;
  wire \sband_tu_r_reg_n_0_[6] ;
  wire \sband_tu_r_reg_n_0_[7] ;
  wire \sband_tu_r_reg_n_0_[8] ;
  wire \sband_tu_r_reg_n_0_[9] ;
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
  wire [30:0]vfb_sof;
  wire vfb_sof015_out;
  wire vfb_sof119_out;
  wire vfb_sof122_out;
  wire vfb_sof225_out;
  wire vfb_sof4_out;
  wire vfb_sof7_in;
  wire \vfb_sof[0]_i_1_n_0 ;
  wire \vfb_sof[0]_i_4_n_0 ;
  wire \vfb_sof_reg[0]_0 ;
  wire \vfb_sof_reg[0]_1 ;
  wire vfb_tu0;
  wire vfb_tu0_i_1_n_0;
  wire vfb_valid_i_1_n_0;
  wire vfb_valid_i_2_n_0;
  wire vfb_valid_reg_0;
  wire [9:0]vfb_vcdt;
  wire \vfb_vcdt[9]_i_1_n_0 ;

  LUT6 #(
    .INIT(64'h00E2E2E2E2E2E2E2)) 
    \TUSR0.vfb_sof[10]_i_1 
       (.I0(\sband_tu_r_reg_n_0_[10] ),
        .I1(vfb_sof119_out),
        .I2(Q[14]),
        .I3(vfb_eol_reg_0),
        .I4(vfb_valid_reg_0),
        .I5(vfb_ready),
        .O(\TUSR0.vfb_sof[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E2E2E2E2E2E2E2)) 
    \TUSR0.vfb_sof[11]_i_1 
       (.I0(\sband_tu_r_reg_n_0_[11] ),
        .I1(vfb_sof119_out),
        .I2(Q[15]),
        .I3(vfb_eol_reg_0),
        .I4(vfb_valid_reg_0),
        .I5(vfb_ready),
        .O(\TUSR0.vfb_sof[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E2E2E2E2E2E2E2)) 
    \TUSR0.vfb_sof[12]_i_1 
       (.I0(\sband_tu_r_reg_n_0_[12] ),
        .I1(vfb_sof119_out),
        .I2(Q[16]),
        .I3(vfb_eol_reg_0),
        .I4(vfb_valid_reg_0),
        .I5(vfb_ready),
        .O(\TUSR0.vfb_sof[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E2E2E2E2E2E2E2)) 
    \TUSR0.vfb_sof[13]_i_1 
       (.I0(\sband_tu_r_reg_n_0_[13] ),
        .I1(vfb_sof119_out),
        .I2(Q[17]),
        .I3(vfb_eol_reg_0),
        .I4(vfb_valid_reg_0),
        .I5(vfb_ready),
        .O(\TUSR0.vfb_sof[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E2E2E2E2E2E2E2)) 
    \TUSR0.vfb_sof[14]_i_1 
       (.I0(\sband_tu_r_reg_n_0_[14] ),
        .I1(vfb_sof119_out),
        .I2(Q[18]),
        .I3(vfb_eol_reg_0),
        .I4(vfb_valid_reg_0),
        .I5(vfb_ready),
        .O(\TUSR0.vfb_sof[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E2E2E2E2E2E2E2)) 
    \TUSR0.vfb_sof[15]_i_1 
       (.I0(\sband_tu_r_reg_n_0_[15] ),
        .I1(vfb_sof119_out),
        .I2(Q[19]),
        .I3(vfb_eol_reg_0),
        .I4(vfb_valid_reg_0),
        .I5(vfb_ready),
        .O(\TUSR0.vfb_sof[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E2E2E2E2E2E2E2)) 
    \TUSR0.vfb_sof[16]_i_1 
       (.I0(\sband_tu_r_reg_n_0_[16] ),
        .I1(vfb_sof119_out),
        .I2(Q[20]),
        .I3(vfb_eol_reg_0),
        .I4(vfb_valid_reg_0),
        .I5(vfb_ready),
        .O(\TUSR0.vfb_sof[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E2E2E2E2E2E2E2)) 
    \TUSR0.vfb_sof[17]_i_1 
       (.I0(\sband_tu_r_reg_n_0_[17] ),
        .I1(vfb_sof119_out),
        .I2(Q[21]),
        .I3(vfb_eol_reg_0),
        .I4(vfb_valid_reg_0),
        .I5(vfb_ready),
        .O(\TUSR0.vfb_sof[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E2E2E2E2E2E2E2)) 
    \TUSR0.vfb_sof[18]_i_1 
       (.I0(\sband_tu_r_reg_n_0_[18] ),
        .I1(vfb_sof119_out),
        .I2(Q[22]),
        .I3(vfb_eol_reg_0),
        .I4(vfb_valid_reg_0),
        .I5(vfb_ready),
        .O(\TUSR0.vfb_sof[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E2E2E2E2E2E2E2)) 
    \TUSR0.vfb_sof[19]_i_1 
       (.I0(\sband_tu_r_reg_n_0_[19] ),
        .I1(vfb_sof119_out),
        .I2(Q[23]),
        .I3(vfb_eol_reg_0),
        .I4(vfb_valid_reg_0),
        .I5(vfb_ready),
        .O(\TUSR0.vfb_sof[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E2E2E2E2E2E2E2)) 
    \TUSR0.vfb_sof[1]_i_1 
       (.I0(\sband_tu_r_reg_n_0_[1] ),
        .I1(vfb_sof119_out),
        .I2(Q[5]),
        .I3(vfb_eol_reg_0),
        .I4(vfb_valid_reg_0),
        .I5(vfb_ready),
        .O(\TUSR0.vfb_sof[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E2E2E2E2E2E2E2)) 
    \TUSR0.vfb_sof[20]_i_1 
       (.I0(\sband_tu_r_reg_n_0_[20] ),
        .I1(vfb_sof119_out),
        .I2(Q[24]),
        .I3(vfb_eol_reg_0),
        .I4(vfb_valid_reg_0),
        .I5(vfb_ready),
        .O(\TUSR0.vfb_sof[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E2E2E2E2E2E2E2)) 
    \TUSR0.vfb_sof[21]_i_1 
       (.I0(\sband_tu_r_reg_n_0_[21] ),
        .I1(vfb_sof119_out),
        .I2(Q[25]),
        .I3(vfb_eol_reg_0),
        .I4(vfb_valid_reg_0),
        .I5(vfb_ready),
        .O(\TUSR0.vfb_sof[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E2E2E2E2E2E2E2)) 
    \TUSR0.vfb_sof[22]_i_1 
       (.I0(\sband_tu_r_reg_n_0_[22] ),
        .I1(vfb_sof119_out),
        .I2(Q[26]),
        .I3(vfb_eol_reg_0),
        .I4(vfb_valid_reg_0),
        .I5(vfb_ready),
        .O(\TUSR0.vfb_sof[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E2E2E2E2E2E2E2)) 
    \TUSR0.vfb_sof[23]_i_1 
       (.I0(\sband_tu_r_reg_n_0_[23] ),
        .I1(vfb_sof119_out),
        .I2(Q[27]),
        .I3(vfb_eol_reg_0),
        .I4(vfb_valid_reg_0),
        .I5(vfb_ready),
        .O(\TUSR0.vfb_sof[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E2E2E2E2E2E2E2)) 
    \TUSR0.vfb_sof[24]_i_1 
       (.I0(\sband_tu_r_reg_n_0_[24] ),
        .I1(vfb_sof119_out),
        .I2(Q[28]),
        .I3(vfb_eol_reg_0),
        .I4(vfb_valid_reg_0),
        .I5(vfb_ready),
        .O(\TUSR0.vfb_sof[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E2E2E2E2E2E2E2)) 
    \TUSR0.vfb_sof[25]_i_1 
       (.I0(\sband_tu_r_reg_n_0_[25] ),
        .I1(vfb_sof119_out),
        .I2(Q[29]),
        .I3(vfb_eol_reg_0),
        .I4(vfb_valid_reg_0),
        .I5(vfb_ready),
        .O(\TUSR0.vfb_sof[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E2E2E2E2E2E2E2)) 
    \TUSR0.vfb_sof[26]_i_1 
       (.I0(\sband_tu_r_reg_n_0_[26] ),
        .I1(vfb_sof119_out),
        .I2(Q[30]),
        .I3(vfb_eol_reg_0),
        .I4(vfb_valid_reg_0),
        .I5(vfb_ready),
        .O(\TUSR0.vfb_sof[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E2E2E2E2E2E2E2)) 
    \TUSR0.vfb_sof[27]_i_1 
       (.I0(\sband_tu_r_reg_n_0_[27] ),
        .I1(vfb_sof119_out),
        .I2(Q[31]),
        .I3(vfb_eol_reg_0),
        .I4(vfb_valid_reg_0),
        .I5(vfb_ready),
        .O(\TUSR0.vfb_sof[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E2E2E2E2E2E2E2)) 
    \TUSR0.vfb_sof[28]_i_1 
       (.I0(\sband_tu_r_reg_n_0_[28] ),
        .I1(vfb_sof119_out),
        .I2(Q[32]),
        .I3(vfb_eol_reg_0),
        .I4(vfb_valid_reg_0),
        .I5(vfb_ready),
        .O(\TUSR0.vfb_sof[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E2E2E2E2E2E2E2)) 
    \TUSR0.vfb_sof[29]_i_1 
       (.I0(\sband_tu_r_reg_n_0_[29] ),
        .I1(vfb_sof119_out),
        .I2(Q[33]),
        .I3(vfb_eol_reg_0),
        .I4(vfb_valid_reg_0),
        .I5(vfb_ready),
        .O(\TUSR0.vfb_sof[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E2E2E2E2E2E2E2)) 
    \TUSR0.vfb_sof[2]_i_1 
       (.I0(\sband_tu_r_reg_n_0_[2] ),
        .I1(vfb_sof119_out),
        .I2(Q[6]),
        .I3(vfb_eol_reg_0),
        .I4(vfb_valid_reg_0),
        .I5(vfb_ready),
        .O(\TUSR0.vfb_sof[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E2E2E2E2E2E2E2)) 
    \TUSR0.vfb_sof[30]_i_1 
       (.I0(\sband_tu_r_reg_n_0_[30] ),
        .I1(vfb_sof119_out),
        .I2(Q[34]),
        .I3(vfb_eol_reg_0),
        .I4(vfb_valid_reg_0),
        .I5(vfb_ready),
        .O(\TUSR0.vfb_sof[30]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF380)) 
    \TUSR0.vfb_sof[31]_i_1 
       (.I0(vfb_eol_reg_0),
        .I1(vfb_valid_reg_0),
        .I2(vfb_ready),
        .I3(vfb_sof7_in),
        .O(\TUSR0.vfb_sof[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E2E2E2E2E2E2E2)) 
    \TUSR0.vfb_sof[31]_i_2 
       (.I0(\sband_tu_r_reg_n_0_[31] ),
        .I1(vfb_sof119_out),
        .I2(Q[35]),
        .I3(vfb_eol_reg_0),
        .I4(vfb_valid_reg_0),
        .I5(vfb_ready),
        .O(\TUSR0.vfb_sof[31]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'hFEAA)) 
    \TUSR0.vfb_sof[31]_i_3 
       (.I0(vfb_sof119_out),
        .I1(vfb_cnt_reg[3]),
        .I2(vfb_cnt_reg[2]),
        .I3(sband_tact),
        .O(vfb_sof7_in));
  LUT6 #(
    .INIT(64'h00E2E2E2E2E2E2E2)) 
    \TUSR0.vfb_sof[3]_i_1 
       (.I0(\sband_tu_r_reg_n_0_[3] ),
        .I1(vfb_sof119_out),
        .I2(Q[7]),
        .I3(vfb_eol_reg_0),
        .I4(vfb_valid_reg_0),
        .I5(vfb_ready),
        .O(\TUSR0.vfb_sof[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E2E2E2E2E2E2E2)) 
    \TUSR0.vfb_sof[4]_i_1 
       (.I0(\sband_tu_r_reg_n_0_[4] ),
        .I1(vfb_sof119_out),
        .I2(Q[8]),
        .I3(vfb_eol_reg_0),
        .I4(vfb_valid_reg_0),
        .I5(vfb_ready),
        .O(\TUSR0.vfb_sof[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E2E2E2E2E2E2E2)) 
    \TUSR0.vfb_sof[5]_i_1 
       (.I0(\sband_tu_r_reg_n_0_[5] ),
        .I1(vfb_sof119_out),
        .I2(Q[9]),
        .I3(vfb_eol_reg_0),
        .I4(vfb_valid_reg_0),
        .I5(vfb_ready),
        .O(\TUSR0.vfb_sof[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E2E2E2E2E2E2E2)) 
    \TUSR0.vfb_sof[6]_i_1 
       (.I0(\sband_tu_r_reg_n_0_[6] ),
        .I1(vfb_sof119_out),
        .I2(Q[10]),
        .I3(vfb_eol_reg_0),
        .I4(vfb_valid_reg_0),
        .I5(vfb_ready),
        .O(\TUSR0.vfb_sof[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E2E2E2E2E2E2E2)) 
    \TUSR0.vfb_sof[7]_i_1 
       (.I0(\sband_tu_r_reg_n_0_[7] ),
        .I1(vfb_sof119_out),
        .I2(Q[11]),
        .I3(vfb_eol_reg_0),
        .I4(vfb_valid_reg_0),
        .I5(vfb_ready),
        .O(\TUSR0.vfb_sof[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E2E2E2E2E2E2E2)) 
    \TUSR0.vfb_sof[8]_i_1 
       (.I0(\sband_tu_r_reg_n_0_[8] ),
        .I1(vfb_sof119_out),
        .I2(Q[12]),
        .I3(vfb_eol_reg_0),
        .I4(vfb_valid_reg_0),
        .I5(vfb_ready),
        .O(\TUSR0.vfb_sof[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E2E2E2E2E2E2E2)) 
    \TUSR0.vfb_sof[9]_i_1 
       (.I0(\sband_tu_r_reg_n_0_[9] ),
        .I1(vfb_sof119_out),
        .I2(Q[13]),
        .I3(vfb_eol_reg_0),
        .I4(vfb_valid_reg_0),
        .I5(vfb_ready),
        .O(\TUSR0.vfb_sof[9]_i_1_n_0 ));
  FDRE \TUSR0.vfb_sof_reg[10] 
       (.C(vfb_clk),
        .CE(\TUSR0.vfb_sof[31]_i_1_n_0 ),
        .D(\TUSR0.vfb_sof[10]_i_1_n_0 ),
        .Q(vfb_sof[9]),
        .R(vfb_valid_i_1_n_0));
  FDRE \TUSR0.vfb_sof_reg[11] 
       (.C(vfb_clk),
        .CE(\TUSR0.vfb_sof[31]_i_1_n_0 ),
        .D(\TUSR0.vfb_sof[11]_i_1_n_0 ),
        .Q(vfb_sof[10]),
        .R(vfb_valid_i_1_n_0));
  FDRE \TUSR0.vfb_sof_reg[12] 
       (.C(vfb_clk),
        .CE(\TUSR0.vfb_sof[31]_i_1_n_0 ),
        .D(\TUSR0.vfb_sof[12]_i_1_n_0 ),
        .Q(vfb_sof[11]),
        .R(vfb_valid_i_1_n_0));
  FDRE \TUSR0.vfb_sof_reg[13] 
       (.C(vfb_clk),
        .CE(\TUSR0.vfb_sof[31]_i_1_n_0 ),
        .D(\TUSR0.vfb_sof[13]_i_1_n_0 ),
        .Q(vfb_sof[12]),
        .R(vfb_valid_i_1_n_0));
  FDRE \TUSR0.vfb_sof_reg[14] 
       (.C(vfb_clk),
        .CE(\TUSR0.vfb_sof[31]_i_1_n_0 ),
        .D(\TUSR0.vfb_sof[14]_i_1_n_0 ),
        .Q(vfb_sof[13]),
        .R(vfb_valid_i_1_n_0));
  FDRE \TUSR0.vfb_sof_reg[15] 
       (.C(vfb_clk),
        .CE(\TUSR0.vfb_sof[31]_i_1_n_0 ),
        .D(\TUSR0.vfb_sof[15]_i_1_n_0 ),
        .Q(vfb_sof[14]),
        .R(vfb_valid_i_1_n_0));
  FDRE \TUSR0.vfb_sof_reg[16] 
       (.C(vfb_clk),
        .CE(\TUSR0.vfb_sof[31]_i_1_n_0 ),
        .D(\TUSR0.vfb_sof[16]_i_1_n_0 ),
        .Q(vfb_sof[15]),
        .R(vfb_valid_i_1_n_0));
  FDRE \TUSR0.vfb_sof_reg[17] 
       (.C(vfb_clk),
        .CE(\TUSR0.vfb_sof[31]_i_1_n_0 ),
        .D(\TUSR0.vfb_sof[17]_i_1_n_0 ),
        .Q(vfb_sof[16]),
        .R(vfb_valid_i_1_n_0));
  FDRE \TUSR0.vfb_sof_reg[18] 
       (.C(vfb_clk),
        .CE(\TUSR0.vfb_sof[31]_i_1_n_0 ),
        .D(\TUSR0.vfb_sof[18]_i_1_n_0 ),
        .Q(vfb_sof[17]),
        .R(vfb_valid_i_1_n_0));
  FDRE \TUSR0.vfb_sof_reg[19] 
       (.C(vfb_clk),
        .CE(\TUSR0.vfb_sof[31]_i_1_n_0 ),
        .D(\TUSR0.vfb_sof[19]_i_1_n_0 ),
        .Q(vfb_sof[18]),
        .R(vfb_valid_i_1_n_0));
  FDRE \TUSR0.vfb_sof_reg[1] 
       (.C(vfb_clk),
        .CE(\TUSR0.vfb_sof[31]_i_1_n_0 ),
        .D(\TUSR0.vfb_sof[1]_i_1_n_0 ),
        .Q(vfb_sof[0]),
        .R(vfb_valid_i_1_n_0));
  FDRE \TUSR0.vfb_sof_reg[20] 
       (.C(vfb_clk),
        .CE(\TUSR0.vfb_sof[31]_i_1_n_0 ),
        .D(\TUSR0.vfb_sof[20]_i_1_n_0 ),
        .Q(vfb_sof[19]),
        .R(vfb_valid_i_1_n_0));
  FDRE \TUSR0.vfb_sof_reg[21] 
       (.C(vfb_clk),
        .CE(\TUSR0.vfb_sof[31]_i_1_n_0 ),
        .D(\TUSR0.vfb_sof[21]_i_1_n_0 ),
        .Q(vfb_sof[20]),
        .R(vfb_valid_i_1_n_0));
  FDRE \TUSR0.vfb_sof_reg[22] 
       (.C(vfb_clk),
        .CE(\TUSR0.vfb_sof[31]_i_1_n_0 ),
        .D(\TUSR0.vfb_sof[22]_i_1_n_0 ),
        .Q(vfb_sof[21]),
        .R(vfb_valid_i_1_n_0));
  FDRE \TUSR0.vfb_sof_reg[23] 
       (.C(vfb_clk),
        .CE(\TUSR0.vfb_sof[31]_i_1_n_0 ),
        .D(\TUSR0.vfb_sof[23]_i_1_n_0 ),
        .Q(vfb_sof[22]),
        .R(vfb_valid_i_1_n_0));
  FDRE \TUSR0.vfb_sof_reg[24] 
       (.C(vfb_clk),
        .CE(\TUSR0.vfb_sof[31]_i_1_n_0 ),
        .D(\TUSR0.vfb_sof[24]_i_1_n_0 ),
        .Q(vfb_sof[23]),
        .R(vfb_valid_i_1_n_0));
  FDRE \TUSR0.vfb_sof_reg[25] 
       (.C(vfb_clk),
        .CE(\TUSR0.vfb_sof[31]_i_1_n_0 ),
        .D(\TUSR0.vfb_sof[25]_i_1_n_0 ),
        .Q(vfb_sof[24]),
        .R(vfb_valid_i_1_n_0));
  FDRE \TUSR0.vfb_sof_reg[26] 
       (.C(vfb_clk),
        .CE(\TUSR0.vfb_sof[31]_i_1_n_0 ),
        .D(\TUSR0.vfb_sof[26]_i_1_n_0 ),
        .Q(vfb_sof[25]),
        .R(vfb_valid_i_1_n_0));
  FDRE \TUSR0.vfb_sof_reg[27] 
       (.C(vfb_clk),
        .CE(\TUSR0.vfb_sof[31]_i_1_n_0 ),
        .D(\TUSR0.vfb_sof[27]_i_1_n_0 ),
        .Q(vfb_sof[26]),
        .R(vfb_valid_i_1_n_0));
  FDRE \TUSR0.vfb_sof_reg[28] 
       (.C(vfb_clk),
        .CE(\TUSR0.vfb_sof[31]_i_1_n_0 ),
        .D(\TUSR0.vfb_sof[28]_i_1_n_0 ),
        .Q(vfb_sof[27]),
        .R(vfb_valid_i_1_n_0));
  FDRE \TUSR0.vfb_sof_reg[29] 
       (.C(vfb_clk),
        .CE(\TUSR0.vfb_sof[31]_i_1_n_0 ),
        .D(\TUSR0.vfb_sof[29]_i_1_n_0 ),
        .Q(vfb_sof[28]),
        .R(vfb_valid_i_1_n_0));
  FDRE \TUSR0.vfb_sof_reg[2] 
       (.C(vfb_clk),
        .CE(\TUSR0.vfb_sof[31]_i_1_n_0 ),
        .D(\TUSR0.vfb_sof[2]_i_1_n_0 ),
        .Q(vfb_sof[1]),
        .R(vfb_valid_i_1_n_0));
  FDRE \TUSR0.vfb_sof_reg[30] 
       (.C(vfb_clk),
        .CE(\TUSR0.vfb_sof[31]_i_1_n_0 ),
        .D(\TUSR0.vfb_sof[30]_i_1_n_0 ),
        .Q(vfb_sof[29]),
        .R(vfb_valid_i_1_n_0));
  FDRE \TUSR0.vfb_sof_reg[31] 
       (.C(vfb_clk),
        .CE(\TUSR0.vfb_sof[31]_i_1_n_0 ),
        .D(\TUSR0.vfb_sof[31]_i_2_n_0 ),
        .Q(vfb_sof[30]),
        .R(vfb_valid_i_1_n_0));
  FDRE \TUSR0.vfb_sof_reg[3] 
       (.C(vfb_clk),
        .CE(\TUSR0.vfb_sof[31]_i_1_n_0 ),
        .D(\TUSR0.vfb_sof[3]_i_1_n_0 ),
        .Q(vfb_sof[2]),
        .R(vfb_valid_i_1_n_0));
  FDRE \TUSR0.vfb_sof_reg[4] 
       (.C(vfb_clk),
        .CE(\TUSR0.vfb_sof[31]_i_1_n_0 ),
        .D(\TUSR0.vfb_sof[4]_i_1_n_0 ),
        .Q(vfb_sof[3]),
        .R(vfb_valid_i_1_n_0));
  FDRE \TUSR0.vfb_sof_reg[5] 
       (.C(vfb_clk),
        .CE(\TUSR0.vfb_sof[31]_i_1_n_0 ),
        .D(\TUSR0.vfb_sof[5]_i_1_n_0 ),
        .Q(vfb_sof[4]),
        .R(vfb_valid_i_1_n_0));
  FDRE \TUSR0.vfb_sof_reg[6] 
       (.C(vfb_clk),
        .CE(\TUSR0.vfb_sof[31]_i_1_n_0 ),
        .D(\TUSR0.vfb_sof[6]_i_1_n_0 ),
        .Q(vfb_sof[5]),
        .R(vfb_valid_i_1_n_0));
  FDRE \TUSR0.vfb_sof_reg[7] 
       (.C(vfb_clk),
        .CE(\TUSR0.vfb_sof[31]_i_1_n_0 ),
        .D(\TUSR0.vfb_sof[7]_i_1_n_0 ),
        .Q(vfb_sof[6]),
        .R(vfb_valid_i_1_n_0));
  FDRE \TUSR0.vfb_sof_reg[8] 
       (.C(vfb_clk),
        .CE(\TUSR0.vfb_sof[31]_i_1_n_0 ),
        .D(\TUSR0.vfb_sof[8]_i_1_n_0 ),
        .Q(vfb_sof[7]),
        .R(vfb_valid_i_1_n_0));
  FDRE \TUSR0.vfb_sof_reg[9] 
       (.C(vfb_clk),
        .CE(\TUSR0.vfb_sof[31]_i_1_n_0 ),
        .D(\TUSR0.vfb_sof[9]_i_1_n_0 ),
        .Q(vfb_sof[8]),
        .R(vfb_valid_i_1_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    mdt_tr_INST_0
       (.I0(vfb_ready),
        .I1(vfb_valid_reg_0),
        .O(vfb_ready_0));
  LUT6 #(
    .INIT(64'hBBBBFFFBAAAAAAAA)) 
    sband_tact_i_1
       (.I0(vfb_sof119_out),
        .I1(vfb_sof225_out),
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
        .CE(vfb_sof119_out),
        .D(sband_tl),
        .Q(sband_tl_r),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_ts_r_reg[0] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[0]),
        .Q(\sband_ts_r_reg[9]_0 [0]),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_ts_r_reg[1] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[1]),
        .Q(\sband_ts_r_reg[9]_0 [1]),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_ts_r_reg[2] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[2]),
        .Q(\sband_ts_r_reg[9]_0 [2]),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_ts_r_reg[3] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[3]),
        .Q(\sband_ts_r_reg[9]_0 [3]),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_ts_r_reg[4] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[36]),
        .Q(\sband_ts_r_reg[9]_0 [4]),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_ts_r_reg[5] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[37]),
        .Q(\sband_ts_r_reg[9]_0 [5]),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_ts_r_reg[6] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[38]),
        .Q(\sband_ts_r_reg[9]_0 [6]),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_ts_r_reg[7] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[39]),
        .Q(\sband_ts_r_reg[9]_0 [7]),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_ts_r_reg[8] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[40]),
        .Q(\sband_ts_r_reg[9]_0 [8]),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_ts_r_reg[9] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[41]),
        .Q(\sband_ts_r_reg[9]_0 [9]),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_tu_r_reg[0] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[4]),
        .Q(\sband_tu_r_reg[0]_0 ),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_tu_r_reg[10] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[14]),
        .Q(\sband_tu_r_reg_n_0_[10] ),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_tu_r_reg[11] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[15]),
        .Q(\sband_tu_r_reg_n_0_[11] ),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_tu_r_reg[12] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[16]),
        .Q(\sband_tu_r_reg_n_0_[12] ),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_tu_r_reg[13] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[17]),
        .Q(\sband_tu_r_reg_n_0_[13] ),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_tu_r_reg[14] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[18]),
        .Q(\sband_tu_r_reg_n_0_[14] ),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_tu_r_reg[15] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[19]),
        .Q(\sband_tu_r_reg_n_0_[15] ),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_tu_r_reg[16] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[20]),
        .Q(\sband_tu_r_reg_n_0_[16] ),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_tu_r_reg[17] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[21]),
        .Q(\sband_tu_r_reg_n_0_[17] ),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_tu_r_reg[18] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[22]),
        .Q(\sband_tu_r_reg_n_0_[18] ),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_tu_r_reg[19] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[23]),
        .Q(\sband_tu_r_reg_n_0_[19] ),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_tu_r_reg[1] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[5]),
        .Q(\sband_tu_r_reg_n_0_[1] ),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_tu_r_reg[20] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[24]),
        .Q(\sband_tu_r_reg_n_0_[20] ),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_tu_r_reg[21] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[25]),
        .Q(\sband_tu_r_reg_n_0_[21] ),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_tu_r_reg[22] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[26]),
        .Q(\sband_tu_r_reg_n_0_[22] ),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_tu_r_reg[23] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[27]),
        .Q(\sband_tu_r_reg_n_0_[23] ),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_tu_r_reg[24] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[28]),
        .Q(\sband_tu_r_reg_n_0_[24] ),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_tu_r_reg[25] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[29]),
        .Q(\sband_tu_r_reg_n_0_[25] ),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_tu_r_reg[26] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[30]),
        .Q(\sband_tu_r_reg_n_0_[26] ),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_tu_r_reg[27] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[31]),
        .Q(\sband_tu_r_reg_n_0_[27] ),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_tu_r_reg[28] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[32]),
        .Q(\sband_tu_r_reg_n_0_[28] ),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_tu_r_reg[29] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[33]),
        .Q(\sband_tu_r_reg_n_0_[29] ),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_tu_r_reg[2] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[6]),
        .Q(\sband_tu_r_reg_n_0_[2] ),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_tu_r_reg[30] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[34]),
        .Q(\sband_tu_r_reg_n_0_[30] ),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_tu_r_reg[31] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[35]),
        .Q(\sband_tu_r_reg_n_0_[31] ),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_tu_r_reg[3] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[7]),
        .Q(\sband_tu_r_reg_n_0_[3] ),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_tu_r_reg[4] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[8]),
        .Q(\sband_tu_r_reg_n_0_[4] ),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_tu_r_reg[5] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[9]),
        .Q(\sband_tu_r_reg_n_0_[5] ),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_tu_r_reg[6] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[10]),
        .Q(\sband_tu_r_reg_n_0_[6] ),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_tu_r_reg[7] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[11]),
        .Q(\sband_tu_r_reg_n_0_[7] ),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_tu_r_reg[8] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[12]),
        .Q(\sband_tu_r_reg_n_0_[8] ),
        .R(vfb_valid_i_1_n_0));
  FDRE \sband_tu_r_reg[9] 
       (.C(vfb_clk),
        .CE(vfb_sof119_out),
        .D(Q[13]),
        .Q(\sband_tu_r_reg_n_0_[9] ),
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
        .O(vfb_sof225_out));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \vfb_cnt[3]_i_3 
       (.I0(vfb_cnt_reg[2]),
        .I1(vfb_cnt_reg[3]),
        .O(cnt_done0[3]));
  FDRE \vfb_cnt_reg[2] 
       (.C(vfb_clk),
        .CE(vfb_sof225_out),
        .D(cnt_done0[2]),
        .Q(vfb_cnt_reg[2]),
        .R(\vfb_cnt[3]_i_1_n_0 ));
  FDRE \vfb_cnt_reg[3] 
       (.C(vfb_clk),
        .CE(vfb_sof225_out),
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
        .I1(vfb_sof015_out),
        .I2(vfb_sof119_out),
        .I3(cur_dtype_pxls1),
        .I4(Q[42]),
        .I5(vfb_sof122_out),
        .O(vfb_eol_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    vfb_eol_i_2
       (.I0(sband_tact),
        .I1(vfb_cnt_reg[2]),
        .I2(vfb_cnt_reg[3]),
        .O(vfb_sof015_out));
  FDRE vfb_eol_reg
       (.C(vfb_clk),
        .CE(vfb_ready_0),
        .D(vfb_eol_i_1_n_0),
        .Q(vfb_eol_reg_0),
        .R(vfb_valid_i_1_n_0));
  LUT5 #(
    .INIT(32'h00002E22)) 
    \vfb_sof[0]_i_1 
       (.I0(\vfb_sof_reg[0]_0 ),
        .I1(vfb_sof4_out),
        .I2(vfb_sof122_out),
        .I3(\vfb_sof_reg[0]_1 ),
        .I4(\vfb_sof[0]_i_4_n_0 ),
        .O(\vfb_sof[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAA88888)) 
    \vfb_sof[0]_i_2 
       (.I0(vfb_ready_0),
        .I1(vfb_sof119_out),
        .I2(vfb_cnt_reg[3]),
        .I3(vfb_cnt_reg[2]),
        .I4(sband_tact),
        .I5(vfb_sof122_out),
        .O(vfb_sof4_out));
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
        .I3(vfb_sof119_out),
        .I4(vfb_sof122_out),
        .O(vfb_valid_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h80)) 
    vfb_valid_i_3
       (.I0(vfb_ready),
        .I1(vfb_valid_reg_0),
        .I2(vfb_eol_reg_0),
        .O(vfb_sof122_out));
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
        .I3(vfb_sof119_out),
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
    vfb_sof119_out,
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
    \vfb_sof_reg[0] ,
    \vfb_vcdt_reg[9] ,
    \buf_data_reg[1][136]_0 ,
    s_axis_aresetn,
    s_axis_aclk);
  output cur_dtype_pxls1;
  output sband_tl;
  output [42:0]Q;
  output \buf_data_reg[0][4]_0 ;
  output sdt_tv;
  output \buf_data_reg[0][135]_0 ;
  output vfb_sof119_out;
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
  input [0:0]\vfb_sof_reg[0] ;
  input [9:0]\vfb_vcdt_reg[9] ;
  input [74:0]\buf_data_reg[1][136]_0 ;
  input s_axis_aresetn;
  input s_axis_aclk;

  wire [9:0]D;
  wire [42:0]Q;
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
  wire [74:0]\buf_data_reg[1][136]_0 ;
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
  wire sband_tl;
  wire sband_tl_r_reg;
  wire sdt_tv;
  wire [31:0]tdata_s0;
  wire vfb_sof119_out;
  wire [0:0]\vfb_sof_reg[0] ;
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
        .I3(\buf_data_reg[1][136]_0 [42]),
        .O(p_2_in[104]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][105]_i_1 
       (.I0(\buf_data_reg[1] [105]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [43]),
        .O(p_2_in[105]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][106]_i_1 
       (.I0(\buf_data_reg[1] [106]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [44]),
        .O(p_2_in[106]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][107]_i_1 
       (.I0(\buf_data_reg[1] [107]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [45]),
        .O(p_2_in[107]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][108]_i_1 
       (.I0(\buf_data_reg[1] [108]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [46]),
        .O(p_2_in[108]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][109]_i_1 
       (.I0(\buf_data_reg[1] [109]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [47]),
        .O(p_2_in[109]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][10]_i_1 
       (.I0(\buf_data_reg[1] [10]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [10]),
        .O(p_2_in[10]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][110]_i_1 
       (.I0(\buf_data_reg[1] [110]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [48]),
        .O(p_2_in[110]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][111]_i_1 
       (.I0(\buf_data_reg[1] [111]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [49]),
        .O(p_2_in[111]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][112]_i_1 
       (.I0(\buf_data_reg[1] [112]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [50]),
        .O(p_2_in[112]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][113]_i_1 
       (.I0(\buf_data_reg[1] [113]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [51]),
        .O(p_2_in[113]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][114]_i_1 
       (.I0(\buf_data_reg[1] [114]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [52]),
        .O(p_2_in[114]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][115]_i_1 
       (.I0(\buf_data_reg[1] [115]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [53]),
        .O(p_2_in[115]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][116]_i_1 
       (.I0(\buf_data_reg[1] [116]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [54]),
        .O(p_2_in[116]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][117]_i_1 
       (.I0(\buf_data_reg[1] [117]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [55]),
        .O(p_2_in[117]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][118]_i_1 
       (.I0(\buf_data_reg[1] [118]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [56]),
        .O(p_2_in[118]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][119]_i_1 
       (.I0(\buf_data_reg[1] [119]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [57]),
        .O(p_2_in[119]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][11]_i_1 
       (.I0(\buf_data_reg[1] [11]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [11]),
        .O(p_2_in[11]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][120]_i_1 
       (.I0(\buf_data_reg[1] [120]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [58]),
        .O(p_2_in[120]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][121]_i_1 
       (.I0(\buf_data_reg[1] [121]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [59]),
        .O(p_2_in[121]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][122]_i_1 
       (.I0(\buf_data_reg[1] [122]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [60]),
        .O(p_2_in[122]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][123]_i_1 
       (.I0(\buf_data_reg[1] [123]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [61]),
        .O(p_2_in[123]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][124]_i_1 
       (.I0(\buf_data_reg[1] [124]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [62]),
        .O(p_2_in[124]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][125]_i_1 
       (.I0(\buf_data_reg[1] [125]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [63]),
        .O(p_2_in[125]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][126]_i_1 
       (.I0(\buf_data_reg[1] [126]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [64]),
        .O(p_2_in[126]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][127]_i_1 
       (.I0(\buf_data_reg[1] [127]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [65]),
        .O(p_2_in[127]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][128]_i_1 
       (.I0(\buf_data_reg[1] [128]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [66]),
        .O(p_2_in[128]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][129]_i_1 
       (.I0(\buf_data_reg[1] [129]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [67]),
        .O(p_2_in[129]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][12]_i_1 
       (.I0(\buf_data_reg[1] [12]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [12]),
        .O(p_2_in[12]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][130]_i_1 
       (.I0(\buf_data_reg[1] [130]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [68]),
        .O(p_2_in[130]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][131]_i_1 
       (.I0(\buf_data_reg[1] [131]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [69]),
        .O(p_2_in[131]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][132]_i_1 
       (.I0(\buf_data_reg[1] [132]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [70]),
        .O(p_2_in[132]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][133]_i_1 
       (.I0(\buf_data_reg[1] [133]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [71]),
        .O(p_2_in[133]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][134]_i_1 
       (.I0(\buf_data_reg[1] [134]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [72]),
        .O(p_2_in[134]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][135]_i_1 
       (.I0(\buf_data_reg[1] [135]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [73]),
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
        .I3(\buf_data_reg[1][136]_0 [74]),
        .O(p_2_in[136]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][13]_i_1 
       (.I0(\buf_data_reg[1] [13]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [13]),
        .O(p_2_in[13]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][14]_i_1 
       (.I0(\buf_data_reg[1] [14]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [14]),
        .O(p_2_in[14]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][15]_i_1 
       (.I0(\buf_data_reg[1] [15]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [15]),
        .O(p_2_in[15]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][16]_i_1 
       (.I0(\buf_data_reg[1] [16]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [16]),
        .O(p_2_in[16]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][17]_i_1 
       (.I0(\buf_data_reg[1] [17]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [17]),
        .O(p_2_in[17]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][18]_i_1 
       (.I0(\buf_data_reg[1] [18]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [18]),
        .O(p_2_in[18]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][19]_i_1 
       (.I0(\buf_data_reg[1] [19]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [19]),
        .O(p_2_in[19]));
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
    \buf_data[0][20]_i_1 
       (.I0(\buf_data_reg[1] [20]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [20]),
        .O(p_2_in[20]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][21]_i_1 
       (.I0(\buf_data_reg[1] [21]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [21]),
        .O(p_2_in[21]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][22]_i_1 
       (.I0(\buf_data_reg[1] [22]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [22]),
        .O(p_2_in[22]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][23]_i_1 
       (.I0(\buf_data_reg[1] [23]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [23]),
        .O(p_2_in[23]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][24]_i_1 
       (.I0(\buf_data_reg[1] [24]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [24]),
        .O(p_2_in[24]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][25]_i_1 
       (.I0(\buf_data_reg[1] [25]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [25]),
        .O(p_2_in[25]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][26]_i_1 
       (.I0(\buf_data_reg[1] [26]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [26]),
        .O(p_2_in[26]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][27]_i_1 
       (.I0(\buf_data_reg[1] [27]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [27]),
        .O(p_2_in[27]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][28]_i_1 
       (.I0(\buf_data_reg[1] [28]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [28]),
        .O(p_2_in[28]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][29]_i_1 
       (.I0(\buf_data_reg[1] [29]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [29]),
        .O(p_2_in[29]));
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
    \buf_data[0][30]_i_1 
       (.I0(\buf_data_reg[1] [30]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [30]),
        .O(p_2_in[30]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][31]_i_1 
       (.I0(\buf_data_reg[1] [31]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [31]),
        .O(p_2_in[31]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][32]_i_1 
       (.I0(\buf_data_reg[1] [32]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [32]),
        .O(p_2_in[32]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][33]_i_1 
       (.I0(\buf_data_reg[1] [33]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [33]),
        .O(p_2_in[33]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][34]_i_1 
       (.I0(\buf_data_reg[1] [34]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [34]),
        .O(p_2_in[34]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][35]_i_1 
       (.I0(\buf_data_reg[1] [35]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [35]),
        .O(p_2_in[35]));
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
    \buf_data[0][5]_i_1 
       (.I0(\buf_data_reg[1] [5]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [5]),
        .O(p_2_in[5]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][68]_i_1 
       (.I0(\buf_data_reg[1] [68]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [36]),
        .O(p_2_in[68]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][69]_i_1 
       (.I0(\buf_data_reg[1] [69]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [37]),
        .O(p_2_in[69]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][6]_i_1 
       (.I0(\buf_data_reg[1] [6]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [6]),
        .O(p_2_in[6]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][70]_i_1 
       (.I0(\buf_data_reg[1] [70]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [38]),
        .O(p_2_in[70]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][71]_i_1 
       (.I0(\buf_data_reg[1] [71]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [39]),
        .O(p_2_in[71]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][72]_i_1 
       (.I0(\buf_data_reg[1] [72]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [40]),
        .O(p_2_in[72]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][73]_i_1 
       (.I0(\buf_data_reg[1] [73]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [41]),
        .O(p_2_in[73]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][7]_i_1 
       (.I0(\buf_data_reg[1] [7]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [7]),
        .O(p_2_in[7]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][8]_i_1 
       (.I0(\buf_data_reg[1] [8]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [8]),
        .O(p_2_in[8]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \buf_data[0][9]_i_1 
       (.I0(\buf_data_reg[1] [9]),
        .I1(p_0_in),
        .I2(cur_dtype_pxls1),
        .I3(\buf_data_reg[1][136]_0 [9]),
        .O(p_2_in[9]));
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
  FDRE \buf_data_reg[0][10] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[10]),
        .Q(Q[10]),
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
  FDRE \buf_data_reg[0][11] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[11]),
        .Q(Q[11]),
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
  FDRE \buf_data_reg[0][12] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[12]),
        .Q(Q[12]),
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
        .Q(Q[42]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][13] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[13]),
        .Q(Q[13]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][14] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[14]),
        .Q(Q[14]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][15] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[15]),
        .Q(Q[15]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][16] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[16]),
        .Q(Q[16]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][17] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[17]),
        .Q(Q[17]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][18] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[18]),
        .Q(Q[18]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][19] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[19]),
        .Q(Q[19]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][1] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[1]),
        .Q(Q[1]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][20] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[20]),
        .Q(Q[20]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][21] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[21]),
        .Q(Q[21]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][22] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[22]),
        .Q(Q[22]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][23] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[23]),
        .Q(Q[23]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][24] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[24]),
        .Q(Q[24]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][25] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[25]),
        .Q(Q[25]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][26] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[26]),
        .Q(Q[26]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][27] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[27]),
        .Q(Q[27]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][28] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[28]),
        .Q(Q[28]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][29] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[29]),
        .Q(Q[29]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][2] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[2]),
        .Q(Q[2]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][30] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[30]),
        .Q(Q[30]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][31] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[31]),
        .Q(Q[31]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][32] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[32]),
        .Q(Q[32]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][33] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[33]),
        .Q(Q[33]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][34] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[34]),
        .Q(Q[34]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][35] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[35]),
        .Q(Q[35]),
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
  FDRE \buf_data_reg[0][5] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[5]),
        .Q(Q[5]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][68] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[68]),
        .Q(Q[36]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][69] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[69]),
        .Q(Q[37]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][6] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[6]),
        .Q(Q[6]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][70] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[70]),
        .Q(Q[38]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][71] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[71]),
        .Q(Q[39]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][72] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[72]),
        .Q(Q[40]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][73] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[73]),
        .Q(Q[41]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][7] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[7]),
        .Q(Q[7]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][8] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[8]),
        .Q(Q[8]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[0][9] 
       (.C(s_axis_aclk),
        .CE(\buf_data[0][136]_i_1_n_0 ),
        .D(p_2_in[9]),
        .Q(Q[9]),
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
        .D(\buf_data_reg[1][136]_0 [42]),
        .Q(\buf_data_reg[1] [104]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][105] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [43]),
        .Q(\buf_data_reg[1] [105]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][106] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [44]),
        .Q(\buf_data_reg[1] [106]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][107] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [45]),
        .Q(\buf_data_reg[1] [107]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][108] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [46]),
        .Q(\buf_data_reg[1] [108]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][109] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [47]),
        .Q(\buf_data_reg[1] [109]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][10] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [10]),
        .Q(\buf_data_reg[1] [10]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][110] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [48]),
        .Q(\buf_data_reg[1] [110]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][111] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [49]),
        .Q(\buf_data_reg[1] [111]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][112] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [50]),
        .Q(\buf_data_reg[1] [112]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][113] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [51]),
        .Q(\buf_data_reg[1] [113]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][114] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [52]),
        .Q(\buf_data_reg[1] [114]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][115] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [53]),
        .Q(\buf_data_reg[1] [115]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][116] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [54]),
        .Q(\buf_data_reg[1] [116]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][117] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [55]),
        .Q(\buf_data_reg[1] [117]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][118] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [56]),
        .Q(\buf_data_reg[1] [118]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][119] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [57]),
        .Q(\buf_data_reg[1] [119]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][11] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [11]),
        .Q(\buf_data_reg[1] [11]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][120] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [58]),
        .Q(\buf_data_reg[1] [120]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][121] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [59]),
        .Q(\buf_data_reg[1] [121]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][122] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [60]),
        .Q(\buf_data_reg[1] [122]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][123] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [61]),
        .Q(\buf_data_reg[1] [123]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][124] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [62]),
        .Q(\buf_data_reg[1] [124]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][125] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [63]),
        .Q(\buf_data_reg[1] [125]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][126] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [64]),
        .Q(\buf_data_reg[1] [126]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][127] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [65]),
        .Q(\buf_data_reg[1] [127]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][128] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [66]),
        .Q(\buf_data_reg[1] [128]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][129] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [67]),
        .Q(\buf_data_reg[1] [129]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][12] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [12]),
        .Q(\buf_data_reg[1] [12]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][130] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [68]),
        .Q(\buf_data_reg[1] [130]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][131] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [69]),
        .Q(\buf_data_reg[1] [131]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][132] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [70]),
        .Q(\buf_data_reg[1] [132]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][133] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [71]),
        .Q(\buf_data_reg[1] [133]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][134] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [72]),
        .Q(\buf_data_reg[1] [134]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][135] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [73]),
        .Q(\buf_data_reg[1] [135]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][136] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [74]),
        .Q(\buf_data_reg[1] [136]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][13] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [13]),
        .Q(\buf_data_reg[1] [13]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][14] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [14]),
        .Q(\buf_data_reg[1] [14]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][15] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [15]),
        .Q(\buf_data_reg[1] [15]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][16] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [16]),
        .Q(\buf_data_reg[1] [16]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][17] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [17]),
        .Q(\buf_data_reg[1] [17]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][18] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [18]),
        .Q(\buf_data_reg[1] [18]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][19] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [19]),
        .Q(\buf_data_reg[1] [19]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][1] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [1]),
        .Q(\buf_data_reg[1] [1]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][20] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [20]),
        .Q(\buf_data_reg[1] [20]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][21] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [21]),
        .Q(\buf_data_reg[1] [21]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][22] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [22]),
        .Q(\buf_data_reg[1] [22]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][23] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [23]),
        .Q(\buf_data_reg[1] [23]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][24] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [24]),
        .Q(\buf_data_reg[1] [24]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][25] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [25]),
        .Q(\buf_data_reg[1] [25]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][26] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [26]),
        .Q(\buf_data_reg[1] [26]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][27] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [27]),
        .Q(\buf_data_reg[1] [27]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][28] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [28]),
        .Q(\buf_data_reg[1] [28]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][29] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [29]),
        .Q(\buf_data_reg[1] [29]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][2] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [2]),
        .Q(\buf_data_reg[1] [2]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][30] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [30]),
        .Q(\buf_data_reg[1] [30]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][31] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [31]),
        .Q(\buf_data_reg[1] [31]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][32] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [32]),
        .Q(\buf_data_reg[1] [32]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][33] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [33]),
        .Q(\buf_data_reg[1] [33]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][34] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [34]),
        .Q(\buf_data_reg[1] [34]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][35] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [35]),
        .Q(\buf_data_reg[1] [35]),
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
  FDRE \buf_data_reg[1][5] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [5]),
        .Q(\buf_data_reg[1] [5]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][68] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [36]),
        .Q(\buf_data_reg[1] [68]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][69] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [37]),
        .Q(\buf_data_reg[1] [69]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][6] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [6]),
        .Q(\buf_data_reg[1] [6]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][70] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [38]),
        .Q(\buf_data_reg[1] [70]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][71] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [39]),
        .Q(\buf_data_reg[1] [71]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][72] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [40]),
        .Q(\buf_data_reg[1] [72]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][73] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [41]),
        .Q(\buf_data_reg[1] [73]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][7] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [7]),
        .Q(\buf_data_reg[1] [7]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][8] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [8]),
        .Q(\buf_data_reg[1] [8]),
        .R(\buf_valid[1]_i_1_n_0 ));
  FDRE \buf_data_reg[1][9] 
       (.C(s_axis_aclk),
        .CE(\buf_data[1][136]_i_1_n_0 ),
        .D(\buf_data_reg[1][136]_0 [9]),
        .Q(\buf_data_reg[1] [9]),
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
       (.I0(Q[39]),
        .I1(Q[40]),
        .I2(Q[41]),
        .I3(main_dtvc),
        .I4(\buf_valid_reg_n_0_[0] ),
        .I5(cur_dtype_sink_reg_n_0),
        .O(cur_dtype_sink_i_1_n_0));
  LUT6 #(
    .INIT(64'h0100000000000000)) 
    cur_dtype_sink_i_2
       (.I0(Q[40]),
        .I1(Q[36]),
        .I2(Q[38]),
        .I3(Q[41]),
        .I4(Q[37]),
        .I5(Q[39]),
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
        .I1(Q[42]),
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
        .O(vfb_sof119_out));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    sband_tl_r_i_2
       (.I0(Q[42]),
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
       (.I0(Q[39]),
        .I1(Q[37]),
        .I2(Q[41]),
        .I3(Q[38]),
        .I4(Q[36]),
        .I5(Q[40]),
        .O(sban_dtvc));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[0]_i_1 
       (.I0(vfb_sof119_out),
        .I1(tdata_s0[0]),
        .O(\buf_data_reg[0][104]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[10]_i_1 
       (.I0(vfb_sof119_out),
        .I1(tdata_s0[10]),
        .O(\buf_data_reg[0][114]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[11]_i_1 
       (.I0(vfb_sof119_out),
        .I1(tdata_s0[11]),
        .O(\buf_data_reg[0][115]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[12]_i_1 
       (.I0(vfb_sof119_out),
        .I1(tdata_s0[12]),
        .O(\buf_data_reg[0][116]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[13]_i_1 
       (.I0(vfb_sof119_out),
        .I1(tdata_s0[13]),
        .O(\buf_data_reg[0][117]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[14]_i_1 
       (.I0(vfb_sof119_out),
        .I1(tdata_s0[14]),
        .O(\buf_data_reg[0][118]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[15]_i_1 
       (.I0(vfb_sof119_out),
        .I1(tdata_s0[15]),
        .O(\buf_data_reg[0][119]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[16]_i_1 
       (.I0(vfb_sof119_out),
        .I1(tdata_s0[16]),
        .O(\buf_data_reg[0][120]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[17]_i_1 
       (.I0(vfb_sof119_out),
        .I1(tdata_s0[17]),
        .O(\buf_data_reg[0][121]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[18]_i_1 
       (.I0(vfb_sof119_out),
        .I1(tdata_s0[18]),
        .O(\buf_data_reg[0][122]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[19]_i_1 
       (.I0(vfb_sof119_out),
        .I1(tdata_s0[19]),
        .O(\buf_data_reg[0][123]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[1]_i_1 
       (.I0(vfb_sof119_out),
        .I1(tdata_s0[1]),
        .O(\buf_data_reg[0][105]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[20]_i_1 
       (.I0(vfb_sof119_out),
        .I1(tdata_s0[20]),
        .O(\buf_data_reg[0][124]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[21]_i_1 
       (.I0(vfb_sof119_out),
        .I1(tdata_s0[21]),
        .O(\buf_data_reg[0][125]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[22]_i_1 
       (.I0(vfb_sof119_out),
        .I1(tdata_s0[22]),
        .O(\buf_data_reg[0][126]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[23]_i_1 
       (.I0(vfb_sof119_out),
        .I1(tdata_s0[23]),
        .O(\buf_data_reg[0][127]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[24]_i_1 
       (.I0(vfb_sof119_out),
        .I1(tdata_s0[24]),
        .O(\buf_data_reg[0][128]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[25]_i_1 
       (.I0(vfb_sof119_out),
        .I1(tdata_s0[25]),
        .O(\buf_data_reg[0][129]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[26]_i_1 
       (.I0(vfb_sof119_out),
        .I1(tdata_s0[26]),
        .O(\buf_data_reg[0][130]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[27]_i_1 
       (.I0(vfb_sof119_out),
        .I1(tdata_s0[27]),
        .O(\buf_data_reg[0][131]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[28]_i_1 
       (.I0(vfb_sof119_out),
        .I1(tdata_s0[28]),
        .O(\buf_data_reg[0][132]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[29]_i_1 
       (.I0(vfb_sof119_out),
        .I1(tdata_s0[29]),
        .O(\buf_data_reg[0][133]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[2]_i_1 
       (.I0(vfb_sof119_out),
        .I1(tdata_s0[2]),
        .O(\buf_data_reg[0][106]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[30]_i_1 
       (.I0(vfb_sof119_out),
        .I1(tdata_s0[30]),
        .O(\buf_data_reg[0][134]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[31]_i_2 
       (.I0(vfb_sof119_out),
        .I1(tdata_s0[31]),
        .O(\buf_data_reg[0][135]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[3]_i_1 
       (.I0(vfb_sof119_out),
        .I1(tdata_s0[3]),
        .O(\buf_data_reg[0][107]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[4]_i_1 
       (.I0(vfb_sof119_out),
        .I1(tdata_s0[4]),
        .O(\buf_data_reg[0][108]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[5]_i_1 
       (.I0(vfb_sof119_out),
        .I1(tdata_s0[5]),
        .O(\buf_data_reg[0][109]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[6]_i_1 
       (.I0(vfb_sof119_out),
        .I1(tdata_s0[6]),
        .O(\buf_data_reg[0][110]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[7]_i_1 
       (.I0(vfb_sof119_out),
        .I1(tdata_s0[7]),
        .O(\buf_data_reg[0][111]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[8]_i_1 
       (.I0(vfb_sof119_out),
        .I1(tdata_s0[8]),
        .O(\buf_data_reg[0][112]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vfb_data[9]_i_1 
       (.I0(vfb_sof119_out),
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
        .I5(\vfb_sof_reg[0] ),
        .O(\buf_data_reg[0][4]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vfb_vcdt[0]_i_1 
       (.I0(Q[0]),
        .I1(vfb_sof119_out),
        .I2(\vfb_vcdt_reg[9] [0]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vfb_vcdt[1]_i_1 
       (.I0(Q[1]),
        .I1(vfb_sof119_out),
        .I2(\vfb_vcdt_reg[9] [1]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vfb_vcdt[2]_i_1 
       (.I0(Q[2]),
        .I1(vfb_sof119_out),
        .I2(\vfb_vcdt_reg[9] [2]),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vfb_vcdt[3]_i_1 
       (.I0(Q[3]),
        .I1(vfb_sof119_out),
        .I2(\vfb_vcdt_reg[9] [3]),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vfb_vcdt[4]_i_1 
       (.I0(Q[36]),
        .I1(vfb_sof119_out),
        .I2(\vfb_vcdt_reg[9] [4]),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vfb_vcdt[5]_i_1 
       (.I0(Q[37]),
        .I1(vfb_sof119_out),
        .I2(\vfb_vcdt_reg[9] [5]),
        .O(D[5]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vfb_vcdt[6]_i_1 
       (.I0(Q[38]),
        .I1(vfb_sof119_out),
        .I2(\vfb_vcdt_reg[9] [6]),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vfb_vcdt[7]_i_1 
       (.I0(Q[39]),
        .I1(vfb_sof119_out),
        .I2(\vfb_vcdt_reg[9] [7]),
        .O(D[7]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vfb_vcdt[8]_i_1 
       (.I0(Q[40]),
        .I1(vfb_sof119_out),
        .I2(\vfb_vcdt_reg[9] [8]),
        .O(D[8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \vfb_vcdt[9]_i_2 
       (.I0(Q[41]),
        .I1(vfb_sof119_out),
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
