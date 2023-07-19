MODEL=mnist
all: clean gendata andromeda vcs

gendata:
	python3 gendata.py --n 3

andromeda:
	python3 ../bin/andromeda.py --tflite ../model/$(MODEL).tflite --top $(MODEL) --clk 200e6 --fps 30 --regz 64 --regb 8 --dtype 16

vcs:
	vcs -sverilog +vpi -full64 +vcs+fsdbon+all mnist_tb.v mnist.v mnist_rom.v ../src/conv2d_data.v ../src/conv2d_ctrl.v ../src/conv2d.v
	./simv

iverilog:
	python3 ../bin/andromeda.py --tflite ../model/$(MODEL).tflite --top $(MODEL) --clk 200e6 --fps 30 --regz 32 --regb 8 --dtype 8
	../../iverilog/build/bin/iverilog mnist_tb.v mnist.v mnist_rom.v ../src/conv2d_data.v ../src/conv2d_ctrl.v ../src/conv2d.v
	./a.out

clean:
	rm -rf csrc simv.daidir simv
