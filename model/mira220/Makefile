CLK=200e6 # nstripe==1
STRIDE=1 # {1,2}

default:
	echo "make {train,quantize,test,sim}

train:
	python3 train.py --stride $(STRIDE) |& tee train.log

quantize:
	python3 quantize.py |& tee quantize.log

andromeda:
	python3 ../../bin/andromeda.py --tflite mira220.tflite --top mira220 --clk $(CLK) --fps 110 --regz 32 --regb 8 --dtype 8 |& tee andromeda.log

vivado: andromeda
	vivado -log vivado.log -mode tcl -source build.tcl -tclargs mira220
