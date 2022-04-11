default:
	echo "usage: make {build,clean}"

build::
	python3 andromeda.py --toolchain vivado --build --variant a7-100 --cpu-type vexriscv --with-pmod-gpio

copy:
	cp ./build/digilent_arty/gateware/digilent_arty.bin /mnt/c/Users/rob.liston/Desktop

clean:
	rm -rf build
