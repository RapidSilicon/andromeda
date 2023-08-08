default:
	echo "usage: make {compile_tb,gtk,init_soc,sim_soc,clean}"

compile_tb::
	iverilog ./../soc_if.v ./../rtl_ibuf/ibuf_defines.v ./../rtl_ibuf/sdp_bram.v ./../rtl_ibuf/i2c_master.v ./../rtl_ibuf/ibuf.v ./../andromeda.v ./andromeda_tb.v
	vvp a.out 

gtk::
	gtkwave dump.vcd
init_soc::
	python3 litex_sim.py --integrated-main-ram-size=0x10000 --cpu-type=vexriscv --no-compile-gateware;
	python3 ./demo/demo.py --build-path=./build/sim
sim_soc::
	python3 litex_sim.py --integrated-main-ram-size=0x10000 --cpu-type=vexriscv --ram-init=demo.bin --trace;

clean::
	rm -rf a.out dump.vcd build demo.bin
