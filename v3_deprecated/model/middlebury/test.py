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
parser.add_argument('--dataset', help='dataset directory',default='./dataset')
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

dleft=[]
dright=[]
ldisp=[]
dname=[]
for d in os.listdir(args.dataset):
    d0 = cv2.imread('{}/{}/view1.png'.format(args.dataset,d), cv2.IMREAD_COLOR)
    d1 = cv2.imread('{}/{}/view5.png'.format(args.dataset,d), cv2.IMREAD_COLOR)
    l0 = cv2.imread('{}/{}/disp1.png'.format(args.dataset,d), cv2.IMREAD_GRAYSCALE)
    l1 = cv2.imread('{}/{}/disp5.png'.format(args.dataset,d), cv2.IMREAD_GRAYSCALE)
    #print('d',d,'d0.shape',d0.shape,'d1.shape',d1.shape,'l0.shape',l0.shape,'l1.shape',l1.shape)
    d0 = crop_center(d0,400,368)
    d1 = crop_center(d1,400,368)
    l0 = cv2.resize(l0, [400,368])
    l0 = l0[:,:,np.newaxis]
    l1 = cv2.resize(l1, [400,368])
    l1 = l1[:,:,np.newaxis]
    #print('d',d,'d0.shape',d0.shape,'d1.shape',d1.shape,'l0.shape',l0.shape,'l1.shape',l1.shape)
    dleft.append(d0)
    dright.append(d1)
    ldisp.append(np.concatenate([l0,l1],axis=-1))
    dname.append(d)

dleft = np.array(dleft)/255.0
dright = np.array(dright)/255.0
ldisp = np.array(ldisp)/255.0
print('dleft.shape',dleft.shape,'dright.shape',dright.shape,'ldisp.shape',ldisp.shape)

# load keras model
model = tf.keras.saving.load_model(args.keras)
print(model.summary())

#[pred0,pred1] = model.predict([dleft,dright])
pred0 = model.predict([dleft,dright])
print('pred0.shape',pred0.shape)
#print('pred1.shape',pred1.shape)

for i in range(len(pred0)):
    p0 = pred0[i]
    p0 = p0*255
    p0 = p0.astype(np.uint8)
#    p1 = pred1[i]
#    p1 = p1*255
#    p1 = p1.astype(np.uint8)
    #pred0 = pred[i,:,:,0][:,:,np.newaxis]
    #pred0 = pred0*255
    #pred0 = pred0.astype(np.uint8)
    #pred1 = pred[i,:,:,1][:,:,np.newaxis]
    #pred1 = pred1*255
    #pred1 = pred1.astype(np.uint8)
    lab0 = ldisp[i,:,:,0][:,:,np.newaxis]
    lab0 = lab0*255
    lab0 = lab0.astype(np.uint8)
    #lab0 = cv2.resize(lab0, [386,258])
    lab1 = ldisp[i,:,:,1][:,:,np.newaxis]
    lab1 = lab1*255
    lab1 = lab1.astype(np.uint8)
    #lab1 = cv2.resize(lab1, [386,258])
    dat0 = dleft[i]
    dat0 = dat0*255
    dat0 = dat0.astype(np.uint8)
    #dat0 = cv2.resize(dat0, [386,258])
    dat1 = dright[i]
    dat1 = dat1*255
    dat1 = dat1.astype(np.uint8)
    #dat1 = cv2.resize(dat1, [386,258])

    pimg = np.concatenate([p0,p0],axis=-2)
    pimg = cv2.cvtColor(pimg,cv2.COLOR_GRAY2RGB)
    pimg = cv2.resize(pimg, [800,368])
    lab = np.concatenate([lab0,lab1],axis=-2)
    lab = cv2.cvtColor(lab,cv2.COLOR_GRAY2RGB)
    dat = np.concatenate([dat0,dat1],axis=-2)
    print(pimg.shape,lab.shape,dat.shape)
    img = np.concatenate([dat,lab,pimg],axis=-3)
    cv2.imwrite('gallery/{}.jpg'.format(dname[i]), img)
    
exit()
    


# Define the model architecture
if args.net=='alt1':
    def encoder(i):
        e0 = keras.layers.Conv2D(filters=4, kernel_size=(3,3), strides=(2,2), activation=tf.nn.relu, padding='valid')(i)
        e1 = keras.layers.Conv2D(filters=4, kernel_size=(3,3), strides=(2,2), activation=tf.nn.relu, padding='valid')(e0)
        e2 = keras.layers.Conv2D(filters=4, kernel_size=(3,3), strides=(2,2), activation=tf.nn.relu, padding='valid')(e1)
        e3 = keras.layers.Conv2D(filters=4, kernel_size=(3,3), strides=(2,2), activation=tf.nn.relu, padding='valid')(e2)
        e4 = keras.layers.Conv2D(filters=4, kernel_size=(3,3), strides=(2,2), activation=tf.nn.relu, padding='valid')(e3)
        return e4

    def upsample(i):
        u0 = keras.layers.UpSampling2D()(i)
        u1 = keras.layers.Conv2D(filters=4, kernel_size=(3,3), strides=(1,1), activation=tf.nn.relu, padding='valid')(u0)
        return u1

    input0 = keras.layers.Input(shape=(386,258,3))
    input1 = keras.layers.Input(shape=(368,258,3))
    enc0 = encoder(input0)
    enc1 = encoder(input1)
    cat = keras.layers.Concatenate(axis=-1)([enc0,enc1])
    fuse0 = keras.layers.Conv2D(filters=4, kernel_size=(3,3), strides=(2,2), activation=tf.nn.relu, padding='valid')(cat)
    dec0 = upsample(fuse0)
    dec1 = upsample(dec0)
    dec2 = upsample(dec1)
    dec3 = upsample(dec2)
    dec4 = upsample(dec3)
    dec5 = upsample(dec4)
    dec6 = upsample(dec5)
    out = keras.layers.Conv2D(filters=2, kernel_size=(3,3), strides=(1,1), activation=None, padding='valid')(dec6)

    model = keras.Model(inputs=[input0, input1], outputs=out)

print(model.summary())

# Train the digit classification model
#model.compile(optimizer='adam', loss=keras.losses.SparseCategoricalCrossentropy(from_logits=True), metrics=['accuracy'])
model.compile(optimizer='adam', loss=tf.keras.losses.MeanSquaredError())
#model.compile(optimizer='adam', loss=tf.keras.losses.BinaryCrossentropy(from_logits=True))
#model.compile(optimizer='adam', loss=tf.keras.losses.KLDivergence())
model.fit([dleft,dright],ldisp,epochs=args.epochs,batch_size=args.batch)
#  train_images,
#  train_labels,
#  epochs=args.epochs,
#  validation_data=(test_images, test_labels)
#)
model.save(args.keras)
