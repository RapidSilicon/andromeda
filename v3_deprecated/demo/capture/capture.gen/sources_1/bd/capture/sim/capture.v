//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
//Date        : Mon Dec  4 15:40:55 2023
//Host        : LAPTOP-FEFLDCST running 64-bit major release  (build 9200)
//Command     : generate_target capture.bd
//Design      : capture
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "capture,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=capture,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=11,numReposBlks=11,numNonXlnxBlks=2,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=1,da_board_cnt=4,da_clkrst_cnt=3,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "capture.hwdef" *) 
module capture
   (board_leds_led_out,
    fixed_fabric_100mhz_clk_n,
    fixed_fabric_100mhz_clk_p,
    host_interface_okaa,
    host_interface_okhu,
    host_interface_okuh,
    host_interface_okuhu,
    mipi_phy_if_clk_n,
    mipi_phy_if_clk_p,
    mipi_phy_if_data_n,
    mipi_phy_if_data_p,
    szg_port_a_cam1_iic_scl_i,
    szg_port_a_cam1_iic_scl_o,
    szg_port_a_cam1_iic_scl_t,
    szg_port_a_cam1_iic_sda_i,
    szg_port_a_cam1_iic_sda_o,
    szg_port_a_cam1_iic_sda_t,
    szg_port_a_cam1_reset_tri_o);
  (* X_INTERFACE_INFO = "opalkelly.com:interface:led:1.0 board_leds LED_OUT" *) output [5:0]board_leds_led_out;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 fixed_fabric_100mhz CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME fixed_fabric_100mhz, CAN_DEBUG false, FREQ_HZ 100000000" *) input fixed_fabric_100mhz_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 fixed_fabric_100mhz CLK_P" *) input fixed_fabric_100mhz_clk_p;
  (* X_INTERFACE_INFO = "opalkelly.com:interface:host_interface:1.0 host_interface okAA" *) inout host_interface_okaa;
  (* X_INTERFACE_INFO = "opalkelly.com:interface:host_interface:1.0 host_interface okHU" *) output [2:0]host_interface_okhu;
  (* X_INTERFACE_INFO = "opalkelly.com:interface:host_interface:1.0 host_interface okUH" *) input [4:0]host_interface_okuh;
  (* X_INTERFACE_INFO = "opalkelly.com:interface:host_interface:1.0 host_interface okUHU" *) inout [31:0]host_interface_okuhu;
  (* X_INTERFACE_INFO = "xilinx.com:interface:mipi_phy:1.0 mipi_phy_if CLK_N" *) input mipi_phy_if_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:mipi_phy:1.0 mipi_phy_if CLK_P" *) input mipi_phy_if_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:mipi_phy:1.0 mipi_phy_if DATA_N" *) input [1:0]mipi_phy_if_data_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:mipi_phy:1.0 mipi_phy_if DATA_P" *) input [1:0]mipi_phy_if_data_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 szg_port_a_cam1_iic SCL_I" *) input szg_port_a_cam1_iic_scl_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 szg_port_a_cam1_iic SCL_O" *) output szg_port_a_cam1_iic_scl_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 szg_port_a_cam1_iic SCL_T" *) output szg_port_a_cam1_iic_scl_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 szg_port_a_cam1_iic SDA_I" *) input szg_port_a_cam1_iic_sda_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 szg_port_a_cam1_iic SDA_O" *) output szg_port_a_cam1_iic_sda_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 szg_port_a_cam1_iic SDA_T" *) output szg_port_a_cam1_iic_sda_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 szg_port_a_cam1_reset TRI_O" *) output szg_port_a_cam1_reset_tri_o;

  wire [31:0]Net;
  wire [0:0]Net1;
  wire [31:0]axi_crossbar_0_M00_AXI_ARADDR;
  wire axi_crossbar_0_M00_AXI_ARREADY;
  wire [0:0]axi_crossbar_0_M00_AXI_ARVALID;
  wire [31:0]axi_crossbar_0_M00_AXI_AWADDR;
  wire axi_crossbar_0_M00_AXI_AWREADY;
  wire [0:0]axi_crossbar_0_M00_AXI_AWVALID;
  wire [0:0]axi_crossbar_0_M00_AXI_BREADY;
  wire [1:0]axi_crossbar_0_M00_AXI_BRESP;
  wire axi_crossbar_0_M00_AXI_BVALID;
  wire [31:0]axi_crossbar_0_M00_AXI_RDATA;
  wire [0:0]axi_crossbar_0_M00_AXI_RREADY;
  wire [1:0]axi_crossbar_0_M00_AXI_RRESP;
  wire axi_crossbar_0_M00_AXI_RVALID;
  wire [31:0]axi_crossbar_0_M00_AXI_WDATA;
  wire axi_crossbar_0_M00_AXI_WREADY;
  wire [3:0]axi_crossbar_0_M00_AXI_WSTRB;
  wire [0:0]axi_crossbar_0_M00_AXI_WVALID;
  wire [63:32]axi_crossbar_0_M01_AXI_ARADDR;
  wire axi_crossbar_0_M01_AXI_ARREADY;
  wire [1:1]axi_crossbar_0_M01_AXI_ARVALID;
  wire [63:32]axi_crossbar_0_M01_AXI_AWADDR;
  wire axi_crossbar_0_M01_AXI_AWREADY;
  wire [1:1]axi_crossbar_0_M01_AXI_AWVALID;
  wire [1:1]axi_crossbar_0_M01_AXI_BREADY;
  wire [1:0]axi_crossbar_0_M01_AXI_BRESP;
  wire axi_crossbar_0_M01_AXI_BVALID;
  wire [31:0]axi_crossbar_0_M01_AXI_RDATA;
  wire [1:1]axi_crossbar_0_M01_AXI_RREADY;
  wire [1:0]axi_crossbar_0_M01_AXI_RRESP;
  wire axi_crossbar_0_M01_AXI_RVALID;
  wire [63:32]axi_crossbar_0_M01_AXI_WDATA;
  wire axi_crossbar_0_M01_AXI_WREADY;
  wire [7:4]axi_crossbar_0_M01_AXI_WSTRB;
  wire [1:1]axi_crossbar_0_M01_AXI_WVALID;
  wire [95:64]axi_crossbar_0_M02_AXI_ARADDR;
  wire [8:6]axi_crossbar_0_M02_AXI_ARPROT;
  wire [0:0]axi_crossbar_0_M02_AXI_ARREADY;
  wire [2:2]axi_crossbar_0_M02_AXI_ARVALID;
  wire [95:64]axi_crossbar_0_M02_AXI_AWADDR;
  wire [8:6]axi_crossbar_0_M02_AXI_AWPROT;
  wire [0:0]axi_crossbar_0_M02_AXI_AWREADY;
  wire [2:2]axi_crossbar_0_M02_AXI_AWVALID;
  wire [2:2]axi_crossbar_0_M02_AXI_BREADY;
  wire [1:0]axi_crossbar_0_M02_AXI_BRESP;
  wire [0:0]axi_crossbar_0_M02_AXI_BVALID;
  wire [31:0]axi_crossbar_0_M02_AXI_RDATA;
  wire [2:2]axi_crossbar_0_M02_AXI_RREADY;
  wire [1:0]axi_crossbar_0_M02_AXI_RRESP;
  wire [0:0]axi_crossbar_0_M02_AXI_RVALID;
  wire [95:64]axi_crossbar_0_M02_AXI_WDATA;
  wire [0:0]axi_crossbar_0_M02_AXI_WREADY;
  wire [11:8]axi_crossbar_0_M02_AXI_WSTRB;
  wire [2:2]axi_crossbar_0_M02_AXI_WVALID;
  wire [0:0]axi_crossbar_0_s_axi_arready;
  wire [0:0]axi_crossbar_0_s_axi_awready;
  wire [1:0]axi_crossbar_0_s_axi_bresp;
  wire [0:0]axi_crossbar_0_s_axi_bvalid;
  wire [31:0]axi_crossbar_0_s_axi_rdata;
  wire [1:0]axi_crossbar_0_s_axi_rresp;
  wire [0:0]axi_crossbar_0_s_axi_rvalid;
  wire [0:0]axi_crossbar_0_s_axi_wready;
  wire [0:0]axi_gpio_0_GPIO2_TRI_O;
  wire [5:0]axi_gpio_0_gpio_io_o;
  wire axi_iic_0_IIC_SCL_I;
  wire axi_iic_0_IIC_SCL_O;
  wire axi_iic_0_IIC_SCL_T;
  wire axi_iic_0_IIC_SDA_I;
  wire axi_iic_0_IIC_SDA_O;
  wire axi_iic_0_IIC_SDA_T;
  wire clk_wiz_0_clk_out2;
  wire [0:0]fb_ahb_0_global_resetn;
  wire fb_ahb_0_global_resetn1;
  wire [31:0]fb_ahb_0_o_axi_araddr;
  wire [2:0]fb_ahb_0_o_axi_arprot;
  wire fb_ahb_0_o_axi_arvalid;
  wire [31:0]fb_ahb_0_o_axi_awaddr;
  wire [2:0]fb_ahb_0_o_axi_awprot;
  wire fb_ahb_0_o_axi_awvalid;
  wire fb_ahb_0_o_axi_bready;
  wire fb_ahb_0_o_axi_rready;
  wire [31:0]fb_ahb_0_o_axi_wdata;
  wire [3:0]fb_ahb_0_o_axi_wstrb;
  wire fb_ahb_0_o_axi_wvalid;
  wire [31:0]fb_ahb_0_wireout20;
  wire [31:0]fb_ahb_0_wireout21;
  wire [31:0]fb_ahb_0_wireout22;
  wire [31:0]fb_ahb_0_wireout23;
  wire fifo_generator_0_prog_empty;
  wire fixed_fabric_100mhz_1_CLK_N;
  wire fixed_fabric_100mhz_1_CLK_P;
  wire frontpanel_0_btpoa0_ep_read;
  wire frontpanel_0_okClk;
  wire [31:0]frontpanel_0_ti40_ep_trigger;
  wire [31:0]frontpanel_0_wi00_ep_dataout;
  wire [31:0]frontpanel_0_wi01_ep_dataout;
  wire [31:0]frontpanel_0_wi02_ep_dataout;
  wire [31:0]frontpanel_0_wi03_ep_dataout;
  wire [31:0]frontpanel_0_wi04_ep_dataout;
  wire [31:0]frontpanel_0_wi05_ep_dataout;
  wire host_interface_1_okAA;
  wire [2:0]host_interface_1_okHU;
  wire [4:0]host_interface_1_okUH;
  wire [31:0]host_interface_1_okUHU;
  wire [5:0]leds_0_led_out_LED_OUT;
  wire [31:0]mipi_csi2_rx_subsyst_0_video_out_tdata;
  wire mipi_csi2_rx_subsyst_0_video_out_tvalid;
  wire mipi_phy_if_1_CLK_N;
  wire mipi_phy_if_1_CLK_P;
  wire [1:0]mipi_phy_if_1_DATA_N;
  wire [1:0]mipi_phy_if_1_DATA_P;
  wire [0:0]proc_sys_reset_0_peripheral_reset;
  wire [8:0]NLW_axi_crossbar_0_m_axi_arprot_UNCONNECTED;
  wire [8:0]NLW_axi_crossbar_0_m_axi_awprot_UNCONNECTED;

  assign axi_iic_0_IIC_SCL_I = szg_port_a_cam1_iic_scl_i;
  assign axi_iic_0_IIC_SDA_I = szg_port_a_cam1_iic_sda_i;
  assign board_leds_led_out[5:0] = leds_0_led_out_LED_OUT;
  assign fixed_fabric_100mhz_1_CLK_N = fixed_fabric_100mhz_clk_n;
  assign fixed_fabric_100mhz_1_CLK_P = fixed_fabric_100mhz_clk_p;
  assign host_interface_1_okUH = host_interface_okuh[4:0];
  assign host_interface_okhu[2:0] = host_interface_1_okHU;
  assign mipi_phy_if_1_CLK_N = mipi_phy_if_clk_n;
  assign mipi_phy_if_1_CLK_P = mipi_phy_if_clk_p;
  assign mipi_phy_if_1_DATA_N = mipi_phy_if_data_n[1:0];
  assign mipi_phy_if_1_DATA_P = mipi_phy_if_data_p[1:0];
  assign szg_port_a_cam1_iic_scl_o = axi_iic_0_IIC_SCL_O;
  assign szg_port_a_cam1_iic_scl_t = axi_iic_0_IIC_SCL_T;
  assign szg_port_a_cam1_iic_sda_o = axi_iic_0_IIC_SDA_O;
  assign szg_port_a_cam1_iic_sda_t = axi_iic_0_IIC_SDA_T;
  assign szg_port_a_cam1_reset_tri_o = axi_gpio_0_GPIO2_TRI_O;
  capture_axi_crossbar_0_0 axi_crossbar_0
       (.aclk(frontpanel_0_okClk),
        .aresetn(fb_ahb_0_global_resetn),
        .m_axi_araddr({axi_crossbar_0_M02_AXI_ARADDR,axi_crossbar_0_M01_AXI_ARADDR,axi_crossbar_0_M00_AXI_ARADDR}),
        .m_axi_arprot({axi_crossbar_0_M02_AXI_ARPROT,NLW_axi_crossbar_0_m_axi_arprot_UNCONNECTED[5:0]}),
        .m_axi_arready({axi_crossbar_0_M02_AXI_ARREADY,axi_crossbar_0_M01_AXI_ARREADY,axi_crossbar_0_M00_AXI_ARREADY}),
        .m_axi_arvalid({axi_crossbar_0_M02_AXI_ARVALID,axi_crossbar_0_M01_AXI_ARVALID,axi_crossbar_0_M00_AXI_ARVALID}),
        .m_axi_awaddr({axi_crossbar_0_M02_AXI_AWADDR,axi_crossbar_0_M01_AXI_AWADDR,axi_crossbar_0_M00_AXI_AWADDR}),
        .m_axi_awprot({axi_crossbar_0_M02_AXI_AWPROT,NLW_axi_crossbar_0_m_axi_awprot_UNCONNECTED[5:0]}),
        .m_axi_awready({axi_crossbar_0_M02_AXI_AWREADY,axi_crossbar_0_M01_AXI_AWREADY,axi_crossbar_0_M00_AXI_AWREADY}),
        .m_axi_awvalid({axi_crossbar_0_M02_AXI_AWVALID,axi_crossbar_0_M01_AXI_AWVALID,axi_crossbar_0_M00_AXI_AWVALID}),
        .m_axi_bready({axi_crossbar_0_M02_AXI_BREADY,axi_crossbar_0_M01_AXI_BREADY,axi_crossbar_0_M00_AXI_BREADY}),
        .m_axi_bresp({axi_crossbar_0_M02_AXI_BRESP,axi_crossbar_0_M01_AXI_BRESP,axi_crossbar_0_M00_AXI_BRESP}),
        .m_axi_bvalid({axi_crossbar_0_M02_AXI_BVALID,axi_crossbar_0_M01_AXI_BVALID,axi_crossbar_0_M00_AXI_BVALID}),
        .m_axi_rdata({axi_crossbar_0_M02_AXI_RDATA,axi_crossbar_0_M01_AXI_RDATA,axi_crossbar_0_M00_AXI_RDATA}),
        .m_axi_rready({axi_crossbar_0_M02_AXI_RREADY,axi_crossbar_0_M01_AXI_RREADY,axi_crossbar_0_M00_AXI_RREADY}),
        .m_axi_rresp({axi_crossbar_0_M02_AXI_RRESP,axi_crossbar_0_M01_AXI_RRESP,axi_crossbar_0_M00_AXI_RRESP}),
        .m_axi_rvalid({axi_crossbar_0_M02_AXI_RVALID,axi_crossbar_0_M01_AXI_RVALID,axi_crossbar_0_M00_AXI_RVALID}),
        .m_axi_wdata({axi_crossbar_0_M02_AXI_WDATA,axi_crossbar_0_M01_AXI_WDATA,axi_crossbar_0_M00_AXI_WDATA}),
        .m_axi_wready({axi_crossbar_0_M02_AXI_WREADY,axi_crossbar_0_M01_AXI_WREADY,axi_crossbar_0_M00_AXI_WREADY}),
        .m_axi_wstrb({axi_crossbar_0_M02_AXI_WSTRB,axi_crossbar_0_M01_AXI_WSTRB,axi_crossbar_0_M00_AXI_WSTRB}),
        .m_axi_wvalid({axi_crossbar_0_M02_AXI_WVALID,axi_crossbar_0_M01_AXI_WVALID,axi_crossbar_0_M00_AXI_WVALID}),
        .s_axi_araddr(fb_ahb_0_o_axi_araddr),
        .s_axi_arprot(fb_ahb_0_o_axi_arprot),
        .s_axi_arready(axi_crossbar_0_s_axi_arready),
        .s_axi_arvalid(fb_ahb_0_o_axi_arvalid),
        .s_axi_awaddr(fb_ahb_0_o_axi_awaddr),
        .s_axi_awprot(fb_ahb_0_o_axi_awprot),
        .s_axi_awready(axi_crossbar_0_s_axi_awready),
        .s_axi_awvalid(fb_ahb_0_o_axi_awvalid),
        .s_axi_bready(fb_ahb_0_o_axi_bready),
        .s_axi_bresp(axi_crossbar_0_s_axi_bresp),
        .s_axi_bvalid(axi_crossbar_0_s_axi_bvalid),
        .s_axi_rdata(axi_crossbar_0_s_axi_rdata),
        .s_axi_rready(fb_ahb_0_o_axi_rready),
        .s_axi_rresp(axi_crossbar_0_s_axi_rresp),
        .s_axi_rvalid(axi_crossbar_0_s_axi_rvalid),
        .s_axi_wdata(fb_ahb_0_o_axi_wdata),
        .s_axi_wready(axi_crossbar_0_s_axi_wready),
        .s_axi_wstrb(fb_ahb_0_o_axi_wstrb),
        .s_axi_wvalid(fb_ahb_0_o_axi_wvalid));
  capture_axi_gpio_0_0 axi_gpio_0
       (.gpio2_io_o(axi_gpio_0_GPIO2_TRI_O),
        .gpio_io_o(axi_gpio_0_gpio_io_o),
        .s_axi_aclk(frontpanel_0_okClk),
        .s_axi_araddr(axi_crossbar_0_M00_AXI_ARADDR[8:0]),
        .s_axi_aresetn(fb_ahb_0_global_resetn),
        .s_axi_arready(axi_crossbar_0_M00_AXI_ARREADY),
        .s_axi_arvalid(axi_crossbar_0_M00_AXI_ARVALID),
        .s_axi_awaddr(axi_crossbar_0_M00_AXI_AWADDR[8:0]),
        .s_axi_awready(axi_crossbar_0_M00_AXI_AWREADY),
        .s_axi_awvalid(axi_crossbar_0_M00_AXI_AWVALID),
        .s_axi_bready(axi_crossbar_0_M00_AXI_BREADY),
        .s_axi_bresp(axi_crossbar_0_M00_AXI_BRESP),
        .s_axi_bvalid(axi_crossbar_0_M00_AXI_BVALID),
        .s_axi_rdata(axi_crossbar_0_M00_AXI_RDATA),
        .s_axi_rready(axi_crossbar_0_M00_AXI_RREADY),
        .s_axi_rresp(axi_crossbar_0_M00_AXI_RRESP),
        .s_axi_rvalid(axi_crossbar_0_M00_AXI_RVALID),
        .s_axi_wdata(axi_crossbar_0_M00_AXI_WDATA),
        .s_axi_wready(axi_crossbar_0_M00_AXI_WREADY),
        .s_axi_wstrb(axi_crossbar_0_M00_AXI_WSTRB),
        .s_axi_wvalid(axi_crossbar_0_M00_AXI_WVALID));
  capture_axi_iic_0_0 axi_iic_0
       (.s_axi_aclk(frontpanel_0_okClk),
        .s_axi_araddr(axi_crossbar_0_M01_AXI_ARADDR[40:32]),
        .s_axi_aresetn(fb_ahb_0_global_resetn),
        .s_axi_arready(axi_crossbar_0_M01_AXI_ARREADY),
        .s_axi_arvalid(axi_crossbar_0_M01_AXI_ARVALID),
        .s_axi_awaddr(axi_crossbar_0_M01_AXI_AWADDR[40:32]),
        .s_axi_awready(axi_crossbar_0_M01_AXI_AWREADY),
        .s_axi_awvalid(axi_crossbar_0_M01_AXI_AWVALID),
        .s_axi_bready(axi_crossbar_0_M01_AXI_BREADY),
        .s_axi_bresp(axi_crossbar_0_M01_AXI_BRESP),
        .s_axi_bvalid(axi_crossbar_0_M01_AXI_BVALID),
        .s_axi_rdata(axi_crossbar_0_M01_AXI_RDATA),
        .s_axi_rready(axi_crossbar_0_M01_AXI_RREADY),
        .s_axi_rresp(axi_crossbar_0_M01_AXI_RRESP),
        .s_axi_rvalid(axi_crossbar_0_M01_AXI_RVALID),
        .s_axi_wdata(axi_crossbar_0_M01_AXI_WDATA),
        .s_axi_wready(axi_crossbar_0_M01_AXI_WREADY),
        .s_axi_wstrb(axi_crossbar_0_M01_AXI_WSTRB),
        .s_axi_wvalid(axi_crossbar_0_M01_AXI_WVALID),
        .scl_i(axi_iic_0_IIC_SCL_I),
        .scl_o(axi_iic_0_IIC_SCL_O),
        .scl_t(axi_iic_0_IIC_SCL_T),
        .sda_i(axi_iic_0_IIC_SDA_I),
        .sda_o(axi_iic_0_IIC_SDA_O),
        .sda_t(axi_iic_0_IIC_SDA_T));
  capture_clk_wiz_0_0 clk_wiz_0
       (.clk_in1_n(fixed_fabric_100mhz_1_CLK_N),
        .clk_in1_p(fixed_fabric_100mhz_1_CLK_P),
        .clk_out1(frontpanel_0_okClk),
        .clk_out2(clk_wiz_0_clk_out2));
  capture_fb_ahb_0_4 fb_ahb_0
       (.clk(frontpanel_0_okClk),
        .global_resetn(fb_ahb_0_global_resetn1),
        .i_axi_arready(axi_crossbar_0_s_axi_arready),
        .i_axi_awready(axi_crossbar_0_s_axi_awready),
        .i_axi_bresp(axi_crossbar_0_s_axi_bresp),
        .i_axi_bvalid(axi_crossbar_0_s_axi_bvalid),
        .i_axi_rdata(axi_crossbar_0_s_axi_rdata),
        .i_axi_rresp(axi_crossbar_0_s_axi_rresp),
        .i_axi_rvalid(axi_crossbar_0_s_axi_rvalid),
        .i_axi_wready(axi_crossbar_0_s_axi_wready),
        .o_axi_araddr(fb_ahb_0_o_axi_araddr),
        .o_axi_arprot(fb_ahb_0_o_axi_arprot),
        .o_axi_arvalid(fb_ahb_0_o_axi_arvalid),
        .o_axi_awaddr(fb_ahb_0_o_axi_awaddr),
        .o_axi_awprot(fb_ahb_0_o_axi_awprot),
        .o_axi_awvalid(fb_ahb_0_o_axi_awvalid),
        .o_axi_bready(fb_ahb_0_o_axi_bready),
        .o_axi_rready(fb_ahb_0_o_axi_rready),
        .o_axi_wdata(fb_ahb_0_o_axi_wdata),
        .o_axi_wstrb(fb_ahb_0_o_axi_wstrb),
        .o_axi_wvalid(fb_ahb_0_o_axi_wvalid),
        .resetn(fb_ahb_0_global_resetn),
        .triggerin40(frontpanel_0_ti40_ep_trigger),
        .wirein00(frontpanel_0_wi00_ep_dataout),
        .wirein01(frontpanel_0_wi01_ep_dataout),
        .wirein02(frontpanel_0_wi02_ep_dataout),
        .wirein03(frontpanel_0_wi03_ep_dataout),
        .wirein04(frontpanel_0_wi04_ep_dataout),
        .wirein05(frontpanel_0_wi05_ep_dataout),
        .wireout20(fb_ahb_0_wireout20),
        .wireout21(fb_ahb_0_wireout21),
        .wireout22(fb_ahb_0_wireout22),
        .wireout23(fb_ahb_0_wireout23));
  capture_fifo_generator_0_0 fifo_generator_0
       (.clk(frontpanel_0_okClk),
        .din(mipi_csi2_rx_subsyst_0_video_out_tdata),
        .dout(Net),
        .prog_empty(fifo_generator_0_prog_empty),
        .rd_en(frontpanel_0_btpoa0_ep_read),
        .srst(proc_sys_reset_0_peripheral_reset),
        .wr_en(mipi_csi2_rx_subsyst_0_video_out_tvalid));
  capture_frontpanel_0_0 frontpanel_0
       (.btpoa0_ep_datain(Net),
        .btpoa0_ep_read(frontpanel_0_btpoa0_ep_read),
        .btpoa0_ep_ready(fifo_generator_0_prog_empty),
        .okAA(host_interface_okaa),
        .okHU(host_interface_1_okHU),
        .okUH(host_interface_1_okUH),
        .okUHU(host_interface_okuhu[31:0]),
        .ti40_ep_clk(frontpanel_0_okClk),
        .ti40_ep_trigger(frontpanel_0_ti40_ep_trigger),
        .wi00_ep_dataout(frontpanel_0_wi00_ep_dataout),
        .wi01_ep_dataout(frontpanel_0_wi01_ep_dataout),
        .wi02_ep_dataout(frontpanel_0_wi02_ep_dataout),
        .wi03_ep_dataout(frontpanel_0_wi03_ep_dataout),
        .wi04_ep_dataout(frontpanel_0_wi04_ep_dataout),
        .wi05_ep_dataout(frontpanel_0_wi05_ep_dataout),
        .wo20_ep_datain(fb_ahb_0_wireout20),
        .wo21_ep_datain(fb_ahb_0_wireout21),
        .wo22_ep_datain(fb_ahb_0_wireout22),
        .wo23_ep_datain(fb_ahb_0_wireout23));
  capture_leds_0_0 leds_0
       (.led_in(axi_gpio_0_gpio_io_o),
        .led_out(leds_0_led_out_LED_OUT));
  capture_mipi_csi2_rx_subsyst_0_0 mipi_csi2_rx_subsyst_0
       (.csirxss_s_axi_araddr(axi_crossbar_0_M02_AXI_ARADDR[76:64]),
        .csirxss_s_axi_arprot(axi_crossbar_0_M02_AXI_ARPROT),
        .csirxss_s_axi_arready(axi_crossbar_0_M02_AXI_ARREADY),
        .csirxss_s_axi_arvalid(axi_crossbar_0_M02_AXI_ARVALID),
        .csirxss_s_axi_awaddr(axi_crossbar_0_M02_AXI_AWADDR[76:64]),
        .csirxss_s_axi_awprot(axi_crossbar_0_M02_AXI_AWPROT),
        .csirxss_s_axi_awready(axi_crossbar_0_M02_AXI_AWREADY),
        .csirxss_s_axi_awvalid(axi_crossbar_0_M02_AXI_AWVALID),
        .csirxss_s_axi_bready(axi_crossbar_0_M02_AXI_BREADY),
        .csirxss_s_axi_bresp(axi_crossbar_0_M02_AXI_BRESP),
        .csirxss_s_axi_bvalid(axi_crossbar_0_M02_AXI_BVALID),
        .csirxss_s_axi_rdata(axi_crossbar_0_M02_AXI_RDATA),
        .csirxss_s_axi_rready(axi_crossbar_0_M02_AXI_RREADY),
        .csirxss_s_axi_rresp(axi_crossbar_0_M02_AXI_RRESP),
        .csirxss_s_axi_rvalid(axi_crossbar_0_M02_AXI_RVALID),
        .csirxss_s_axi_wdata(axi_crossbar_0_M02_AXI_WDATA),
        .csirxss_s_axi_wready(axi_crossbar_0_M02_AXI_WREADY),
        .csirxss_s_axi_wstrb(axi_crossbar_0_M02_AXI_WSTRB),
        .csirxss_s_axi_wvalid(axi_crossbar_0_M02_AXI_WVALID),
        .dphy_clk_200M(clk_wiz_0_clk_out2),
        .emb_nonimg_tready(Net1),
        .lite_aclk(frontpanel_0_okClk),
        .lite_aresetn(fb_ahb_0_global_resetn),
        .mipi_phy_if_clk_n(mipi_phy_if_1_CLK_N),
        .mipi_phy_if_clk_p(mipi_phy_if_1_CLK_P),
        .mipi_phy_if_data_n(mipi_phy_if_1_DATA_N),
        .mipi_phy_if_data_p(mipi_phy_if_1_DATA_P),
        .video_aclk(frontpanel_0_okClk),
        .video_aresetn(fb_ahb_0_global_resetn),
        .video_out_tdata(mipi_csi2_rx_subsyst_0_video_out_tdata),
        .video_out_tready(Net1),
        .video_out_tvalid(mipi_csi2_rx_subsyst_0_video_out_tvalid));
  capture_proc_sys_reset_0_1 proc_sys_reset_0
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(fb_ahb_0_global_resetn1),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(fb_ahb_0_global_resetn),
        .peripheral_reset(proc_sys_reset_0_peripheral_reset),
        .slowest_sync_clk(frontpanel_0_okClk));
  capture_xlconstant_0_0 xlconstant_0
       (.dout(Net1));
endmodule
