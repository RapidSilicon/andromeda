SHELL=bash
CLK=500e6
DUMP=
#DUMP=+vcs+dumpvars+testbench.vcd
#DUMP=+vcs+fsdbon+all
SIM_COMPILE= vcs -j8 -sverilog +vpi -full64 $(DUMP) -pvalue+DTYPE=16
SIM_RUN= ./simv
##SIM_COMPILE= ~/iverilog/build/bin/iverilog -v -g2012 -s mnist_tb -P DTYPE=16 -o sim.vvp -pfileline=1
#SIM_COMPILE= ~/iverilog/build/bin/iverilog -v -g2012 -s mnist_tb -P DTYPE=16 -o sim.vvp
#SIM_RUN= "~/iverilog/build/bin/vvp sim.vvp -lxt2"


all: gallery train quantize andromeda test sim check

lazy: gallery lazy_train quantize andromeda test sim check

old_training:
	cp ./artifacts/encoder.tflite  ./

hardware: old_training andromeda

gallery:
	python3 train.py --smin 10 --smax 10 --stretch 0 --gallery

train:
	python3 train.py --smin 10 --smax 10 --stretch 0 --lr 0.00001 --batch 3 --nbatch 50000

lazy_train:
	python3 train.py --smin 10 --smax 10 --stretch 0 --lr 0.00001 --batch 3 --nbatch 5 # 5 !.. That's how much I can train :) 

quantize:
	python3 quant.py --dtype 16 --keras encoder.keras --tflite encoder.tflite |& tee log.quantize

andromeda:
	python3 ../bin/andromeda.py --tflite encoder.tflite --top encoder --clk $(CLK) --rowtime 20000e-9 --regz 64 --regb 8 --dtype 16 |& tee log.andromeda

test:
	python3 train.py --smin 10 --smax 10 --stretch 0 --test

sim:
	$(SIM_COMPILE) testbench.v encoder.v encoder_rom.v ../src/conv2d_data.v ../src/conv2d_ctrl.v ../src/conv2d.v
	script --command $(SIM_RUN) --flush log.sim

check:
	python3 check.py --log log.sim 
