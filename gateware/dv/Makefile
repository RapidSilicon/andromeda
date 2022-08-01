default:
	echo "usage: make {iveri,gtk,clean}"

iveri::
	iverilog ./../soc_if.v ./../rtl_ibuf/ibuf_defines.v ./../rtl_ibuf/sdp_bram.v ./../rtl_ibuf/i2c_master.v ./../rtl_ibuf/ibuf.v ./../andromeda.v ./andromeda_tb.v
	vvp a.out 

gtk::
	gtkwave dump.vcd

clean::
	rm -rf a.out dump.vcd
