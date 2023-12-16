// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Tue Oct 24 19:00:06 2023
// Host        : LAPTOP-FEFLDCST running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ capture_fb_ahb_0_4_sim_netlist.v
// Design      : capture_fb_ahb_0_4
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcau25p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "capture_fb_ahb_0_4,fb_ahb,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "fb_ahb,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clk,
    resetn,
    m_ahb_haddr,
    m_ahb_hburst,
    m_ahb_hprot,
    m_ahb_hrdata,
    m_ahb_hready_in,
    m_ahb_hready_out,
    m_ahb_hresp,
    m_ahb_hsize,
    m_ahb_htrans,
    m_ahb_hwdata,
    m_ahb_hwrite,
    m_ahb_hsel,
    wirein00,
    wirein01,
    triggerin40,
    triggerout60,
    wireout20,
    global_resetn);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET resetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN capture_clk_wiz_0_0_clk_out1, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 resetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input resetn;
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 global_resetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME global_resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) output global_resetn;

  wire \<const0> ;
  wire \<const1> ;
  wire clk;
  wire global_resetn;
  wire [31:0]m_ahb_hrdata;
  wire m_ahb_hready_in;
  wire m_ahb_hsel;
  wire [1:1]\^m_ahb_htrans ;
  wire m_ahb_hwrite;
  wire resetn;
  wire [31:0]triggerin40;
  wire [0:0]\^triggerout60 ;
  wire [31:0]wirein00;
  wire [31:0]wirein01;
  wire [31:0]wireout20;

  assign m_ahb_haddr[31:0] = wirein00;
  assign m_ahb_hburst[2] = \<const0> ;
  assign m_ahb_hburst[1] = \<const0> ;
  assign m_ahb_hburst[0] = \<const0> ;
  assign m_ahb_hprot[3] = \<const0> ;
  assign m_ahb_hprot[2] = \<const0> ;
  assign m_ahb_hprot[1] = \<const1> ;
  assign m_ahb_hprot[0] = \<const1> ;
  assign m_ahb_hready_out = \<const1> ;
  assign m_ahb_hsize[2] = \<const0> ;
  assign m_ahb_hsize[1] = \<const1> ;
  assign m_ahb_hsize[0] = \<const0> ;
  assign m_ahb_htrans[1] = \^m_ahb_htrans [1];
  assign m_ahb_htrans[0] = \<const0> ;
  assign m_ahb_hwdata[31:0] = wirein01;
  assign triggerout60[31] = \<const0> ;
  assign triggerout60[30] = \<const0> ;
  assign triggerout60[29] = \<const0> ;
  assign triggerout60[28] = \<const0> ;
  assign triggerout60[27] = \<const0> ;
  assign triggerout60[26] = \<const0> ;
  assign triggerout60[25] = \<const0> ;
  assign triggerout60[24] = \<const0> ;
  assign triggerout60[23] = \<const0> ;
  assign triggerout60[22] = \<const0> ;
  assign triggerout60[21] = \<const0> ;
  assign triggerout60[20] = \<const0> ;
  assign triggerout60[19] = \<const0> ;
  assign triggerout60[18] = \<const0> ;
  assign triggerout60[17] = \<const0> ;
  assign triggerout60[16] = \<const0> ;
  assign triggerout60[15] = \<const0> ;
  assign triggerout60[14] = \<const0> ;
  assign triggerout60[13] = \<const0> ;
  assign triggerout60[12] = \<const0> ;
  assign triggerout60[11] = \<const0> ;
  assign triggerout60[10] = \<const0> ;
  assign triggerout60[9] = \<const0> ;
  assign triggerout60[8] = \<const0> ;
  assign triggerout60[7] = \<const0> ;
  assign triggerout60[6] = \<const0> ;
  assign triggerout60[5] = \<const0> ;
  assign triggerout60[4] = \<const0> ;
  assign triggerout60[3] = \<const0> ;
  assign triggerout60[2] = \<const0> ;
  assign triggerout60[1] = \<const0> ;
  assign triggerout60[0] = \^triggerout60 [0];
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fb_ahb inst
       (.clk(clk),
        .global_resetn(global_resetn),
        .m_ahb_hrdata(m_ahb_hrdata),
        .m_ahb_hready_in(m_ahb_hready_in),
        .m_ahb_hsel(m_ahb_hsel),
        .m_ahb_htrans(\^m_ahb_htrans ),
        .m_ahb_hwrite(m_ahb_hwrite),
        .resetn(resetn),
        .triggerin40(triggerin40[2:0]),
        .triggerout60(\^triggerout60 ),
        .wireout20(wireout20));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fb_ahb
   (wireout20,
    m_ahb_htrans,
    m_ahb_hsel,
    triggerout60,
    m_ahb_hwrite,
    global_resetn,
    clk,
    m_ahb_hrdata,
    triggerin40,
    m_ahb_hready_in,
    resetn);
  output [31:0]wireout20;
  output [0:0]m_ahb_htrans;
  output m_ahb_hsel;
  output [0:0]triggerout60;
  output m_ahb_hwrite;
  output global_resetn;
  input clk;
  input [31:0]m_ahb_hrdata;
  input [2:0]triggerin40;
  input m_ahb_hready_in;
  input resetn;

  wire \FSM_onehot_state[0]_i_1_n_0 ;
  wire \FSM_onehot_state[2]_i_1_n_0 ;
  wire \FSM_onehot_state_reg_n_0_[0] ;
  wire \FSM_onehot_state_reg_n_0_[1] ;
  wire \FSM_onehot_state_reg_n_0_[2] ;
  wire \__2/i__n_0 ;
  wire clk;
  wire global_resetn;
  wire global_resetn_i_1_n_0;
  wire global_resetn_i_2_n_0;
  wire [31:0]m_ahb_hrdata;
  wire m_ahb_hready_in;
  wire m_ahb_hsel;
  wire m_ahb_hsel_i_1_n_0;
  wire [0:0]m_ahb_htrans;
  wire \m_ahb_htrans[1]_i_1_n_0 ;
  wire m_ahb_hwrite;
  wire m_ahb_hwrite_i_1_n_0;
  wire [7:0]p_0_in;
  wire rcnt;
  wire \rcnt[7]_i_3_n_0 ;
  wire [7:0]rcnt_reg;
  wire resetn;
  wire [2:0]triggerin40;
  wire [0:0]triggerout60;
  wire \triggerout60[0]_i_1_n_0 ;
  wire [31:0]wireout20;
  wire \wireout20[31]_i_1_n_0 ;

  LUT2 #(
    .INIT(4'h1)) 
    \FSM_onehot_state[0]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[0] ),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .O(\FSM_onehot_state[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \FSM_onehot_state[2]_i_1 
       (.I0(resetn),
        .O(\FSM_onehot_state[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "iSTATE:100,iSTATE0:001,iSTATE1:010," *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(clk),
        .CE(\__2/i__n_0 ),
        .D(\FSM_onehot_state[0]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[0] ),
        .S(\FSM_onehot_state[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "iSTATE:100,iSTATE0:001,iSTATE1:010," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(clk),
        .CE(\__2/i__n_0 ),
        .D(\FSM_onehot_state_reg_n_0_[0] ),
        .Q(\FSM_onehot_state_reg_n_0_[1] ),
        .R(\FSM_onehot_state[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "iSTATE:100,iSTATE0:001,iSTATE1:010," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(clk),
        .CE(\__2/i__n_0 ),
        .D(\FSM_onehot_state_reg_n_0_[1] ),
        .Q(\FSM_onehot_state_reg_n_0_[2] ),
        .R(\FSM_onehot_state[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEFEF0F0EEEEF000)) 
    \__2/i_ 
       (.I0(triggerin40[0]),
        .I1(triggerin40[1]),
        .I2(m_ahb_hready_in),
        .I3(\FSM_onehot_state_reg_n_0_[2] ),
        .I4(\FSM_onehot_state_reg_n_0_[0] ),
        .I5(\FSM_onehot_state_reg_n_0_[1] ),
        .O(\__2/i__n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000100)) 
    global_resetn_i_1
       (.I0(global_resetn_i_2_n_0),
        .I1(rcnt_reg[4]),
        .I2(rcnt_reg[3]),
        .I3(rcnt_reg[2]),
        .I4(rcnt_reg[7]),
        .I5(triggerin40[2]),
        .O(global_resetn_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFFF7)) 
    global_resetn_i_2
       (.I0(rcnt_reg[6]),
        .I1(rcnt_reg[5]),
        .I2(rcnt_reg[1]),
        .I3(rcnt_reg[0]),
        .O(global_resetn_i_2_n_0));
  FDRE global_resetn_reg
       (.C(clk),
        .CE(1'b1),
        .D(global_resetn_i_1_n_0),
        .Q(global_resetn),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h00000000CEAA0000)) 
    m_ahb_hsel_i_1
       (.I0(m_ahb_hsel),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(\FSM_onehot_state_reg_n_0_[2] ),
        .I3(m_ahb_hready_in),
        .I4(resetn),
        .I5(\FSM_onehot_state_reg_n_0_[0] ),
        .O(m_ahb_hsel_i_1_n_0));
  FDRE m_ahb_hsel_reg
       (.C(clk),
        .CE(1'b1),
        .D(m_ahb_hsel_i_1_n_0),
        .Q(m_ahb_hsel),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h00000000CEAA0000)) 
    \m_ahb_htrans[1]_i_1 
       (.I0(m_ahb_htrans),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(\FSM_onehot_state_reg_n_0_[2] ),
        .I3(m_ahb_hready_in),
        .I4(resetn),
        .I5(\FSM_onehot_state_reg_n_0_[0] ),
        .O(\m_ahb_htrans[1]_i_1_n_0 ));
  FDRE \m_ahb_htrans_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\m_ahb_htrans[1]_i_1_n_0 ),
        .Q(m_ahb_htrans),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h00A0E0A0)) 
    m_ahb_hwrite_i_1
       (.I0(m_ahb_hwrite),
        .I1(triggerin40[1]),
        .I2(resetn),
        .I3(\FSM_onehot_state_reg_n_0_[0] ),
        .I4(triggerin40[0]),
        .O(m_ahb_hwrite_i_1_n_0));
  FDRE m_ahb_hwrite_reg
       (.C(clk),
        .CE(1'b1),
        .D(m_ahb_hwrite_i_1_n_0),
        .Q(m_ahb_hwrite),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \rcnt[0]_i_1 
       (.I0(rcnt_reg[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rcnt[1]_i_1 
       (.I0(rcnt_reg[0]),
        .I1(rcnt_reg[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \rcnt[2]_i_1 
       (.I0(rcnt_reg[2]),
        .I1(rcnt_reg[1]),
        .I2(rcnt_reg[0]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \rcnt[3]_i_1 
       (.I0(rcnt_reg[3]),
        .I1(rcnt_reg[0]),
        .I2(rcnt_reg[1]),
        .I3(rcnt_reg[2]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \rcnt[4]_i_1 
       (.I0(rcnt_reg[4]),
        .I1(rcnt_reg[2]),
        .I2(rcnt_reg[1]),
        .I3(rcnt_reg[0]),
        .I4(rcnt_reg[3]),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \rcnt[5]_i_1 
       (.I0(rcnt_reg[5]),
        .I1(rcnt_reg[3]),
        .I2(rcnt_reg[0]),
        .I3(rcnt_reg[1]),
        .I4(rcnt_reg[2]),
        .I5(rcnt_reg[4]),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \rcnt[6]_i_1 
       (.I0(rcnt_reg[6]),
        .I1(\rcnt[7]_i_3_n_0 ),
        .I2(rcnt_reg[5]),
        .O(p_0_in[6]));
  LUT5 #(
    .INIT(32'hFFFFFEFF)) 
    \rcnt[7]_i_1 
       (.I0(global_resetn_i_2_n_0),
        .I1(rcnt_reg[4]),
        .I2(rcnt_reg[3]),
        .I3(rcnt_reg[2]),
        .I4(rcnt_reg[7]),
        .O(rcnt));
  LUT4 #(
    .INIT(16'h6AAA)) 
    \rcnt[7]_i_2 
       (.I0(rcnt_reg[7]),
        .I1(rcnt_reg[5]),
        .I2(rcnt_reg[6]),
        .I3(\rcnt[7]_i_3_n_0 ),
        .O(p_0_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \rcnt[7]_i_3 
       (.I0(rcnt_reg[4]),
        .I1(rcnt_reg[2]),
        .I2(rcnt_reg[1]),
        .I3(rcnt_reg[0]),
        .I4(rcnt_reg[3]),
        .O(\rcnt[7]_i_3_n_0 ));
  FDRE \rcnt_reg[0] 
       (.C(clk),
        .CE(rcnt),
        .D(p_0_in[0]),
        .Q(rcnt_reg[0]),
        .R(triggerin40[2]));
  FDRE \rcnt_reg[1] 
       (.C(clk),
        .CE(rcnt),
        .D(p_0_in[1]),
        .Q(rcnt_reg[1]),
        .R(triggerin40[2]));
  FDRE \rcnt_reg[2] 
       (.C(clk),
        .CE(rcnt),
        .D(p_0_in[2]),
        .Q(rcnt_reg[2]),
        .R(triggerin40[2]));
  FDRE \rcnt_reg[3] 
       (.C(clk),
        .CE(rcnt),
        .D(p_0_in[3]),
        .Q(rcnt_reg[3]),
        .R(triggerin40[2]));
  FDRE \rcnt_reg[4] 
       (.C(clk),
        .CE(rcnt),
        .D(p_0_in[4]),
        .Q(rcnt_reg[4]),
        .R(triggerin40[2]));
  FDRE \rcnt_reg[5] 
       (.C(clk),
        .CE(rcnt),
        .D(p_0_in[5]),
        .Q(rcnt_reg[5]),
        .R(triggerin40[2]));
  FDRE \rcnt_reg[6] 
       (.C(clk),
        .CE(rcnt),
        .D(p_0_in[6]),
        .Q(rcnt_reg[6]),
        .R(triggerin40[2]));
  FDRE \rcnt_reg[7] 
       (.C(clk),
        .CE(rcnt),
        .D(p_0_in[7]),
        .Q(rcnt_reg[7]),
        .R(triggerin40[2]));
  LUT5 #(
    .INIT(32'h0000EA00)) 
    \triggerout60[0]_i_1 
       (.I0(triggerout60),
        .I1(\FSM_onehot_state_reg_n_0_[2] ),
        .I2(m_ahb_hready_in),
        .I3(resetn),
        .I4(\FSM_onehot_state_reg_n_0_[0] ),
        .O(\triggerout60[0]_i_1_n_0 ));
  FDRE \triggerout60_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\triggerout60[0]_i_1_n_0 ),
        .Q(triggerout60),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h02000000)) 
    \wireout20[31]_i_1 
       (.I0(resetn),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(\FSM_onehot_state_reg_n_0_[0] ),
        .I3(\FSM_onehot_state_reg_n_0_[2] ),
        .I4(m_ahb_hready_in),
        .O(\wireout20[31]_i_1_n_0 ));
  FDRE \wireout20_reg[0] 
       (.C(clk),
        .CE(\wireout20[31]_i_1_n_0 ),
        .D(m_ahb_hrdata[0]),
        .Q(wireout20[0]),
        .R(1'b0));
  FDRE \wireout20_reg[10] 
       (.C(clk),
        .CE(\wireout20[31]_i_1_n_0 ),
        .D(m_ahb_hrdata[10]),
        .Q(wireout20[10]),
        .R(1'b0));
  FDRE \wireout20_reg[11] 
       (.C(clk),
        .CE(\wireout20[31]_i_1_n_0 ),
        .D(m_ahb_hrdata[11]),
        .Q(wireout20[11]),
        .R(1'b0));
  FDRE \wireout20_reg[12] 
       (.C(clk),
        .CE(\wireout20[31]_i_1_n_0 ),
        .D(m_ahb_hrdata[12]),
        .Q(wireout20[12]),
        .R(1'b0));
  FDRE \wireout20_reg[13] 
       (.C(clk),
        .CE(\wireout20[31]_i_1_n_0 ),
        .D(m_ahb_hrdata[13]),
        .Q(wireout20[13]),
        .R(1'b0));
  FDRE \wireout20_reg[14] 
       (.C(clk),
        .CE(\wireout20[31]_i_1_n_0 ),
        .D(m_ahb_hrdata[14]),
        .Q(wireout20[14]),
        .R(1'b0));
  FDRE \wireout20_reg[15] 
       (.C(clk),
        .CE(\wireout20[31]_i_1_n_0 ),
        .D(m_ahb_hrdata[15]),
        .Q(wireout20[15]),
        .R(1'b0));
  FDRE \wireout20_reg[16] 
       (.C(clk),
        .CE(\wireout20[31]_i_1_n_0 ),
        .D(m_ahb_hrdata[16]),
        .Q(wireout20[16]),
        .R(1'b0));
  FDRE \wireout20_reg[17] 
       (.C(clk),
        .CE(\wireout20[31]_i_1_n_0 ),
        .D(m_ahb_hrdata[17]),
        .Q(wireout20[17]),
        .R(1'b0));
  FDRE \wireout20_reg[18] 
       (.C(clk),
        .CE(\wireout20[31]_i_1_n_0 ),
        .D(m_ahb_hrdata[18]),
        .Q(wireout20[18]),
        .R(1'b0));
  FDRE \wireout20_reg[19] 
       (.C(clk),
        .CE(\wireout20[31]_i_1_n_0 ),
        .D(m_ahb_hrdata[19]),
        .Q(wireout20[19]),
        .R(1'b0));
  FDRE \wireout20_reg[1] 
       (.C(clk),
        .CE(\wireout20[31]_i_1_n_0 ),
        .D(m_ahb_hrdata[1]),
        .Q(wireout20[1]),
        .R(1'b0));
  FDRE \wireout20_reg[20] 
       (.C(clk),
        .CE(\wireout20[31]_i_1_n_0 ),
        .D(m_ahb_hrdata[20]),
        .Q(wireout20[20]),
        .R(1'b0));
  FDRE \wireout20_reg[21] 
       (.C(clk),
        .CE(\wireout20[31]_i_1_n_0 ),
        .D(m_ahb_hrdata[21]),
        .Q(wireout20[21]),
        .R(1'b0));
  FDRE \wireout20_reg[22] 
       (.C(clk),
        .CE(\wireout20[31]_i_1_n_0 ),
        .D(m_ahb_hrdata[22]),
        .Q(wireout20[22]),
        .R(1'b0));
  FDRE \wireout20_reg[23] 
       (.C(clk),
        .CE(\wireout20[31]_i_1_n_0 ),
        .D(m_ahb_hrdata[23]),
        .Q(wireout20[23]),
        .R(1'b0));
  FDRE \wireout20_reg[24] 
       (.C(clk),
        .CE(\wireout20[31]_i_1_n_0 ),
        .D(m_ahb_hrdata[24]),
        .Q(wireout20[24]),
        .R(1'b0));
  FDRE \wireout20_reg[25] 
       (.C(clk),
        .CE(\wireout20[31]_i_1_n_0 ),
        .D(m_ahb_hrdata[25]),
        .Q(wireout20[25]),
        .R(1'b0));
  FDRE \wireout20_reg[26] 
       (.C(clk),
        .CE(\wireout20[31]_i_1_n_0 ),
        .D(m_ahb_hrdata[26]),
        .Q(wireout20[26]),
        .R(1'b0));
  FDRE \wireout20_reg[27] 
       (.C(clk),
        .CE(\wireout20[31]_i_1_n_0 ),
        .D(m_ahb_hrdata[27]),
        .Q(wireout20[27]),
        .R(1'b0));
  FDRE \wireout20_reg[28] 
       (.C(clk),
        .CE(\wireout20[31]_i_1_n_0 ),
        .D(m_ahb_hrdata[28]),
        .Q(wireout20[28]),
        .R(1'b0));
  FDRE \wireout20_reg[29] 
       (.C(clk),
        .CE(\wireout20[31]_i_1_n_0 ),
        .D(m_ahb_hrdata[29]),
        .Q(wireout20[29]),
        .R(1'b0));
  FDRE \wireout20_reg[2] 
       (.C(clk),
        .CE(\wireout20[31]_i_1_n_0 ),
        .D(m_ahb_hrdata[2]),
        .Q(wireout20[2]),
        .R(1'b0));
  FDRE \wireout20_reg[30] 
       (.C(clk),
        .CE(\wireout20[31]_i_1_n_0 ),
        .D(m_ahb_hrdata[30]),
        .Q(wireout20[30]),
        .R(1'b0));
  FDRE \wireout20_reg[31] 
       (.C(clk),
        .CE(\wireout20[31]_i_1_n_0 ),
        .D(m_ahb_hrdata[31]),
        .Q(wireout20[31]),
        .R(1'b0));
  FDRE \wireout20_reg[3] 
       (.C(clk),
        .CE(\wireout20[31]_i_1_n_0 ),
        .D(m_ahb_hrdata[3]),
        .Q(wireout20[3]),
        .R(1'b0));
  FDRE \wireout20_reg[4] 
       (.C(clk),
        .CE(\wireout20[31]_i_1_n_0 ),
        .D(m_ahb_hrdata[4]),
        .Q(wireout20[4]),
        .R(1'b0));
  FDRE \wireout20_reg[5] 
       (.C(clk),
        .CE(\wireout20[31]_i_1_n_0 ),
        .D(m_ahb_hrdata[5]),
        .Q(wireout20[5]),
        .R(1'b0));
  FDRE \wireout20_reg[6] 
       (.C(clk),
        .CE(\wireout20[31]_i_1_n_0 ),
        .D(m_ahb_hrdata[6]),
        .Q(wireout20[6]),
        .R(1'b0));
  FDRE \wireout20_reg[7] 
       (.C(clk),
        .CE(\wireout20[31]_i_1_n_0 ),
        .D(m_ahb_hrdata[7]),
        .Q(wireout20[7]),
        .R(1'b0));
  FDRE \wireout20_reg[8] 
       (.C(clk),
        .CE(\wireout20[31]_i_1_n_0 ),
        .D(m_ahb_hrdata[8]),
        .Q(wireout20[8]),
        .R(1'b0));
  FDRE \wireout20_reg[9] 
       (.C(clk),
        .CE(\wireout20[31]_i_1_n_0 ),
        .D(m_ahb_hrdata[9]),
        .Q(wireout20[9]),
        .R(1'b0));
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
