import logging
logging.getLogger("tensorflow").setLevel(logging.DEBUG)
import tensorflow as tf
from tensorflow import keras
import numpy as np
import pathlib
import argparse

parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument('--tflite', help='tflite flatbuffer model file',default='mnist.tflite')
parser.add_argument('--n', help='test sample',default=0, type=int)
parser.add_argument('--dtype', help='dtype width (int9, int16)',default=16, type=int)
parser.add_argument('--fill', help='constant input data',default=None, type=int)
#parser.add_argument('--null', help='test with input data equal zero',default=False, action='store_true')
parser.add_argument('--debug', help='verbose output',default=False, action='store_true')
args = parser.parse_args()
print(args)

# Load MNIST dataset
mnist = keras.datasets.mnist
(train_images, train_labels), (test_images, test_labels) = mnist.load_data()
train_images = train_images.astype(np.float32) / 255.0
test_images = test_images.astype(np.float32) / 255.0

# load tflite model
tf.lite.experimental.Analyzer.analyze(model_path=args.tflite)
interpreter = tf.lite.Interpreter(model_path=args.tflite,experimental_preserve_all_tensors=True)
interpreter.allocate_tensors() # Needed before execution!
input_details = interpreter.get_input_details()[0]  # Model has single input.
output_details = interpreter.get_output_details()[0]  # Model has single output.
input_scale, input_zero_point = input_details["quantization"]
print('input_scale',input_scale,'input_zero_point',input_zero_point)

input_data = test_images[args.n]
#input_data = np.expand_dims(input_data,0)
#input_data = np.expand_dims(input_data,-1)
input_data = input_data / input_scale + input_zero_point
input_data = input_data.astype(input_details["dtype"])
if args.fill is not None:
    input_data.fill(args.fill)

np.set_printoptions(linewidth=200)
#print('test index',args.n,'label',test_labels[args.n],'\n',input_data.reshape([28,28])) # ascii art
print('test index',args.n,'label',test_labels[args.n],'\n',input_data)

interpreter.set_tensor(input_details['index'], input_data.reshape([1,28,28,1]))
interpreter.invoke()
p = interpreter.get_tensor(output_details['index'])
pred = np.argmax(p)
print('label',test_labels[args.n],'pred',pred,'p',p)

# dump layer output activations
#for k in range(30,44):
#    t = interpreter.get_tensor(k)
#    print('k',k,'t.shape',t.shape)
#    t = t.reshape(-1, t.shape[-1])
#    for i in range(t.shape[0]):
#        s=''
#        for j in range(t.shape[1]):
#            s+='{:04X}'.format(t[i,j])
#            #s += hex(t[i,j])[2:]
#        print('u{} i {:6d} feature {}'.format(k-30+1,i,s))
#        if k==43:
#            print(t)

# dump layer output activations
for d in interpreter.get_tensor_details():
    if len(d['name'])==0:
        continue
    if d['dtype']!=np.int16:
        continue
    if 'conv2d' not in d['name']:
        continue
    if '/conv2d/' in d['name']:
        firstlayer=d['index']-1

    u = d['index']-firstlayer
    t = interpreter.get_tensor(d['index'])
    print('u',u,'t.shape',t.shape)
    t = t.reshape(-1, t.shape[-1])

    # write expected outputs
    fexp = open('expect_u{}.mem'.format(u),'w')
    for i in range(t.shape[0]):
        s=''
        #for j in range(t.shape[1]):
        for j in range(t.shape[1]-1,-1,-1):
            s+='{:04X}'.format(t[i,j].astype(np.ushort))
        print('index {:4d} u{} i {:6d} feature {}'.format(d['index'],u,i,s))
        print(s,file=fexp)
    fexp.close()
        
#        if k==43:
#            print(t)
# write binary test data for verilog simulation
s=''
for r in range(28):
    for c in range(28):
        for b in range(args.dtype,0,-1):
            if (input_data[r,c]>>(b-1))&1:
                s+='1'
            else:
                s+='0'
        s+='\n'

f = open('test_data.mem','w')
print(s,file=f)
