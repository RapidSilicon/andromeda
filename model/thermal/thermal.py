import logging
logging.getLogger("tensorflow").setLevel(logging.DEBUG)

import tensorflow as tf
from tensorflow import keras
import numpy as np
#import pathlib
import argparse
import os
import re
import cv2
import random

parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument('--dumpc', help='when --test is true, dump test data as c code',default=False, action='store_true')
parser.add_argument('--window', help='window size in frames, input layer channels',default=16, type=int)
parser.add_argument('--alt', help='model version',default='alt1')
parser.add_argument('--tflite', help='tflite flatbuffer model file',default='thermal.tflite')
parser.add_argument('--dtype', help='dtype width (int8, int16)',default=8, type=int)
parser.add_argument('--batch', help='batch size',default=100, type=int)
parser.add_argument('--nbatch', help='number of training batches',default=1000000, type=int)
parser.add_argument('--save', help='model file name',default='thermal.keras')
parser.add_argument('--load', help='model file name',default=None)
parser.add_argument('--test', help='validation test',default=False, action='store_true')
parser.add_argument('--convert', help='convert to tflite',default=False, action='store_true')

#parser.add_argument('--stride', help='{1,2}',default=1, type=int)
#parser.add_argument('--top', help='top level module name',default='thermal')
#parser.add_argument('--clk', help='FPGA clock rate',default=500e6, type=float)
#parser.add_argument('--fps', help='first layer input shape arrival rate',default=100., type=float)
#parser.add_argument('--dtype', help='dtype width (int8, bfloat16)',default=8, type=int)
#parser.add_argument('--regz', help='regz width e.g. 32,48,64',default=32, type=int)
#parser.add_argument('--regb', help='regb width (weight) (int8, int16)',default=8, type=int)
#parser.add_argument('--analyze', help='run TFLite analyzer',default=False, action='store_true')
#parser.add_argument('--debug', help='verbose output',default=False, action='store_true')
args = parser.parse_args()
print(args)

## Load MNIST dataset
#mnist = keras.datasets.mnist
#(train_images, train_labels), (test_images, test_labels) = mnist.load_data()
#train_images = train_images.astype(np.float32) / 255.0
#test_images = test_images.astype(np.float32) / 255.0

# Define the model architecture
if args.alt=='alt1':
    model = keras.Sequential([
    keras.layers.InputLayer(input_shape=(24, 32, args.window)),
    keras.layers.Conv2D(filters=12, kernel_size=(3, 4), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=12, kernel_size=(3, 4), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=12, kernel_size=(3, 4), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=12, kernel_size=(3, 4), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=12, kernel_size=(3, 4), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=12, kernel_size=(3, 4), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=12, kernel_size=(3, 4), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=12, kernel_size=(3, 4), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=12, kernel_size=(3, 4), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=12, kernel_size=(4, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=5, kernel_size=(3, 3), strides=(1,1), activation=None, padding='valid'),
    keras.layers.Flatten(),
    ])

if args.alt=='alt2':
    model = keras.Sequential([
    keras.layers.InputLayer(input_shape=(24, 32, args.window)),
    keras.layers.Conv2D(filters=12, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=12, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=12, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=12, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=12, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=12, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=12, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=12, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=12, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=12, kernel_size=(3, 3), strides=(1,1), activation=tf.nn.relu, padding='valid'),
    keras.layers.Conv2D(filters=5, kernel_size=(4, 12), strides=(1,1), activation=None, padding='valid'),
    keras.layers.Flatten(),
    ])

'''
if args.alt=='alt3':
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
'''

print(model.summary())
#exit()

# load the raw dataset
raw_train={}
raw_test={}
for d in os.listdir('./dataset'):
    action,clip = re.split('_', d)
    if clip=='006':
        ds = raw_test
    else:
        ds = raw_train

    if action not in ds:
        ds[action]={}
    
    ds[action][clip] = np.zeros([1000,24,32,1])
    for f in os.listdir('./dataset/{}'.format(d)):
        frame = int(f[-9:-4])
        img = cv2.imread('./dataset/{}/{}'.format(d,f), cv2.IMREAD_GRAYSCALE)
        #print('img',img.shape)
        ds[action][clip][frame,:,:,0] = img/255.
        #print('action',action,'clip',clip,'frame',frame,'shape',img.shape)
 
# batch generator for 32-frame windows
actionmap = {'quiet':0, 'loiter':1, 'writhe':2, 'walk':3, 'run':4}
actionunmap = {0:'quiet', 1:'loiter', 2:'writhe', 3:'walk', 4:'run'}
def batch_generator(raw, batch_size=args.batch):
    x = np.zeros([batch_size,24,32,args.window])
    y = np.zeros([batch_size])
    for b in range(args.nbatch):
        for k in range(batch_size):
            a = random.choice(list(raw.keys()))
            c = random.choice(list(raw[a].keys()))
            w = np.random.randint(1000-args.window)
            t = raw[a][c][w:w+args.window,:,:,0]
            x[k] = np.moveaxis(t,0,-1)
            y[k] = actionmap[a]
        yield x,y

train_generator = batch_generator(raw_train)
#test_generator = batch_generator(raw_test)

if args.load is None:
    # Train the model
    model.compile(optimizer='adam', loss=keras.losses.SparseCategoricalCrossentropy(from_logits=True), metrics=['accuracy'])
    #model.fit(train_generator, validation_data=test_generator)
    model.fit(train_generator)
    model.save(args.save)
else:
    model = tf.keras.models.load_model(args.load)

# TEST
if args.test:
    ntot=0
    ncorrect=0
    for a in raw_test.keys():
        for c in raw_test[a].keys():
            for w in range(1000-args.window):
                x = raw_test[a][c][w:w+args.window]
                #print('x',x.shape)
                x = np.swapaxes(x,0,3)
                if args.dumpc:
                    print('x',x.shape,x)
                p = model.predict([x], batch_size=1, verbose=0)
                p = tf.nn.softmax(p[0])
                print('ntot',ntot,'a',a,'c',c,'y',actionmap[a],'pred',np.argmax(p), '{:8.6f} {:8.6f} {:8.6f} {:8.6f} {:8.6f}'.format(p[0],p[1],p[2],p[3],p[4]))
                ntot+=1
                ncorrect += np.argmax(p)==actionmap[a]
                # colorize frame based on prediction
                img1 = (raw_test[a][c][w+args.window-1]*255).astype(np.uint8)
                img2 = cv2.resize(img1, (640,480), interpolation= cv2.INTER_LINEAR)
                img3 = cv2.cvtColor(img2,cv2.COLOR_GRAY2RGB)
                #pred = np.argmax(p)
                if np.argmax(p)==actionmap[a]:
                    color=(0,255,0)
                else:
                    color=(0,0,255)
                cv2.putText(img3, 'p {} {} y {} {}'.format(np.argmax(p),actionunmap[np.argmax(p)], actionmap[a], a), (20, 25), cv2.FONT_HERSHEY_PLAIN, 2, color, 4)
#                if pred==1: # loiter
#                    img3[:,:,0]=0 # yellow
#                if pred==2: # 
#                    img3[:,:,0]=0 # red
#                    img3[:,:,1]=0
#                if pred==3:
#                    img3[:,:,0]=0
#                    img3[:,:,2]=0
#                if pred==4:
#                    img3[:,:,0]=0 # green
#                    img3[:,:,2]=0

                cv2.imwrite('gallery/{}_{}_{:05d}.jpg'.format(a,c,w), img3)

    print('test accuracy',ncorrect/ntot,'ntot',ntot)

if args.convert:
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
    
    # random dataset for prototyping
    def representative_dataset():
        for _ in range(10):
            data = np.random.rand(1, 24, 32, 32)
            yield [data.astype(np.float32)]
    converter.representative_dataset = representative_dataset
    '''
    
    def representative_dataset():
        for i in range(100):
            a = random.choice(list(raw_test.keys()))
            c = random.choice(list(raw_test[a].keys()))
            w = np.random.randint(1000-args.window)
            t = np.moveaxis(raw_test[a][c][w:w+args.window,:,:,0],0,-1)
            yield [np.array([t.astype(np.float32)])]
    converter.representative_dataset = representative_dataset
    
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
    
