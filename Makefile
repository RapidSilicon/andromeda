default:
	echo "usage: make {build,demo,clean}"

build::
	python3 ./gateware/andromeda.py --toolchain vivado --build --variant a7-100 --cpu-type vexriscv --with-pmod-gpio --with-spi-flash --csr-address-width 15 --with-ethernet
	echo "bitstream: ./build/digilent_arty/gateware/digilent_arty.bin"

demo::
	cd software && $(MAKE) BUILD_DIR=../build/digilent_arty all
	echo "application: ./software/demo.bin"

clean::
	cd software && $(MAKE) BUILD_DIR=../build/digilent_arty clean
	rm -rf build
