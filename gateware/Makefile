default:

andromeda::
	python3 ../bin/andromeda.py --tflite ../model/thermal/thermal.tflite --top thermal --clk 100e6 --fps 16 --regz 32 --regb 8 --dtype 9

test::
	iverilog -v -g2012 -s testbench testbench.v andromeda.v thermal.v thermal_rom.v ../src/conv2d.v ../src/conv2d_ctrl.v ../src/conv2d_data.v
