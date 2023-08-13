default:
	echo "usage: make {build,demo,bts2hw,clean}"

andromeda::
	python3 ./bin/andromeda.py --tflite ./model/thermal/themal.tflite --top thermal --clk 100e6 --fps 16 --regz 32 --regb 8 --dtype 9

build::
	#python3 ./gateware/digilent_arty.py --toolchain vivado --build --variant a7-100 --cpu-type vexriscv --with-pmod-gpio --with-spi-flash --with-ethernet --integrated-rom-size=0x20000
	#python3 ./gateware/digilent_arty.py --toolchain vivado --build --variant a7-100 --cpu-type vexriscv --with-ethernet
	python3 ./gateware/digilent_arty.py --toolchain vivado --build --variant a7-100 --cpu-type vexriscv --with-ethernet
	echo "bitstream: ./build/digilent_arty/gateware/digilent_arty.bin"

bts2hw::
	vivado -mode tcl -source  hw.tcl

demo::
	cd software && $(MAKE) BUILD_DIR=../build/digilent_arty all
	echo "application: ./software/demo.bin"

clean::
	cd software && $(MAKE) BUILD_DIR=../build/digilent_arty clean
	rm -rf build vivado*
