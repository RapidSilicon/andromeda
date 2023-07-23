import logging
logging.getLogger("tensorflow").setLevel(logging.DEBUG)

import tensorflow as tf
from tensorflow import keras
import numpy as np
#import pathlib
import argparse

parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument('--stride', help='{1,2}',default=1, type=int)
parser.add_argument('--tflite', help='tflite flatbuffer model file',default='../model/mnist.tflite')
parser.add_argument('--dtype', help='dtype width (int8, int16)',default=8, type=int)
parser.add_argument('--epochs', help='training epochs',default=1, type=int)
#parser.add_argument('--top', help='top level module name',default='mnist')
#parser.add_argument('--clk', help='FPGA clock rate',default=500e6, type=float)
#parser.add_argument('--fps', help='first layer input shape arrival rate',default=100., type=float)
#parser.add_argument('--dtype', help='dtype width (int8, bfloat16)',default=8, type=int)
#parser.add_argument('--regz', help='regz width e.g. 32,48,64',default=32, type=int)
#parser.add_argument('--regb', help='regb width (weight) (int8, int16)',default=8, type=int)
#parser.add_argument('--analyze', help='run TFLite analyzer',default=False, action='store_true')
#parser.add_argument('--debug', help='verbose output',default=False, action='store_true')
args = parser.parse_args()
print(args)

# Load MNIST dataset
mnist = keras.datasets.mnist
(train_images, train_labels), (test_images, test_labels) = mnist.load_data()
train_images = train_images.astype(np.float32) / 255.0
test_images = test_images.astype(np.float32) / 255.0

# Define the model architecture
if args.stride==1:
    model = keras.Sequential([
    keras.layers.InputLayer(input_shape=(28, 28, 1)),
    keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=10, kernel_size=(2, 2), strides=(1,1), activation=None, padding='valid'),
    keras.layers.Flatten(),
    ])

if args.stride==2:
    model = keras.Sequential([
    keras.layers.InputLayer(input_shape=(28, 28, 1)),
    keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(2,2), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(2,2), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=10, kernel_size=(2, 2), strides=(1,1), activation=None, padding='valid'),
    keras.layers.Flatten(),
    ])

print(model.summary())

# Train the digit classification model
model.compile(optimizer='adam', loss=keras.losses.SparseCategoricalCrossentropy(from_logits=True), metrics=['accuracy'])
model.fit(
  train_images,
  train_labels,
  epochs=args.epochs,
  validation_data=(test_images, test_labels)
)

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
  for input_value in tf.data.Dataset.from_tensor_slices(np.expand_dims(tf.cast(train_images, tf.float32), axis=-1)).batch(1).take(100):
    # Model has only one input so each data point has one element.
    yield [input_value]
converter.representative_dataset = representative_data_gen

'''
# random dataset for prototyping
def representative_dataset():
    for _ in range(10):
        data = np.random.rand(1, 2160, 3840, 3)
        yield [data.astype(np.float32)]
converter.representative_dataset = representative_dataset
'''

tflite_model = converter.convert()
tf.lite.experimental.Analyzer.analyze(model_content=tflite_model)

f = open(args.tflite,'wb')
f.write(tflite_model)
f.close()

#tflite_models_dir = pathlib.Path("./")
#tflite_models_dir.mkdir(exist_ok=True, parents=True)
#tflite_model_file = tflite_models_dir/"mnist.tflite"
#tflite_model_file.write_bytes(tflite_model)

'''
# reference
interpreter = tf.lite.Interpreter(model_path='./mnist.tflite')
print(dir(interpreter))
interpreter.allocate_tensors()
print(interpreter.get_input_details())
print(interpreter.get_output_details())
print(interpreter.get_tensor_details())
'''

