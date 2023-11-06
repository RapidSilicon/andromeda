# convert Verilog simulation log file ($display() statements) into png image files
import numpy as np
import tensorflow as tf
import argparse
import os
import cv2

parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument('--tflite', help='tflite flatbuffer model file',default='mb2006.tflite')
parser.add_argument('--log', help='input log file',default='sim.log')
parser.add_argument('--png', help='output png file',default='sim.png')
parser.add_argument('--debug', help='verbose output',default=False, action='store_true')
args = parser.parse_args()
print(args)

# output zero point and scale
interpreter = tf.lite.Interpreter(model_path=args.tflite,experimental_preserve_all_tensors=True)
interpreter.allocate_tensors() # Needed before execution!
output_details = interpreter.get_output_details()[0]  # Model has single output.
output_scale, output_zero_point = output_details["quantization"]
print('output_scale',output_scale,1./output_scale,'output_zero_point',output_zero_point)

img = np.zeros([386,450,1],dtype=np.uint8)
f = open(args.log, 'r')
for l in f:
    #MONITOR time 4976635.000000 m_0_data 00e m_0_row   0 m_0_col   0 feat           0
    if l.startswith('MONITOR'):
        w = l.split()
        d = int(w[4])
        #d = int(w[4],16)
#        if d>255:
#            d-=256
#            #d=-1*((~(d&0xff))+1)
#            print('d',d)
#        d+=128
        #d = d//(32768/256)
        d = d * output_scale + output_zero_point
        d = int(d*255.)
        r = int(w[6])
        c = int(w[8])
        #img[r,c] = min(255,d)
        img[r,c] = d
f.close()

img = cv2.cvtColor(img,cv2.COLOR_GRAY2RGB)
cv2.imwrite(args.png, img)
