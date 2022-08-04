default:
	echo "usage: make {build,demo,bts2hw,clean}"

build::
	python3 ./gateware/digilent_arty.py --toolchain vivado --build --variant a7-100 --cpu-type vexriscv --with-pmod-gpio --with-spi-flash --with-ethernet --integrated-rom-size=0x20000
	echo "bitstream: ./build/digilent_arty/gateware/digilent_arty.bin"
bts2hw::
	vivado -mode tcl -source  hw.tcl

demo::
	cd software && $(MAKE) BUILD_DIR=../build/digilent_arty all
	echo "application: ./software/demo.bin"

clean::
	cd software && $(MAKE) BUILD_DIR=../build/digilent_arty clean
	rm -rf build vivado*
