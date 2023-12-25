import logging
logging.getLogger("tensorflow").setLevel(logging.DEBUG)

import tensorflow as tf
from tensorflow import keras
import numpy as np
import cv2
import random
import argparse

parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument('--keras', help='keras model file',default='encoder.keras')
parser.add_argument('--tflite', help='tflite flatbuffer model file',default='encoder.tflite')
parser.add_argument('--dtype', help='dtype width (int8, int16)',default=16, type=int)
parser.add_argument('--sidex', help='QAM grid',default=1700, type=int)
parser.add_argument('--spacex', help='QAM grid',default=100, type=int)
parser.add_argument('--sidey', help='QAM grid',default=1500, type=int)
parser.add_argument('--spacey', help='QAM grid',default=100, type=int)
parser.add_argument('--smin', help='ball scale size min',default=5, type=int)
parser.add_argument('--smax', help='ball scale size max',default=30, type=int)
parser.add_argument('--stretch', help='grid random scale',default=0.5, type=float)
parser.add_argument('--nballs', help='sample size',default=2000, type=int)
parser.add_argument('--debug', help='verbose output',default=False, action='store_true')
args = parser.parse_args()
print(args)

# Load MNIST dataset
#mnist = keras.datasets.mnist
#(train_images, train_labels), (test_images, test_labels) = mnist.load_data()
#train_images = train_images.astype(np.float32) / 255.0
#test_images = test_images.astype(np.float32) / 255.0

# load keras model
model = tf.keras.saving.load_model(args.keras)
model.compile()

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

#def representative_data_gen():
#  for input_value in tf.data.Dataset.from_tensor_slices(np.expand_dims(tf.cast(train_images, tf.float32), axis=-1)).batch(1).take(100):
#    # Model has only one input so each data point has one element.
#    yield [input_value]
#converter.representative_dataset = representative_data_gen

# dynamically generate (data,label) examples
def representative_dataset():
    batch=100
    d = np.zeros([batch,1400,1600,3]).astype(np.uint8)
    l = np.zeros([batch,15*17]).astype(np.float32)
    grid=[(x+args.spacex//2,y+args.spacey//2) for x in range(0,args.sidex,args.spacex) for y in range(0,args.sidey,args.spacey)]
    # randomly render colored gaussian balls on grid
    for i in range(batch):
        for j in range(15*17):
            if np.random.randint(2):
                l[i,j]=1
                scale=np.random.random()*(args.smax-args.smin)+args.smin
                xy=np.random.normal(loc=grid[j],scale=scale,size=[args.nballs,2])
                color=tuple(random.choice([128,255]) for _ in range(3))
                for (x,y) in ((x,y) for (x,y) in xy if x>0 and x<1600 and y>=0 and y<1400):
                    d[i,int(y),int(x)]=color
        # randomly stretch and center
        fx=(1-args.stretch)+np.random.random()*args.stretch
        fy=(1-args.stretch)+np.random.random()*args.stretch
        img=cv2.resize(d[i],dsize=(0,0),fx=fx,fy=fy,interpolation=cv2.INTER_LINEAR)
        d[i].fill(0)
        wy=img.shape[0]
        wx=img.shape[1]
        d[i,1400//2-wy//2:1400//2-wy//2+wy,1600//2-wx//2:1600//2-wx//2+wx,:]=img
        yield [np.expand_dims(d[i],axis=0).astype(np.float32)/255.]

# random dataset
def random_dataset():
    for _ in range(100):
        data0 = np.random.rand(1, 1400, 1600, 3).astype(np.float32)
        #data0 = np.random.rand(1, 1120, 1280, 1).astype(np.float32)
        #data1 = np.random.rand(1, 1120, 1280, 1).astype(np.float32)
        #yield [data0,data1]
        yield [data0]

converter.representative_dataset = representative_dataset
tflite_model = converter.convert()
tf.lite.experimental.Analyzer.analyze(model_content=tflite_model)

f = open(args.tflite,'wb')
f.write(tflite_model)
f.close()
