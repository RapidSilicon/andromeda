set_property IOSTANDARD LVCMOS12 [get_ports {led_out[*]}]
set_property DRIVE 8 [get_ports {led_out[*]}]
set_false_path -to [get_ports {led_out[*]}]
