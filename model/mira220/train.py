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
parser.add_argument('--keras', help='keras model file',default='mira220.keras')
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
        e0 = downsample(i,2)
        e1 = downsample(e0,4)
        e2 = downsample(e1,8,nl=None)
        return e2

#    def upsample(i,filters):
#        u0 = keras.layers.UpSampling2D()(i)
#        u1 = keras.layers.Conv2D(filters, kernel_size=(3,3), strides=(1,1), activation=tf.nn.relu, padding='valid')(u0)
#        return u1
#
#    def decoder(i):
#        d0 = upsample(i,16)
#        d1 = upsample(d0,8)
#        d2 = upsample(d1,4)
#        d3 = upsample(d2,2)
#        d4 = upsample(d3,1)
#        return d4

    in0 = keras.layers.Input(shape=(1120,1280,1))
    in1 = keras.layers.Input(shape=(1120,1280,1))
    enc0 = encoder(in0)
    enc1 = encoder(in1)
    cat = keras.layers.Concatenate(axis=-1)([enc0,enc1])
    #cat = keras.layers.Add()([enc0, enc1])
    #fuse0 = keras.layers.Conv2D(filters=64, kernel_size=(3,3), strides=(1,1), activation=tf.nn.relu, padding='valid')(cat)
    #fuse1 = keras.layers.Conv2D(filters=64, kernel_size=(3,3), strides=(1,1), activation=tf.nn.relu, padding='valid')(fuse0)
    #fuse2 = keras.layers.Conv2D(filters=64, kernel_size=(3,3), strides=(1,1), activation=tf.nn.relu, padding='valid')(fuse1)
    fuse0 = downsample(cat,16)
    out = downsample(fuse0,32,nl=None)
    #out = keras.layers.Conv2D(filters=64, kernel_size=(3,3), strides=(1,1), activation=None, padding='valid')(fuse1)
    #out0 = decoder(fuse1)
    #out1 = decoder(fuse1)

    #model = keras.Model(inputs=[in0, in1], outputs=[out0,out1])
    model = keras.Model(inputs=[in0, in1], outputs=[out])

print(model.summary())

#opt = tf.keras.optimizers.Adam(args.lr)
#model.compile(optimizer=opt, loss=tf.keras.losses.MeanSquaredError())
#model.compile(optimizer='adam', loss=tf.keras.losses.BinaryCrossentropy(from_logits=True))
#model.compile(optimizer='adam', loss=tf.keras.losses.KLDivergence())
#model.fit([dleft,dright],[lleft,lright],epochs=args.epochs,batch_size=args.batch)
model.save(args.keras)
