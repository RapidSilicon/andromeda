// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Tue Oct 24 12:09:12 2023
// Host        : LAPTOP-FEFLDCST running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top hier_0_leds_0_0 -prefix
//               hier_0_leds_0_0_ hier_0_inst_0_leds_0_0_stub.v
// Design      : hier_0_inst_0_leds_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcau25p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module hier_0_leds_0_0(led_in, led_out)
/* synthesis syn_black_box black_box_pad_pin="led_in[5:0],led_out[5:0]" */;
  input [5:0]led_in;
  output [5:0]led_out;
endmodule
