# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "AW" -parent ${Page_0}
  ipgui::add_param $IPINST -name "AXI_READ_ID" -parent ${Page_0}
  ipgui::add_param $IPINST -name "AXI_WRITE_ID" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_AXI_ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_AXI_DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_AXI_ID_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DW" -parent ${Page_0}
  ipgui::add_param $IPINST -name "LGFIFO" -parent ${Page_0}
  ipgui::add_param $IPINST -name "OPT_LITTLE_ENDIAN" -parent ${Page_0}


}

proc update_PARAM_VALUE.AW { PARAM_VALUE.AW } {
	# Procedure called to update AW when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AW { PARAM_VALUE.AW } {
	# Procedure called to validate AW
	return true
}

proc update_PARAM_VALUE.AXI_READ_ID { PARAM_VALUE.AXI_READ_ID } {
	# Procedure called to update AXI_READ_ID when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_READ_ID { PARAM_VALUE.AXI_READ_ID } {
	# Procedure called to validate AXI_READ_ID
	return true
}

proc update_PARAM_VALUE.AXI_WRITE_ID { PARAM_VALUE.AXI_WRITE_ID } {
	# Procedure called to update AXI_WRITE_ID when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_WRITE_ID { PARAM_VALUE.AXI_WRITE_ID } {
	# Procedure called to validate AXI_WRITE_ID
	return true
}

proc update_PARAM_VALUE.C_AXI_ADDR_WIDTH { PARAM_VALUE.C_AXI_ADDR_WIDTH } {
	# Procedure called to update C_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_AXI_ADDR_WIDTH { PARAM_VALUE.C_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_AXI_DATA_WIDTH { PARAM_VALUE.C_AXI_DATA_WIDTH } {
	# Procedure called to update C_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_AXI_DATA_WIDTH { PARAM_VALUE.C_AXI_DATA_WIDTH } {
	# Procedure called to validate C_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_AXI_ID_WIDTH { PARAM_VALUE.C_AXI_ID_WIDTH } {
	# Procedure called to update C_AXI_ID_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_AXI_ID_WIDTH { PARAM_VALUE.C_AXI_ID_WIDTH } {
	# Procedure called to validate C_AXI_ID_WIDTH
	return true
}

proc update_PARAM_VALUE.DW { PARAM_VALUE.DW } {
	# Procedure called to update DW when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DW { PARAM_VALUE.DW } {
	# Procedure called to validate DW
	return true
}

proc update_PARAM_VALUE.LGFIFO { PARAM_VALUE.LGFIFO } {
	# Procedure called to update LGFIFO when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.LGFIFO { PARAM_VALUE.LGFIFO } {
	# Procedure called to validate LGFIFO
	return true
}

proc update_PARAM_VALUE.OPT_LITTLE_ENDIAN { PARAM_VALUE.OPT_LITTLE_ENDIAN } {
	# Procedure called to update OPT_LITTLE_ENDIAN when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.OPT_LITTLE_ENDIAN { PARAM_VALUE.OPT_LITTLE_ENDIAN } {
	# Procedure called to validate OPT_LITTLE_ENDIAN
	return true
}


proc update_MODELPARAM_VALUE.C_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_AXI_DATA_WIDTH PARAM_VALUE.C_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_AXI_ADDR_WIDTH PARAM_VALUE.C_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_AXI_ID_WIDTH { MODELPARAM_VALUE.C_AXI_ID_WIDTH PARAM_VALUE.C_AXI_ID_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_AXI_ID_WIDTH}] ${MODELPARAM_VALUE.C_AXI_ID_WIDTH}
}

proc update_MODELPARAM_VALUE.DW { MODELPARAM_VALUE.DW PARAM_VALUE.DW } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DW}] ${MODELPARAM_VALUE.DW}
}

proc update_MODELPARAM_VALUE.AW { MODELPARAM_VALUE.AW PARAM_VALUE.AW } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AW}] ${MODELPARAM_VALUE.AW}
}

proc update_MODELPARAM_VALUE.AXI_WRITE_ID { MODELPARAM_VALUE.AXI_WRITE_ID PARAM_VALUE.AXI_WRITE_ID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_WRITE_ID}] ${MODELPARAM_VALUE.AXI_WRITE_ID}
}

proc update_MODELPARAM_VALUE.AXI_READ_ID { MODELPARAM_VALUE.AXI_READ_ID PARAM_VALUE.AXI_READ_ID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_READ_ID}] ${MODELPARAM_VALUE.AXI_READ_ID}
}

proc update_MODELPARAM_VALUE.OPT_LITTLE_ENDIAN { MODELPARAM_VALUE.OPT_LITTLE_ENDIAN PARAM_VALUE.OPT_LITTLE_ENDIAN } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OPT_LITTLE_ENDIAN}] ${MODELPARAM_VALUE.OPT_LITTLE_ENDIAN}
}

proc update_MODELPARAM_VALUE.LGFIFO { MODELPARAM_VALUE.LGFIFO PARAM_VALUE.LGFIFO } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.LGFIFO}] ${MODELPARAM_VALUE.LGFIFO}
}

