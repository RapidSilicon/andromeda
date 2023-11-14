
################################################################
# This is a generated script based on design: capture
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2023.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   if { [string compare $scripts_vivado_version $current_vivado_version] > 0 } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2042 -severity "ERROR" " This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Sourcing the script failed since it was created with a future version of Vivado."}

   } else {
     catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   }

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source capture_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# fb_ahb

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcau25p-ffvb676-2-e
   set_property BOARD_PART opalkelly.com:xem8320-au25p_szg_port_a_szg_mipi_8320_szg_port_std:part0:1.2 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name capture

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
opalkelly.com:ip:frontpanel:1.0\
xilinx.com:ip:clk_wiz:6.0\
xilinx.com:ip:proc_sys_reset:5.0\
xilinx.com:ip:axi_crossbar:2.1\
xilinx.com:ip:axi_gpio:2.0\
xilinx.com:ip:axi_iic:2.1\
opalkelly.com:ip:leds:1.0\
"

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

##################################################################
# CHECK Modules
##################################################################
set bCheckModules 1
if { $bCheckModules == 1 } {
   set list_check_mods "\ 
fb_ahb\
"

   set list_mods_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2020 -severity "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2021 -severity "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_gid_msg -ssname BD::TCL -id 2022 -severity "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

if { $bCheckIPsPassed != 1 } {
  common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set host_interface [ create_bd_intf_port -mode Slave -vlnv opalkelly.com:interface:host_interface_rtl:1.0 host_interface ]

  set fixed_fabric_100mhz [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 fixed_fabric_100mhz ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {100000000} \
   ] $fixed_fabric_100mhz

  set board_leds [ create_bd_intf_port -mode Master -vlnv opalkelly.com:interface:led_rtl:1.0 board_leds ]

  set szg_port_a_cam1_iic [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 szg_port_a_cam1_iic ]

  set szg_port_a_cam1_reset [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 szg_port_a_cam1_reset ]


  # Create ports

  # Create instance: frontpanel_0, and set properties
  set frontpanel_0 [ create_bd_cell -type ip -vlnv opalkelly.com:ip:frontpanel:1.0 frontpanel_0 ]
  set_property -dict [list \
    CONFIG.BTPO.COUNT {0} \
    CONFIG.RB.EN {false} \
    CONFIG.TI.ADDR_0 {0x40} \
    CONFIG.TI.COUNT {1} \
    CONFIG.TO.ADDR_0 {0xff} \
    CONFIG.TO.ADDR_1 {0xff} \
    CONFIG.TO.COUNT {0} \
    CONFIG.WI.ADDR_0 {0x00} \
    CONFIG.WI.ADDR_1 {0x01} \
    CONFIG.WI.ADDR_2 {0x02} \
    CONFIG.WI.ADDR_3 {0x03} \
    CONFIG.WI.ADDR_4 {0x04} \
    CONFIG.WI.ADDR_5 {0x05} \
    CONFIG.WI.COUNT {6} \
    CONFIG.WO.ADDR_0 {0x20} \
    CONFIG.WO.ADDR_1 {0x21} \
    CONFIG.WO.ADDR_2 {0x22} \
    CONFIG.WO.ADDR_3 {0x23} \
    CONFIG.WO.COUNT {4} \
    CONFIG.host_interface_BOARD_INTERFACE {host_interface} \
  ] $frontpanel_0


  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_0 ]
  set_property -dict [list \
    CONFIG.AUTO_PRIMITIVE {BUFGCE_DIV} \
    CONFIG.CLKOUT1_DRIVES {Buffer} \
    CONFIG.CLKOUT1_JITTER {115.831} \
    CONFIG.CLKOUT1_PHASE_ERROR {87.180} \
    CONFIG.CLKOUT2_DRIVES {Buffer} \
    CONFIG.CLKOUT3_DRIVES {Buffer} \
    CONFIG.CLKOUT4_DRIVES {Buffer} \
    CONFIG.CLKOUT5_DRIVES {Buffer} \
    CONFIG.CLKOUT6_DRIVES {Buffer} \
    CONFIG.CLKOUT7_DRIVES {Buffer} \
    CONFIG.CLK_IN1_BOARD_INTERFACE {fixed_fabric_100mhz} \
    CONFIG.FEEDBACK_SOURCE {FDBK_AUTO} \
    CONFIG.MMCM_BANDWIDTH {OPTIMIZED} \
    CONFIG.MMCM_CLKFBOUT_MULT_F {12.000} \
    CONFIG.MMCM_CLKOUT0_DIVIDE_F {12.000} \
    CONFIG.MMCM_COMPENSATION {AUTO} \
    CONFIG.OPTIMIZE_CLOCKING_STRUCTURE_EN {true} \
    CONFIG.PRIMITIVE {Auto} \
    CONFIG.PRIM_SOURCE {Differential_clock_capable_pin} \
    CONFIG.USE_BOARD_FLOW {true} \
    CONFIG.USE_LOCKED {false} \
    CONFIG.USE_RESET {false} \
  ] $clk_wiz_0


  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: fb_ahb_0, and set properties
  set block_name fb_ahb
  set block_cell_name fb_ahb_0
  if { [catch {set fb_ahb_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $fb_ahb_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: axi_crossbar_0, and set properties
  set axi_crossbar_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_crossbar:2.1 axi_crossbar_0 ]
  set_property -dict [list \
    CONFIG.ADDR_RANGES {1} \
    CONFIG.M00_A00_ADDR_WIDTH {12} \
    CONFIG.M00_A00_BASE_ADDR {0x0000000000100000} \
    CONFIG.M01_A00_ADDR_WIDTH {12} \
    CONFIG.M01_A00_BASE_ADDR {0x0000000000200000} \
    CONFIG.STRATEGY {0} \
  ] $axi_crossbar_0


  # Create instance: axi_gpio_0, and set properties
  set axi_gpio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0 ]
  set_property -dict [list \
    CONFIG.C_ALL_OUTPUTS {1} \
    CONFIG.C_GPIO_WIDTH {6} \
    CONFIG.GPIO2_BOARD_INTERFACE {szg_port_a_cam1_reset} \
    CONFIG.USE_BOARD_FLOW {true} \
  ] $axi_gpio_0


  # Create instance: axi_iic_0, and set properties
  set axi_iic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic:2.1 axi_iic_0 ]
  set_property -dict [list \
    CONFIG.C_SCL_INERTIAL_DELAY {3} \
    CONFIG.C_SDA_INERTIAL_DELAY {3} \
    CONFIG.C_SDA_LEVEL {1} \
    CONFIG.IIC_BOARD_INTERFACE {szg_port_a_cam1_iic} \
    CONFIG.USE_BOARD_FLOW {true} \
  ] $axi_iic_0


  # Create instance: leds_0, and set properties
  set leds_0 [ create_bd_cell -type ip -vlnv opalkelly.com:ip:leds:1.0 leds_0 ]
  set_property CONFIG.LED_OUT_BOARD_INTERFACE {board_leds} $leds_0


  # Create interface connections
  connect_bd_intf_net -intf_net axi_crossbar_0_M00_AXI [get_bd_intf_pins axi_gpio_0/S_AXI] [get_bd_intf_pins axi_crossbar_0/M00_AXI]
  connect_bd_intf_net -intf_net axi_crossbar_0_M01_AXI [get_bd_intf_pins axi_iic_0/S_AXI] [get_bd_intf_pins axi_crossbar_0/M01_AXI]
  connect_bd_intf_net -intf_net axi_gpio_0_GPIO2 [get_bd_intf_ports szg_port_a_cam1_reset] [get_bd_intf_pins axi_gpio_0/GPIO2]
  connect_bd_intf_net -intf_net axi_iic_0_IIC [get_bd_intf_ports szg_port_a_cam1_iic] [get_bd_intf_pins axi_iic_0/IIC]
  connect_bd_intf_net -intf_net fixed_fabric_100mhz_1 [get_bd_intf_ports fixed_fabric_100mhz] [get_bd_intf_pins clk_wiz_0/CLK_IN1_D]
  connect_bd_intf_net -intf_net host_interface_1 [get_bd_intf_ports host_interface] [get_bd_intf_pins frontpanel_0/host_interface]
  connect_bd_intf_net -intf_net leds_0_led_out [get_bd_intf_ports board_leds] [get_bd_intf_pins leds_0/led_out]

  # Create port connections
  connect_bd_net -net axi_crossbar_0_s_axi_arready [get_bd_pins axi_crossbar_0/s_axi_arready] [get_bd_pins fb_ahb_0/i_axi_arready]
  connect_bd_net -net axi_crossbar_0_s_axi_awready [get_bd_pins axi_crossbar_0/s_axi_awready] [get_bd_pins fb_ahb_0/i_axi_awready]
  connect_bd_net -net axi_crossbar_0_s_axi_bresp [get_bd_pins axi_crossbar_0/s_axi_bresp] [get_bd_pins fb_ahb_0/i_axi_bresp]
  connect_bd_net -net axi_crossbar_0_s_axi_bvalid [get_bd_pins axi_crossbar_0/s_axi_bvalid] [get_bd_pins fb_ahb_0/i_axi_bvalid]
  connect_bd_net -net axi_crossbar_0_s_axi_rdata [get_bd_pins axi_crossbar_0/s_axi_rdata] [get_bd_pins fb_ahb_0/i_axi_rdata]
  connect_bd_net -net axi_crossbar_0_s_axi_rresp [get_bd_pins axi_crossbar_0/s_axi_rresp] [get_bd_pins fb_ahb_0/i_axi_rresp]
  connect_bd_net -net axi_crossbar_0_s_axi_rvalid [get_bd_pins axi_crossbar_0/s_axi_rvalid] [get_bd_pins fb_ahb_0/i_axi_rvalid]
  connect_bd_net -net axi_crossbar_0_s_axi_wready [get_bd_pins axi_crossbar_0/s_axi_wready] [get_bd_pins fb_ahb_0/i_axi_wready]
  connect_bd_net -net axi_gpio_0_gpio_io_o [get_bd_pins axi_gpio_0/gpio_io_o] [get_bd_pins leds_0/led_in]
  connect_bd_net -net fb_ahb_0_global_resetn [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_crossbar_0/aresetn] [get_bd_pins axi_gpio_0/s_axi_aresetn] [get_bd_pins axi_iic_0/s_axi_aresetn] [get_bd_pins fb_ahb_0/resetn]
  connect_bd_net -net fb_ahb_0_global_resetn1 [get_bd_pins fb_ahb_0/global_resetn] [get_bd_pins proc_sys_reset_0/ext_reset_in]
  connect_bd_net -net fb_ahb_0_o_axi_araddr [get_bd_pins fb_ahb_0/o_axi_araddr] [get_bd_pins axi_crossbar_0/s_axi_araddr]
  connect_bd_net -net fb_ahb_0_o_axi_arprot [get_bd_pins fb_ahb_0/o_axi_arprot] [get_bd_pins axi_crossbar_0/s_axi_arprot]
  connect_bd_net -net fb_ahb_0_o_axi_arvalid [get_bd_pins fb_ahb_0/o_axi_arvalid] [get_bd_pins axi_crossbar_0/s_axi_arvalid]
  connect_bd_net -net fb_ahb_0_o_axi_awaddr [get_bd_pins fb_ahb_0/o_axi_awaddr] [get_bd_pins axi_crossbar_0/s_axi_awaddr]
  connect_bd_net -net fb_ahb_0_o_axi_awprot [get_bd_pins fb_ahb_0/o_axi_awprot] [get_bd_pins axi_crossbar_0/s_axi_awprot]
  connect_bd_net -net fb_ahb_0_o_axi_awvalid [get_bd_pins fb_ahb_0/o_axi_awvalid] [get_bd_pins axi_crossbar_0/s_axi_awvalid]
  connect_bd_net -net fb_ahb_0_o_axi_bready [get_bd_pins fb_ahb_0/o_axi_bready] [get_bd_pins axi_crossbar_0/s_axi_bready]
  connect_bd_net -net fb_ahb_0_o_axi_rready [get_bd_pins fb_ahb_0/o_axi_rready] [get_bd_pins axi_crossbar_0/s_axi_rready]
  connect_bd_net -net fb_ahb_0_o_axi_wdata [get_bd_pins fb_ahb_0/o_axi_wdata] [get_bd_pins axi_crossbar_0/s_axi_wdata]
  connect_bd_net -net fb_ahb_0_o_axi_wstrb [get_bd_pins fb_ahb_0/o_axi_wstrb] [get_bd_pins axi_crossbar_0/s_axi_wstrb]
  connect_bd_net -net fb_ahb_0_o_axi_wvalid [get_bd_pins fb_ahb_0/o_axi_wvalid] [get_bd_pins axi_crossbar_0/s_axi_wvalid]
  connect_bd_net -net fb_ahb_0_wireout20 [get_bd_pins fb_ahb_0/wireout20] [get_bd_pins frontpanel_0/wo20_ep_datain]
  connect_bd_net -net fb_ahb_0_wireout21 [get_bd_pins fb_ahb_0/wireout21] [get_bd_pins frontpanel_0/wo21_ep_datain]
  connect_bd_net -net fb_ahb_0_wireout22 [get_bd_pins fb_ahb_0/wireout22] [get_bd_pins frontpanel_0/wo22_ep_datain]
  connect_bd_net -net fb_ahb_0_wireout23 [get_bd_pins fb_ahb_0/wireout23] [get_bd_pins frontpanel_0/wo23_ep_datain]
  connect_bd_net -net frontpanel_0_okClk [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins frontpanel_0/ti40_ep_clk] [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins axi_crossbar_0/aclk] [get_bd_pins axi_gpio_0/s_axi_aclk] [get_bd_pins axi_iic_0/s_axi_aclk] [get_bd_pins fb_ahb_0/clk]
  connect_bd_net -net frontpanel_0_ti40_ep_trigger [get_bd_pins frontpanel_0/ti40_ep_trigger] [get_bd_pins fb_ahb_0/triggerin40]
  connect_bd_net -net frontpanel_0_wi00_ep_dataout [get_bd_pins frontpanel_0/wi00_ep_dataout] [get_bd_pins fb_ahb_0/wirein00]
  connect_bd_net -net frontpanel_0_wi01_ep_dataout [get_bd_pins frontpanel_0/wi01_ep_dataout] [get_bd_pins fb_ahb_0/wirein01]
  connect_bd_net -net frontpanel_0_wi02_ep_dataout [get_bd_pins frontpanel_0/wi02_ep_dataout] [get_bd_pins fb_ahb_0/wirein02]
  connect_bd_net -net frontpanel_0_wi03_ep_dataout [get_bd_pins frontpanel_0/wi03_ep_dataout] [get_bd_pins fb_ahb_0/wirein03]
  connect_bd_net -net frontpanel_0_wi04_ep_dataout [get_bd_pins frontpanel_0/wi04_ep_dataout] [get_bd_pins fb_ahb_0/wirein04]
  connect_bd_net -net frontpanel_0_wi05_ep_dataout [get_bd_pins frontpanel_0/wi05_ep_dataout] [get_bd_pins fb_ahb_0/wirein05]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


