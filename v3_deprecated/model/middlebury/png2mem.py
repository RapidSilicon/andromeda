# convert png to readmemb file
import tensorflow as tf
from tensorflow import keras
import numpy as np
import argparse
import os
import cv2

parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument('--inp', help='model input (0,1)',default=0, type=int)
parser.add_argument('--tflite', help='tflite flatbuffer model file',default='mb2006.tflite')
parser.add_argument('--data', help='input data png file',default='')
parser.add_argument('--memb', help='output mem file',default='')
parser.add_argument('--dtype', help='dtype width (int9, int16)',default=9, type=int)
parser.add_argument('--debug', help='verbose output',default=False, action='store_true')
args = parser.parse_args()
print(args)

# load Middlebury 2006 stereo vision dataset # disp1.png  disp5.png  view1.png  view5.png
def crop_center(img,cropx,cropy):
    #print('img.shape',img.shape)
    startx = img.shape[-2]//2-(cropx//2)
    starty = img.shape[-3]//2-(cropy//2)    
    return img[starty:starty+cropy,startx:startx+cropx]

d = cv2.imread(args.data, cv2.IMREAD_COLOR).astype(np.float32)
d = d/255.
print('d.shape',d.shape,'d.dtype',d.dtype)
d = crop_center(d,400,368)
print('d.shape',d.shape,'d.dtype',d.dtype)

# input zero point and scale
interpreter = tf.lite.Interpreter(model_path=args.tflite,experimental_preserve_all_tensors=True)
interpreter.allocate_tensors() # Needed before execution!
input_details = interpreter.get_input_details()[args.inp]  # Model has single input.
input_scale, input_zero_point = input_details["quantization"]
print('input_scale',input_scale,1./input_scale,'input_zero_point',input_zero_point)

d = d / input_scale + input_zero_point
d = d.astype(input_details["dtype"])

s=''
for r in range(d.shape[-3]):
    for c in range(d.shape[-2]):
        #for h in range(d.shape[-1]): # channels last
        for h in range(d.shape[-1],0,-1): # channels last
            for b in range(args.dtype,0,-1):
                #if (d[r,c,h]>>(b-1))&1:
                if (d[r,c,h-1]>>(b-1))&1:
                    s+='1'
                else:
                    s+='0'
        s+='\n'

f = open(args.memb,'w')
print(s,file=f)
