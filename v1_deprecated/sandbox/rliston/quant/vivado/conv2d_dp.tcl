read_verilog -sv ../conv2d_dp.v
read_xdc conv2d_dp.xdc
synth_design -top conv2d_dp
report_utilization
report_timing -max_paths 100
