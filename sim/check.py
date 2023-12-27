import logging
logging.getLogger("tensorflow").setLevel(logging.DEBUG)
import tensorflow as tf
from tensorflow import keras
import numpy as np
import pathlib
import argparse
import cv2
import tflite

parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument('--data', help='input image mem file',default='data.mem')
parser.add_argument('--log', help='verilog simulation log file',default='log.sim')
parser.add_argument('--label', help='output label mem file',default='label.mem')
parser.add_argument('--encoder', help='encoder keras model file',default='encoder.keras')
parser.add_argument('--task', help='downstream task keras model file',default='task.keras')
parser.add_argument('--tflite', help='tflite flatbuffer model file',default='encoder.tflite')
parser.add_argument('--debug', help='verbose output',default=False, action='store_true')
args = parser.parse_args()
print(args)

# data = np.array(read_mem("data.mem"))
# label = np.array(read_mem("label.mem"))
# feat = np.array(parse_log("log.sim"))
# logits1 = keras_task(keras_encoder(data))
# logits2 = keras_task(tflite_encoder(data) * output_scale)
# logits3 = keras_task(feat * output_scale)
# accuracy{123} = round(sigmoid(logits{123}))==label

def read_mem(fn,shape,dtype): # shape = [1400,1600,3], [255,1]
    a=[]
    with open(fn, 'r') as f:
        for line in f.readlines():
            line=line.strip()
            if len(line)>0:
                for i in range(shape[-1]):
                    d=0
                    for j in range(dtype):
                        c = line[-(i*dtype+j+1)]
                        if c=='1':
                            d+=2**j
                    a.append(d)
    return np.array(a,dtype=np.float32).reshape(shape)

def parse_log(fn):
    feat=np.zeros([1,14,18,512],dtype=np.int16)
    with open(fn, 'r') as f:
        for line in f.readlines():
            f = line.split()
            if len(f)>0:
                if f[0]=='OUTPUT':
                    row=int(f[6])
                    col=int(f[8])
                    s=f[10]
                    #print('s',s)
                    for i in range(512):
                        h=s[i*4:i*4+4]
                        v=int(h,base=16)
                        #print('h',len(h),h,'i',i,i*4,i*4+4)
                        feat[0,row,col,511-i]=v
                        #print(row,col,511-i,h,v,feat[0,row,col,511-i])
                        #print('i',i,'row',row,'col',col,'feat',feat[0,row,col,i])
    return feat.astype(np.float32)

#exit()


#OUTPUT time 12210938.000000 feat           0 m_row  0 m_col  0 m_data 1dd2113800000000000018ff163d16600958032c0fee291b17c915330000093e000005b20a990000000009380000000000001257125b000000000000000000002dac1d26101821211cf70faa000000000000000018bb0000047e1b5638371100000002dc0000074900a80b53000000001bff0ef117710000181603b4000000000000007d0000000013720000000012a9142f2504000013f9000000001e7506d9000009d4296500000000000000001cca013a0000033d0000007815e4000000001bc10000000005ba151c043d00000000078211cb01c800461c2a00001a97054600000000000000001c6123110000025b00001254000008921fa700001dac0a070000023d0000134500001ded00001b6500002b7700000be8289f025f2d883039121d00000d1b1f731b95332e2ad41df1000000002bd3072100000000000000000b1a0b9329c9000000001b891b8700000b84176e000007480f4900001a2d196000002778000000000000255100000aea2c47000013e4000000000e7b0000079f000019b102d20a0732a1309a07880000000017c50cc812121b8400001741041917301eb10000000011f8014d000000001d3c00000000000000001b0500001b5a02a5153d0000000000000000227521db2b980dfa223f000035a62b5e2b240000166f00000bc909480000000022741c081de50000000000000eae00002ffb105e1fb01369368000000491000012580000000000000000000000000ff700000251000000001ecf1b510ead31cd0b49000021780000000026c521eb00000bb5180126751f2a00000ee1079e000000000000210c000000000ea42b1c074d07b100002e2e0f68197100001c8e0000000000e0000009550000000014a20000275d000000001d45191f00000000000000003978000030bd1af6000012230cf719fc3096000010740a8c1a932677000003dc12362164000015850b8e000000000ed81c0f00001529000013ba00000f0a18670d6700001689184b0000000008751cd521651f40000008710f73287d219b00000000176e000024010d4a00001da10000160e000000000e01000000000000000023f413bd0000000011033f8800000490214714942a6b1875169200000000051f164218541dd00000139c1d1a06d60dfb000032260f8300001c2309e637ae0cdc00000b340000000039d10e3e2997000004c90000000002d00e7100001c6700000000209900002c610c2209d30000104a30910f701fa92ac400004c7c149900000741000017c600000a3935e02680000000002fee2f72000011710000000032792f2f1e00000015700000000000000c3100002b100000000000001f4e0e0904a31dd6124a07dc00000910000000001fae000000000d87000000000000174516c6000000003c7400000db90000000006e513c9
    

data=read_mem(args.data,[1,1400,1600,3],16)
print('data',data.shape,data.dtype)
label=read_mem(args.label,[255],1)
print('label',label.shape,label.dtype)

# EVALUATE FLOATING POINT ENCODER, FLOATING POINT TASK
encoder = tf.keras.models.load_model(args.encoder)
task = tf.keras.models.load_model(args.task)
logits = task(encoder(data/32767.))
p=1/(1+np.exp(-logits)) # sigmoid
acc1=np.mean(np.round(p)==label)
if args.debug:
    print('p1',p)

#fff = encoder(data/32767.)
#print('fff',fff.shape,np.amin(fff),np.amax(fff))

# EVALUATE TFLITE ENCODER, FLOATING POINT TASK
interpreter = tf.lite.Interpreter(model_path=args.tflite,experimental_preserve_all_tensors=True)
interpreter.allocate_tensors() # Needed before execution!
output_details = interpreter.get_output_details()[0]  # Model has single output.
output_scale, output_zero_point = output_details["quantization"]
input_details = interpreter.get_input_details()[0]  # Model has single input.
input_scale, input_zero_point = input_details["quantization"]
print('input_scale',input_scale,1./input_scale,'input_zero_point',input_zero_point)
print('output_scale',output_scale,1./output_scale,'output_zero_point',output_zero_point)
interpreter.set_tensor(input_details['index'], data.astype(input_details["dtype"]))
interpreter.invoke()
feat = interpreter.get_tensor(output_details['index'])[0]
feat = feat*output_scale+output_zero_point
feat = np.expand_dims(feat,0)
#print(feat)
#print('feat shape',feat.shape,feat.dtype, np.amin(feat),np.amax(feat))
logits = task(feat)
p=1/(1+np.exp(-logits)) # sigmoid
if args.debug:
    print('p2',p)
acc2=np.mean(np.round(p)==label)

# EVALUATE ANDROMEDA ENCODER, FLOATING POINT TASK
feat=parse_log(args.log)
feat = feat*output_scale+output_zero_point
logits = task(feat)
p=1/(1+np.exp(-logits)) # sigmoid
if args.debug:
    print('p3',p)
acc3=np.mean(np.round(p)==label)

#print('feat',feat[0,0,0])

# CORRELATE
print('acc1',acc1,'acc2',acc2,'acc3',acc3)
exit()


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
output_scale, output_zero_point = output_details["quantization"]
print('output_scale',output_scale,1./output_scale,'output_zero_point',output_zero_point)
pred = pred * output_scale + output_zero_point
print('pred shape',pred.shape,pred.dtype, np.amin(pred),np.amax(pred))
exit()
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
output_scale, output_zero_point = output_details["quantization"]
print('output_scale',output_scale,1./output_scale,'output_zero_point',output_zero_point)
pred = pred * output_scale + output_zero_point
print('pred shape',pred.shape,pred.dtype, np.amin(pred),np.amax(pred))
#pred = pred.astype(output_details["dtype"])
#pred = pred.astype(np.int32)
#pred += 128
#pred = pred//128
pred = pred*255.
pred = pred.astype(np.uint8)
print('pred shape',pred.shape,pred.dtype, np.amin(pred),np.amax(pred))
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

for n in [53,54,55,56,57,58,59,60,70,71,73,75,77,79,81,68,82,69,61,62,63,64,65,66,67,68]:
    dump_expect(n,'expect_{}.memh'.format(n))


exit()
#DEBUG
for x in interpreter.get_tensor_details():
    if x['index']==60:
        scale60=x['quantization_parameters']['scales'][0]
    if x['index']==82:
        scale82=x['quantization_parameters']['scales'][0]
print(scale60/scale82)

exit()
with open(args.tflite, 'rb') as f:
    buf = f.read()
    model = tflite.Model.GetRootAsModel(buf, 0)
    graph = model.Subgraphs(0)
print(dir(graph.Operators(16)))
print(dir(graph.Operators(7)))
exit()

#graph.Operators(j)
print(dir(interpreter))
for x in interpreter.get_tensor_details():
    print(x)
#print(interpreter.get_tensor_details())
#print('op16',interpreter.get_input_details()[16]['quantization'], interpreter.get_output_details()[16]['quantization'])
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

