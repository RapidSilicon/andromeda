MODEL=mnist
default:
	#python3 ../bin/andromeda.py --tflite ../model/$(MODEL).tflite --top $(MODEL) --clk 200e6 --fps 30 --regz 32 --regb 8 --dtype 9
	python3 ../bin/andromeda.py --tflite ../model/mnist.tflite.8x16 --top $(MODEL) --clk 200e6 --fps 30 --regz 64 --regb 8 --dtype 16
	vivado -log $(MODEL).log -mode tcl -source build.tcl -tclargs $(MODEL)
