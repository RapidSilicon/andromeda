set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { S_AXI_ACLK }]; #IO_L12P_T1_MRCC_35 Sch=gclk[100]

## Pmod Header JA
set_property -dict { PACKAGE_PIN G13   IOSTANDARD LVCMOS33 } [get_ports { I2C_SDA }]; #IO_0_15 Sch=ja[1]
set_property PULLUP true [get_ports { I2C_SDA }]
set_property -dict { PACKAGE_PIN B11   IOSTANDARD LVCMOS33 } [get_ports { I2C_SCL }]; #IO_L4P_T0_15 Sch=ja[2]
set_property PULLUP true [get_ports { I2C_SCL }]