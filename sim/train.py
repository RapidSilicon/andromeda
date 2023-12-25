#import logging
#logging.getLogger("tensorflow").setLevel(logging.DEBUG)

import numpy as np
import argparse
import os
import cv2
import datetime
import random

parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument('--gallery', help='produce thumbnail examples',default=False, action='store_true')
parser.add_argument('--test', help='produce a test example and label for testbench.v',default=False, action='store_true')
parser.add_argument('--smin', help='ball scale size min',default=5, type=int)
parser.add_argument('--smax', help='ball scale size max',default=30, type=int)
parser.add_argument('--stretch', help='grid random scale',default=0.9, type=float)
parser.add_argument('--nballs', help='sample size',default=2000, type=int)
#parser.add_argument('--ballsize', help='gaussian scale',default=10.0, type=float)
parser.add_argument('--log', help='log file',default='./log.train')
parser.add_argument('--sidex', help='QAM grid',default=1700, type=int)
parser.add_argument('--spacex', help='QAM grid',default=100, type=int)
parser.add_argument('--sidey', help='QAM grid',default=1500, type=int)
parser.add_argument('--spacey', help='QAM grid',default=100, type=int)
parser.add_argument('--net', help='network name',default='alt1')
#parser.add_argument('--keras', help='keras model file',default='enc_model.keras')
#parser.add_argument('--epochs', help='training epochs',default=1000000, type=int)
parser.add_argument('--batch', help='batch size',default=1, type=int)
parser.add_argument('--lr', help='learning rate',default=0.0001, type=float)
#parser.add_argument('--dataset', help='dataset directory',default='./dataset')
parser.add_argument('--tflite', help='tflite flatbuffer model file',default='encoder.tflite')
parser.add_argument('--dtype', help='dtype width (int8, int16)',default=16, type=int)
parser.add_argument('--debug', help='verbose output',default=False, action='store_true')
args = parser.parse_args()
print(args)

# dynamically generate (data,label) examples
def generate_batch(args,show=True):
    d = np.zeros([args.batch,1400,1600,3]).astype(np.uint8)
    l = np.zeros([args.batch,15*17]).astype(np.float32)
    #grid=[(x,y) for x in range(-args.sidex//2,args.sidex//2,args.spacex) for y in range(-args.sidey//2,args.sidey//2,args.spacey)]
    #grid=[(x+args.spacex//2,y+args.spacey//2) for x in range(0,args.sidex,args.spacex) for y in range(0,args.sidey,args.spacey)]
    grid=[(x,y) for x in range(0,args.sidex,args.spacex) for y in range(0,args.sidey,args.spacey)]
    #print('grid',len(grid),grid)
    # randomly render colored gaussian balls on grid
    for i in range(args.batch):
        for j in range(15*17):
            if np.random.randint(2):
                l[i,j]=1
                #scale=args.ballsize
                scale=np.random.random()*(args.smax-args.smin)+args.smin
                xy=np.random.normal(loc=grid[j],scale=scale,size=[args.nballs,2])
                color=tuple(random.choice([128,255]) for _ in range(3))
                #color=np.random.randint(128,256,size=3).astype(np.uint8)
                #color=[200,200,200]
                #print(i,j,'grid',grid[j],'color',color,'xy',xy)
                for (x,y) in ((x,y) for (x,y) in xy if x>0 and x<1600 and y>=0 and y<1400):
                    d[i,int(y),int(x)]=color
#                for (x,y) in xy:
#                    if x>=0 and x<1600 and y>=0 and y<1400:
#                        #print('color',color,'i',i,'j',j,'x',int(x),'y',int(y))
#                        d[i,int(y),int(x)]=color
    # randomly stretch and center
    for i in range(args.batch):
        #fx=0.5+np.random.random()*0.5
        #fy=0.5+np.random.random()*0.5
        fx=(1-args.stretch)+np.random.random()*args.stretch
        fy=(1-args.stretch)+np.random.random()*args.stretch
        img=cv2.resize(d[i],dsize=(0,0),fx=fx,fy=fy,interpolation=cv2.INTER_LINEAR)
        d[i].fill(0)
        wy=img.shape[0]
        wx=img.shape[1]
        d[i,1400//2-wy//2:1400//2-wy//2+wy,1600//2-wx//2:1600//2-wx//2+wx,:]=img
    # display first sample in batch
    if show:
        cv2.imshow('train', cv2.resize(d[0],dsize=(800,700),interpolation=cv2.INTER_LINEAR)) 
        cv2.waitKey(1)
    return (d/255.,l)

if args.gallery:
    border=5
    h=280
    w=320
    col=5
    row=3
    args.batch=row*col
    d,l=generate_batch(args,show=False)
    d = (d*255).astype(np.uint8)
    img=np.zeros([(h+border)*row,(w+border)*col,3],dtype=np.uint8)
    img.fill(255)
    for i in range(d.shape[0]):
        img[(i//col)*(h+border):(i//col)*(h+border)+h,(i%col)*(w+border):(i%col)*(w+border)+w]=cv2.resize(d[i],dsize=(w,h),interpolation=cv2.INTER_LANCZOS4)
    #cv2.imshow('gallery',img)
    cv2.imwrite('gallery.png',img)
    #cv2.waitKey(0)
    exit()

import tensorflow as tf
from tensorflow import keras

if args.test:
    # load tflite model to extract input scale and zero point
    interpreter = tf.lite.Interpreter(model_path=args.tflite,experimental_preserve_all_tensors=True)
    interpreter.allocate_tensors() # Needed before execution!
    input_details = interpreter.get_input_details()[0]  # Model has single input.
    input_scale, input_zero_point = input_details["quantization"]
    print('input_scale',input_scale,'input_zero_point',input_zero_point)
    #output_details = interpreter.get_output_details()[0]  # Model has single output.
    #output_scale, output_zero_point = output_details["quantization"]
    #print('output_scale',output_scale,'output_zero_point',output_zero_point)

    d,l = generate_batch(args,show=False)
    d = (d/input_scale).astype(np.int32)
    print('d.shape',d.shape)
    s=''
    for r in range(1400):
        print('row',r)
        for c in range(1600):
            for h in range(3,0,-1):
                for b in range(args.dtype,0,-1):
                    if (d[0,r,c,h-1]>>(b-1))&1:
                        s+='1'
                    else:
                        s+='0'
            s+='\n'
    
    ls='' # 255 bit label string in binary
    l = l.astype(np.int32)
    for i in range(15*17,0,-1):
        ls+=str(l[0,i-1])

    f = open('data.mem','w')
    print(s,file=f)
    f.close()
    f = open('label.mem','w')
    print(ls,file=f)
    f.close()
    exit()

print(args,file=open(args.log,'a'))

# Define the model architecture
if args.net=='alt1':
    def downsample(i,filters,nl=tf.nn.relu):
        u0 = keras.layers.Conv2D(filters, kernel_size=(3,3), strides=(1,1), activation=tf.nn.relu, padding='valid')(i)
        u1 = keras.layers.Conv2D(filters, kernel_size=(3,3), strides=(2,2), activation=tf.nn.relu, padding='valid')(u0)
        u2 = keras.layers.Conv2D(filters, kernel_size=(3,3), strides=(1,1), activation=nl, padding='valid')(u1)
        return u2

    def encoder(inp):
        e0 = downsample(inp,16)
        e1 = downsample(e0,32)
        e2 = downsample(e1,64)
        e3 = downsample(e2,128)
        e4 = downsample(e3,256)
        e5 = downsample(e4,512,nl=tf.nn.relu)
        return e5

    def task(inp):
        d0 = keras.layers.Conv2D(32, kernel_size=(1,1), strides=(1,1), activation=tf.nn.relu, padding='valid')(inp)
        d1 = keras.layers.Flatten()(d0)
        d2 = keras.layers.Dense(1000,activation=tf.nn.relu)(d1)
        d3 = keras.layers.Dense(1000,activation=tf.nn.relu)(d2)
        #d4 = keras.layers.Dense(1000,activation=tf.nn.relu)(d4)
        #d5 = keras.layers.Dense(1000,activation=tf.nn.relu)(d5)
        #d6 = keras.layers.Dense(1000,activation=tf.nn.relu)(d6)
        y = keras.layers.Dense(15*17,activation=None)(d3)
        return y

    inp = keras.layers.Input(shape=(1400,1600,3))
    enc = encoder(inp)
    y = task(enc)

    enc_model = keras.Model(inputs=[inp], outputs=[enc])
    task_model = keras.Model(inputs=[enc], outputs=[y])
    model = keras.Model(inputs=[inp], outputs=[y])

    #x = enc_model(in0)
    #d0 = keras.layers.Conv2D(64, kernel_size=(1,1), strides=(1,1), activation=tf.nn.relu, padding='valid')(x)
    #d1 = keras.layers.Flatten()(x)
    #d2 = keras.layers.Dense(1000,activation=tf.nn.relu)(d1)
    #d3 = keras.layers.Dense(1000,activation=tf.nn.relu)(d2)
    #d4 = keras.layers.Dense(1000,activation=tf.nn.selu)(d3)
    #d5 = keras.layers.Dense(1000,activation=tf.nn.selu)(d4)
    #d6 = keras.layers.Dense(1000,activation=tf.nn.selu)(d5)
    #d7 = keras.layers.Dense(1000,activation=tf.nn.selu)(d6)
    #d3 = keras.layers.Dense(1000,activation=None)(d1)
    #d0 = keras.layers.Conv2D(8, kernel_size=(1,1), strides=(1,1), activation=tf.nn.selu, padding='valid')(x)
    #d1 = keras.layers.Flatten()(d0)
    #d2 = keras.layers.Dense(1000,activation=tf.nn.selu)(d1)
    #d3 = keras.layers.Dense(1000,activation=tf.nn.selu)(d2)
    #y = keras.layers.Dense(14*16,activation=None)(d3)
    #model = keras.Model(inputs=[in0], outputs=[y])

print(model.summary())

# TRAIN MODEL
opt = tf.keras.optimizers.Adam(args.lr)
model.compile(optimizer=opt)
enc_model.compile()
task_model.compile()
#loss=[]
#grad=[]
#pred=[]
i=0
while True:
    #print('weights',model.get_weights())
    (x,y)=generate_batch(args)
    with tf.GradientTape() as tape:
        logits=model(x)
        loss=tf.keras.losses.BinaryCrossentropy(from_logits=True)(y,logits)
        grads=tape.gradient(loss,model.trainable_weights)
        opt.apply_gradients(zip(grads,model.trainable_weights))
        grad=[np.linalg.norm(x) for x in grads]
        p=1/(1+np.exp(-logits)) # sigmoid
    #pred.append(p)
    if i%1==0:
        accuracy=np.mean(np.round(p)==np.round(y))
        #s=''
        #for c in y[0]:
        #    if c==0:
        #        s+='0'
        #    else:
        #        s+='1'
        #s+='\n'
        #print('label',s)
        np.set_printoptions(precision=4,suppress=True)
        #print('i {:6d} wall {} loss {:12.10f} grad {:12.10f} accuracy {:4.3f} lr {:8.6f} batch {:5d} p {} y {}'.format(i,datetime.datetime.now(),np.mean(loss),np.mean(grad),accuracy,args.lr,args.batch,p[0,0:5],y[0,0:5]))
        print('i {:6d} wall {} loss {:12.10f} grad {:12.10f} accuracy {:4.3f} p {} y {}'.format(i,datetime.datetime.now(),np.mean(loss),np.mean(grad),accuracy,p[0,0:5],y[0,0:5]))
        print('i {:6d} wall {} loss {:12.10f} grad {:12.10f} accuracy {:4.3f} p {} y {}'.format(i,datetime.datetime.now(),np.mean(loss),np.mean(grad),accuracy,p[0,0:5],y[0,0:5]),file=open(args.log,'a'))
    if i%100==0:
        enc_model.save('encoder.keras')
        task_model.save('task.keras')
    i+=1
        
    



#model.compile(optimizer='adam', loss=tf.keras.losses.BinaryCrossentropy(from_logits=True))
#model.fit(generate_batch(args),epochs=args.epochs,steps_per_epoch=100)
#model.save(args.keras)
