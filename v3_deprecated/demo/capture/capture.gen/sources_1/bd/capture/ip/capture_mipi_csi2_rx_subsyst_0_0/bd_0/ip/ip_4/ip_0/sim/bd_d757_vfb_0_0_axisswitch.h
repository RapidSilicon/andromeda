#ifndef IP_BD_D757_VFB_0_0_AXISSWITCH_H_
#define IP_BD_D757_VFB_0_0_AXISSWITCH_H_

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


#ifndef XTLM
#include "xtlm.h"
#endif
#ifndef SYSTEMC_INCLUDED
#include <systemc>
#endif

#if defined(_MSC_VER)
#define DllExport __declspec(dllexport)
#elif defined(__GNUC__)
#define DllExport __attribute__ ((visibility("default")))
#else
#define DllExport
#endif

#include "bd_d757_vfb_0_0_axisswitch_sc.h"




#ifdef XILINX_SIMULATOR
class DllExport bd_d757_vfb_0_0_axisswitch : public bd_d757_vfb_0_0_axisswitch_sc
{
public:

  bd_d757_vfb_0_0_axisswitch(const sc_core::sc_module_name& nm);
  virtual ~bd_d757_vfb_0_0_axisswitch();

  // module pin-to-pin RTL interface

  sc_core::sc_in< bool > aclk;
  sc_core::sc_in< bool > aresetn;
  sc_core::sc_in< sc_dt::sc_bv<1> > s_axis_tvalid;
  sc_core::sc_out< sc_dt::sc_bv<1> > s_axis_tready;
  sc_core::sc_in< sc_dt::sc_bv<32> > s_axis_tdata;
  sc_core::sc_in< sc_dt::sc_bv<4> > s_axis_tkeep;
  sc_core::sc_in< sc_dt::sc_bv<1> > s_axis_tlast;
  sc_core::sc_in< sc_dt::sc_bv<4> > s_axis_tdest;
  sc_core::sc_in< sc_dt::sc_bv<96> > s_axis_tuser;
  sc_core::sc_out< sc_dt::sc_bv<16> > m_axis_tvalid;
  sc_core::sc_in< sc_dt::sc_bv<16> > m_axis_tready;
  sc_core::sc_out< sc_dt::sc_bv<512> > m_axis_tdata;
  sc_core::sc_out< sc_dt::sc_bv<64> > m_axis_tkeep;
  sc_core::sc_out< sc_dt::sc_bv<16> > m_axis_tlast;
  sc_core::sc_out< sc_dt::sc_bv<64> > m_axis_tdest;
  sc_core::sc_out< sc_dt::sc_bv<1536> > m_axis_tuser;
  sc_core::sc_out< sc_dt::sc_bv<1> > s_decode_err;

  // Dummy Signals for IP Ports


protected:

  virtual void before_end_of_elaboration();

private:

  xtlm::xaxis_pin2xtlm_t<4,96,1,4,1,1>* mp_S00_AXIS_transactor;
  xsc::common::vectorN2scalar_converter<1>* mp_s_axis_tvalid_converter;
  sc_signal< bool > m_s_axis_tvalid_converter_signal;
  xsc::common::scalar2vectorN_converter<1>* mp_s_axis_tready_converter;
  sc_signal< bool > m_s_axis_tready_converter_signal;
  xsc::common::vectorN2scalar_converter<1>* mp_s_axis_tlast_converter;
  sc_signal< bool > m_s_axis_tlast_converter_signal;
  sc_signal< bool > m_S00_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M00_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_0;
  sc_signal< bool > m_m_axis_tvalid_converter_0_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_0;
  sc_signal< bool > m_m_axis_tready_converter_0_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_0;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_0_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_0;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_0_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_0;
  sc_signal< bool > m_m_axis_tlast_converter_0_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_0;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_0_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_0;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_0_signal;
  sc_signal< bool > m_M00_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M01_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_1;
  sc_signal< bool > m_m_axis_tvalid_converter_1_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_1;
  sc_signal< bool > m_m_axis_tready_converter_1_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_1;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_1_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_1;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_1_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_1;
  sc_signal< bool > m_m_axis_tlast_converter_1_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_1;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_1_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_1;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_1_signal;
  sc_signal< bool > m_M01_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M02_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_2;
  sc_signal< bool > m_m_axis_tvalid_converter_2_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_2;
  sc_signal< bool > m_m_axis_tready_converter_2_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_2;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_2_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_2;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_2_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_2;
  sc_signal< bool > m_m_axis_tlast_converter_2_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_2;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_2_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_2;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_2_signal;
  sc_signal< bool > m_M02_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M03_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_3;
  sc_signal< bool > m_m_axis_tvalid_converter_3_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_3;
  sc_signal< bool > m_m_axis_tready_converter_3_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_3;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_3_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_3;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_3_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_3;
  sc_signal< bool > m_m_axis_tlast_converter_3_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_3;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_3_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_3;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_3_signal;
  sc_signal< bool > m_M03_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M04_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_4;
  sc_signal< bool > m_m_axis_tvalid_converter_4_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_4;
  sc_signal< bool > m_m_axis_tready_converter_4_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_4;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_4_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_4;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_4_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_4;
  sc_signal< bool > m_m_axis_tlast_converter_4_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_4;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_4_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_4;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_4_signal;
  sc_signal< bool > m_M04_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M05_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_5;
  sc_signal< bool > m_m_axis_tvalid_converter_5_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_5;
  sc_signal< bool > m_m_axis_tready_converter_5_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_5;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_5_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_5;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_5_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_5;
  sc_signal< bool > m_m_axis_tlast_converter_5_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_5;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_5_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_5;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_5_signal;
  sc_signal< bool > m_M05_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M06_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_6;
  sc_signal< bool > m_m_axis_tvalid_converter_6_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_6;
  sc_signal< bool > m_m_axis_tready_converter_6_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_6;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_6_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_6;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_6_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_6;
  sc_signal< bool > m_m_axis_tlast_converter_6_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_6;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_6_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_6;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_6_signal;
  sc_signal< bool > m_M06_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M07_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_7;
  sc_signal< bool > m_m_axis_tvalid_converter_7_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_7;
  sc_signal< bool > m_m_axis_tready_converter_7_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_7;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_7_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_7;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_7_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_7;
  sc_signal< bool > m_m_axis_tlast_converter_7_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_7;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_7_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_7;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_7_signal;
  sc_signal< bool > m_M07_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M08_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_8;
  sc_signal< bool > m_m_axis_tvalid_converter_8_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_8;
  sc_signal< bool > m_m_axis_tready_converter_8_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_8;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_8_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_8;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_8_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_8;
  sc_signal< bool > m_m_axis_tlast_converter_8_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_8;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_8_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_8;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_8_signal;
  sc_signal< bool > m_M08_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M09_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_9;
  sc_signal< bool > m_m_axis_tvalid_converter_9_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_9;
  sc_signal< bool > m_m_axis_tready_converter_9_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_9;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_9_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_9;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_9_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_9;
  sc_signal< bool > m_m_axis_tlast_converter_9_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_9;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_9_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_9;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_9_signal;
  sc_signal< bool > m_M09_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M10_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_10;
  sc_signal< bool > m_m_axis_tvalid_converter_10_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_10;
  sc_signal< bool > m_m_axis_tready_converter_10_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_10;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_10_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_10;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_10_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_10;
  sc_signal< bool > m_m_axis_tlast_converter_10_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_10;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_10_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_10;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_10_signal;
  sc_signal< bool > m_M10_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M11_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_11;
  sc_signal< bool > m_m_axis_tvalid_converter_11_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_11;
  sc_signal< bool > m_m_axis_tready_converter_11_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_11;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_11_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_11;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_11_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_11;
  sc_signal< bool > m_m_axis_tlast_converter_11_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_11;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_11_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_11;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_11_signal;
  sc_signal< bool > m_M11_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M12_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_12;
  sc_signal< bool > m_m_axis_tvalid_converter_12_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_12;
  sc_signal< bool > m_m_axis_tready_converter_12_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_12;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_12_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_12;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_12_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_12;
  sc_signal< bool > m_m_axis_tlast_converter_12_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_12;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_12_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_12;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_12_signal;
  sc_signal< bool > m_M12_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M13_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_13;
  sc_signal< bool > m_m_axis_tvalid_converter_13_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_13;
  sc_signal< bool > m_m_axis_tready_converter_13_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_13;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_13_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_13;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_13_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_13;
  sc_signal< bool > m_m_axis_tlast_converter_13_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_13;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_13_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_13;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_13_signal;
  sc_signal< bool > m_M13_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M14_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_14;
  sc_signal< bool > m_m_axis_tvalid_converter_14_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_14;
  sc_signal< bool > m_m_axis_tready_converter_14_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_14;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_14_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_14;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_14_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_14;
  sc_signal< bool > m_m_axis_tlast_converter_14_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_14;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_14_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_14;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_14_signal;
  sc_signal< bool > m_M14_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M15_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_15;
  sc_signal< bool > m_m_axis_tvalid_converter_15_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_15;
  sc_signal< bool > m_m_axis_tready_converter_15_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_15;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_15_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_15;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_15_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_15;
  sc_signal< bool > m_m_axis_tlast_converter_15_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_15;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_15_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_15;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_15_signal;
  sc_signal< bool > m_M15_AXIS_transactor_rst_signal;

  xsc::xsc_concatenator<512, 16> * mp_m_axis_concat_tdata;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_0;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_1;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_2;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_3;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_4;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_5;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_6;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_7;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_8;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_9;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_10;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_11;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_12;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_13;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_14;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_15;

  xsc::xsc_concatenator<64, 16> * mp_m_axis_concat_tdest;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_0;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_1;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_2;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_3;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_4;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_5;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_6;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_7;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_8;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_9;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_10;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_11;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_12;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_13;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_14;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_15;


  xsc::xsc_concatenator<64, 16> * mp_m_axis_concat_tkeep;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_0;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_1;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_2;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_3;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_4;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_5;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_6;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_7;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_8;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_9;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_10;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_11;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_12;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_13;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_14;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_15;

  xsc::xsc_concatenator<16, 16> * mp_m_axis_concat_tlast;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_0;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_1;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_2;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_3;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_4;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_5;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_6;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_7;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_8;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_9;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_10;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_11;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_12;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_13;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_14;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_15;

  xsc::xsc_split<16, 16> * mp_m_axis_split_tready;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_0;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_1;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_2;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_3;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_4;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_5;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_6;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_7;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_8;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_9;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_10;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_11;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_12;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_13;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_14;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_15;


  xsc::xsc_concatenator<1536, 16> * mp_m_axis_concat_tuser;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_0;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_1;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_2;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_3;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_4;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_5;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_6;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_7;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_8;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_9;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_10;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_11;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_12;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_13;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_14;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_15;

  xsc::xsc_concatenator<16, 16> * mp_m_axis_concat_tvalid;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_0;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_1;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_2;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_3;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_4;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_5;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_6;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_7;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_8;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_9;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_10;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_11;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_12;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_13;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_14;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_15;

};
#endif // XILINX_SIMULATOR




#ifdef XM_SYSTEMC
class DllExport bd_d757_vfb_0_0_axisswitch : public bd_d757_vfb_0_0_axisswitch_sc
{
public:

  bd_d757_vfb_0_0_axisswitch(const sc_core::sc_module_name& nm);
  virtual ~bd_d757_vfb_0_0_axisswitch();

  // module pin-to-pin RTL interface

  sc_core::sc_in< bool > aclk;
  sc_core::sc_in< bool > aresetn;
  sc_core::sc_in< sc_dt::sc_bv<1> > s_axis_tvalid;
  sc_core::sc_out< sc_dt::sc_bv<1> > s_axis_tready;
  sc_core::sc_in< sc_dt::sc_bv<32> > s_axis_tdata;
  sc_core::sc_in< sc_dt::sc_bv<4> > s_axis_tkeep;
  sc_core::sc_in< sc_dt::sc_bv<1> > s_axis_tlast;
  sc_core::sc_in< sc_dt::sc_bv<4> > s_axis_tdest;
  sc_core::sc_in< sc_dt::sc_bv<96> > s_axis_tuser;
  sc_core::sc_out< sc_dt::sc_bv<16> > m_axis_tvalid;
  sc_core::sc_in< sc_dt::sc_bv<16> > m_axis_tready;
  sc_core::sc_out< sc_dt::sc_bv<512> > m_axis_tdata;
  sc_core::sc_out< sc_dt::sc_bv<64> > m_axis_tkeep;
  sc_core::sc_out< sc_dt::sc_bv<16> > m_axis_tlast;
  sc_core::sc_out< sc_dt::sc_bv<64> > m_axis_tdest;
  sc_core::sc_out< sc_dt::sc_bv<1536> > m_axis_tuser;
  sc_core::sc_out< sc_dt::sc_bv<1> > s_decode_err;

  // Dummy Signals for IP Ports


protected:

  virtual void before_end_of_elaboration();

private:

  xtlm::xaxis_pin2xtlm_t<4,96,1,4,1,1>* mp_S00_AXIS_transactor;
  xsc::common::vectorN2scalar_converter<1>* mp_s_axis_tvalid_converter;
  sc_signal< bool > m_s_axis_tvalid_converter_signal;
  xsc::common::scalar2vectorN_converter<1>* mp_s_axis_tready_converter;
  sc_signal< bool > m_s_axis_tready_converter_signal;
  xsc::common::vectorN2scalar_converter<1>* mp_s_axis_tlast_converter;
  sc_signal< bool > m_s_axis_tlast_converter_signal;
  sc_signal< bool > m_S00_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M00_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_0;
  sc_signal< bool > m_m_axis_tvalid_converter_0_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_0;
  sc_signal< bool > m_m_axis_tready_converter_0_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_0;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_0_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_0;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_0_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_0;
  sc_signal< bool > m_m_axis_tlast_converter_0_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_0;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_0_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_0;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_0_signal;
  sc_signal< bool > m_M00_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M01_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_1;
  sc_signal< bool > m_m_axis_tvalid_converter_1_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_1;
  sc_signal< bool > m_m_axis_tready_converter_1_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_1;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_1_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_1;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_1_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_1;
  sc_signal< bool > m_m_axis_tlast_converter_1_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_1;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_1_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_1;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_1_signal;
  sc_signal< bool > m_M01_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M02_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_2;
  sc_signal< bool > m_m_axis_tvalid_converter_2_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_2;
  sc_signal< bool > m_m_axis_tready_converter_2_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_2;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_2_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_2;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_2_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_2;
  sc_signal< bool > m_m_axis_tlast_converter_2_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_2;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_2_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_2;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_2_signal;
  sc_signal< bool > m_M02_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M03_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_3;
  sc_signal< bool > m_m_axis_tvalid_converter_3_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_3;
  sc_signal< bool > m_m_axis_tready_converter_3_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_3;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_3_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_3;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_3_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_3;
  sc_signal< bool > m_m_axis_tlast_converter_3_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_3;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_3_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_3;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_3_signal;
  sc_signal< bool > m_M03_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M04_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_4;
  sc_signal< bool > m_m_axis_tvalid_converter_4_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_4;
  sc_signal< bool > m_m_axis_tready_converter_4_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_4;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_4_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_4;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_4_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_4;
  sc_signal< bool > m_m_axis_tlast_converter_4_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_4;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_4_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_4;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_4_signal;
  sc_signal< bool > m_M04_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M05_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_5;
  sc_signal< bool > m_m_axis_tvalid_converter_5_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_5;
  sc_signal< bool > m_m_axis_tready_converter_5_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_5;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_5_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_5;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_5_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_5;
  sc_signal< bool > m_m_axis_tlast_converter_5_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_5;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_5_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_5;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_5_signal;
  sc_signal< bool > m_M05_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M06_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_6;
  sc_signal< bool > m_m_axis_tvalid_converter_6_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_6;
  sc_signal< bool > m_m_axis_tready_converter_6_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_6;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_6_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_6;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_6_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_6;
  sc_signal< bool > m_m_axis_tlast_converter_6_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_6;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_6_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_6;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_6_signal;
  sc_signal< bool > m_M06_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M07_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_7;
  sc_signal< bool > m_m_axis_tvalid_converter_7_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_7;
  sc_signal< bool > m_m_axis_tready_converter_7_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_7;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_7_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_7;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_7_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_7;
  sc_signal< bool > m_m_axis_tlast_converter_7_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_7;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_7_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_7;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_7_signal;
  sc_signal< bool > m_M07_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M08_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_8;
  sc_signal< bool > m_m_axis_tvalid_converter_8_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_8;
  sc_signal< bool > m_m_axis_tready_converter_8_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_8;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_8_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_8;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_8_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_8;
  sc_signal< bool > m_m_axis_tlast_converter_8_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_8;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_8_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_8;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_8_signal;
  sc_signal< bool > m_M08_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M09_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_9;
  sc_signal< bool > m_m_axis_tvalid_converter_9_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_9;
  sc_signal< bool > m_m_axis_tready_converter_9_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_9;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_9_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_9;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_9_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_9;
  sc_signal< bool > m_m_axis_tlast_converter_9_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_9;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_9_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_9;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_9_signal;
  sc_signal< bool > m_M09_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M10_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_10;
  sc_signal< bool > m_m_axis_tvalid_converter_10_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_10;
  sc_signal< bool > m_m_axis_tready_converter_10_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_10;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_10_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_10;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_10_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_10;
  sc_signal< bool > m_m_axis_tlast_converter_10_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_10;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_10_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_10;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_10_signal;
  sc_signal< bool > m_M10_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M11_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_11;
  sc_signal< bool > m_m_axis_tvalid_converter_11_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_11;
  sc_signal< bool > m_m_axis_tready_converter_11_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_11;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_11_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_11;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_11_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_11;
  sc_signal< bool > m_m_axis_tlast_converter_11_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_11;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_11_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_11;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_11_signal;
  sc_signal< bool > m_M11_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M12_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_12;
  sc_signal< bool > m_m_axis_tvalid_converter_12_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_12;
  sc_signal< bool > m_m_axis_tready_converter_12_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_12;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_12_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_12;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_12_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_12;
  sc_signal< bool > m_m_axis_tlast_converter_12_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_12;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_12_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_12;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_12_signal;
  sc_signal< bool > m_M12_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M13_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_13;
  sc_signal< bool > m_m_axis_tvalid_converter_13_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_13;
  sc_signal< bool > m_m_axis_tready_converter_13_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_13;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_13_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_13;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_13_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_13;
  sc_signal< bool > m_m_axis_tlast_converter_13_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_13;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_13_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_13;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_13_signal;
  sc_signal< bool > m_M13_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M14_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_14;
  sc_signal< bool > m_m_axis_tvalid_converter_14_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_14;
  sc_signal< bool > m_m_axis_tready_converter_14_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_14;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_14_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_14;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_14_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_14;
  sc_signal< bool > m_m_axis_tlast_converter_14_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_14;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_14_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_14;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_14_signal;
  sc_signal< bool > m_M14_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M15_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_15;
  sc_signal< bool > m_m_axis_tvalid_converter_15_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_15;
  sc_signal< bool > m_m_axis_tready_converter_15_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_15;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_15_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_15;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_15_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_15;
  sc_signal< bool > m_m_axis_tlast_converter_15_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_15;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_15_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_15;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_15_signal;
  sc_signal< bool > m_M15_AXIS_transactor_rst_signal;

  xsc::xsc_concatenator<512, 16> * mp_m_axis_concat_tdata;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_0;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_1;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_2;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_3;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_4;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_5;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_6;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_7;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_8;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_9;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_10;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_11;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_12;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_13;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_14;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_15;

  xsc::xsc_concatenator<64, 16> * mp_m_axis_concat_tdest;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_0;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_1;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_2;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_3;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_4;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_5;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_6;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_7;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_8;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_9;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_10;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_11;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_12;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_13;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_14;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_15;


  xsc::xsc_concatenator<64, 16> * mp_m_axis_concat_tkeep;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_0;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_1;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_2;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_3;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_4;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_5;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_6;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_7;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_8;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_9;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_10;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_11;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_12;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_13;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_14;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_15;

  xsc::xsc_concatenator<16, 16> * mp_m_axis_concat_tlast;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_0;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_1;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_2;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_3;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_4;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_5;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_6;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_7;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_8;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_9;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_10;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_11;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_12;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_13;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_14;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_15;

  xsc::xsc_split<16, 16> * mp_m_axis_split_tready;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_0;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_1;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_2;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_3;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_4;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_5;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_6;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_7;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_8;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_9;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_10;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_11;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_12;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_13;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_14;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_15;


  xsc::xsc_concatenator<1536, 16> * mp_m_axis_concat_tuser;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_0;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_1;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_2;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_3;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_4;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_5;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_6;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_7;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_8;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_9;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_10;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_11;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_12;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_13;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_14;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_15;

  xsc::xsc_concatenator<16, 16> * mp_m_axis_concat_tvalid;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_0;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_1;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_2;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_3;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_4;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_5;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_6;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_7;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_8;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_9;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_10;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_11;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_12;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_13;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_14;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_15;

};
#endif // XM_SYSTEMC




#ifdef RIVIERA
class DllExport bd_d757_vfb_0_0_axisswitch : public bd_d757_vfb_0_0_axisswitch_sc
{
public:

  bd_d757_vfb_0_0_axisswitch(const sc_core::sc_module_name& nm);
  virtual ~bd_d757_vfb_0_0_axisswitch();

  // module pin-to-pin RTL interface

  sc_core::sc_in< bool > aclk;
  sc_core::sc_in< bool > aresetn;
  sc_core::sc_in< sc_dt::sc_bv<1> > s_axis_tvalid;
  sc_core::sc_out< sc_dt::sc_bv<1> > s_axis_tready;
  sc_core::sc_in< sc_dt::sc_bv<32> > s_axis_tdata;
  sc_core::sc_in< sc_dt::sc_bv<4> > s_axis_tkeep;
  sc_core::sc_in< sc_dt::sc_bv<1> > s_axis_tlast;
  sc_core::sc_in< sc_dt::sc_bv<4> > s_axis_tdest;
  sc_core::sc_in< sc_dt::sc_bv<96> > s_axis_tuser;
  sc_core::sc_out< sc_dt::sc_bv<16> > m_axis_tvalid;
  sc_core::sc_in< sc_dt::sc_bv<16> > m_axis_tready;
  sc_core::sc_out< sc_dt::sc_bv<512> > m_axis_tdata;
  sc_core::sc_out< sc_dt::sc_bv<64> > m_axis_tkeep;
  sc_core::sc_out< sc_dt::sc_bv<16> > m_axis_tlast;
  sc_core::sc_out< sc_dt::sc_bv<64> > m_axis_tdest;
  sc_core::sc_out< sc_dt::sc_bv<1536> > m_axis_tuser;
  sc_core::sc_out< sc_dt::sc_bv<1> > s_decode_err;

  // Dummy Signals for IP Ports


protected:

  virtual void before_end_of_elaboration();

private:

  xtlm::xaxis_pin2xtlm_t<4,96,1,4,1,1>* mp_S00_AXIS_transactor;
  xsc::common::vectorN2scalar_converter<1>* mp_s_axis_tvalid_converter;
  sc_signal< bool > m_s_axis_tvalid_converter_signal;
  xsc::common::scalar2vectorN_converter<1>* mp_s_axis_tready_converter;
  sc_signal< bool > m_s_axis_tready_converter_signal;
  xsc::common::vectorN2scalar_converter<1>* mp_s_axis_tlast_converter;
  sc_signal< bool > m_s_axis_tlast_converter_signal;
  sc_signal< bool > m_S00_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M00_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_0;
  sc_signal< bool > m_m_axis_tvalid_converter_0_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_0;
  sc_signal< bool > m_m_axis_tready_converter_0_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_0;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_0_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_0;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_0_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_0;
  sc_signal< bool > m_m_axis_tlast_converter_0_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_0;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_0_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_0;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_0_signal;
  sc_signal< bool > m_M00_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M01_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_1;
  sc_signal< bool > m_m_axis_tvalid_converter_1_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_1;
  sc_signal< bool > m_m_axis_tready_converter_1_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_1;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_1_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_1;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_1_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_1;
  sc_signal< bool > m_m_axis_tlast_converter_1_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_1;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_1_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_1;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_1_signal;
  sc_signal< bool > m_M01_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M02_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_2;
  sc_signal< bool > m_m_axis_tvalid_converter_2_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_2;
  sc_signal< bool > m_m_axis_tready_converter_2_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_2;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_2_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_2;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_2_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_2;
  sc_signal< bool > m_m_axis_tlast_converter_2_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_2;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_2_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_2;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_2_signal;
  sc_signal< bool > m_M02_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M03_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_3;
  sc_signal< bool > m_m_axis_tvalid_converter_3_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_3;
  sc_signal< bool > m_m_axis_tready_converter_3_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_3;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_3_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_3;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_3_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_3;
  sc_signal< bool > m_m_axis_tlast_converter_3_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_3;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_3_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_3;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_3_signal;
  sc_signal< bool > m_M03_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M04_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_4;
  sc_signal< bool > m_m_axis_tvalid_converter_4_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_4;
  sc_signal< bool > m_m_axis_tready_converter_4_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_4;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_4_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_4;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_4_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_4;
  sc_signal< bool > m_m_axis_tlast_converter_4_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_4;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_4_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_4;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_4_signal;
  sc_signal< bool > m_M04_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M05_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_5;
  sc_signal< bool > m_m_axis_tvalid_converter_5_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_5;
  sc_signal< bool > m_m_axis_tready_converter_5_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_5;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_5_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_5;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_5_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_5;
  sc_signal< bool > m_m_axis_tlast_converter_5_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_5;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_5_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_5;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_5_signal;
  sc_signal< bool > m_M05_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M06_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_6;
  sc_signal< bool > m_m_axis_tvalid_converter_6_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_6;
  sc_signal< bool > m_m_axis_tready_converter_6_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_6;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_6_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_6;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_6_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_6;
  sc_signal< bool > m_m_axis_tlast_converter_6_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_6;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_6_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_6;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_6_signal;
  sc_signal< bool > m_M06_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M07_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_7;
  sc_signal< bool > m_m_axis_tvalid_converter_7_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_7;
  sc_signal< bool > m_m_axis_tready_converter_7_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_7;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_7_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_7;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_7_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_7;
  sc_signal< bool > m_m_axis_tlast_converter_7_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_7;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_7_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_7;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_7_signal;
  sc_signal< bool > m_M07_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M08_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_8;
  sc_signal< bool > m_m_axis_tvalid_converter_8_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_8;
  sc_signal< bool > m_m_axis_tready_converter_8_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_8;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_8_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_8;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_8_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_8;
  sc_signal< bool > m_m_axis_tlast_converter_8_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_8;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_8_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_8;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_8_signal;
  sc_signal< bool > m_M08_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M09_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_9;
  sc_signal< bool > m_m_axis_tvalid_converter_9_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_9;
  sc_signal< bool > m_m_axis_tready_converter_9_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_9;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_9_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_9;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_9_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_9;
  sc_signal< bool > m_m_axis_tlast_converter_9_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_9;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_9_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_9;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_9_signal;
  sc_signal< bool > m_M09_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M10_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_10;
  sc_signal< bool > m_m_axis_tvalid_converter_10_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_10;
  sc_signal< bool > m_m_axis_tready_converter_10_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_10;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_10_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_10;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_10_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_10;
  sc_signal< bool > m_m_axis_tlast_converter_10_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_10;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_10_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_10;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_10_signal;
  sc_signal< bool > m_M10_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M11_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_11;
  sc_signal< bool > m_m_axis_tvalid_converter_11_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_11;
  sc_signal< bool > m_m_axis_tready_converter_11_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_11;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_11_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_11;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_11_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_11;
  sc_signal< bool > m_m_axis_tlast_converter_11_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_11;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_11_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_11;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_11_signal;
  sc_signal< bool > m_M11_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M12_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_12;
  sc_signal< bool > m_m_axis_tvalid_converter_12_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_12;
  sc_signal< bool > m_m_axis_tready_converter_12_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_12;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_12_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_12;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_12_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_12;
  sc_signal< bool > m_m_axis_tlast_converter_12_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_12;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_12_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_12;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_12_signal;
  sc_signal< bool > m_M12_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M13_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_13;
  sc_signal< bool > m_m_axis_tvalid_converter_13_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_13;
  sc_signal< bool > m_m_axis_tready_converter_13_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_13;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_13_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_13;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_13_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_13;
  sc_signal< bool > m_m_axis_tlast_converter_13_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_13;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_13_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_13;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_13_signal;
  sc_signal< bool > m_M13_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M14_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_14;
  sc_signal< bool > m_m_axis_tvalid_converter_14_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_14;
  sc_signal< bool > m_m_axis_tready_converter_14_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_14;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_14_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_14;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_14_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_14;
  sc_signal< bool > m_m_axis_tlast_converter_14_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_14;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_14_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_14;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_14_signal;
  sc_signal< bool > m_M14_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M15_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_15;
  sc_signal< bool > m_m_axis_tvalid_converter_15_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_15;
  sc_signal< bool > m_m_axis_tready_converter_15_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_15;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_15_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_15;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_15_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_15;
  sc_signal< bool > m_m_axis_tlast_converter_15_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_15;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_15_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_15;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_15_signal;
  sc_signal< bool > m_M15_AXIS_transactor_rst_signal;

  xsc::xsc_concatenator<512, 16> * mp_m_axis_concat_tdata;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_0;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_1;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_2;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_3;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_4;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_5;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_6;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_7;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_8;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_9;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_10;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_11;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_12;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_13;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_14;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_15;

  xsc::xsc_concatenator<64, 16> * mp_m_axis_concat_tdest;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_0;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_1;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_2;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_3;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_4;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_5;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_6;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_7;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_8;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_9;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_10;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_11;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_12;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_13;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_14;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_15;


  xsc::xsc_concatenator<64, 16> * mp_m_axis_concat_tkeep;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_0;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_1;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_2;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_3;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_4;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_5;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_6;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_7;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_8;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_9;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_10;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_11;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_12;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_13;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_14;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_15;

  xsc::xsc_concatenator<16, 16> * mp_m_axis_concat_tlast;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_0;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_1;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_2;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_3;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_4;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_5;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_6;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_7;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_8;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_9;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_10;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_11;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_12;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_13;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_14;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_15;

  xsc::xsc_split<16, 16> * mp_m_axis_split_tready;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_0;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_1;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_2;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_3;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_4;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_5;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_6;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_7;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_8;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_9;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_10;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_11;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_12;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_13;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_14;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_15;


  xsc::xsc_concatenator<1536, 16> * mp_m_axis_concat_tuser;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_0;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_1;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_2;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_3;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_4;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_5;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_6;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_7;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_8;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_9;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_10;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_11;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_12;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_13;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_14;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_15;

  xsc::xsc_concatenator<16, 16> * mp_m_axis_concat_tvalid;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_0;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_1;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_2;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_3;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_4;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_5;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_6;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_7;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_8;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_9;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_10;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_11;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_12;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_13;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_14;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_15;

};
#endif // RIVIERA




#ifdef VCSSYSTEMC
#include "utils/xtlm_axis_initiator_stub.h"

#include "utils/xtlm_axis_target_stub.h"

class DllExport bd_d757_vfb_0_0_axisswitch : public bd_d757_vfb_0_0_axisswitch_sc
{
public:

  bd_d757_vfb_0_0_axisswitch(const sc_core::sc_module_name& nm);
  virtual ~bd_d757_vfb_0_0_axisswitch();

  // module pin-to-pin RTL interface

  sc_core::sc_in< bool > aclk;
  sc_core::sc_in< bool > aresetn;
  sc_core::sc_in< sc_dt::sc_bv<1> > s_axis_tvalid;
  sc_core::sc_out< sc_dt::sc_bv<1> > s_axis_tready;
  sc_core::sc_in< sc_dt::sc_bv<32> > s_axis_tdata;
  sc_core::sc_in< sc_dt::sc_bv<4> > s_axis_tkeep;
  sc_core::sc_in< sc_dt::sc_bv<1> > s_axis_tlast;
  sc_core::sc_in< sc_dt::sc_bv<4> > s_axis_tdest;
  sc_core::sc_in< sc_dt::sc_bv<96> > s_axis_tuser;
  sc_core::sc_out< sc_dt::sc_bv<16> > m_axis_tvalid;
  sc_core::sc_in< sc_dt::sc_bv<16> > m_axis_tready;
  sc_core::sc_out< sc_dt::sc_bv<512> > m_axis_tdata;
  sc_core::sc_out< sc_dt::sc_bv<64> > m_axis_tkeep;
  sc_core::sc_out< sc_dt::sc_bv<16> > m_axis_tlast;
  sc_core::sc_out< sc_dt::sc_bv<64> > m_axis_tdest;
  sc_core::sc_out< sc_dt::sc_bv<1536> > m_axis_tuser;
  sc_core::sc_out< sc_dt::sc_bv<1> > s_decode_err;

  // Dummy Signals for IP Ports


protected:

  virtual void before_end_of_elaboration();

private:

  xtlm::xaxis_pin2xtlm_t<4,96,1,4,1,1>* mp_S00_AXIS_transactor;
  xsc::common::vectorN2scalar_converter<1>* mp_s_axis_tvalid_converter;
  sc_signal< bool > m_s_axis_tvalid_converter_signal;
  xsc::common::scalar2vectorN_converter<1>* mp_s_axis_tready_converter;
  sc_signal< bool > m_s_axis_tready_converter_signal;
  xsc::common::vectorN2scalar_converter<1>* mp_s_axis_tlast_converter;
  sc_signal< bool > m_s_axis_tlast_converter_signal;
  sc_signal< bool > m_S00_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M00_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_0;
  sc_signal< bool > m_m_axis_tvalid_converter_0_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_0;
  sc_signal< bool > m_m_axis_tready_converter_0_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_0;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_0_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_0;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_0_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_0;
  sc_signal< bool > m_m_axis_tlast_converter_0_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_0;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_0_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_0;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_0_signal;
  sc_signal< bool > m_M00_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M01_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_1;
  sc_signal< bool > m_m_axis_tvalid_converter_1_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_1;
  sc_signal< bool > m_m_axis_tready_converter_1_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_1;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_1_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_1;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_1_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_1;
  sc_signal< bool > m_m_axis_tlast_converter_1_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_1;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_1_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_1;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_1_signal;
  sc_signal< bool > m_M01_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M02_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_2;
  sc_signal< bool > m_m_axis_tvalid_converter_2_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_2;
  sc_signal< bool > m_m_axis_tready_converter_2_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_2;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_2_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_2;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_2_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_2;
  sc_signal< bool > m_m_axis_tlast_converter_2_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_2;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_2_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_2;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_2_signal;
  sc_signal< bool > m_M02_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M03_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_3;
  sc_signal< bool > m_m_axis_tvalid_converter_3_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_3;
  sc_signal< bool > m_m_axis_tready_converter_3_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_3;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_3_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_3;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_3_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_3;
  sc_signal< bool > m_m_axis_tlast_converter_3_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_3;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_3_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_3;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_3_signal;
  sc_signal< bool > m_M03_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M04_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_4;
  sc_signal< bool > m_m_axis_tvalid_converter_4_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_4;
  sc_signal< bool > m_m_axis_tready_converter_4_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_4;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_4_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_4;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_4_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_4;
  sc_signal< bool > m_m_axis_tlast_converter_4_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_4;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_4_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_4;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_4_signal;
  sc_signal< bool > m_M04_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M05_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_5;
  sc_signal< bool > m_m_axis_tvalid_converter_5_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_5;
  sc_signal< bool > m_m_axis_tready_converter_5_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_5;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_5_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_5;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_5_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_5;
  sc_signal< bool > m_m_axis_tlast_converter_5_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_5;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_5_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_5;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_5_signal;
  sc_signal< bool > m_M05_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M06_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_6;
  sc_signal< bool > m_m_axis_tvalid_converter_6_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_6;
  sc_signal< bool > m_m_axis_tready_converter_6_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_6;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_6_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_6;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_6_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_6;
  sc_signal< bool > m_m_axis_tlast_converter_6_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_6;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_6_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_6;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_6_signal;
  sc_signal< bool > m_M06_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M07_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_7;
  sc_signal< bool > m_m_axis_tvalid_converter_7_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_7;
  sc_signal< bool > m_m_axis_tready_converter_7_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_7;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_7_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_7;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_7_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_7;
  sc_signal< bool > m_m_axis_tlast_converter_7_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_7;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_7_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_7;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_7_signal;
  sc_signal< bool > m_M07_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M08_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_8;
  sc_signal< bool > m_m_axis_tvalid_converter_8_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_8;
  sc_signal< bool > m_m_axis_tready_converter_8_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_8;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_8_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_8;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_8_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_8;
  sc_signal< bool > m_m_axis_tlast_converter_8_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_8;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_8_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_8;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_8_signal;
  sc_signal< bool > m_M08_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M09_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_9;
  sc_signal< bool > m_m_axis_tvalid_converter_9_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_9;
  sc_signal< bool > m_m_axis_tready_converter_9_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_9;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_9_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_9;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_9_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_9;
  sc_signal< bool > m_m_axis_tlast_converter_9_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_9;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_9_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_9;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_9_signal;
  sc_signal< bool > m_M09_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M10_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_10;
  sc_signal< bool > m_m_axis_tvalid_converter_10_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_10;
  sc_signal< bool > m_m_axis_tready_converter_10_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_10;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_10_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_10;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_10_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_10;
  sc_signal< bool > m_m_axis_tlast_converter_10_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_10;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_10_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_10;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_10_signal;
  sc_signal< bool > m_M10_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M11_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_11;
  sc_signal< bool > m_m_axis_tvalid_converter_11_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_11;
  sc_signal< bool > m_m_axis_tready_converter_11_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_11;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_11_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_11;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_11_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_11;
  sc_signal< bool > m_m_axis_tlast_converter_11_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_11;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_11_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_11;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_11_signal;
  sc_signal< bool > m_M11_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M12_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_12;
  sc_signal< bool > m_m_axis_tvalid_converter_12_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_12;
  sc_signal< bool > m_m_axis_tready_converter_12_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_12;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_12_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_12;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_12_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_12;
  sc_signal< bool > m_m_axis_tlast_converter_12_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_12;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_12_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_12;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_12_signal;
  sc_signal< bool > m_M12_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M13_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_13;
  sc_signal< bool > m_m_axis_tvalid_converter_13_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_13;
  sc_signal< bool > m_m_axis_tready_converter_13_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_13;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_13_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_13;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_13_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_13;
  sc_signal< bool > m_m_axis_tlast_converter_13_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_13;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_13_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_13;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_13_signal;
  sc_signal< bool > m_M13_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M14_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_14;
  sc_signal< bool > m_m_axis_tvalid_converter_14_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_14;
  sc_signal< bool > m_m_axis_tready_converter_14_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_14;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_14_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_14;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_14_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_14;
  sc_signal< bool > m_m_axis_tlast_converter_14_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_14;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_14_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_14;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_14_signal;
  sc_signal< bool > m_M14_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M15_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_15;
  sc_signal< bool > m_m_axis_tvalid_converter_15_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_15;
  sc_signal< bool > m_m_axis_tready_converter_15_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_15;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_15_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_15;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_15_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_15;
  sc_signal< bool > m_m_axis_tlast_converter_15_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_15;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_15_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_15;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_15_signal;
  sc_signal< bool > m_M15_AXIS_transactor_rst_signal;

  xsc::xsc_concatenator<512, 16> * mp_m_axis_concat_tdata;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_0;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_1;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_2;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_3;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_4;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_5;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_6;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_7;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_8;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_9;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_10;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_11;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_12;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_13;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_14;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_15;

  xsc::xsc_concatenator<64, 16> * mp_m_axis_concat_tdest;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_0;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_1;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_2;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_3;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_4;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_5;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_6;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_7;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_8;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_9;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_10;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_11;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_12;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_13;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_14;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_15;


  xsc::xsc_concatenator<64, 16> * mp_m_axis_concat_tkeep;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_0;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_1;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_2;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_3;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_4;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_5;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_6;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_7;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_8;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_9;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_10;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_11;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_12;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_13;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_14;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_15;

  xsc::xsc_concatenator<16, 16> * mp_m_axis_concat_tlast;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_0;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_1;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_2;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_3;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_4;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_5;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_6;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_7;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_8;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_9;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_10;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_11;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_12;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_13;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_14;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_15;

  xsc::xsc_split<16, 16> * mp_m_axis_split_tready;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_0;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_1;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_2;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_3;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_4;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_5;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_6;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_7;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_8;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_9;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_10;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_11;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_12;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_13;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_14;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_15;


  xsc::xsc_concatenator<1536, 16> * mp_m_axis_concat_tuser;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_0;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_1;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_2;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_3;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_4;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_5;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_6;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_7;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_8;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_9;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_10;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_11;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_12;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_13;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_14;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_15;

  xsc::xsc_concatenator<16, 16> * mp_m_axis_concat_tvalid;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_0;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_1;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_2;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_3;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_4;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_5;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_6;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_7;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_8;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_9;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_10;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_11;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_12;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_13;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_14;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_15;

  // Transactor stubs
  xtlm::xtlm_axis_initiator_stub * M00_AXIS_transactor_initiator_socket_stub;
  xtlm::xtlm_axis_initiator_stub * M01_AXIS_transactor_initiator_socket_stub;
  xtlm::xtlm_axis_initiator_stub * M02_AXIS_transactor_initiator_socket_stub;
  xtlm::xtlm_axis_initiator_stub * M03_AXIS_transactor_initiator_socket_stub;
  xtlm::xtlm_axis_initiator_stub * M04_AXIS_transactor_initiator_socket_stub;
  xtlm::xtlm_axis_initiator_stub * M05_AXIS_transactor_initiator_socket_stub;
  xtlm::xtlm_axis_initiator_stub * M06_AXIS_transactor_initiator_socket_stub;
  xtlm::xtlm_axis_initiator_stub * M07_AXIS_transactor_initiator_socket_stub;
  xtlm::xtlm_axis_initiator_stub * M08_AXIS_transactor_initiator_socket_stub;
  xtlm::xtlm_axis_initiator_stub * M09_AXIS_transactor_initiator_socket_stub;
  xtlm::xtlm_axis_initiator_stub * M10_AXIS_transactor_initiator_socket_stub;
  xtlm::xtlm_axis_initiator_stub * M11_AXIS_transactor_initiator_socket_stub;
  xtlm::xtlm_axis_initiator_stub * M12_AXIS_transactor_initiator_socket_stub;
  xtlm::xtlm_axis_initiator_stub * M13_AXIS_transactor_initiator_socket_stub;
  xtlm::xtlm_axis_initiator_stub * M14_AXIS_transactor_initiator_socket_stub;
  xtlm::xtlm_axis_initiator_stub * M15_AXIS_transactor_initiator_socket_stub;
  xtlm::xtlm_axis_target_stub * S00_AXIS_transactor_target_socket_stub;

  // Socket stubs

};
#endif // VCSSYSTEMC




#ifdef MTI_SYSTEMC
#include "utils/xtlm_axis_initiator_stub.h"

#include "utils/xtlm_axis_target_stub.h"

class DllExport bd_d757_vfb_0_0_axisswitch : public bd_d757_vfb_0_0_axisswitch_sc
{
public:

  bd_d757_vfb_0_0_axisswitch(const sc_core::sc_module_name& nm);
  virtual ~bd_d757_vfb_0_0_axisswitch();

  // module pin-to-pin RTL interface

  sc_core::sc_in< bool > aclk;
  sc_core::sc_in< bool > aresetn;
  sc_core::sc_in< sc_dt::sc_bv<1> > s_axis_tvalid;
  sc_core::sc_out< sc_dt::sc_bv<1> > s_axis_tready;
  sc_core::sc_in< sc_dt::sc_bv<32> > s_axis_tdata;
  sc_core::sc_in< sc_dt::sc_bv<4> > s_axis_tkeep;
  sc_core::sc_in< sc_dt::sc_bv<1> > s_axis_tlast;
  sc_core::sc_in< sc_dt::sc_bv<4> > s_axis_tdest;
  sc_core::sc_in< sc_dt::sc_bv<96> > s_axis_tuser;
  sc_core::sc_out< sc_dt::sc_bv<16> > m_axis_tvalid;
  sc_core::sc_in< sc_dt::sc_bv<16> > m_axis_tready;
  sc_core::sc_out< sc_dt::sc_bv<512> > m_axis_tdata;
  sc_core::sc_out< sc_dt::sc_bv<64> > m_axis_tkeep;
  sc_core::sc_out< sc_dt::sc_bv<16> > m_axis_tlast;
  sc_core::sc_out< sc_dt::sc_bv<64> > m_axis_tdest;
  sc_core::sc_out< sc_dt::sc_bv<1536> > m_axis_tuser;
  sc_core::sc_out< sc_dt::sc_bv<1> > s_decode_err;

  // Dummy Signals for IP Ports


protected:

  virtual void before_end_of_elaboration();

private:

  xtlm::xaxis_pin2xtlm_t<4,96,1,4,1,1>* mp_S00_AXIS_transactor;
  xsc::common::vectorN2scalar_converter<1>* mp_s_axis_tvalid_converter;
  sc_signal< bool > m_s_axis_tvalid_converter_signal;
  xsc::common::scalar2vectorN_converter<1>* mp_s_axis_tready_converter;
  sc_signal< bool > m_s_axis_tready_converter_signal;
  xsc::common::vectorN2scalar_converter<1>* mp_s_axis_tlast_converter;
  sc_signal< bool > m_s_axis_tlast_converter_signal;
  sc_signal< bool > m_S00_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M00_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_0;
  sc_signal< bool > m_m_axis_tvalid_converter_0_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_0;
  sc_signal< bool > m_m_axis_tready_converter_0_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_0;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_0_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_0;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_0_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_0;
  sc_signal< bool > m_m_axis_tlast_converter_0_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_0;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_0_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_0;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_0_signal;
  sc_signal< bool > m_M00_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M01_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_1;
  sc_signal< bool > m_m_axis_tvalid_converter_1_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_1;
  sc_signal< bool > m_m_axis_tready_converter_1_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_1;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_1_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_1;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_1_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_1;
  sc_signal< bool > m_m_axis_tlast_converter_1_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_1;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_1_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_1;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_1_signal;
  sc_signal< bool > m_M01_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M02_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_2;
  sc_signal< bool > m_m_axis_tvalid_converter_2_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_2;
  sc_signal< bool > m_m_axis_tready_converter_2_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_2;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_2_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_2;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_2_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_2;
  sc_signal< bool > m_m_axis_tlast_converter_2_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_2;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_2_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_2;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_2_signal;
  sc_signal< bool > m_M02_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M03_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_3;
  sc_signal< bool > m_m_axis_tvalid_converter_3_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_3;
  sc_signal< bool > m_m_axis_tready_converter_3_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_3;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_3_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_3;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_3_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_3;
  sc_signal< bool > m_m_axis_tlast_converter_3_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_3;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_3_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_3;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_3_signal;
  sc_signal< bool > m_M03_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M04_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_4;
  sc_signal< bool > m_m_axis_tvalid_converter_4_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_4;
  sc_signal< bool > m_m_axis_tready_converter_4_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_4;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_4_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_4;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_4_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_4;
  sc_signal< bool > m_m_axis_tlast_converter_4_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_4;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_4_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_4;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_4_signal;
  sc_signal< bool > m_M04_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M05_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_5;
  sc_signal< bool > m_m_axis_tvalid_converter_5_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_5;
  sc_signal< bool > m_m_axis_tready_converter_5_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_5;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_5_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_5;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_5_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_5;
  sc_signal< bool > m_m_axis_tlast_converter_5_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_5;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_5_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_5;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_5_signal;
  sc_signal< bool > m_M05_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M06_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_6;
  sc_signal< bool > m_m_axis_tvalid_converter_6_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_6;
  sc_signal< bool > m_m_axis_tready_converter_6_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_6;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_6_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_6;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_6_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_6;
  sc_signal< bool > m_m_axis_tlast_converter_6_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_6;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_6_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_6;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_6_signal;
  sc_signal< bool > m_M06_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M07_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_7;
  sc_signal< bool > m_m_axis_tvalid_converter_7_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_7;
  sc_signal< bool > m_m_axis_tready_converter_7_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_7;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_7_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_7;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_7_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_7;
  sc_signal< bool > m_m_axis_tlast_converter_7_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_7;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_7_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_7;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_7_signal;
  sc_signal< bool > m_M07_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M08_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_8;
  sc_signal< bool > m_m_axis_tvalid_converter_8_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_8;
  sc_signal< bool > m_m_axis_tready_converter_8_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_8;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_8_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_8;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_8_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_8;
  sc_signal< bool > m_m_axis_tlast_converter_8_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_8;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_8_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_8;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_8_signal;
  sc_signal< bool > m_M08_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M09_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_9;
  sc_signal< bool > m_m_axis_tvalid_converter_9_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_9;
  sc_signal< bool > m_m_axis_tready_converter_9_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_9;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_9_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_9;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_9_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_9;
  sc_signal< bool > m_m_axis_tlast_converter_9_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_9;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_9_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_9;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_9_signal;
  sc_signal< bool > m_M09_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M10_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_10;
  sc_signal< bool > m_m_axis_tvalid_converter_10_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_10;
  sc_signal< bool > m_m_axis_tready_converter_10_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_10;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_10_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_10;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_10_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_10;
  sc_signal< bool > m_m_axis_tlast_converter_10_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_10;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_10_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_10;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_10_signal;
  sc_signal< bool > m_M10_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M11_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_11;
  sc_signal< bool > m_m_axis_tvalid_converter_11_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_11;
  sc_signal< bool > m_m_axis_tready_converter_11_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_11;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_11_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_11;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_11_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_11;
  sc_signal< bool > m_m_axis_tlast_converter_11_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_11;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_11_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_11;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_11_signal;
  sc_signal< bool > m_M11_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M12_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_12;
  sc_signal< bool > m_m_axis_tvalid_converter_12_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_12;
  sc_signal< bool > m_m_axis_tready_converter_12_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_12;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_12_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_12;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_12_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_12;
  sc_signal< bool > m_m_axis_tlast_converter_12_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_12;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_12_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_12;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_12_signal;
  sc_signal< bool > m_M12_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M13_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_13;
  sc_signal< bool > m_m_axis_tvalid_converter_13_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_13;
  sc_signal< bool > m_m_axis_tready_converter_13_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_13;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_13_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_13;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_13_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_13;
  sc_signal< bool > m_m_axis_tlast_converter_13_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_13;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_13_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_13;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_13_signal;
  sc_signal< bool > m_M13_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M14_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_14;
  sc_signal< bool > m_m_axis_tvalid_converter_14_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_14;
  sc_signal< bool > m_m_axis_tready_converter_14_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_14;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_14_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_14;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_14_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_14;
  sc_signal< bool > m_m_axis_tlast_converter_14_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_14;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_14_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_14;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_14_signal;
  sc_signal< bool > m_M14_AXIS_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<64,1536,16,64,1,1>* mp_M15_AXIS_transactor;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tvalid_converter_15;
  sc_signal< bool > m_m_axis_tvalid_converter_15_signal;
  xsc::common::vectorN2scalar_converter<16>* mp_m_axis_tready_converter_15;
  sc_signal< bool > m_m_axis_tready_converter_15_signal;
  xsc::common::vector2vector_converter<512,512>* mp_m_axis_tdata_converter_15;
  sc_signal< sc_bv<512> > m_m_axis_tdata_converter_15_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tkeep_converter_15;
  sc_signal< sc_bv<64> > m_m_axis_tkeep_converter_15_signal;
  xsc::common::scalar2vectorN_converter<16>* mp_m_axis_tlast_converter_15;
  sc_signal< bool > m_m_axis_tlast_converter_15_signal;
  xsc::common::vector2vector_converter<64,64>* mp_m_axis_tdest_converter_15;
  sc_signal< sc_bv<64> > m_m_axis_tdest_converter_15_signal;
  xsc::common::vector2vector_converter<1536,1536>* mp_m_axis_tuser_converter_15;
  sc_signal< sc_bv<1536> > m_m_axis_tuser_converter_15_signal;
  sc_signal< bool > m_M15_AXIS_transactor_rst_signal;

  xsc::xsc_concatenator<512, 16> * mp_m_axis_concat_tdata;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_0;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_1;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_2;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_3;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_4;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_5;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_6;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_7;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_8;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_9;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_10;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_11;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_12;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_13;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_14;
  sc_signal<sc_dt::sc_bv<512> > m_axis_concat_tdata_out_15;

  xsc::xsc_concatenator<64, 16> * mp_m_axis_concat_tdest;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_0;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_1;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_2;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_3;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_4;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_5;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_6;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_7;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_8;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_9;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_10;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_11;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_12;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_13;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_14;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tdest_out_15;


  xsc::xsc_concatenator<64, 16> * mp_m_axis_concat_tkeep;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_0;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_1;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_2;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_3;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_4;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_5;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_6;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_7;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_8;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_9;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_10;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_11;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_12;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_13;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_14;
  sc_signal<sc_dt::sc_bv<64> > m_axis_concat_tkeep_out_15;

  xsc::xsc_concatenator<16, 16> * mp_m_axis_concat_tlast;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_0;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_1;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_2;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_3;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_4;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_5;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_6;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_7;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_8;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_9;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_10;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_11;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_12;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_13;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_14;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tlast_out_15;

  xsc::xsc_split<16, 16> * mp_m_axis_split_tready;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_0;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_1;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_2;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_3;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_4;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_5;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_6;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_7;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_8;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_9;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_10;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_11;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_12;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_13;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_14;
  sc_signal<sc_dt::sc_bv<16> > m_axis_split_tready_out_15;


  xsc::xsc_concatenator<1536, 16> * mp_m_axis_concat_tuser;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_0;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_1;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_2;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_3;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_4;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_5;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_6;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_7;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_8;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_9;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_10;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_11;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_12;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_13;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_14;
  sc_signal<sc_dt::sc_bv<1536> > m_axis_concat_tuser_out_15;

  xsc::xsc_concatenator<16, 16> * mp_m_axis_concat_tvalid;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_0;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_1;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_2;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_3;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_4;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_5;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_6;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_7;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_8;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_9;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_10;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_11;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_12;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_13;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_14;
  sc_signal<sc_dt::sc_bv<16> > m_axis_concat_tvalid_out_15;

  // Transactor stubs
  xtlm::xtlm_axis_initiator_stub * M00_AXIS_transactor_initiator_socket_stub;
  xtlm::xtlm_axis_initiator_stub * M01_AXIS_transactor_initiator_socket_stub;
  xtlm::xtlm_axis_initiator_stub * M02_AXIS_transactor_initiator_socket_stub;
  xtlm::xtlm_axis_initiator_stub * M03_AXIS_transactor_initiator_socket_stub;
  xtlm::xtlm_axis_initiator_stub * M04_AXIS_transactor_initiator_socket_stub;
  xtlm::xtlm_axis_initiator_stub * M05_AXIS_transactor_initiator_socket_stub;
  xtlm::xtlm_axis_initiator_stub * M06_AXIS_transactor_initiator_socket_stub;
  xtlm::xtlm_axis_initiator_stub * M07_AXIS_transactor_initiator_socket_stub;
  xtlm::xtlm_axis_initiator_stub * M08_AXIS_transactor_initiator_socket_stub;
  xtlm::xtlm_axis_initiator_stub * M09_AXIS_transactor_initiator_socket_stub;
  xtlm::xtlm_axis_initiator_stub * M10_AXIS_transactor_initiator_socket_stub;
  xtlm::xtlm_axis_initiator_stub * M11_AXIS_transactor_initiator_socket_stub;
  xtlm::xtlm_axis_initiator_stub * M12_AXIS_transactor_initiator_socket_stub;
  xtlm::xtlm_axis_initiator_stub * M13_AXIS_transactor_initiator_socket_stub;
  xtlm::xtlm_axis_initiator_stub * M14_AXIS_transactor_initiator_socket_stub;
  xtlm::xtlm_axis_initiator_stub * M15_AXIS_transactor_initiator_socket_stub;
  xtlm::xtlm_axis_target_stub * S00_AXIS_transactor_target_socket_stub;

  // Socket stubs

};
#endif // MTI_SYSTEMC
#endif // IP_BD_D757_VFB_0_0_AXISSWITCH_H_
