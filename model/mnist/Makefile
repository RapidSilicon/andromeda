all: mnist_s1_q8x8 mnist_s1_q16x8 mnist_s2_q8x8 mnist_s2_q16x8

mnist_s1_q8x8:
	python3 mnist.py --stride 1 --dtype=8 --tflite mnist_s1_q8x8.tflite --epochs 5

mnist_s1_q16x8:
	python3 mnist.py --stride 1 --dtype=16 --tflite mnist_s1_q16x8.tflite --epochs 5

mnist_s2_q8x8:
	python3 mnist.py --stride 2 --dtype=8 --tflite mnist_s2_q8x8.tflite --epochs 5

mnist_s2_q16x8:
	python3 mnist.py --stride 2 --dtype=16 --tflite mnist_s2_q16x8.tflite --epochs 5
