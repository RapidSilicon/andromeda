import socket
import numpy as np
import cv2
import struct
import argparse
import os
import time
np.set_printoptions(linewidth=250)

parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument('--dir', help='directory to store images', default='video')
parser.add_argument('--n', help='number of frames to capture', default=1000, type=int)
parser.add_argument('--flip', default=False, action='store_true')
parser.add_argument('--forever', default=False, action='store_true')
parser.add_argument('--gallery', default=False, action='store_true')
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

fb = np.zeros([24,32], dtype=np.uint8)
fbraw = np.zeros([24,32], dtype=np.uint8)
i=0
t0 = time.time()
pred0=0
pred1=0
pred2=0
pred3=0
pred4=0
while True:
    data, addr = sock.recvfrom(1024) # buffer size is 1024 bytes
    #print('len(data)',len(data))

    if len(data)==768:
        hdata = struct.unpack('>384H',data)
    elif len(data)==768+12:
        hdata = struct.unpack('>384H',data[12:])
        status = struct.unpack('>H',data[0:2])[0]
        pred0 = struct.unpack('>h',data[2:4])[0]
        pred1 = struct.unpack('>h',data[4:6])[0]
        pred2 = struct.unpack('>h',data[6:8])[0]
        pred3 = struct.unpack('>h',data[8:10])[0]
        pred4 = struct.unpack('>h',data[10:12])[0]
    else:
        print("ERROR: UDP PACKET LENGTH",len(data))

    gdata = [x if x<32768 else x-65536 for x in hdata]
    gdata = [-128 if x<-128 else x for x in gdata]
    gdata = [x+128 for x in gdata]

    if len(data)==768+12:
        for r in range(0,12):
            for c in range(0,32):
                fbraw[r,c] = gdata[r*32+c]
                if args.flip:
                    fb[23-r,c] = gdata[r*32+c]
                else:
                    fb[r,c] = gdata[r*32+c]
    else:
        for r in range(0,12):
            for c in range(0,32):
                fbraw[r+12,c] = gdata[r*32+c]
                if args.flip:
                    fb[23-(r+12),c] = gdata[r*32+c]
                else:
                    fb[r+12,c] = gdata[r*32+c]

        fb4=fb
        fbout = cv2.resize(fb4, (640,480), interpolation= cv2.INTER_NEAREST)
        fbout = cv2.cvtColor(fbout,cv2.COLOR_GRAY2RGB)
        pred = np.argmax(np.array([pred0,pred1,pred2,pred3,pred4]))
        #cv2.putText(fbout, 'pred {}'.format(1+pred), (20, 25), cv2.FONT_HERSHEY_PLAIN, 2, (255,0,255), 4)
        cv2.putText(fbout, 'pred {}'.format(1+pred), (20, 55), cv2.FONT_HERSHEY_PLAIN, 5, (255,0,255), 4)
        cv2.imshow("frame", fbout)
        cv2.waitKey(1)
        i+=1
        if args.gallery:
            cv2.imwrite('gallery/frame_{:05d}.jpg'.format(i), fbout)
        if i<args.n:
            cv2.imwrite('{}/frame{:05d}.jpg'.format(args.dir,i),fbraw)
        elif i==args.n:
            print("dir {} frames {} elapsed {} fps {}".format(args.dir,args.n,time.time()-t0, args.n/(time.time()-t0)))
            if not args.forever:
                exit()
