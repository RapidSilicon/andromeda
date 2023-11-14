//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
//Date        : Sat Nov 11 15:35:55 2023
//Host        : LAPTOP-FEFLDCST running 64-bit major release  (build 9200)
//Command     : generate_target capture_wrapper.bd
//Design      : capture_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module capture_wrapper
   (board_leds_led_out,
    fixed_fabric_100mhz_clk_n,
    fixed_fabric_100mhz_clk_p,
    host_interface_okaa,
    host_interface_okhu,
    host_interface_okuh,
    host_interface_okuhu,
    szg_port_a_cam1_iic_scl_io,
    szg_port_a_cam1_iic_sda_io,
    szg_port_a_cam1_reset_tri_o);
  output [5:0]board_leds_led_out;
  input fixed_fabric_100mhz_clk_n;
  input fixed_fabric_100mhz_clk_p;
  inout host_interface_okaa;
  output [2:0]host_interface_okhu;
  input [4:0]host_interface_okuh;
  inout [31:0]host_interface_okuhu;
  inout szg_port_a_cam1_iic_scl_io;
  inout szg_port_a_cam1_iic_sda_io;
  output szg_port_a_cam1_reset_tri_o;

  wire [5:0]board_leds_led_out;
  wire fixed_fabric_100mhz_clk_n;
  wire fixed_fabric_100mhz_clk_p;
  wire host_interface_okaa;
  wire [2:0]host_interface_okhu;
  wire [4:0]host_interface_okuh;
  wire [31:0]host_interface_okuhu;
  wire szg_port_a_cam1_iic_scl_i;
  wire szg_port_a_cam1_iic_scl_io;
  wire szg_port_a_cam1_iic_scl_o;
  wire szg_port_a_cam1_iic_scl_t;
  wire szg_port_a_cam1_iic_sda_i;
  wire szg_port_a_cam1_iic_sda_io;
  wire szg_port_a_cam1_iic_sda_o;
  wire szg_port_a_cam1_iic_sda_t;
  wire szg_port_a_cam1_reset_tri_o;

  capture capture_i
       (.board_leds_led_out(board_leds_led_out),
        .fixed_fabric_100mhz_clk_n(fixed_fabric_100mhz_clk_n),
        .fixed_fabric_100mhz_clk_p(fixed_fabric_100mhz_clk_p),
        .host_interface_okaa(host_interface_okaa),
        .host_interface_okhu(host_interface_okhu),
        .host_interface_okuh(host_interface_okuh),
        .host_interface_okuhu(host_interface_okuhu),
        .szg_port_a_cam1_iic_scl_i(szg_port_a_cam1_iic_scl_i),
        .szg_port_a_cam1_iic_scl_o(szg_port_a_cam1_iic_scl_o),
        .szg_port_a_cam1_iic_scl_t(szg_port_a_cam1_iic_scl_t),
        .szg_port_a_cam1_iic_sda_i(szg_port_a_cam1_iic_sda_i),
        .szg_port_a_cam1_iic_sda_o(szg_port_a_cam1_iic_sda_o),
        .szg_port_a_cam1_iic_sda_t(szg_port_a_cam1_iic_sda_t),
        .szg_port_a_cam1_reset_tri_o(szg_port_a_cam1_reset_tri_o));
  IOBUF szg_port_a_cam1_iic_scl_iobuf
       (.I(szg_port_a_cam1_iic_scl_o),
        .IO(szg_port_a_cam1_iic_scl_io),
        .O(szg_port_a_cam1_iic_scl_i),
        .T(szg_port_a_cam1_iic_scl_t));
  IOBUF szg_port_a_cam1_iic_sda_iobuf
       (.I(szg_port_a_cam1_iic_sda_o),
        .IO(szg_port_a_cam1_iic_sda_io),
        .O(szg_port_a_cam1_iic_sda_i),
        .T(szg_port_a_cam1_iic_sda_t));
endmodule
