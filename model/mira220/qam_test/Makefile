CLK=500e6 # nstripe==1
ALT=alt1
BATCH=3

default:
	echo "make {train,quantize,test,sim}

train:
	python3 train.py --net $(ALT) --batch $(BATCH)
	#stdbuf -i0 -o0 -e0 python3 train.py --net $(ALT) --batch $(BATCH) |& stdbuf -i0 -o0 -e0 tee log.train
	#python3 train.py --net $(ALT) --batch $(BATCH) |& tee log.train

quantize:
	python3 quantize.py --dtype 16 |& tee log.quantize

andromeda:
	#python3 ../../bin/andromeda.py --tflite mira220.tflite --top mira220 --clk $(CLK) --fps 110 --regz 32 --regb 8 --dtype 8 |& tee log.andromeda
	python3 ../../bin/andromeda.py --tflite mira220.tflite --top mira220 --clk $(CLK) --fps 30 --regz 64 --regb 8 --dtype 16 |& tee log.andromeda

vivado:
	vivado -log log.vivado -mode tcl -source build.tcl -tclargs mira220
