default:
	#python3 ../bin/andromeda.py --tflite ../model/mnist_s2_q16x8.tflite --top mnist --clk 100e6 --fps 30 --regz 64 --regb 8 --dtype 16
	python3 ../bin/andromeda.py --tflite ../model/mnist_s2_q8x8.tflite --top mnist --clk 100e6 --fps 30 --regz 32 --regb 8 --dtype 9
	vivado -log mnist.log -mode tcl -source build.tcl -tclargs mnist

naneye:
	python3 ../bin/andromeda.py --tflite ../model/naneye.tflite --top naneye --clk 100e6 --fps 30 --regz 32 --regb 8 --dtype 9
	vivado -log naneye.log -mode tcl -source build.tcl -tclargs naneye

mira220:
	python3 ../bin/andromeda.py --tflite ../model/mira220.tflite --top mira220 --clk 200e6 --fps 60 --regz 32 --regb 8 --dtype 9
	vivado -log mira220.log -mode tcl -source build.tcl -tclargs mira220
