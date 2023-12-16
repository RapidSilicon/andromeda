default:

gendata::
	python3 gendata.py --img ../model/thermal/dataset2/two_001/frame00100.jpg --dtype 16

andromeda::
	python3 ../bin/andromeda.py --tflite ../model/thermal/thermal.tflite --top thermal --clk 100e6 --fps 16 --regz 64 --regb 8 --dtype 16

test::
	#iverilog -pfileline=1 -v -g2012 -s testbench testbench.v andromeda.v thermal.v thermal_rom.v ../src/conv2d.v ../src/conv2d_ctrl.v ../src/conv2d_data.v
	iverilog -v -g2012 -s testbench testbench.v andromeda.v thermal.v thermal_rom.v ../src/conv2d.v ../src/conv2d_ctrl.v ../src/conv2d_data.v

sim:
	xvlog testbench.v andromeda.v thermal.v thermal_rom.v ../src/conv2d.v ../src/conv2d_ctrl.v ../src/conv2d_data.v
	xelab testbench -timescale 1ns/1ps --debug typical
	xsim testbench --stats --testplusarg FILEINIT --log testbench.log --wdb testbench.wdb
