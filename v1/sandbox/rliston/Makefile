default:
	echo "usage: make {build,clean}"

build::
	python3 andromeda.py --toolchain vivado --build --variant a7-100 --cpu-type vexriscv --with-pmod-gpio --with-spi-flash --csr-address-width 15 --with-ethernet

copy::
	cp ./build/digilent_arty/gateware/digilent_arty.bin /mnt/c/Users/rob.liston/Desktop

demo::
	cd demo && $(MAKE) BUILD_DIR=../build/digilent_arty all

clean::
	cd demo && $(MAKE) BUILD_DIR=../build/digilent_arty clean
	rm -rf build
