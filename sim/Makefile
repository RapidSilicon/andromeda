MODEL=mnist
default:
	python3 ../bin/andromeda.py --tflite ../model/$(MODEL).tflite --top $(MODEL) --clk 200e6 --fps 30 --rega 8 --regb 8 --dtype 8
	../../iverilog/build/bin/iverilog mnist_tb.v mnist.v mnist_rom.v ../src/conv2d_data.v ../src/conv2d_ctrl.v ../src/conv2d.v
	./a.out
