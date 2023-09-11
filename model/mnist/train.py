import logging
logging.getLogger("tensorflow").setLevel(logging.DEBUG)

import tensorflow as tf
from tensorflow import keras
import numpy as np
import argparse

parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument('--stride', help='{1,2}',default=1, type=int)
parser.add_argument('--keras', help='keras model file',default='mnist.keras')
parser.add_argument('--epochs', help='training epochs',default=1, type=int)
parser.add_argument('--debug', help='verbose output',default=False, action='store_true')
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
    keras.layers.Conv2D(filters=16, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=16, kernel_size=(3, 3), strides=(2,2), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=16, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=16, kernel_size=(3, 3), strides=(2,2), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=16, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
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
model.save(args.keras)
