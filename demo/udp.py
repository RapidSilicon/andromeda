import socket
import numpy as np
import matplotlib.pyplot as plt
import cv2
import struct
import argparse
import os
import time

parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument('--dir', help='directory to store images', default='video')
parser.add_argument('--n', help='number of frames to capture', default=1000, type=int)
args = parser.parse_args()

if not os.path.isdir(args.dir):
    os.makedirs(args.dir)

def checkerboard(shape):
    return np.indices(shape).sum(axis=0) % 2

odd_mask = checkerboard([24,32])
even_mask = np.abs(odd_mask-1)

UDP_IP = ""
UDP_PORT = 30000

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.bind((UDP_IP, UDP_PORT))
print("socket bind complete")

#fig = plt.figure()
#ax = fig.add_subplot(1,1,1)

#writer = cv2.VideoWriter("output.avi",
#cv2.VideoWriter_fourcc(*"mp4v"), 8,(640,480))

fb = np.zeros([24,32], dtype=np.int16)
#fb0 = np.zeros([24,32], dtype=np.uint16)
#fb1 = np.zeros([24,32], dtype=np.uint16)
#fb = np.zeros([384,2], dtype=np.uint16)
i=0
#init=True
#page=0
t0 = time.time()
while True:
    data, addr = sock.recvfrom(1024) # buffer size is 1024 bytes
    hdata = struct.unpack('>384H',data[1:])
    gdata = [x if x<32768 else x-65536 for x in hdata]
    #print('type(hdata)',type(hdata),len(hdata))
    if data[0]==0:
        for r in range(0,12):
            for c in range(0,32):
                #fb[r,c] = data[1+r*32*2+c*2+1]
                #fb[r,c] = ((data[1+r*32*2+c*2]<<8) | data[1+r*32*2+c*2+1])
                fb[r,c] = gdata[r*32+c]
    else:
        for r in range(0,12):
            for c in range(0,32):
                #fb[r+12,c] = data[1+r*32*2+c*2+1]
                #fb[r+12,c] = ((data[1+r*32*2+c*2]<<8) | data[1+r*32*2+c*2+1])
                fb[r+12,c] = gdata[r*32+c]

        #fb = fb & 0x00ff
        #fb = fb.astype(np.uint8)
        #fb = fb.astype(np.int8)
        #fb = (fb+128).astype(np.uint8)
        #fb = (fb-np.min(fb))/(np.max(fb)-np.min(fb))
        #fb2 = fb0*even_mask + fb1*odd_mask
        #fb3 = -1*fb2.astype(np.int16)
        #fb = fb.astype(np.uint16) & 0x00ff;
        #fb = fb.astype(np.int16)
        #fb2 = (fb - np.mean(fb))+128
        fb1 = fb - np.mean(fb)
        fb2=fb1
        #fb2 = np.clip(fb1,-512,512)
        #fb2 = np.clip(fb1,-3*np.std(fb1),3*np.std(fb1))
        #fb2 = (fb2-np.min(fb2))/(np.max(fb2)-np.min(fb2))
        #fb2 = fb1 - np.amin(fb1)
        #fb2 = fb1*(255/(np.mean(fb2)+2*np.std(fb2)))
        #print('fb min max',np.amin(fb2),np.amax(fb2),np.mean(fb2),np.std(fb2))
        fb3 = (fb2-np.min(fb2))/(np.max(fb2)-np.min(fb2))
        #fb3 = np.clip(fb2,0,255)
        #print('fb histogram',np.histogram(fb))
        #print('fb mean std',np.mean(fb), np.std(fb))
        #fb = (fb-np.min(fb))/(np.max(fb)-np.min(fb))
        #fb=(fb*255).astype(np.uint8)
        fb4 = (fb3*255).astype(np.uint8)
        fbout = cv2.resize(fb4, (640,480), interpolation= cv2.INTER_LINEAR)
        #fb2 = cv2.resize(fb, (640,480), interpolation= cv2.INTER_NEAREST)
        cv2.imshow("frame", fbout)
        cv2.waitKey(1)
        i+=1
        if i<args.n:
            cv2.imwrite('{}/frame{:05d}.jpg'.format(args.dir,i),fb4)
            #writer.write(fb5.astype('uint8'))
        elif i==args.n:
            print("dir {} frames {} elapsed {} fps {}".format(args.dir,args.n,time.time()-t0, args.n/(time.time()-t0)))
            exit()


#    if init and len(data)==770 and (data[1]&1)==0:
#        init=False
#    else:
#        continue

    if len(data)==770:
        #print("status",hex(data[0]),hex(data[1]))
        if (data[1]&1)==0:
            page=0
            for r in range(0,12):
                for c in range(0,32):
                    fb0[r,c] = ((data[2+r*32*2+c*2]<<8) | data[2+r*32*2+c*2+1])
        else:
            page=1
            for r in range(0,12):
                for c in range(0,32):
                    fb1[r,c] = ((data[2+r*32*2+c*2]<<8) | data[2+r*32*2+c*2+1])
        #print("page",page)
    elif len(data)==768:
        if page==0:
            for r in range(0,12):
                for c in range(0,32):
                    fb0[r+12,c] = ((data[r*32*2+c*2]<<8) | data[r*32*2+c*2+1])
        else:
            for r in range(0,12):
                for c in range(0,32):
                    fb1[r+12,c] = ((data[r*32*2+c*2]<<8) | data[r*32*2+c*2+1])

            fb2 = fb0*even_mask + fb1*odd_mask
            #fb3 = -1*fb2.astype(np.int16)
            fb3 = fb2.astype(np.uint16) & 0x00ff;
            #print('fb3 min max',np.amin(fb3),np.amax(fb3))
            fb4 = (fb3-np.min(fb3))/(np.max(fb3)-np.min(fb3))
            #fb4=fb3.astype(np.uint8)
            fb5 = cv2.resize(fb4, (640,480), interpolation= cv2.INTER_LINEAR)
            cv2.imshow("frame", fb5)
            cv2.waitKey(1)
            i+=1
            if i<100:
                cv2.imwrite('video/video{:05d}.jpg'.format(i),fb5)
                #cv2.imwrite('video/video{:05d}.jpg'.format(i),(fb5*255).astype(np.uint8))
                #writer.write(fb5.astype('uint8'))
            elif i==100:
                print("finished video writer")
            #    writer.release()
                
            #ax.clear()
            #ax.matshow(fb)
            #ax.set_title(f"frame "+str(i))
            # Note that using time.sleep does *not* work here!
            #plt.pause(0.01)
    #print("received message len=",len(data))
