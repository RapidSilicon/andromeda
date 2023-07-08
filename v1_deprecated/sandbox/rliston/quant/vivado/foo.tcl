read_verilog -sv foo.v
synth_design -top rams_sp_rom_1 
report_utilization
report_timing -max_paths 100
