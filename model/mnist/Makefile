#CLK=100e6
CLK=2e6
#DUMP=
DUMP=+vcs+fsdbon+all
SIM_COMPILE= vcs -sverilog +vpi -full64 $(DUMP) -pvalue+DTYPE=16
SIM_RUN= ./simv

##SIM_COMPILE= ~/iverilog/build/bin/iverilog -v -g2012 -s mnist_tb -P DTYPE=16 -o sim.vvp -pfileline=1
#SIM_COMPILE= ~/iverilog/build/bin/iverilog -v -g2012 -s mnist_tb -P DTYPE=16 -o sim.vvp
#SIM_RUN= "~/iverilog/build/bin/vvp sim.vvp -lxt2"

default:
	echo "make {train,quantize,test,sim}

train:
	python3 train.py

quantize:
	python3 quantize.py

test:
	python3 test.py --tflite mnist.tflite --dtype 16 |& tee test.log

andromeda:
	python3 ../../bin/andromeda.py --tflite mnist.tflite --top mnist --clk $(CLK) --fps 30 --regz 64 --regb 8 --dtype 16 |& tee andromeda.log

sim:
	python3 ../../bin/andromeda.py --tflite mnist.tflite --top mnist --clk $(CLK) --fps 30 --regz 64 --regb 8 --dtype 16
	$(SIM_COMPILE) mnist_tb.v mnist.v mnist_rom.v ../../src/conv2d_data.v ../../src/conv2d_ctrl.v ../../src/conv2d.v
	script --command $(SIM_RUN) --flush sim.log

