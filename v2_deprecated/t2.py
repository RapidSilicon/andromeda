import logging
logging.getLogger("tensorflow").setLevel(logging.DEBUG)

import tensorflow as tf
from tensorflow import keras
import numpy as np
import pathlib
print(tf.lite.OpsSet.EXPERIMENTAL_TFLITE_BUILTINS_ACTIVATIONS_INT16_WEIGHTS_INT8)

# Load MNIST dataset
#mnist = keras.datasets.mnist
#(train_images, train_labels), (test_images, test_labels) = mnist.load_data()

# Normalize the input image so that each pixel value is between 0 to 1.
#train_images = train_images / 255.0
#test_images = test_images / 255.0

# Define the model architecture
model = keras.Sequential([
  #keras.layers.InputLayer(input_shape=(28, 28, 1)),
  keras.layers.InputLayer(input_shape=(544, 728, 3)),
  #keras.layers.Reshape(target_shape=(28, 28, 1)),
  keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
  keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(2,2), activation=tf.nn.relu, padding='valid'),
  keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
  keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(2,2), activation=tf.nn.relu, padding='valid'),
  keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
  keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(2,2), activation=tf.nn.relu, padding='valid'),
  keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
  keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(2,2), activation=tf.nn.relu, padding='valid'),
  keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
  keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(2,2), activation=tf.nn.relu, padding='valid'),
  keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
  keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(2,2), activation=tf.nn.relu, padding='valid'),
  keras.layers.Conv2D(filters=32, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
  keras.layers.Conv2D(filters=10, kernel_size=(3, 6), padding='valid'),
  #keras.layers.MaxPooling2D(pool_size=(2, 2)),
  keras.layers.Flatten(),
  #keras.layers.Dense(10)
])

print(model.summary())

# Train the digit classification model
model.compile(optimizer='adam',
              loss=keras.losses.SparseCategoricalCrossentropy(from_logits=True),
              metrics=['accuracy'])

#model.fit(
#  train_images,
#  train_labels,
#  epochs=1,
#  validation_data=(test_images, test_labels)
#)

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

#mnist_ds = tf.data.Dataset.from_tensor_slices(np.expand_dims(tf.cast(train_images, tf.float32), axis=-1)).batch(1)
#def representative_data_gen():
#  yield(np.random.random(size=[544,728,3]))
#  keras.layers.InputLayer(input_shape=(544, 728, 3)),
#  for input_value in tf.data.Dataset.from_tensor_slices(np.expand_dims(tf.cast(train_images, tf.float32), axis=-1)).batch(1).take(100):
#    # Model has only one input so each data point has one element.
#    yield [input_value]
def representative_dataset():
    for _ in range(100):
        data = np.random.rand(1, 544, 728, 3)
        yield [data.astype(np.float32)]
converter.representative_dataset = representative_dataset

tflite_model = converter.convert()
tf.lite.experimental.Analyzer.analyze(model_content=tflite_model)

tflite_models_dir = pathlib.Path("./")
tflite_models_dir.mkdir(exist_ok=True, parents=True)
tflite_model_file = tflite_models_dir/"t2.tflite"
tflite_model_file.write_bytes(tflite_model)

interpreter = tf.lite.Interpreter(model_path='./t2.tflite')
print(dir(interpreter))
interpreter.allocate_tensors()
print(interpreter.get_input_details())
print(interpreter.get_output_details())
print(interpreter.get_tensor_details())


