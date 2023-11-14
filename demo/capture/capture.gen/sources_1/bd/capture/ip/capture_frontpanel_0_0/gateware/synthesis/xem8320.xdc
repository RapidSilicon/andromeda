set_property CFGBVS GND [current_design]
set_property CONFIG_VOLTAGE 1.8 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS True [current_design]


# The XEM8320-AU25P board file is in use. Host interface pin location constraints
# are located in "_board.xdc" at the generated output products folder.

set_property IOSTANDARD LVCMOS18 [get_ports {okHU[*]}]
set_property IOSTANDARD LVCMOS18 [get_ports {okUH[*]}]
set_property IOSTANDARD LVCMOS18 [get_ports {okUHU[*]}]
set_property IOSTANDARD LVCMOS18 [get_ports {okAA}]
set_property SLEW FAST [get_ports {okHU[*]}]
set_property SLEW FAST [get_ports {okUHU[*]}]

create_clock -name okUH0 -period 9.920 [get_ports {okUH[0]}]
create_generated_clock -name dnaclkdiv32 -source [get_pins -hier mmcm0_bufg/O] -divide_by 32 [get_pins -hier a0/d0/dna0/CLK]

set_input_delay -add_delay -max -clock [get_clocks {okUH0}]  8.000 [get_ports -regexp {okUH\[[1-4]\]}]
set_input_delay -add_delay -min -clock [get_clocks {okUH0}] 9.920 [get_ports -regexp {okUH\[[1-4]\]}]
#set_multicycle_path -setup -from [get_ports -regexp {okUH\[[1-4]\]}] 2

set_input_delay -add_delay -max -clock [get_clocks {okUH0}]  7.000 [get_ports {okUHU[*]}]
set_input_delay -add_delay -min -clock [get_clocks {okUH0}]  2.000 [get_ports {okUHU[*]}]
#set_multicycle_path -setup -from [get_ports {okUHU[*]}] 2

set_output_delay -add_delay -max -clock [get_clocks {okUH0}]  2.000 [get_ports {okHU[*]}]
set_output_delay -add_delay -min -clock [get_clocks {okUH0}]  -0.500 [get_ports {okHU[*]}]

set_output_delay -add_delay -max -clock [get_clocks {okUH0}]  2.000 [get_ports {okUHU[*]}]
set_output_delay -add_delay -min -clock [get_clocks {okUH0}]  -0.500 [get_ports {okUHU[*]}]
