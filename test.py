import logging
logging.getLogger("tensorflow").setLevel(logging.DEBUG)

import tensorflow as tf
from tensorflow import keras
import numpy as np
import pathlib
print(tf.lite.OpsSet.EXPERIMENTAL_TFLITE_BUILTINS_ACTIVATIONS_INT16_WEIGHTS_INT8)

tf.lite.experimental.Analyzer.analyze(model_path='./mnist_model.tflite')

interpreter = tf.lite.Interpreter(model_path='./mnist_model.tflite')
print(dir(interpreter))
interpreter.allocate_tensors()
print(interpreter.get_input_details())
print(interpreter.get_output_details())
print(interpreter.get_tensor_details())


