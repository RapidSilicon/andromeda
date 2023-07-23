MODEL=mnist
DUMP=
#DUMP=+vcs+fsdbon+all
tf8x8:
	python3 gendata.py --n 409 --dtype 9 --tflite ../model/$(MODEL).tflite
	python3 ../bin/andromeda.py --tflite ../model/$(MODEL).tflite --top $(MODEL) --clk 200e6 --fps 30 --regz 32 --regb 8 --dtype 9
	vcs -sverilog +vpi -full64 $(DUMP) -pvalue+DTYPE=9 mnist_tb.v mnist.v mnist_rom.v ../src/conv2d_data.v ../src/conv2d_ctrl.v ../src/conv2d.v
	./simv

tf8x16:
	python3 gendata.py --n 409 --dtype 16 --tflite ../model/mnist.tflite.8x16
	python3 ../bin/andromeda.py --tflite ../model/mnist.tflite.8x16 --top $(MODEL) --clk 200e6 --fps 30 --regz 64 --regb 8 --dtype 16
	vcs -sverilog +vpi -full64 $(DUMP) -pvalue+DTYPE=16 mnist_tb.v mnist.v mnist_rom.v ../src/conv2d_data.v ../src/conv2d_ctrl.v ../src/conv2d.v
	./simv

clean:
	rm -rf csrc simv.daidir simv
