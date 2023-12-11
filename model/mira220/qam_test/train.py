#import logging
#logging.getLogger("tensorflow").setLevel(logging.DEBUG)

import tensorflow as tf ; print('tensorflow',tf.__version__)
from tensorflow import keras
import numpy as np
import argparse
import os
import cv2
import datetime
import random

parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument('--stretch', help='grid random scale',default=0.3, type=float)
parser.add_argument('--nballs', help='sample size',default=2000, type=int)
parser.add_argument('--ballsize', help='gaussian scale',default=10.0, type=float)
parser.add_argument('--log', help='log file',default='./log.train')
parser.add_argument('--sidex', help='QAM grid',default=1600, type=int)
parser.add_argument('--spacex', help='QAM grid',default=100, type=int)
parser.add_argument('--sidey', help='QAM grid',default=1400, type=int)
parser.add_argument('--spacey', help='QAM grid',default=100, type=int)
parser.add_argument('--net', help='network name',default='alt1')
parser.add_argument('--keras', help='keras model file',default='qamtest.keras')
parser.add_argument('--epochs', help='training epochs',default=1000000, type=int)
parser.add_argument('--batch', help='batch size',default=3, type=int)
parser.add_argument('--lr', help='learning rate',default=0.0001, type=float)
parser.add_argument('--dataset', help='dataset directory',default='./dataset')
parser.add_argument('--debug', help='verbose output',default=False, action='store_true')
args = parser.parse_args()
print(args)
print(args,file=open(args.log,'a'))

# Define the model architecture
if args.net=='alt1':
    def downsample(i,filters,nl=tf.nn.selu):
        u0 = keras.layers.Conv2D(filters, kernel_size=(3,3), strides=(1,1), activation=tf.nn.selu, padding='valid')(i)
        u1 = keras.layers.Conv2D(filters, kernel_size=(3,3), strides=(2,2), activation=tf.nn.selu, padding='valid')(u0)
        u2 = keras.layers.Conv2D(filters, kernel_size=(3,3), strides=(1,1), activation=nl, padding='valid')(u1)
        return u2

    def encoder(i):
        e0 = downsample(i,16)
        e1 = downsample(e0,32)
        e2 = downsample(e1,64)
        e3 = downsample(e2,128)
        e4 = downsample(e3,256)
        #e5 = downsample(e4,512,nl=None)
        e5 = downsample(e4,512)
        return e5

    in0 = keras.layers.Input(shape=(1400,1600,3))
    out = encoder(in0)
    enc_model = keras.Model(inputs=[in0], outputs=[out])
    x = enc_model(in0)
    d0 = keras.layers.Conv2D(16, kernel_size=(1,1), strides=(1,1), activation=tf.nn.selu, padding='valid')(x)
    d1 = keras.layers.Flatten()(d0)
    d2 = keras.layers.Dense(1000,activation=tf.nn.selu)(d1)
    d3 = keras.layers.Dense(1000,activation=tf.nn.selu)(d2)
    d4 = keras.layers.Dense(1000,activation=tf.nn.selu)(d3)
    d5 = keras.layers.Dense(1000,activation=tf.nn.selu)(d4)
    d6 = keras.layers.Dense(1000,activation=tf.nn.selu)(d5)
    #d7 = keras.layers.Dense(1000,activation=tf.nn.selu)(d6)
    #d3 = keras.layers.Dense(1000,activation=None)(d1)
    #d0 = keras.layers.Conv2D(8, kernel_size=(1,1), strides=(1,1), activation=tf.nn.selu, padding='valid')(x)
    #d1 = keras.layers.Flatten()(d0)
    #d2 = keras.layers.Dense(1000,activation=tf.nn.selu)(d1)
    #d3 = keras.layers.Dense(1000,activation=tf.nn.selu)(d2)
    y = keras.layers.Dense(14*16,activation=None)(d6)
    model = keras.Model(inputs=[in0], outputs=[y])

print(model.summary())

# dynamically generate (data,label) examples
def generate_batch(args):
    d = np.zeros([args.batch,1400,1600,3]).astype(np.uint8)
    l = np.zeros([args.batch,14*16]).astype(np.float32)
    #grid=[(x,y) for x in range(-args.sidex//2,args.sidex//2,args.spacex) for y in range(-args.sidey//2,args.sidey//2,args.spacey)]
    grid=[(x+args.spacex//2,y+args.spacey//2) for x in range(0,args.sidex+args.spacex,args.spacex) for y in range(0,args.sidey+args.spacey,args.spacey)]
    # randomly render colored gaussian balls on grid
    for i in range(args.batch):
        for j in range(14*16):
            if np.random.randint(2):
                l[i,j]=1
                #scale=args.ballsize
                scale=np.random.random()*(30-5)+5
                xy=np.random.normal(loc=grid[j],scale=scale,size=[args.nballs,2])
                color=tuple(random.choice([128,255]) for _ in range(3))
                #color=np.random.randint(128,256,size=3).astype(np.uint8)
                #color=[200,200,200]
                #print(i,j,'grid',grid[j],'color',color,'xy',xy)
                for (x,y) in xy:
                    if x>=0 and x<1600 and y>=0 and y<1400:
                        #print('color',color,'i',i,'j',j,'x',int(x),'y',int(y))
                        d[i,int(y),int(x)]=color
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
    cv2.imshow('train', cv2.resize(d[0],dsize=(800,700),interpolation=cv2.INTER_LINEAR)) 
    cv2.waitKey(1)
    return (d/255.,l)

opt = tf.keras.optimizers.Adam(args.lr)
model.compile(optimizer=opt)
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
        model.save(args.keras)
    i+=1
        
    



#model.compile(optimizer='adam', loss=tf.keras.losses.BinaryCrossentropy(from_logits=True))
#model.fit(generate_batch(args),epochs=args.epochs,steps_per_epoch=100)
#model.save(args.keras)
