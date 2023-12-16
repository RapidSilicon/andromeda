// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2023 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:ip:axis_switch:1.1
// IP Revision: 29

(* X_CORE_INFO = "axis_switch_v1_1_29_axis_switch,Vivado 2023.2" *)
(* CHECK_LICENSE_TYPE = "bd_d757_vfb_0_0_axisswitch,axis_switch_v1_1_29_axis_switch,{}" *)
(* CORE_GENERATION_INFO = "bd_d757_vfb_0_0_axisswitch,axis_switch_v1_1_29_axis_switch,{x_ipProduct=Vivado 2023.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=axis_switch,x_ipVersion=1.1,x_ipCoreRevision=29,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_FAMILY=kintexuplus,C_NUM_SI_SLOTS=1,C_LOG_SI_SLOTS=1,C_NUM_MI_SLOTS=16,C_AXIS_TDATA_WIDTH=32,C_AXIS_TID_WIDTH=1,C_AXIS_TDEST_WIDTH=4,C_AXIS_TUSER_WIDTH=96,C_AXIS_SIGNAL_SET=0b00000000000000000000000011011011,C_ARB_ON_MAX_XFERS=1,C_ARB_ON_NUM_CYCLES=0,C_ARB_ON_TLAST=0,C_INCLU\
DE_ARBITER=1,C_ARB_ALGORITHM=0,C_OUTPUT_REG=0,C_DECODER_REG=1,C_M_AXIS_CONNECTIVITY_ARRAY=0b1111111111111111,C_M_AXIS_BASETDEST_ARRAY=0b1111111011011100101110101001100001110110010101000011001000010000,C_M_AXIS_HIGHTDEST_ARRAY=0b1111111011011100101110101001100001110110010101000011001000010000,C_ROUTING_MODE=0,C_S_AXI_CTRL_ADDR_WIDTH=7,C_S_AXI_CTRL_DATA_WIDTH=32,C_COMMON_CLOCK=0}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module bd_d757_vfb_0_0_axisswitch (
  aclk,
  aresetn,
  s_axis_tvalid,
  s_axis_tready,
  s_axis_tdata,
  s_axis_tkeep,
  s_axis_tlast,
  s_axis_tdest,
  s_axis_tuser,
  m_axis_tvalid,
  m_axis_tready,
  m_axis_tdata,
  m_axis_tkeep,
  m_axis_tlast,
  m_axis_tdest,
  m_axis_tuser,
  s_decode_err
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLKIF, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLKIF CLK" *)
input wire aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RSTIF, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RSTIF RST" *)
input wire aresetn;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TVALID" *)
input wire [0 : 0] s_axis_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TREADY" *)
output wire [0 : 0] s_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TDATA" *)
input wire [31 : 0] s_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TKEEP" *)
input wire [3 : 0] s_axis_tkeep;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TLAST" *)
input wire [0 : 0] s_axis_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TDEST" *)
input wire [3 : 0] s_axis_tdest;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXIS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TUSER" *)
input wire [95 : 0] s_axis_tuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TVALID [0:0] [0:0], xilinx.com:interface:axis:1.0 M01_AXIS TVALID [0:0] [1:1], xilinx.com:interface:axis:1.0 M02_AXIS TVALID [0:0] [2:2], xilinx.com:interface:axis:1.0 M03_AXIS TVALID [0:0] [3:3], xilinx.com:interface:axis:1.0 M04_AXIS TVALID [0:0] [4:4], xilinx.com:interface:axis:1.0 M05_AXIS TVALID [0:0] [5:5], xilinx.com:interface:axis:1.0 M06_AXIS TVALID [0:0] [6:6], xilinx.com:interface:axis:1.0 M07_AXIS TVALID [0:0] [7:7], xilinx.com:interface:axis:1.\
0 M08_AXIS TVALID [0:0] [8:8], xilinx.com:interface:axis:1.0 M09_AXIS TVALID [0:0] [9:9], xilinx.com:interface:axis:1.0 M10_AXIS TVALID [0:0] [10:10], xilinx.com:interface:axis:1.0 M11_AXIS TVALID [0:0] [11:11], xilinx.com:interface:axis:1.0 M12_AXIS TVALID [0:0] [12:12], xilinx.com:interface:axis:1.0 M13_AXIS TVALID [0:0] [13:13], xilinx.com:interface:axis:1.0 M14_AXIS TVALID [0:0] [14:14], xilinx.com:interface:axis:1.0 M15_AXIS TVALID [0:0] [15:15]" *)
output wire [15 : 0] m_axis_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TREADY [0:0] [0:0], xilinx.com:interface:axis:1.0 M01_AXIS TREADY [0:0] [1:1], xilinx.com:interface:axis:1.0 M02_AXIS TREADY [0:0] [2:2], xilinx.com:interface:axis:1.0 M03_AXIS TREADY [0:0] [3:3], xilinx.com:interface:axis:1.0 M04_AXIS TREADY [0:0] [4:4], xilinx.com:interface:axis:1.0 M05_AXIS TREADY [0:0] [5:5], xilinx.com:interface:axis:1.0 M06_AXIS TREADY [0:0] [6:6], xilinx.com:interface:axis:1.0 M07_AXIS TREADY [0:0] [7:7], xilinx.com:interface:axis:1.\
0 M08_AXIS TREADY [0:0] [8:8], xilinx.com:interface:axis:1.0 M09_AXIS TREADY [0:0] [9:9], xilinx.com:interface:axis:1.0 M10_AXIS TREADY [0:0] [10:10], xilinx.com:interface:axis:1.0 M11_AXIS TREADY [0:0] [11:11], xilinx.com:interface:axis:1.0 M12_AXIS TREADY [0:0] [12:12], xilinx.com:interface:axis:1.0 M13_AXIS TREADY [0:0] [13:13], xilinx.com:interface:axis:1.0 M14_AXIS TREADY [0:0] [14:14], xilinx.com:interface:axis:1.0 M15_AXIS TREADY [0:0] [15:15]" *)
input wire [15 : 0] m_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TDATA [31:0] [31:0], xilinx.com:interface:axis:1.0 M01_AXIS TDATA [31:0] [63:32], xilinx.com:interface:axis:1.0 M02_AXIS TDATA [31:0] [95:64], xilinx.com:interface:axis:1.0 M03_AXIS TDATA [31:0] [127:96], xilinx.com:interface:axis:1.0 M04_AXIS TDATA [31:0] [159:128], xilinx.com:interface:axis:1.0 M05_AXIS TDATA [31:0] [191:160], xilinx.com:interface:axis:1.0 M06_AXIS TDATA [31:0] [223:192], xilinx.com:interface:axis:1.0 M07_AXIS TDATA [31:0] [255:224], xili\
nx.com:interface:axis:1.0 M08_AXIS TDATA [31:0] [287:256], xilinx.com:interface:axis:1.0 M09_AXIS TDATA [31:0] [319:288], xilinx.com:interface:axis:1.0 M10_AXIS TDATA [31:0] [351:320], xilinx.com:interface:axis:1.0 M11_AXIS TDATA [31:0] [383:352], xilinx.com:interface:axis:1.0 M12_AXIS TDATA [31:0] [415:384], xilinx.com:interface:axis:1.0 M13_AXIS TDATA [31:0] [447:416], xilinx.com:interface:axis:1.0 M14_AXIS TDATA [31:0] [479:448], xilinx.com:interface:axis:1.0 M15_AXIS TDATA [31:0] [511:480]" *)
output wire [511 : 0] m_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TKEEP [3:0] [3:0], xilinx.com:interface:axis:1.0 M01_AXIS TKEEP [3:0] [7:4], xilinx.com:interface:axis:1.0 M02_AXIS TKEEP [3:0] [11:8], xilinx.com:interface:axis:1.0 M03_AXIS TKEEP [3:0] [15:12], xilinx.com:interface:axis:1.0 M04_AXIS TKEEP [3:0] [19:16], xilinx.com:interface:axis:1.0 M05_AXIS TKEEP [3:0] [23:20], xilinx.com:interface:axis:1.0 M06_AXIS TKEEP [3:0] [27:24], xilinx.com:interface:axis:1.0 M07_AXIS TKEEP [3:0] [31:28], xilinx.com:interface:axis\
:1.0 M08_AXIS TKEEP [3:0] [35:32], xilinx.com:interface:axis:1.0 M09_AXIS TKEEP [3:0] [39:36], xilinx.com:interface:axis:1.0 M10_AXIS TKEEP [3:0] [43:40], xilinx.com:interface:axis:1.0 M11_AXIS TKEEP [3:0] [47:44], xilinx.com:interface:axis:1.0 M12_AXIS TKEEP [3:0] [51:48], xilinx.com:interface:axis:1.0 M13_AXIS TKEEP [3:0] [55:52], xilinx.com:interface:axis:1.0 M14_AXIS TKEEP [3:0] [59:56], xilinx.com:interface:axis:1.0 M15_AXIS TKEEP [3:0] [63:60]" *)
output wire [63 : 0] m_axis_tkeep;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TLAST [0:0] [0:0], xilinx.com:interface:axis:1.0 M01_AXIS TLAST [0:0] [1:1], xilinx.com:interface:axis:1.0 M02_AXIS TLAST [0:0] [2:2], xilinx.com:interface:axis:1.0 M03_AXIS TLAST [0:0] [3:3], xilinx.com:interface:axis:1.0 M04_AXIS TLAST [0:0] [4:4], xilinx.com:interface:axis:1.0 M05_AXIS TLAST [0:0] [5:5], xilinx.com:interface:axis:1.0 M06_AXIS TLAST [0:0] [6:6], xilinx.com:interface:axis:1.0 M07_AXIS TLAST [0:0] [7:7], xilinx.com:interface:axis:1.0 M08_AX\
IS TLAST [0:0] [8:8], xilinx.com:interface:axis:1.0 M09_AXIS TLAST [0:0] [9:9], xilinx.com:interface:axis:1.0 M10_AXIS TLAST [0:0] [10:10], xilinx.com:interface:axis:1.0 M11_AXIS TLAST [0:0] [11:11], xilinx.com:interface:axis:1.0 M12_AXIS TLAST [0:0] [12:12], xilinx.com:interface:axis:1.0 M13_AXIS TLAST [0:0] [13:13], xilinx.com:interface:axis:1.0 M14_AXIS TLAST [0:0] [14:14], xilinx.com:interface:axis:1.0 M15_AXIS TLAST [0:0] [15:15]" *)
output wire [15 : 0] m_axis_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TDEST [3:0] [3:0], xilinx.com:interface:axis:1.0 M01_AXIS TDEST [3:0] [7:4], xilinx.com:interface:axis:1.0 M02_AXIS TDEST [3:0] [11:8], xilinx.com:interface:axis:1.0 M03_AXIS TDEST [3:0] [15:12], xilinx.com:interface:axis:1.0 M04_AXIS TDEST [3:0] [19:16], xilinx.com:interface:axis:1.0 M05_AXIS TDEST [3:0] [23:20], xilinx.com:interface:axis:1.0 M06_AXIS TDEST [3:0] [27:24], xilinx.com:interface:axis:1.0 M07_AXIS TDEST [3:0] [31:28], xilinx.com:interface:axis\
:1.0 M08_AXIS TDEST [3:0] [35:32], xilinx.com:interface:axis:1.0 M09_AXIS TDEST [3:0] [39:36], xilinx.com:interface:axis:1.0 M10_AXIS TDEST [3:0] [43:40], xilinx.com:interface:axis:1.0 M11_AXIS TDEST [3:0] [47:44], xilinx.com:interface:axis:1.0 M12_AXIS TDEST [3:0] [51:48], xilinx.com:interface:axis:1.0 M13_AXIS TDEST [3:0] [55:52], xilinx.com:interface:axis:1.0 M14_AXIS TDEST [3:0] [59:56], xilinx.com:interface:axis:1.0 M15_AXIS TDEST [3:0] [63:60]" *)
output wire [63 : 0] m_axis_tdest;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M00_AXIS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0, XIL_INTERFACENAME M01_AXIS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0, XIL_INTERFACENAME M02_AXIS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUS\
ER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0, XIL_INTERFACENAME M03_AXIS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0, XIL_INTERFACENAME M04_AXIS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 10000\
0000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0, XIL_INTERFACENAME M05_AXIS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0, XIL_INTERFACENAME M06_AXIS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0, XIL_INTERFACENAME M07_A\
XIS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0, XIL_INTERFACENAME M08_AXIS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0, XIL_INTERFACENAME M09_AXIS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY \
1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0, XIL_INTERFACENAME M10_AXIS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0, XIL_INTERFACENAME M11_AXIS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERE\
D_METADATA undef, INSERT_VIP 0, XIL_INTERFACENAME M12_AXIS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0, XIL_INTERFACENAME M13_AXIS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0, XIL_INTERFACENAME M14_AXIS, TDATA_NUM_BYTES 1,\
 TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0, XIL_INTERFACENAME M15_AXIS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TUSER [95:0] [95:0], xilinx.com:interface:axis:1.0 M01_AXIS TUSER [95:0] [191:96], xilinx.com:interface:axis:1.0 M02_AXIS TUSER [95:0] [287:192], xilinx.com:interface:axis:1.0 M03_AXIS TUSER [95:0] [383:288], xilinx.com:interface:axis:1.0 M04_AXIS TUSER [95:0] [479:384], xilinx.com:interface:axis:1.0 M05_AXIS TUSER [95:0] [575:480], xilinx.com:interface:axis:1.0 M06_AXIS TUSER [95:0] [671:576], xilinx.com:interface:axis:1.0 M07_AXIS TUSER [95:0] [767:672], \
xilinx.com:interface:axis:1.0 M08_AXIS TUSER [95:0] [863:768], xilinx.com:interface:axis:1.0 M09_AXIS TUSER [95:0] [959:864], xilinx.com:interface:axis:1.0 M10_AXIS TUSER [95:0] [1055:960], xilinx.com:interface:axis:1.0 M11_AXIS TUSER [95:0] [1151:1056], xilinx.com:interface:axis:1.0 M12_AXIS TUSER [95:0] [1247:1152], xilinx.com:interface:axis:1.0 M13_AXIS TUSER [95:0] [1343:1248], xilinx.com:interface:axis:1.0 M14_AXIS TUSER [95:0] [1439:1344], xilinx.com:interface:axis:1.0 M15_AXIS TUSER [95:0\
] [1535:1440]" *)
output wire [1535 : 0] m_axis_tuser;
output wire [0 : 0] s_decode_err;

  axis_switch_v1_1_29_axis_switch #(
    .C_FAMILY("kintexuplus"),
    .C_NUM_SI_SLOTS(1),
    .C_LOG_SI_SLOTS(1),
    .C_NUM_MI_SLOTS(16),
    .C_AXIS_TDATA_WIDTH(32),
    .C_AXIS_TID_WIDTH(1),
    .C_AXIS_TDEST_WIDTH(4),
    .C_AXIS_TUSER_WIDTH(96),
    .C_AXIS_SIGNAL_SET(32'B00000000000000000000000011011011),
    .C_ARB_ON_MAX_XFERS(1),
    .C_ARB_ON_NUM_CYCLES(0),
    .C_ARB_ON_TLAST(0),
    .C_INCLUDE_ARBITER(1),
    .C_ARB_ALGORITHM(0),
    .C_OUTPUT_REG(0),
    .C_DECODER_REG(1),
    .C_M_AXIS_CONNECTIVITY_ARRAY(16'B1111111111111111),
    .C_M_AXIS_BASETDEST_ARRAY(64'B1111111011011100101110101001100001110110010101000011001000010000),
    .C_M_AXIS_HIGHTDEST_ARRAY(64'B1111111011011100101110101001100001110110010101000011001000010000),
    .C_ROUTING_MODE(0),
    .C_S_AXI_CTRL_ADDR_WIDTH(7),
    .C_S_AXI_CTRL_DATA_WIDTH(32),
    .C_COMMON_CLOCK(0)
  ) inst (
    .aclk(aclk),
    .aresetn(aresetn),
    .aclken(1'H1),
    .s_axis_tvalid(s_axis_tvalid),
    .s_axis_tready(s_axis_tready),
    .s_axis_tdata(s_axis_tdata),
    .s_axis_tstrb(4'HF),
    .s_axis_tkeep(s_axis_tkeep),
    .s_axis_tlast(s_axis_tlast),
    .s_axis_tid(1'H0),
    .s_axis_tdest(s_axis_tdest),
    .s_axis_tuser(s_axis_tuser),
    .m_axis_tvalid(m_axis_tvalid),
    .m_axis_tready(m_axis_tready),
    .m_axis_tdata(m_axis_tdata),
    .m_axis_tstrb(),
    .m_axis_tkeep(m_axis_tkeep),
    .m_axis_tlast(m_axis_tlast),
    .m_axis_tid(),
    .m_axis_tdest(m_axis_tdest),
    .m_axis_tuser(m_axis_tuser),
    .arb_req(),
    .arb_done(),
    .arb_gnt(16'H0000),
    .arb_sel(16'H0000),
    .arb_last(),
    .arb_id(),
    .arb_dest(),
    .arb_user(),
    .s_req_suppress(1'H0),
    .s_axi_ctrl_aclk(1'H0),
    .s_axi_ctrl_aresetn(1'H0),
    .s_axi_ctrl_awvalid(1'H0),
    .s_axi_ctrl_awready(),
    .s_axi_ctrl_awaddr(7'H00),
    .s_axi_ctrl_wvalid(1'H0),
    .s_axi_ctrl_wready(),
    .s_axi_ctrl_wdata(32'H00000000),
    .s_axi_ctrl_bvalid(),
    .s_axi_ctrl_bready(1'H0),
    .s_axi_ctrl_bresp(),
    .s_axi_ctrl_arvalid(1'H0),
    .s_axi_ctrl_arready(),
    .s_axi_ctrl_araddr(7'H00),
    .s_axi_ctrl_rvalid(),
    .s_axi_ctrl_rready(1'H0),
    .s_axi_ctrl_rdata(),
    .s_axi_ctrl_rresp(),
    .s_decode_err(s_decode_err)
  );
endmodule
