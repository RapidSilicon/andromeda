import logging
logging.getLogger("tensorflow").setLevel(logging.DEBUG)

import tensorflow as tf
from tensorflow import keras
import numpy as np
import pathlib
print(tf.lite.OpsSet.EXPERIMENTAL_TFLITE_BUILTINS_ACTIVATIONS_INT16_WEIGHTS_INT8)

# Define the model architecture
model = keras.Sequential([
  keras.layers.InputLayer(input_shape=(2160, 3840, 3)),
  keras.layers.Conv2D(filters=8, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
  keras.layers.Conv2D(filters=8, kernel_size=(3, 3), strides=(2,2), activation=tf.nn.relu, padding='valid'),
  keras.layers.Conv2D(filters=16, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
  keras.layers.Conv2D(filters=16, kernel_size=(3, 3), strides=(2,2), activation=tf.nn.relu, padding='valid'),
  keras.layers.Conv2D(filters=16, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
  keras.layers.Conv2D(filters=16, kernel_size=(3, 3), strides=(2,2), activation=tf.nn.relu, padding='valid'),
  keras.layers.Conv2D(filters=16, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
  keras.layers.Conv2D(filters=16, kernel_size=(3, 3), strides=(2,2), activation=tf.nn.relu, padding='valid'),
  keras.layers.Conv2D(filters=16, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
  keras.layers.Conv2D(filters=16, kernel_size=(3, 3), strides=(2,2), activation=tf.nn.relu, padding='valid'),
  keras.layers.Conv2D(filters=16, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
  keras.layers.Conv2D(filters=16, kernel_size=(3, 3), strides=(2,2), activation=tf.nn.relu, padding='valid'),
  keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
  keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
  keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
  keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
  keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
  keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
  keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
  keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
  keras.layers.Flatten(),
])

print(model.summary())
model.compile()

converter = tf.lite.TFLiteConverter.from_keras_model(model)
converter.optimizations = [tf.lite.Optimize.DEFAULT]
#converter.target_spec.supported_ops = [tf.lite.OpsSet.EXPERIMENTAL_TFLITE_BUILTINS_ACTIVATIONS_INT16_WEIGHTS_INT8]
#converter.inference_input_type = tf.int16
#converter.inference_output_type = tf.int16
converter.target_spec.supported_ops = [tf.lite.OpsSet.TFLITE_BUILTINS_INT8]
converter.inference_input_type = tf.int8
converter.inference_output_type = tf.int8
# Ensure that if any ops can't be quantized, the converter throws an error
# Set the input and output tensors to uint8 (APIs added in r2.3)

def representative_dataset():
    for _ in range(10):
        data = np.random.rand(1, 2160, 3840, 3)
        yield [data.astype(np.float32)]
converter.representative_dataset = representative_dataset

tflite_model = converter.convert()
tf.lite.experimental.Analyzer.analyze(model_content=tflite_model)

tflite_models_dir = pathlib.Path("./")
tflite_models_dir.mkdir(exist_ok=True, parents=True)
tflite_model_file = tflite_models_dir/"t4.tflite"
tflite_model_file.write_bytes(tflite_model)
