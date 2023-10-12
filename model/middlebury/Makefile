CLK=200e6 # nstripe==1
NET=alt1 # {1,2}

default:
	echo "make {train,quantize,test,sim}

train:
	python3 train.py --lr 0.001 --batch 1 --epochs 1000 --net $(NET) |& tee log.train

test:
	python3 test.py

quantize:
	python3 quantize.py |& tee log.quantize

andromeda:
	python3 ../../bin/andromeda.py --tflite mb2006.tflite --top mb2006 --clk $(CLK) --fps 90 --regz 64 --regb 8 --dtype 16 |& tee log.andromeda

vivado: andromeda
	vivado -log log.vivado -mode tcl -source build.tcl -tclargs mb2006
