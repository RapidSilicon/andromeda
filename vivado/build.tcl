set_param synth.elaboration.rodinMoreOptions "rt::set_parameter var_size_limit 300000000"
read_verilog ./${argv}.v
read_verilog ./${argv}_rom.v
read_verilog -sv ../src/conv2d_data.v
read_verilog -sv ../src/conv2d_ctrl.v
read_verilog -sv ../src/conv2d.v
read_xdc build.xdc
#synth_design -top ${argv} -part "xc7vx485tffg1761-2"
synth_design -top ${argv} -part "xc7vx1140tflg1926-1"
#synth_design -top ${argv} -part "XC7A100TCSG324-1"
report_utilization
opt_design -directive Explore
place_design -directive ExtraTimingOpt
phys_opt_design -directive AggressiveExplore
phys_opt_design -directive AggressiveFanoutOpt
#route_design -directive MoreGlobalIterations
route_design -directive Explore
#phys_opt_design -directive Explore
##phys_opt_design -directive AggressiveFanoutOpt
report_route_status
report_timing_summary
report_timing -max_paths 100 -unique_pins -path_type full
report_utilization
exit
