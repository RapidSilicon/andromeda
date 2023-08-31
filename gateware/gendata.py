import logging
logging.getLogger("tensorflow").setLevel(logging.DEBUG)

import tensorflow as tf
from tensorflow import keras
import numpy as np
import pathlib
#print(tf.lite.OpsSet.EXPERIMENTAL_TFLITE_BUILTINS_ACTIVATIONS_INT16_WEIGHTS_INT8)
import argparse
import cv2

parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument('--img', help='test image file',default='../model/thermal/dataset2/five_001/frame00100.jpg')
parser.add_argument('--tflite', help='tflite flatbuffer model file',default='../model/thermal/thermal.tflite')
parser.add_argument('--dtype', help='dtype width (int9, int16)',default=9, type=int)
#parser.add_argument('--n', help='test image',default=0, type=int)
parser.add_argument('--debug', help='verbose output',default=False, action='store_true')
args = parser.parse_args()
print(args)

# load tflite model
interpreter = tf.lite.Interpreter(model_path=args.tflite,experimental_preserve_all_tensors=True)
interpreter.allocate_tensors() # Needed before execution!
input_details = interpreter.get_input_details()[0]  # Model has single input.
output_details = interpreter.get_output_details()[0]  # Model has single output.
input_scale, input_zero_point = input_details["quantization"]
print('input_scale',input_scale,'input_zero_point',input_zero_point)
#print('input_details', input_details)
#print('output_details', output_details)

'''
# Load MNIST dataset
mnist = keras.datasets.mnist
(train_images, train_labels), (test_images, test_labels) = mnist.load_data()
train_images = train_images.astype(np.float32) / 255.0
test_images = test_images.astype(np.float32) / 255.0
'''

input_data = cv2.imread(args.img, cv2.IMREAD_GRAYSCALE).astype(np.float32)/255.

#input_data = test_images[args.n]
#input_data = input_data / input_scale + input_zero_point
input_data = input_data / input_scale
#input_data = input_data.astype(input_details["dtype"])
input_data = input_data.astype(np.int32)

np.set_printoptions(linewidth=200)
#print(args.n,test_labels[args.n],'\n',input_data)

s=''
for r in range(24):
    for c in range(32):
        for b in range(args.dtype,0,-1):
            if (input_data[r,c]>>(b-1))&1:
                s+='1'
            else:
                s+='0'
        s+='\n'

f = open('test_data.mem','w')
print(s,file=f)


# const int z[5] = {10, 11, 12, 13, 14}; 
s='const int test_data[768] = {\n'
for r in range(24):
    for c in range(32):
        s+='0b'
        for b in range(args.dtype,0,-1):
            if (input_data[r,c]>>(b-1))&1:
                s+='1'
            else:
                s+='0'
        s+=',\n'
s+='};'
f = open('test_data.h','w')
print(s,file=f)

