import logging
logging.getLogger("tensorflow").setLevel(logging.DEBUG)

import tensorflow as tf
from tensorflow import keras
import numpy as np
#import pathlib
import argparse

parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument('--keras', help='keras model file',default='qamtest.keras')
parser.add_argument('--tflite', help='tflite flatbuffer model file',default='enc_model.tflite')
parser.add_argument('--dtype', help='dtype width (int8, int16)',default=16, type=int)
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

'''
def representative_data_gen():
  for input_value in tf.data.Dataset.from_tensor_slices(np.expand_dims(tf.cast(train_images, tf.float32), axis=-1)).batch(1).take(100):
    # Model has only one input so each data point has one element.
    yield [input_value]
converter.representative_dataset = representative_data_gen
'''

# random dataset
def representative_dataset():
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
