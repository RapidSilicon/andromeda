//------------------------------------------------------------------------
// File: hier_0_leds_0_0.v
// Creation Date: Mon 10/23/2023 at 17:02:44 -0700
// IP Version: opalkelly.com:ip:leds:1.0 (Rev: 3)
// Tool Version: Vivado v2023.2 (64-bit)
// Opal Kelly Board: XEM8320-AU25P (Part: xcau25p-ffvb676-2-e)
// 
// Copyright (c) 2022-2023 Opal Kelly Incorporated
//------------------------------------------------------------------------

`default_nettype none

module hier_0_leds_0_0(
  led_in,
  led_out
);

input wire [5 : 0] led_in;
(* X_INTERFACE_INFO = "opalkelly.com:interface:led:1.0 led_out LED_OUT" *)
output wire [5 : 0] led_out;

  led inst (
    .led_in(led_in),
    .led_out(led_out)
  );
  
endmodule
`default_nettype wire
