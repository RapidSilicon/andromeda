CLK=200e6 # nstripe==1
NET=alt1 # {1,2}
DUMP=
#DUMP=+vcs+fsdbon+all
#SIM_COMPILE= vcs -sverilog +vpi -full64 $(DUMP) -pvalue+DTYPE=16
#SIM_RUN= ./simv
##SIM_COMPILE= ~/iverilog/build/bin/iverilog -v -g2012 -s mnist_tb -P DTYPE=16 -o sim.vvp -pfileline=1
SIM_COMPILE= ~/iverilog/build/bin/iverilog -v -g2012 -s testbench -P DTYPE=9 -o sim.vvp
SIM_RUN= "~/iverilog/build/bin/vvp sim.vvp -lxt2"

default:
	echo "make {train,quantize,test,sim}

train:
	python3 train.py --lr 0.001 --batch 1 --epochs 500 --net $(NET) |& tee log.train

test:
	python3 test.py

quantize:
	python3 quantize.py --dtype 8 |& tee log.quantize

andromeda:
	python3 ../../bin/andromeda.py --tflite mb2006.tflite --top mb2006 --clk $(CLK) --fps 110 --regz 32 --regb 8 --dtype 9 |& tee log.andromeda

vivado: andromeda
	vivado -log log.vivado -mode tcl -source build.tcl -tclargs mb2006

gendata:
	python3 png2mem.py --data dataset/Flowerpots/view1.png --memb data_0.mem
	python3 png2mem.py --data dataset/Flowerpots/view5.png --memb data_1.mem

sim: andromeda gendata
	$(SIM_COMPILE) testbench.v mb2006.v mb2006_rom.v ../../src/conv2d_data.v ../../src/conv2d_ctrl.v ../../src/conv2d.v ../../src/doublerow.v ../../src/concatenate.v ../../src/replicate.v
	script --command $(SIM_RUN) --flush sim.log

