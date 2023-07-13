MODEL=mnist
default: vcs

vcs:
	python3 ../bin/andromeda.py --tflite ../model/$(MODEL).tflite --top $(MODEL) --clk 200e6 --fps 30 --rega 9 --regb 8 --dtype 9
	vcs -sverilog +vpi -full64 +vcs+fsdbon+all mnist_tb.v mnist.v mnist_rom.v ../src/conv2d_data.v ../src/conv2d_ctrl.v ../src/conv2d.v
	./simv

iverilog:
	python3 ../bin/andromeda.py --tflite ../model/$(MODEL).tflite --top $(MODEL) --clk 200e6 --fps 30 --rega 9 --regb 8 --dtype 9
	../../iverilog/build/bin/iverilog mnist_tb.v mnist.v mnist_rom.v ../src/conv2d_data.v ../src/conv2d_ctrl.v ../src/conv2d.v
	./a.out

gendata:
	python3 gendata.py
