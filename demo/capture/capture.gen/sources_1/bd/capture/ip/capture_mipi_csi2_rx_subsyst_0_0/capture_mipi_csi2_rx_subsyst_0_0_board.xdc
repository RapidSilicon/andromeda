#--------------------Physical Constraints-----------------

set_property BOARD_PART_PIN {szg_porta_s0_d0p} [get_ports mipi_phy_if_clk_p]
set_property BOARD_PART_PIN {szg_porta_s2_d0n} [get_ports mipi_phy_if_clk_n]
set_property BOARD_PART_PIN {szg_porta_s4_d2p} [get_ports mipi_phy_if_data_p[0]]

set_property BOARD_PART_PIN {szg_porta_s8_d4p} [get_ports mipi_phy_if_data_p[1]]

set_property BOARD_PART_PIN {szg_porta_s6_d2n} [get_ports mipi_phy_if_data_n[0]]

set_property BOARD_PART_PIN {szg_porta_s10_d4n} [get_ports mipi_phy_if_data_n[1]]

