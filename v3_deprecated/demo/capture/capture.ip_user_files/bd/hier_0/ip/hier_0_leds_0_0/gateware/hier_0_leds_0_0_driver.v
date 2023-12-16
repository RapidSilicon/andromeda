//------------------------------------------------------------------------
// File: hier_0_leds_0_0_driver.v
// Creation Date: Mon 10/23/2023 at 17:02:44 -0700
// IP Version: opalkelly.com:ip:leds:1.0 (Rev: 3)
// Tool Version: Vivado v2023.2 (64-bit)
// Opal Kelly Board: XEM8320-AU25P (Part: xcau25p-ffvb676-2-e)
// 
// Copyright (c) 2022-2023 Opal Kelly Incorporated
//------------------------------------------------------------------------

`default_nettype none

module led (
    input  wire [5:0] led_in,
    output  wire [5:0] led_out
);

genvar i;
generate
    for (i = 0; i < 6; i = i + 1) begin
        OBUF OBUF_inst (
          .O (led_out[i]),  // Buffer output (connect directly to top-level port)
          .I (led_in[i])   // Buffer input
        );
    end
endgenerate

endmodule
`default_nettype wire
