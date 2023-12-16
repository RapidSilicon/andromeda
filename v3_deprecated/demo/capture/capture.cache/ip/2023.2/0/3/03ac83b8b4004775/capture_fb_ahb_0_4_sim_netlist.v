// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Thu Oct 26 15:31:46 2023
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
    global_resetn);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET resetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN capture_clk_wiz_0_0_clk_out1, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 resetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input resetn;
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 global_resetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME global_resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) output global_resetn;

  wire \<const0> ;
  wire clk;
  wire global_resetn;
  wire i_axi_arready;
  wire i_axi_awready;
  wire [1:0]i_axi_bresp;
  wire i_axi_bvalid;
  wire [31:0]i_axi_rdata;
  wire [1:0]i_axi_rresp;
  wire i_axi_rvalid;
  wire i_axi_wready;
  wire resetn;
  wire [31:0]triggerin40;
  wire [31:0]wirein00;
  wire [31:0]wirein01;
  wire [31:0]wirein02;
  wire [31:0]wirein03;
  wire [31:0]wirein04;
  wire [31:0]wirein05;
  wire [3:0]\^wireout20 ;

  assign o_axi_araddr[31:0] = wirein02;
  assign o_axi_arprot[2:0] = wirein05[20:18];
  assign o_axi_arvalid = \^wireout20 [3];
  assign o_axi_awaddr[31:0] = wirein00;
  assign o_axi_awprot[2:0] = wirein03[20:18];
  assign o_axi_awvalid = \^wireout20 [0];
  assign o_axi_bready = triggerin40[2];
  assign o_axi_rready = triggerin40[4];
  assign o_axi_wdata[31:0] = wirein01;
  assign o_axi_wstrb[3:0] = wirein04[3:0];
  assign o_axi_wvalid = \^wireout20 [1];
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
  assign wireout20[4] = i_axi_rvalid;
  assign wireout20[3] = \^wireout20 [3];
  assign wireout20[2] = i_axi_bvalid;
  assign wireout20[1:0] = \^wireout20 [1:0];
  assign wireout21[31:0] = i_axi_rdata;
  assign wireout22[31] = \<const0> ;
  assign wireout22[30] = \<const0> ;
  assign wireout22[29] = \<const0> ;
  assign wireout22[28] = \<const0> ;
  assign wireout22[27] = \<const0> ;
  assign wireout22[26] = \<const0> ;
  assign wireout22[25] = \<const0> ;
  assign wireout22[24] = \<const0> ;
  assign wireout22[23] = \<const0> ;
  assign wireout22[22] = \<const0> ;
  assign wireout22[21] = \<const0> ;
  assign wireout22[20] = \<const0> ;
  assign wireout22[19] = \<const0> ;
  assign wireout22[18] = \<const0> ;
  assign wireout22[17] = \<const0> ;
  assign wireout22[16] = \<const0> ;
  assign wireout22[15] = \<const0> ;
  assign wireout22[14] = \<const0> ;
  assign wireout22[13] = \<const0> ;
  assign wireout22[12] = \<const0> ;
  assign wireout22[11] = \<const0> ;
  assign wireout22[10] = \<const0> ;
  assign wireout22[9] = \<const0> ;
  assign wireout22[8] = \<const0> ;
  assign wireout22[7] = \<const0> ;
  assign wireout22[6] = \<const0> ;
  assign wireout22[5] = \<const0> ;
  assign wireout22[4] = \<const0> ;
  assign wireout22[3] = \<const0> ;
  assign wireout22[2] = \<const0> ;
  assign wireout22[1:0] = i_axi_bresp;
  assign wireout23[31] = \<const0> ;
  assign wireout23[30] = \<const0> ;
  assign wireout23[29] = \<const0> ;
  assign wireout23[28] = \<const0> ;
  assign wireout23[27] = \<const0> ;
  assign wireout23[26] = \<const0> ;
  assign wireout23[25] = \<const0> ;
  assign wireout23[24] = \<const0> ;
  assign wireout23[23] = \<const0> ;
  assign wireout23[22] = \<const0> ;
  assign wireout23[21] = \<const0> ;
  assign wireout23[20] = \<const0> ;
  assign wireout23[19] = \<const0> ;
  assign wireout23[18] = \<const0> ;
  assign wireout23[17] = \<const0> ;
  assign wireout23[16] = \<const0> ;
  assign wireout23[15] = \<const0> ;
  assign wireout23[14] = \<const0> ;
  assign wireout23[13] = \<const0> ;
  assign wireout23[12] = \<const0> ;
  assign wireout23[11] = \<const0> ;
  assign wireout23[10] = \<const0> ;
  assign wireout23[9] = \<const0> ;
  assign wireout23[8] = \<const0> ;
  assign wireout23[7] = \<const0> ;
  assign wireout23[6] = \<const0> ;
  assign wireout23[5] = \<const0> ;
  assign wireout23[4] = \<const0> ;
  assign wireout23[3] = \<const0> ;
  assign wireout23[2] = \<const0> ;
  assign wireout23[1:0] = i_axi_rresp;
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fb_ahb inst
       (.clk(clk),
        .global_resetn(global_resetn),
        .i_axi_arready(i_axi_arready),
        .i_axi_awready(i_axi_awready),
        .i_axi_wready(i_axi_wready),
        .resetn(resetn),
        .triggerin40({triggerin40[5],triggerin40[3],triggerin40[1:0]}),
        .wireout20({\^wireout20 [3],\^wireout20 [1:0]}));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fb_ahb
   (wireout20,
    global_resetn,
    triggerin40,
    clk,
    i_axi_awready,
    i_axi_wready,
    i_axi_arready,
    resetn);
  output [2:0]wireout20;
  output global_resetn;
  input [3:0]triggerin40;
  input clk;
  input i_axi_awready;
  input i_axi_wready;
  input i_axi_arready;
  input resetn;

  wire clk;
  wire global_resetn;
  wire global_resetn_i_1_n_0;
  wire global_resetn_i_2_n_0;
  wire i_axi_arready;
  wire i_axi_awready;
  wire i_axi_wready;
  wire o_axi_arvalid_i_1_n_0;
  wire o_axi_awvalid_i_2_n_0;
  wire o_axi_wvalid_i_1_n_0;
  wire [7:0]p_0_in;
  wire p_0_in__0;
  wire rcnt;
  wire \rcnt[7]_i_3_n_0 ;
  wire [7:0]rcnt_reg;
  wire resetn;
  wire [3:0]triggerin40;
  wire [2:0]wireout20;

  LUT6 #(
    .INIT(64'h0000000000000100)) 
    global_resetn_i_1
       (.I0(global_resetn_i_2_n_0),
        .I1(rcnt_reg[4]),
        .I2(rcnt_reg[3]),
        .I3(rcnt_reg[2]),
        .I4(rcnt_reg[7]),
        .I5(triggerin40[3]),
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
  LUT3 #(
    .INIT(8'hBA)) 
    o_axi_arvalid_i_1
       (.I0(triggerin40[2]),
        .I1(i_axi_arready),
        .I2(wireout20[2]),
        .O(o_axi_arvalid_i_1_n_0));
  FDRE o_axi_arvalid_reg
       (.C(clk),
        .CE(1'b1),
        .D(o_axi_arvalid_i_1_n_0),
        .Q(wireout20[2]),
        .R(p_0_in__0));
  LUT1 #(
    .INIT(2'h1)) 
    o_axi_awvalid_i_1
       (.I0(resetn),
        .O(p_0_in__0));
  LUT3 #(
    .INIT(8'hBA)) 
    o_axi_awvalid_i_2
       (.I0(triggerin40[0]),
        .I1(i_axi_awready),
        .I2(wireout20[0]),
        .O(o_axi_awvalid_i_2_n_0));
  FDRE o_axi_awvalid_reg
       (.C(clk),
        .CE(1'b1),
        .D(o_axi_awvalid_i_2_n_0),
        .Q(wireout20[0]),
        .R(p_0_in__0));
  LUT3 #(
    .INIT(8'hBA)) 
    o_axi_wvalid_i_1
       (.I0(triggerin40[1]),
        .I1(i_axi_wready),
        .I2(wireout20[1]),
        .O(o_axi_wvalid_i_1_n_0));
  FDRE o_axi_wvalid_reg
       (.C(clk),
        .CE(1'b1),
        .D(o_axi_wvalid_i_1_n_0),
        .Q(wireout20[1]),
        .R(p_0_in__0));
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
        .R(triggerin40[3]));
  FDRE \rcnt_reg[1] 
       (.C(clk),
        .CE(rcnt),
        .D(p_0_in[1]),
        .Q(rcnt_reg[1]),
        .R(triggerin40[3]));
  FDRE \rcnt_reg[2] 
       (.C(clk),
        .CE(rcnt),
        .D(p_0_in[2]),
        .Q(rcnt_reg[2]),
        .R(triggerin40[3]));
  FDRE \rcnt_reg[3] 
       (.C(clk),
        .CE(rcnt),
        .D(p_0_in[3]),
        .Q(rcnt_reg[3]),
        .R(triggerin40[3]));
  FDRE \rcnt_reg[4] 
       (.C(clk),
        .CE(rcnt),
        .D(p_0_in[4]),
        .Q(rcnt_reg[4]),
        .R(triggerin40[3]));
  FDRE \rcnt_reg[5] 
       (.C(clk),
        .CE(rcnt),
        .D(p_0_in[5]),
        .Q(rcnt_reg[5]),
        .R(triggerin40[3]));
  FDRE \rcnt_reg[6] 
       (.C(clk),
        .CE(rcnt),
        .D(p_0_in[6]),
        .Q(rcnt_reg[6]),
        .R(triggerin40[3]));
  FDRE \rcnt_reg[7] 
       (.C(clk),
        .CE(rcnt),
        .D(p_0_in[7]),
        .Q(rcnt_reg[7]),
        .R(triggerin40[3]));
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
