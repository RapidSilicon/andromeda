import logging
logging.getLogger("tensorflow").setLevel(logging.DEBUG)

import tensorflow as tf
from tensorflow import keras
import numpy as np
import os
import argparse
import cv2

parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument('--dataset', help='dataset directory',default='./dataset')
parser.add_argument('--keras', help='keras model file',default='mb2006.keras')
parser.add_argument('--tflite', help='tflite flatbuffer model file',default='mb2006.tflite')
parser.add_argument('--dtype', help='dtype width (int8, int16)',default=8, type=int)
parser.add_argument('--debug', help='verbose output',default=False, action='store_true')
args = parser.parse_args()
print(args)

# Load MNIST dataset
#mnist = keras.datasets.mnist
#(train_images, train_labels), (test_images, test_labels) = mnist.load_data()
#train_images = train_images.astype(np.float32) / 255.0
#test_images = test_images.astype(np.float32) / 255.0

# load Middlebury 2006 stereo vision dataset # disp1.png  disp5.png  view1.png  view5.png
def crop_center(img,cropx,cropy):
    #print('img.shape',img.shape)
    startx = img.shape[-2]//2-(cropx//2)
    starty = img.shape[-3]//2-(cropy//2)    
    return img[starty:starty+cropy,startx:startx+cropx]

dleft=[]
dright=[]
lleft=[]
lright=[]
for d in os.listdir(args.dataset):
    d0 = cv2.imread('{}/{}/view1.png'.format(args.dataset,d), cv2.IMREAD_COLOR)
    d1 = cv2.imread('{}/{}/view5.png'.format(args.dataset,d), cv2.IMREAD_COLOR)
    l0 = cv2.imread('{}/{}/disp1.png'.format(args.dataset,d), cv2.IMREAD_GRAYSCALE)
    l1 = cv2.imread('{}/{}/disp5.png'.format(args.dataset,d), cv2.IMREAD_GRAYSCALE)
    #print('d',d,'d0.shape',d0.shape,'d1.shape',d1.shape,'l0.shape',l0.shape,'l1.shape',l1.shape)
    d0 = crop_center(d0,400,368)
    d1 = crop_center(d1,400,368)
    l0 = cv2.resize(l0, [450,386])
    l0 = l0[:,:,np.newaxis]
    l1 = cv2.resize(l1, [450,386])
    l1 = l1[:,:,np.newaxis]
    #print('d',d,'d0.shape',d0.shape,'d1.shape',d1.shape,'l0.shape',l0.shape,'l1.shape',l1.shape)
    dleft.append(d0)
    dright.append(d1)
    lleft.append(l0)
    lright.append(l1)

dleft = np.array(dleft)/255.0
dright = np.array(dright)/255.0
lleft = np.array(lleft)/255.0
lright = np.array(lright)/255.0
print('dleft.shape',dleft.shape,'dright.shape',dright.shape,'lleft.shape',lleft.shape,'lright.shape',lright.shape)

# load keras model
model = tf.keras.saving.load_model(args.keras)

# convert to tflite
converter = tf.lite.TFLiteConverter.from_keras_model(model)
converter.optimizations = [tf.lite.Optimize.DEFAULT]
if args.dtype==16:
    converter.target_spec.supported_ops = [tf.lite.OpsSet.EXPERIMENTAL_TFLITE_BUILTINS_ACTIVATIONS_INT16_WEIGHTS_INT8]
    converter.inference_input_type = tf.int16
    converter.inference_output_type = tf.int16

if args.dtype==8:
    converter.target_spec.supported_ops = [tf.lite.OpsSet.TFLITE_BUILTINS_INT8]
    converter.inference_input_type = tf.int8
    converter.inference_output_type = tf.int8


def representative_data_gen():
    for i in range(len(dleft)):
        data0 = np.array([dleft[i]]).astype(np.float32)
        data1 = np.array([dright[i]]).astype(np.float32)
        yield [data0,data1]
        
#  for input_value in tf.data.Dataset.from_tensor_slices(np.expand_dims(tf.cast(train_images, tf.float32), axis=-1)).batch(1).take(100):
#    # Model has only one input so each data point has one element.
#    yield [input_value]
converter.representative_dataset = representative_data_gen

'''
# random dataset
def representative_dataset():
    for _ in range(100):
        data0 = np.random.rand(1,368,400,3).astype(np.float32)
        data1 = np.random.rand(1,368,400,3).astype(np.float32)
        yield [data0,data1]
converter.representative_dataset = representative_dataset
'''

tflite_model = converter.convert()
tf.lite.experimental.Analyzer.analyze(model_content=tflite_model)

f = open(args.tflite,'wb')
f.write(tflite_model)
f.close()
