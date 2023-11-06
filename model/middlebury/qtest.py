import logging
logging.getLogger("tensorflow").setLevel(logging.DEBUG)
import tensorflow as tf
from tensorflow import keras
import numpy as np
import pathlib
import argparse
import cv2
#print(tf.lite.OpsSet.EXPERIMENTAL_TFLITE_BUILTINS_ACTIVATIONS_INT16_WEIGHTS_INT8)

parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument('--mem', help='use mem files',default=False, action='store_true')
parser.add_argument('--d0', help='input data png file',default='dataset/Flowerpots/view1.png')
parser.add_argument('--d1', help='input data png file',default='dataset/Flowerpots/view5.png')
parser.add_argument('--tflite', help='tflite flatbuffer model file',default='mb2006.tflite')
#parser.add_argument('--net', help='network name',default='alt1')
#parser.add_argument('--keras', help='keras model file',default='mb2006.keras')
#parser.add_argument('--epochs', help='training epochs',default=1, type=int)
#parser.add_argument('--batch', help='batch size',default=1, type=int)
#parser.add_argument('--dataset', help='dataset directory',default='./dataset')
parser.add_argument('--debug', help='verbose output',default=False, action='store_true')
args = parser.parse_args()
print(args)

## Load MNIST dataset
#mnist = keras.datasets.mnist
#(train_images, train_labels), (test_images, test_labels) = mnist.load_data()
#train_images = train_images.astype(np.float32) / 255.0
#test_images = test_images.astype(np.float32) / 255.0

# load Middlebury 2006 stereo vision dataset
# disp1.png  disp5.png  view1.png  view5.png
def crop_center(img,cropx,cropy):
    #print('img.shape',img.shape)
    startx = img.shape[-2]//2-(cropx//2)
    starty = img.shape[-3]//2-(cropy//2)    
    return img[starty:starty+cropy,startx:startx+cropx]

#if args.mem:
#    d0 = readmem(args.d0)
#    d1 = readmem(args.d1)

d0 = cv2.imread(args.d0, cv2.IMREAD_COLOR).astype(np.float32)/255.0
d1 = cv2.imread(args.d1, cv2.IMREAD_COLOR).astype(np.float32)/255.0
print('d0.shape',d0.shape,'d0.dtype',d0.dtype)
d0 = crop_center(d0,400,368)
d1 = crop_center(d1,400,368)
print('d0.shape',d0.shape,'d0.dtype',d0.dtype)
#rgb = bgr[...,::-1].copy()
#d0 = d0[...,::-1].copy()
#d1 = d1[...,::-1].copy()
#d0 = d0[...,::-1].copy()
#d1 = d1[...,::-1].copy()

# EVALUATE USING TFLITE INTERPRETER
# ---------------------------------
# load tflite model
interpreter = tf.lite.Interpreter(model_path=args.tflite,experimental_preserve_all_tensors=True)
interpreter.allocate_tensors() # Needed before execution!
output_details = interpreter.get_output_details()[0]  # Model has single output.

input_details = interpreter.get_input_details()[0]  # Model has single input.
input_scale, input_zero_point = input_details["quantization"]
print('input_scale',input_scale,1./input_scale,'input_zero_point',input_zero_point)
input_data = d0
input_data = np.expand_dims(input_data,0)
#input_data = np.expand_dims(input_data,-1)
input_data = input_data / input_scale + input_zero_point
input_data = input_data.astype(input_details["dtype"])
interpreter.set_tensor(input_details['index'], input_data)
#print('d0',input_data[0])

input_details = interpreter.get_input_details()[1]  # SECOND INPUT
input_scale, input_zero_point = input_details["quantization"]
print('input_scale',input_scale,1./input_scale,'input_zero_point',input_zero_point)
input_data = d1
input_data = np.expand_dims(input_data,0)
#input_data = np.expand_dims(input_data,-1)
input_data = input_data / input_scale + input_zero_point
input_data = input_data.astype(input_details["dtype"])
interpreter.set_tensor(input_details['index'], input_data)


interpreter.invoke()
pred = interpreter.get_tensor(output_details['index'])
pred=pred[0]
print('pred shape',pred.shape,pred.dtype, np.amin(pred),np.amax(pred))
pred = pred.astype(np.int32)
#pred += 128
pred = pred//128
pred = pred.astype(np.uint8)
img = cv2.cvtColor(pred,cv2.COLOR_GRAY2RGB)
cv2.imwrite('foo.png', img)

def dump_expect(n,fn):
    f = open(fn,'w')
    t = interpreter.get_tensor(n).astype(np.uint16)
    print('t{}.shape'.format(n),t.shape)
    for row in range(t.shape[-3]):
        for col in range(t.shape[-2]):
            s=''
            for chan in range(t.shape[-1],0,-1):
                s += '{:04X}'.format(t[0,row,col,chan-1])
                #print('{:04X}'.format(t[0,row,col,chan]))
                #print(hex(t[0,row,col,chan])[2:])
            print(s,file=f)
    f.close()

for n in [53,54,55,56,57,58,59,60,70,71,73,75,77,79,81]:
    dump_expect(n,'expect_{}.memh'.format(n))
exit()

def dump_tensor(n,typ=None,ochan=0,row=0):
    t = interpreter.get_tensor(n)
    print('t{}.shape'.format(n),t.shape)
    if typ=='weight':
        for i in range(3):
            print('i',i,'t[{},0,{}]'.format(ochan,i),[x for x in t[ochan,0,i]])
    elif typ=='bias':
        print('t',[x for x in t])
    elif typ=='output':
        for i in range(3):
            print('i',i,'t[{},{},{}]'.format(0,row,i),[x for x in t[0,row,i]])

dump_tensor(0)
dump_tensor(1,typ='output')
dump_tensor(2,typ='bias')
dump_tensor(53,typ='output',row=0)
dump_tensor(53,typ='output',row=1)
dump_tensor(53,typ='output',row=2)
dump_tensor(53,typ='output',row=3)
dump_tensor(25,typ='weight')
dump_tensor(25,typ='weight',ochan=1)
dump_tensor(25,typ='weight',ochan=2)

t0 = interpreter.get_tensor(0)
t1 = interpreter.get_tensor(1)
print('t0.shape',t0.shape,'t1.shape',t1.shape)
print([hex(x) for x in t0[0,0,0]])
print([hex(x) for x in t1[0,0,0]])

t53 = interpreter.get_tensor(53)
print('t53.shape',t53.shape)
print([hex(x) for x in t53[0,0,0]])
print([hex(x) for x in t53[0,0,1]])

