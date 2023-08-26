N=0 # sample number from MNIST test data

CLK=100e6
#CLK=150e4

DUMP=
#DUMP=+vcs+fsdbon+all

SIM_COMPILE= vcs -sverilog +vpi -full64 $(DUMP) -pvalue+DTYPE=9
SIM_RUN= ./simv

#SIM_COMPILE= ~/iverilog/build/bin/iverilog -v -g2012 -s mnist_tb -P DTYPE=9
#SIM_RUN= ./a.out

default:

all: clean mnist_s1_q8x8 mnist_s1_q16x8 mnist_s2_q8x8 mnist_s2_q16x8

mnist_s1_q8x8:
	python3 gendata.py --n $(N) --dtype 9 --tflite ../model/mnist_s1_q8x8.tflite
	python3 ../bin/andromeda.py --tflite ../model/mnist_s1_q8x8.tflite --top mnist --clk $(CLK) --fps 30 --regz 32 --regb 8 --dtype 9
	$(SIM_COMPILE) mnist_tb.v mnist.v mnist_rom.v ../src/conv2d_data.v ../src/conv2d_ctrl.v ../src/conv2d.v
	$(SIM_RUN)
	#vcs -sverilog +vpi -full64 $(DUMP) -pvalue+DTYPE=9 mnist_tb.v mnist.v mnist_rom.v ../src/conv2d_data.v ../src/conv2d_ctrl.v ../src/conv2d.v
	#./simv
	#iverilog -v -g2012 -s mnist_tb -P DTYPE=9 mnist_tb.v mnist.v mnist_rom.v ../src/conv2d_data.v ../src/conv2d_ctrl.v ../src/conv2d.v
	#./a.out

mnist_s1_q16x8:
	python3 gendata.py --n $(N) --dtype 16 --tflite ../model/mnist_s1_q16x8.tflite
	python3 ../bin/andromeda.py --tflite ../model/mnist_s1_q16x8.tflite --top mnist --clk $(CLK) --fps 30 --regz 64 --regb 8 --dtype 16
	vcs -sverilog +vpi -full64 $(DUMP) -pvalue+DTYPE=16 mnist_tb.v mnist.v mnist_rom.v ../src/conv2d_data.v ../src/conv2d_ctrl.v ../src/conv2d.v
	./simv

mnist_s2_q8x8:
	python3 gendata.py --n $(N) --dtype 9 --tflite ../model/mnist_s2_q8x8.tflite
	python3 ../bin/andromeda.py --tflite ../model/mnist_s2_q8x8.tflite --top mnist --clk $(CLK) --fps 30 --regz 32 --regb 8 --dtype 9
	vcs -sverilog +vpi -full64 $(DUMP) -pvalue+DTYPE=9 mnist_tb.v mnist.v mnist_rom.v ../src/conv2d_data.v ../src/conv2d_ctrl.v ../src/conv2d.v
	./simv

mnist_s2_q16x8:
	python3 gendata.py --n $(N) --dtype 16 --tflite ../model/mnist_s2_q16x8.tflite
	python3 ../bin/andromeda.py --tflite ../model/mnist_s2_q16x8.tflite --top mnist --clk $(CLK) --fps 30 --regz 64 --regb 8 --dtype 16
	vcs -sverilog +vpi -full64 $(DUMP) -pvalue+DTYPE=16 mnist_tb.v mnist.v mnist_rom.v ../src/conv2d_data.v ../src/conv2d_ctrl.v ../src/conv2d.v
	./simv

clean:
	rm -rf csrc simv.daidir simv
