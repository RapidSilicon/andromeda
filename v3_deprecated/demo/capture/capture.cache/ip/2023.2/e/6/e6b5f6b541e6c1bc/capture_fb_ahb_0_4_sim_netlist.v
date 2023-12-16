// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Tue Oct 24 14:21:23 2023
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
  wire [31:0]triggerin40;
  wire [31:0]triggerout60;
  wire [31:0]wirein00;
  wire [31:0]wirein01;

  assign m_ahb_haddr[31:0] = wirein00;
  assign m_ahb_hburst[2] = \<const0> ;
  assign m_ahb_hburst[1] = \<const0> ;
  assign m_ahb_hburst[0] = \<const0> ;
  assign m_ahb_hprot[3] = \<const0> ;
  assign m_ahb_hprot[2] = \<const0> ;
  assign m_ahb_hprot[1] = \<const1> ;
  assign m_ahb_hprot[0] = \<const1> ;
  assign m_ahb_hready_out = \<const1> ;
  assign m_ahb_hsel = \<const1> ;
  assign m_ahb_hsize[2] = \<const0> ;
  assign m_ahb_hsize[1] = \<const1> ;
  assign m_ahb_hsize[0] = \<const0> ;
  assign m_ahb_htrans[1] = \<const0> ;
  assign m_ahb_htrans[0] = \<const0> ;
  assign m_ahb_hwdata[31:0] = wirein01;
  assign m_ahb_hwrite = \<const0> ;
  assign wireout20[31] = \<const0> ;
  assign wireout20[30] = \<const0> ;
  assign wireout20[29] = \<const0> ;
  assign wireout20[28] = \<const0> ;
  assign wireout20[27] = \<const0> ;
  assign wireout20[26] = \<const0> ;
  assign wireout20[25] = \<const0> ;
  assign wireout20[24] = \<const0> ;
  assign wireout20[23] = \<const0> ;
  assign wireout20[22] = \<const0> ;
  assign wireout20[21] = \<const0> ;
  assign wireout20[20] = \<const0> ;
  assign wireout20[19] = \<const0> ;
  assign wireout20[18] = \<const0> ;
  assign wireout20[17] = \<const0> ;
  assign wireout20[16] = \<const0> ;
  assign wireout20[15] = \<const0> ;
  assign wireout20[14] = \<const0> ;
  assign wireout20[13] = \<const0> ;
  assign wireout20[12] = \<const0> ;
  assign wireout20[11] = \<const0> ;
  assign wireout20[10] = \<const0> ;
  assign wireout20[9] = \<const0> ;
  assign wireout20[8] = \<const0> ;
  assign wireout20[7] = \<const0> ;
  assign wireout20[6] = \<const0> ;
  assign wireout20[5] = \<const0> ;
  assign wireout20[4] = \<const0> ;
  assign wireout20[3] = \<const0> ;
  assign wireout20[2] = \<const0> ;
  assign wireout20[1] = \<const0> ;
  assign wireout20[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fb_ahb inst
       (.clk(clk),
        .global_resetn(global_resetn),
        .triggerin40(triggerin40),
        .triggerout60(triggerout60));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fb_ahb
   (triggerout60,
    global_resetn,
    triggerin40,
    clk);
  output [31:0]triggerout60;
  output global_resetn;
  input [31:0]triggerin40;
  input clk;

  wire clk;
  wire global_resetn;
  wire global_resetn_i_1_n_0;
  wire global_resetn_i_2_n_0;
  wire [7:0]p_0_in;
  wire rcnt;
  wire \rcnt[7]_i_3_n_0 ;
  wire [7:0]rcnt_reg;
  wire [31:0]triggerin40;
  wire [31:0]triggerout60;

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
  FDRE \triggerout60_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(triggerin40[0]),
        .Q(triggerout60[0]),
        .R(1'b0));
  FDRE \triggerout60_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(triggerin40[10]),
        .Q(triggerout60[10]),
        .R(1'b0));
  FDRE \triggerout60_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(triggerin40[11]),
        .Q(triggerout60[11]),
        .R(1'b0));
  FDRE \triggerout60_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(triggerin40[12]),
        .Q(triggerout60[12]),
        .R(1'b0));
  FDRE \triggerout60_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(triggerin40[13]),
        .Q(triggerout60[13]),
        .R(1'b0));
  FDRE \triggerout60_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(triggerin40[14]),
        .Q(triggerout60[14]),
        .R(1'b0));
  FDRE \triggerout60_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(triggerin40[15]),
        .Q(triggerout60[15]),
        .R(1'b0));
  FDRE \triggerout60_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(triggerin40[16]),
        .Q(triggerout60[16]),
        .R(1'b0));
  FDRE \triggerout60_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(triggerin40[17]),
        .Q(triggerout60[17]),
        .R(1'b0));
  FDRE \triggerout60_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(triggerin40[18]),
        .Q(triggerout60[18]),
        .R(1'b0));
  FDRE \triggerout60_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(triggerin40[19]),
        .Q(triggerout60[19]),
        .R(1'b0));
  FDRE \triggerout60_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(triggerin40[1]),
        .Q(triggerout60[1]),
        .R(1'b0));
  FDRE \triggerout60_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(triggerin40[20]),
        .Q(triggerout60[20]),
        .R(1'b0));
  FDRE \triggerout60_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(triggerin40[21]),
        .Q(triggerout60[21]),
        .R(1'b0));
  FDRE \triggerout60_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(triggerin40[22]),
        .Q(triggerout60[22]),
        .R(1'b0));
  FDRE \triggerout60_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(triggerin40[23]),
        .Q(triggerout60[23]),
        .R(1'b0));
  FDRE \triggerout60_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(triggerin40[24]),
        .Q(triggerout60[24]),
        .R(1'b0));
  FDRE \triggerout60_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(triggerin40[25]),
        .Q(triggerout60[25]),
        .R(1'b0));
  FDRE \triggerout60_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(triggerin40[26]),
        .Q(triggerout60[26]),
        .R(1'b0));
  FDRE \triggerout60_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .D(triggerin40[27]),
        .Q(triggerout60[27]),
        .R(1'b0));
  FDRE \triggerout60_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .D(triggerin40[28]),
        .Q(triggerout60[28]),
        .R(1'b0));
  FDRE \triggerout60_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .D(triggerin40[29]),
        .Q(triggerout60[29]),
        .R(1'b0));
  FDRE \triggerout60_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(triggerin40[2]),
        .Q(triggerout60[2]),
        .R(1'b0));
  FDRE \triggerout60_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(triggerin40[30]),
        .Q(triggerout60[30]),
        .R(1'b0));
  FDRE \triggerout60_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(triggerin40[31]),
        .Q(triggerout60[31]),
        .R(1'b0));
  FDRE \triggerout60_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(triggerin40[3]),
        .Q(triggerout60[3]),
        .R(1'b0));
  FDRE \triggerout60_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(triggerin40[4]),
        .Q(triggerout60[4]),
        .R(1'b0));
  FDRE \triggerout60_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(triggerin40[5]),
        .Q(triggerout60[5]),
        .R(1'b0));
  FDRE \triggerout60_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(triggerin40[6]),
        .Q(triggerout60[6]),
        .R(1'b0));
  FDRE \triggerout60_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(triggerin40[7]),
        .Q(triggerout60[7]),
        .R(1'b0));
  FDRE \triggerout60_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(triggerin40[8]),
        .Q(triggerout60[8]),
        .R(1'b0));
  FDRE \triggerout60_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(triggerin40[9]),
        .Q(triggerout60[9]),
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
