import logging
logging.getLogger("tensorflow").setLevel(logging.DEBUG)

import tensorflow as tf
from tensorflow import keras
import numpy as np
import argparse
import os
import cv2

parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument('--net', help='network name',default='alt1')
parser.add_argument('--keras', help='keras model file',default='mb2006.keras')
parser.add_argument('--epochs', help='training epochs',default=1, type=int)
parser.add_argument('--batch', help='batch size',default=1, type=int)
parser.add_argument('--lr', help='learning rate',default=0.001, type=float)
parser.add_argument('--dataset', help='dataset directory',default='./dataset')
parser.add_argument('--debug', help='verbose output',default=False, action='store_true')
args = parser.parse_args()
print(args)

## Load MNIST dataset
#mnist = keras.datasets.mnist
#(train_images, train_labels), (test_images, test_labels) = mnist.load_data()
#train_images = train_images.astype(np.float32) / 255.0
#test_images = test_images.astype(np.float32) / 255.0

# Define the model architecture
if args.net=='alt1':
    def downsample(i,filters,nl=tf.nn.relu):
        u0 = keras.layers.Conv2D(filters, kernel_size=(3,3), strides=(2,2), activation=tf.nn.relu, padding='valid')(i)
        u1 = keras.layers.Conv2D(filters, kernel_size=(3,3), strides=(1,1), activation=nl, padding='valid')(u0)
        return u1

    def encoder(i):
        e0 = downsample(i,8)
        e1 = downsample(e0,8)
        e2 = downsample(e1,16)
        e3 = downsample(e2,16,nl=None)
        return e3

    def upsample(i,filters):
        u0 = keras.layers.UpSampling2D()(i)
        u1 = keras.layers.Conv2D(filters, kernel_size=(3,3), strides=(1,1), activation=tf.nn.relu, padding='valid')(u0)
        return u1

    def decoder(i):
        d0 = upsample(i,16)
        d1 = upsample(d0,16)
        d2 = upsample(d1,8)
        d3 = upsample(d2,8)
        d4 = upsample(d3,1)
        return d4

    input0 = keras.layers.Input(shape=(368,400,3))
    input1 = keras.layers.Input(shape=(368,400,3))
    enc0 = encoder(input0)
    enc1 = encoder(input1)
    #cat = keras.layers.Concatenate(axis=-1)([enc0,enc1])
    cat = keras.layers.Add()([enc0, enc1])
    fuse0 = keras.layers.Conv2D(filters=16, kernel_size=(3,3), strides=(1,1), activation=tf.nn.relu, padding='valid')(cat)
    fuse1 = keras.layers.Conv2D(filters=16, kernel_size=(3,3), strides=(1,1), activation=tf.nn.relu, padding='valid')(fuse0)
    dec0 = decoder(fuse1)
    dec1 = decoder(fuse1)
    out = keras.layers.Concatenate(axis=-1)([dec0,dec1])

    model = keras.Model(inputs=[input0, input1], outputs=out)

print(model.summary())

# load Middlebury 2006 stereo vision dataset # disp1.png  disp5.png  view1.png  view5.png
def crop_center(img,cropx,cropy):
    #print('img.shape',img.shape)
    startx = img.shape[-2]//2-(cropx//2)
    starty = img.shape[-3]//2-(cropy//2)    
    return img[starty:starty+cropy,startx:startx+cropx]

dleft=[]
dright=[]
ldisp=[]
for d in os.listdir(args.dataset):
    d0 = cv2.imread('{}/{}/view1.png'.format(args.dataset,d), cv2.IMREAD_COLOR)
    d1 = cv2.imread('{}/{}/view5.png'.format(args.dataset,d), cv2.IMREAD_COLOR)
    l0 = cv2.imread('{}/{}/disp1.png'.format(args.dataset,d), cv2.IMREAD_GRAYSCALE)
    l1 = cv2.imread('{}/{}/disp5.png'.format(args.dataset,d), cv2.IMREAD_GRAYSCALE)
    #print('d',d,'d0.shape',d0.shape,'d1.shape',d1.shape,'l0.shape',l0.shape,'l1.shape',l1.shape)
    d0 = crop_center(d0,400,368)
    d1 = crop_center(d1,400,368)
    l0 = cv2.resize(l0, [450,386])
    l0 = l0[:,:,np.newaxis]
    l1 = cv2.resize(l1, [450,386])
    l1 = l1[:,:,np.newaxis]
    #print('d',d,'d0.shape',d0.shape,'d1.shape',d1.shape,'l0.shape',l0.shape,'l1.shape',l1.shape)
    dleft.append(d0)
    dright.append(d1)
    ldisp.append(np.concatenate([l0,l1],axis=-1))

dleft = np.array(dleft)/255.0
dright = np.array(dright)/255.0
ldisp = np.array(ldisp)/255.0
print('dleft.shape',dleft.shape,'dright.shape',dright.shape,'ldisp.shape',ldisp.shape)

# Train the digit classification model
#model.compile(optimizer='adam', loss=keras.losses.SparseCategoricalCrossentropy(from_logits=True), metrics=['accuracy'])
opt = tf.keras.optimizers.Adam(args.lr)
model.compile(optimizer=opt, loss=tf.keras.losses.MeanSquaredError())
#model.compile(optimizer='adam', loss=tf.keras.losses.BinaryCrossentropy(from_logits=True))
#model.compile(optimizer='adam', loss=tf.keras.losses.KLDivergence())
model.fit([dleft,dright],ldisp,epochs=args.epochs,batch_size=args.batch)
#  train_images,
#  train_labels,
#  epochs=args.epochs,
#  validation_data=(test_images, test_labels)
#)
model.save(args.keras)
