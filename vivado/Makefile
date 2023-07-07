MODEL=mnist
default:
	python3 ../bin/andromeda.py --tflite ../model/$(MODEL).tflite --top $(MODEL) --clk 200e6 --fps 30 --rega 8 --regb 8 --dtype 8
	vivado -log $(MODEL).log -mode tcl -source build.tcl -tclargs $(MODEL)
