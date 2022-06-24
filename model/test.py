import numpy as np ; print('numpy',np.__version__)
import tensorflow as tf ; print('tensorflow', tf.__version__)
from tensorflow import keras
from tensorflow.keras import layers
import argparse

parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument('--sigma', help='number of standard deviations for quantization',default=3, type=float)
args = parser.parse_args()
print(args)

(x_train, y_train), (x_test, y_test) = keras.datasets.mnist.load_data()
print(x_test.shape)
for i in range(10):
    f = open("x_test{:02d}.mem".format(i),"w")
    for x in x_test[i].flatten():
        q = int((x/255.)*(2**17))
        if q>=0:
            s = bin(q)[2:].zfill(18)
        else:
            s = bin(2**18 + q)[2:]
        print(s,file=f)
    f.close()
