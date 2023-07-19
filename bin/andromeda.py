import numpy as np ; print('numpy',np.__version__)
#from tensorflow import keras
#from tensorflow.keras import layers
import argparse
import random
import tflite
import array

parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument('--tflite', help='tflite flatbuffer model file',default='../model/mnist.tflite')
parser.add_argument('--top', help='top level module name',default='mnist')
parser.add_argument('--clk', help='FPGA clock rate',default=500e6, type=float)
parser.add_argument('--fps', help='first layer input shape arrival rate',default=100., type=float)
parser.add_argument('--dtype', help='dtype width (int8, int16)',default=8, type=int)
parser.add_argument('--regz', help='regz width e.g. 32,48,64',default=32, type=int)
parser.add_argument('--regb', help='regb width (weight) (int8, int16)',default=8, type=int)
parser.add_argument('--analyze', help='run TFLite analyzer',default=False, action='store_true')
parser.add_argument('--debug', help='verbose output',default=False, action='store_true')
args = parser.parse_args()
print(args)

# extract layer graph and weights from tflite file
class Layer:
    pass

if args.analyze:
    import tensorflow as tf ; print('tensorflow', tf.__version__)
    tf.lite.experimental.Analyzer.analyze(model_path=args.tflite)
    exit()

with open(args.tflite, 'rb') as f:
    buf = f.read()
    model = tflite.Model.GetRootAsModel(buf, 0)

layers=[]
graph = model.Subgraphs(0)
for j in range(graph.OperatorsLength()):
    #print(dir(graph.Tensors(graph.Operators(j).Inputs(1))))
    #print(dir(graph.Tensors(graph.Operators(j).Inputs(1)).Quantization()))
    #exit()
    if model.OperatorCodes(graph.Operators(j).OpcodeIndex()).BuiltinCode() == tflite.BuiltinOperator.CONV_2D:
#        print('input scale',j,graph.Tensors(graph.Operators(j).Inputs(0)).Quantization().ScaleAsNumpy())
#        print('input scale',j,graph.Tensors(graph.Operators(j).Inputs(1)).Quantization().ScaleAsNumpy())
#        print('input scale',j,graph.Tensors(graph.Operators(j).Inputs(2)).Quantization().ScaleAsNumpy())
#        print('outputs',j, graph.Operators(j).OutputsLength())
#        print('output scale',j,graph.Tensors(graph.Operators(j).Outputs(0)).Quantization().ScaleAsNumpy())
        
#        print('output scale',j,graph.Tensors(graph.Operators(j).Outputs(1)).Quantization().ScaleAsNumpy())
#        print('output scale',j,graph.Tensors(graph.Operators(j).Outputs(2)).Quantization().ScaleAsNumpy())
        
#        for i in range(3):
#            print('scale',i,graph.Tensors(graph.Operators(j).Inputs(i)).Quantization().ScaleAsNumpy())
#            print('zero point',i,graph.Tensors(graph.Operators(j).Inputs(i)).Quantization().ZeroPointAsNumpy())
#        print('output scale',graph.Tensors(graph.Operators(j).Outputs(i)).Quantization().ScaleAsNumpy())
#        print('output zp',graph.Tensors(graph.Operators(j).Outputs(i)).Quantization().ZeroPointAsNumpy())
        l=Layer()
        l.relu=1
        l.ishape = graph.Tensors(graph.Operators(j).Inputs(0)).ShapeAsNumpy()
        l.wshape = graph.Tensors(graph.Operators(j).Inputs(1)).ShapeAsNumpy()
        l.bshape = graph.Tensors(graph.Operators(j).Inputs(2)).ShapeAsNumpy()
        l.oshape = graph.Tensors(graph.Operators(j).Outputs(0)).ShapeAsNumpy()
        l.weight = model.Buffers(graph.Tensors(graph.Operators(j).Inputs(1)).Buffer()).DataAsNumpy().reshape(l.wshape).astype(np.int8)
        #l.bias = model.Buffers(graph.Tensors(graph.Operators(j).Inputs(2)).Buffer()).DataAsNumpy().astype(np.int32)
        l.bias = model.Buffers(graph.Tensors(graph.Operators(j).Inputs(2)).Buffer()).DataAsNumpy().tobytes()
        #print('j',j,'bias',l.bias,len(l.bias))
        if args.regz==32:
            l.bias = array.array('i', l.bias)
        if args.regz==64:
            l.bias = array.array('q', l.bias)
        #print('j',j,'bias',l.bias)
        if args.regz==32:
            l.bias = np.array(l.bias, dtype=np.int32)
        if args.regz==64:
            l.bias = np.array(l.bias, dtype=np.int64)
        #print('j',j,'bias',l.bias,len(l.bias))
#        print('weight',l.weight.shape,l.weight.dtype,l.weight)
#        print('bias',l.bias.shape,l.bias.dtype,l.bias)

        l.scale = graph.Tensors(graph.Operators(j).Inputs(2)).Quantization().ScaleAsNumpy()
        l.scale = l.scale / graph.Tensors(graph.Operators(j).Outputs(0)).Quantization().Scale(0)

        #print("input  scale 0",graph.Tensors(graph.Operators(j).Inputs(0)).Quantization().ScaleAsNumpy(),'j',j)
        #print("input  scale 1",graph.Tensors(graph.Operators(j).Inputs(1)).Quantization().ScaleAsNumpy(),'j',j)
        #print("input  scale 2",graph.Tensors(graph.Operators(j).Inputs(2)).Quantization().ScaleAsNumpy(),'j',j)
        #print("output scale 0",graph.Tensors(graph.Operators(j).Outputs(0)).Quantization().ScaleAsNumpy(),'j',j)
        #print("scale 0",graph.Tensors(graph.Operators(j).Inputs(0)).Quantization().Scale(0))
        #print("scale 1",graph.Tensors(graph.Operators(j).Inputs(1)).Quantization().Scale(0))
        #print("scale 2",graph.Tensors(graph.Operators(j).Inputs(2)).Quantization().Scale(0))
        #l.scale = graph.Tensors(graph.Operators(j).Inputs(2)).Quantization().ScaleAsNumpy()
        #l.scale = graph.Tensors(graph.Operators(j).Inputs(1)).Quantization().ScaleAsNumpy()
        #print('output scale',graph.Tensors(graph.Operators(j).Outputs(0)).Quantization().Scale(0))
        ##l.scale = l.scale * graph.Tensors(graph.Operators(j).Outputs(0)).Quantization().ScaleAsNumpy()
        ##l.scale = l.scale / 1.5
        #l.scale = np.ones_like(graph.Tensors(graph.Operators(j).Inputs(1)).Quantization().ScaleAsNumpy())
        #l.scale = graph.Tensors(graph.Operators(j).Inputs(2)).Quantization().ScaleAsNumpy()
        #l.scale = np.copy(l.scale)
        #l.scale = l.scale / graph.Tensors(graph.Operators(j).Outputs(0)).Quantization().ScaleAsNumpy()
        #l.scale = np.ones_like(graph.Tensors(graph.Operators(j).Inputs(2)).Quantization().ScaleAsNumpy())
        #l.scale = l.scale * graph.Tensors(graph.Operators(j).Outputs(0)).Quantization().ScaleAsNumpy()
        #l.scale = l.scale / 256.
        #l.scale = l.scale / 32. # 7 bit weight
        #print('scale',l.scale)
        #l.scale *= 0.5 # int32 vs uint32
        #l.scale *= 0.5 # int32 vs uint32
#        print('scale',l.scale.shape,l.scale.dtype,l.scale)

        # DONE: infer stride from oshape/ishape
        # DONE: infer waddr, log2(len(l.weight)+len(l.bias))
        # DONE: infer nstripe using performance calculation for args.fps, args.clk
        # DONE: infer sdepth, compute stripe buffer size
        l.stride = int(np.round(l.ishape[-2]/l.oshape[-2]))
        if l.oshape[-2]<l.wshape[-2]:
            l.stride=1; # HACK
        if l.oshape[-2]==(l.ishape[-2]-l.wshape[-2]+1):
            l.stride=1;
        #if (l.oshape[-2]==((l.ishape[-2]-2)/2)) and (l.oshape[-3]==((l.ishape[-3]-2)/2)):
        #    l.stride = 2
        #else:
        #    l.stride = 1
        #l.waddr = int(np.ceil(np.log2(np.prod(l.wshape)+len(l.bias)/l.oshape[-1])))
        #l.wdepth = (np.prod(l.wshape)+len(l.bias))//l.oshape[-1] # TODO assumes int32 DTYPE for bias?
        l.wdepth = np.prod(l.wshape)//l.oshape[-1]
        l.waddr = int(np.ceil(np.log2(l.wdepth)))
        #l.rate = ((l.ishape[-2]*l.ishape[-3]*args.fps)/(l.stride*l.stride))*l.wshape[-1]*l.wshape[-2]*l.wshape[-3]*l.oshape[-1]
        l.rate = l.oshape[-2]*l.oshape[-3]*args.fps*np.prod(l.wshape)
        l.nmac = l.rate/args.clk
        #print('j',j,'rate',l.rate,'nmac',l.nmac)
        #print(((l.ishape[-2]*l.ishape[-3]*args.fps)/(l.stride*l.stride)), l.wshape[-1]*l.wshape[-2]*l.wshape[-3])
        l.nstripe = int(np.ceil(l.nmac/l.oshape[-1])) # always compute ochan dot products in parallel, TODO enable single MAC layer
        #l.saddr = int(np.ceil(np.log2(((l.nstripe*2*l.stride+l.ishape[-2])*(l.wshape[-2]+l.stride)*l.ishape[-1])/l.nstripe)))
        #l.sdepth = (l.ishape[-2]*l.ishape[-1]*(l.wshape[-3]+l.stride)) // l.nstripe
        l.nrow = l.wshape[-3]+l.stride
        #l.ncol = int(np.ceil(l.oshape[-2]/l.nstripe))
        if l.stride==1:
            l.ncol = int(np.ceil(l.oshape[-2]/l.nstripe))+2
        elif l.stride==2:
            l.ncol = int(np.ceil(l.oshape[-2]/l.nstripe))*2+1
        l.stripe = np.zeros([l.nstripe,l.nrow,l.ncol+2,l.ishape[-1]])
        #print('l.stripe.shape',l.stripe.shape)
        #l.sdepth = int(np.ceil(l.ishape[-2]/l.nstripe)*l.ishape[-1]*(l.wshape[-3]+l.stride))
        if l.stride==1:
            l.overlap=2
        elif l.stride==2:
            l.overlap=1

        # DEBUG?
        if l.nstripe==1:
            l.overlap=0

        if j==0:
            l.prev_ncol = l.ncol
            l.prev_nstripe = l.nstripe
        else:
            l.prev_ncol = layers[-1].ncol
            l.prev_nstripe = layers[-1].nstripe

        layers.append(l)
        #print('layer {:4d} nstripe {:4d} sdepth {:6d} wdepth {:6d} stride {:4d} rate {:6.3e} nmac {:6.0f}\n\tishape {} oshape {} wshape {} bshape {}'.format(
        print('layer {:4d} nstripe {:4d} stride {:2d} rate {:6.3e} nmac {:8.2f} scale {:12.8f} i {} o {} w {} b {} s {}'.format(
            j,l.nstripe,l.stride,l.rate,l.nmac,np.mean(l.scale),l.ishape,l.oshape,l.wshape,l.bshape,l.stripe.shape))
        #print('layer',j,'ishape',l.ishape,'oshape',l.oshape,'wshape',l.wshape,'bshape',l.bshape,'nstripe',l.nstripe,'sdepth',l.sdepth,'wdepth',l.wdepth)

layers[-1].relu=0 # don't apply activation on last layer (HACK)

#print('\ntotal stripe RAM bits {:12d}'.format(sum([l.sdepth*l.nstripe*l.ishape[-1]*args.dtype for l in layers])))
print('\ntotal stripe RAM bits {:12d}'.format(sum([np.prod(l.stripe.shape)*args.dtype for l in layers])))
print('total weight RAM bits {:12d}'.format(sum([l.wdepth*l.oshape[-1]*args.regb for l in layers])))
print('total required MAC units {:12.4f}'.format(sum([l.nmac for l in layers])))
print('total used MAC units {:12.0f}'.format(sum([l.nstripe*l.oshape[-1] for l in layers])))

# top level module
s=''
s+='module {} (\n'.format(args.top)
s+='    input wire clk,\n'
s+='    input wire reset,\n'
s+='    input wire [{}*{}-1:0] s_axis_data,\n'.format(layers[0].ishape[-1], args.dtype)
s+='    input wire s_axis_tvalid,\n'
#s+='    input wire s_axis_tlast,\n'
#s+='    output wire s_axis_tready,\n'
s+='    output wire [{}*{}-1:0] m_axis_data,\n'.format(layers[-1].oshape[-1], args.dtype)
s+='    output wire m_axis_tvalid\n'
#s+='    output wire m_axis_tlast,\n'
#s+='    input wire m_axis_tready\n'
s+=');\n\n'

for j,l in enumerate(layers):
    s+='wire [{}*{}-1:0] axis_data_{};\n'.format(l.oshape[-1], args.dtype,j+1)
    
for j,l in enumerate(layers):
    s+='wire axis_tvalid_{};\n'.format(j)
#    s+='wire axis_tlast_{};\n'.format(j)
#    s+='wire axis_tready_{};\n'.format(j)
    
for j,l in enumerate(layers):
    s+='wire [{}*{}-1:0] weight_rd_{};\n'.format(l.oshape[-1], args.regb,j)
    s+='wire [{}*{}-1:0] weight_ra_{};\n'.format(1, l.waddr,j)
    s+='wire [{}*{}-1:0] bias_rd_{};\n'.format(l.oshape[-1], args.regz,j)
    s+='wire [{}*{}-1:0] scale_rd_{};\n'.format(l.oshape[-1], 32,j)
 
s+='\n'
for j,l in enumerate(layers):
    s+='// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_SWIDTH,NROW,NCOL,OVERLAP,REGZ,REGB,RELU\n'
    s+='conv2d #({},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{}) u{} (\n'.format(
        args.dtype,l.nstripe,l.stripe.shape[1]*l.stripe.shape[2],l.wdepth,l.ishape[-3],l.ishape[-2],l.ishape[-1],l.oshape[-3],l.oshape[-2],l.oshape[-1],l.wshape[-3],l.wshape[-2],l.stride,l.prev_nstripe,l.prev_ncol,l.nrow,l.ncol,l.overlap,args.regz,args.regb,l.relu,j)
    s+='.clk(clk),\n'
    s+='.reset(reset),\n'
    s+='.weight_rd(weight_rd_{}),\n'.format(j)
    s+='.weight_ra(weight_ra_{}),\n'.format(j)
    s+='.bias_rd(bias_rd_{}),\n'.format(j)
    s+='.scale_rd(scale_rd_{}),\n'.format(j)
    if j==0:
        s+='.s_axis_data(s_axis_data),\n'
        s+='.s_axis_tvalid(s_axis_tvalid),\n'
        #s+='.s_axis_tlast(s_axis_tlast),\n'
        #s+='.s_axis_tready(s_axis_tready),\n'
    else:
        s+='.s_axis_data(axis_data_{}),\n'.format(j)
        s+='.s_axis_tvalid(axis_tvalid_{}),\n'.format(j)
        #s+='.s_axis_tlast(axis_tlast_{}),\n'.format(j)
        #s+='.s_axis_tready(axis_tready_{}),\n'.format(j)

    if j==len(layers)-1:
        s+='.m_axis_data(m_axis_data),\n'
        s+='.m_axis_tvalid(m_axis_tvalid)\n'
        #s+='.m_axis_tlast(m_axis_tlast),\n'
        #s+='.m_axis_tready(m_axis_tready)\n'
    else:
        s+='.m_axis_data(axis_data_{}),\n'.format(j+1)
        s+='.m_axis_tvalid(axis_tvalid_{})\n'.format(j+1)
        #s+='.m_axis_tlast(axis_tlast_{}),\n'.format(j+1)
        #s+='.m_axis_tready(axis_tready_{})\n'.format(j+1)
    s+=');\n'

    s+='// weight_rom\n'
    s+='weight_rom_{} rom{} (\n'.format(j,j)
    s+='.clk(clk),\n'
    s+='.addr(weight_ra_{}),\n'.format(j)
    s+='.data(weight_rd_{})\n'.format(j)
    s+=');\n\n'

    s+='// bias_rom\n'
    s+='bias_rom_{} bias{} (\n'.format(j,j)
    s+='.data(bias_rd_{})\n'.format(j)
    s+=');\n\n'

    s+='// scale_rom\n'
    s+='scale_rom_{} scale{} (\n'.format(j,j)
    s+='.data(scale_rd_{})\n'.format(j)
    s+=');\n\n'

s+='endmodule\n'

w=''
for j,l in enumerate(layers):
    #print('l.weight.shape',l.weight.shape)
    #print('l.bias.shape',l.bias.shape)
    w+='module weight_rom_{} (clk, addr, data);\n'.format(j)
    w+='input clk;\n'
    w+='input [{}-1:0] addr;\n'.format(l.waddr)
    w+='output reg [{}*{}-1:0] data;\n'.format(l.oshape[-1], args.regb)
    w+='\n'
    for i in range(l.oshape[-1]):
        #w+='(*rom_style = "block" *) reg [{}:0] data_{};\n'.format(args.dtype-1,i)
        w+='(*rom_style = "distributed" *) reg signed [{}:0] data_{};\n'.format(args.regb-1,i)
        w+='always @(posedge clk)\n'
        w+='begin\n'
        w+='case(addr)\n'
        k=0
        for w0 in l.weight[i].flatten():
            if w0<0:
                w+='{}\'d{}: data_{} <= -{}\'d{};\n'.format(l.waddr,k,i,args.regb,abs(w0))
            else:
                w+='{}\'d{}: data_{} <= {}\'d{};\n'.format(l.waddr,k,i,args.regb,w0)
            k+=1
        w+='default: data_{} <= \'bx;\n'.format(i)
        w+='endcase\n'
        w+='end\n'
        w+='always @(posedge clk) data[{}:{}] <= data_{};\n'.format(i*args.regb+args.regb-1,i*args.regb,i)
        #s+='assign data[{}:{}] = data_{};\n'.format(i*args.dtype+args.dtype-1,i*args.dtype,i)
        w+='\n'
    w+='endmodule\n'
    w+='\n'

    bias_width = args.regz
    w+='module bias_rom_{} (data);\n'.format(j)
    w+='output signed [{}*{}-1:0] data;\n'.format(l.oshape[-1], bias_width)
    w+='\n'
    for i in range(l.oshape[-1]):
        b = l.bias[i]
        if b<0:
            w+='assign data[{} +:{}] = -{}\'d{};\n'.format(i*bias_width,bias_width,bias_width,np.abs(b),bias_width,bias_width)
        else:
            w+='assign data[{} +:{}] = {}\'d{};\n'.format(i*bias_width,bias_width,bias_width,np.abs(b),bias_width,bias_width)
    w+='endmodule\n'
    w+='\n'

    w+='module scale_rom_{} (data);\n'.format(j)
    w+='output [{}*{}-1:0] data;\n'.format(l.oshape[-1], 32)
    w+='\n'
    for i in range(l.oshape[-1]):
        #w+='assign data[{}:{}] = 32\'h{};\n'.format(i*32+31,i*32,hex(int(l.scale[i]*pow(2,32)))[2:])
        #w+='assign data[{}:{}] = 32\'h{};\n'.format(i*32+31,i*32,hex(int(l.scale[i]*pow(2,31)))[2:])
        w+='assign data[{}:{}] = 32\'h{};\n'.format(i*32+31,i*32,hex(int(l.scale[i]*0xffffffff))[2:])
    w+='endmodule\n'
    w+='\n'

with open('./{}.v'.format(args.top), 'w') as f:
    print(s,file=f)
with open('./{}_rom.v'.format(args.top), 'w') as f:
    print(w,file=f)
