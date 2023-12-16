import logging
logging.getLogger("tensorflow").setLevel(logging.DEBUG)
import tensorflow as tf
from tensorflow import keras
import numpy as np
import pathlib
import argparse
#print(tf.lite.OpsSet.EXPERIMENTAL_TFLITE_BUILTINS_ACTIVATIONS_INT16_WEIGHTS_INT8)

parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument('--tflite', help='tflite flatbuffer model file',default='../model/mnist.tflite')
parser.add_argument('--n', help='test image',default=0, type=int)
parser.add_argument('--all', help='compute accuracy of test data',default=False, action='store_true')
parser.add_argument('--single', help='compute accuracy of test data sample n',default=False, action='store_true')
#parser.add_argument('--top', help='top level module name',default='mnist')
#parser.add_argument('--clk', help='FPGA clock rate',default=500e6, type=float)
#parser.add_argument('--fps', help='first layer input shape arrival rate',default=100., type=float)
#parser.add_argument('--dtype', help='dtype width (int8, bfloat16)',default=8, type=int)
#parser.add_argument('--rega', help='rega width (int8, bfloat16)',default=8, type=int)
#parser.add_argument('--regb', help='regb width (weight) (int8, bfloat16)',default=8, type=int)
#parser.add_argument('--analyze', help='run TFLite analyzer',default=False, action='store_true')
parser.add_argument('--debug', help='verbose output',default=False, action='store_true')
args = parser.parse_args()
print(args)

# Load MNIST dataset
mnist = keras.datasets.mnist
(train_images, train_labels), (test_images, test_labels) = mnist.load_data()
train_images = train_images.astype(np.float32) / 255.0
test_images = test_images.astype(np.float32) / 255.0

np.set_printoptions(linewidth=200)

# load tflite model
interpreter = tf.lite.Interpreter(model_path=args.tflite,experimental_preserve_all_tensors=True)
interpreter.allocate_tensors() # Needed before execution!
input_details = interpreter.get_input_details()[0]  # Model has single input.
output_details = interpreter.get_output_details()[0]  # Model has single output.
input_scale, input_zero_point = input_details["quantization"]


if args.all:
    ntotal=0
    ncorrect=0
    args.n = min(args.n,len(test_images))
    for i in range(args.n):
        input_data = test_images[i]
        input_data = np.expand_dims(input_data,0)
        input_data = np.expand_dims(input_data,-1)
        input_data = input_data / input_scale + input_zero_point
        input_data = input_data.astype(input_details["dtype"])
        interpreter.set_tensor(input_details['index'], input_data)
        interpreter.invoke()
        p = np.argmax(interpreter.get_tensor(output_details['index']))
        ntotal +=1
        if p==test_labels[i]:
            ncorrect +=1
        print('i {:6d} ntotal {:6d} ncorrect {:6d} accuracy {:8.4f} p {:2d} l {:2d} output {}'.format(i,ntotal,ncorrect,ncorrect/ntotal,p,test_labels[i],interpreter.get_tensor(output_details['index'])))
        #print('\nntotal',ntotal,'ncorrect',ncorrect,'accuracy',ncorrect/ntotal,'p',p,'output',interpreter.get_tensor(output_details['index']))
 

if args.single:
    print(args.n,test_labels[args.n],'\n',test_images[args.n]) # ascii art
    input_data = test_images[args.n]
    input_data = np.expand_dims(input_data,0)
    input_data = np.expand_dims(input_data,-1)

    interpreter.set_tensor(input_details['index'], input_data)
    interpreter.invoke()
    #print('output shape',interpreter.get_tensor(output_details['index']).shape)
    layer1 = interpreter.get_tensor(30)
    print('layer1.shape',layer1.shape)
    for i in range(layer1.shape[-1]):
        print('i',i,layer1[:,:,:,i])
    #print('input0',interpreter.get_tensor(input0['index'])) 
    print('output',output_details['index'],interpreter.get_tensor(output_details['index']))


#print(dir(interpreter))

# Normalize the input image so that each pixel value is between 0 to 1.
#train_images = train_images / 255.0
#test_images = test_images / 255.0




if args.debug:
    #print(interpreter.get_tensor_details())
    for i,t in enumerate(interpreter.get_tensor_details()):
        print('\nTENSOR',i,'\n',t)
    tf.lite.experimental.Analyzer.analyze(model_path=args.tflite)
    print(interpreter.get_input_details())
    print(interpreter.get_output_details())
    exit()

exit()
# Define the model architecture
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

print(model.summary())

# Train the digit classification model
model.compile(optimizer='adam',
              loss=keras.losses.SparseCategoricalCrossentropy(from_logits=True),
              metrics=['accuracy'])

model.fit(
  train_images,
  train_labels,
  epochs=10,
  validation_data=(test_images, test_labels)
)

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

tflite_models_dir = pathlib.Path("./")
tflite_models_dir.mkdir(exist_ok=True, parents=True)
tflite_model_file = tflite_models_dir/"mnist.tflite"
tflite_model_file.write_bytes(tflite_model)
'''
# reference
interpreter = tf.lite.Interpreter(model_path='./mnist.tflite')
print(dir(interpreter))
interpreter.allocate_tensors()
print(interpreter.get_input_details())
print(interpreter.get_output_details())
print(interpreter.get_tensor_details())
'''

