import logging
logging.getLogger("tensorflow").setLevel(logging.DEBUG)

import tensorflow as tf
from tensorflow import keras
import numpy as np
import pathlib
#print(tf.lite.OpsSet.EXPERIMENTAL_TFLITE_BUILTINS_ACTIVATIONS_INT16_WEIGHTS_INT8)

# Load MNIST dataset
mnist = keras.datasets.mnist
(train_images, train_labels), (test_images, test_labels) = mnist.load_data()

np.set_printoptions(linewidth=200)
for i in range(10):
    print(i,test_labels[i],test_images[i])

s=''
for r in range(28):
    for c in range(28):
        for b in range(9):
            if (test_images[0,r,c]>>b)&1:
                s+='1'
            else:
                s+='0'
        s+='\n'

f = open('test_data.mem','w')
print(s,file=f)
