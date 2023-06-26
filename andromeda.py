import numpy as np ; print('numpy',np.__version__)
#import tensorflow as tf ; print('tensorflow', tf.__version__)
#from tensorflow import keras
#from tensorflow.keras import layers
import argparse
import random
import tflite

parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument('--model', help='flatbuffer model name',default='mnist_model')
parser.add_argument('--clk', help='FPGA clock rate',default=500e6, type=float)
parser.add_argument('--fps', help='first layer input shape arrival rate',default=100., type=float)
parser.add_argument('--tdata', help='dtype width (int8, bfloat16)',default=8, type=int)
args = parser.parse_args()
print(args)

# extract layer graph and weights from tflite file
class Layer:
    pass

with open('./{}.tflite'.format(args.model), 'rb') as f:
    buf = f.read()
    model = tflite.Model.GetRootAsModel(buf, 0)

layers=[]
graph = model.Subgraphs(0)
for j in range(graph.OperatorsLength()):
    if model.OperatorCodes(graph.Operators(j).OpcodeIndex()).BuiltinCode() == tflite.BuiltinOperator.CONV_2D:
        l=Layer()
        l.ishape = graph.Tensors(graph.Operators(j).Inputs(0)).ShapeAsNumpy()
        l.wshape = graph.Tensors(graph.Operators(j).Inputs(1)).ShapeAsNumpy()
        l.bshape = graph.Tensors(graph.Operators(j).Inputs(2)).ShapeAsNumpy()
        l.oshape = graph.Tensors(graph.Operators(j).Outputs(0)).ShapeAsNumpy()
        l.weight = model.Buffers(graph.Tensors(graph.Operators(j).Inputs(1)).Buffer()).DataAsNumpy().reshape(l.wshape)
        l.bias = model.Buffers(graph.Tensors(graph.Operators(j).Inputs(2)).Buffer()).DataAsNumpy()
        # DONE: infer stride from oshape/ishape
        # DONE: infer waddr, log2(len(l.weight)+len(l.bias))
        # DONE: infer nstripe using performance calculation for args.fps, args.clk
        # DONE: infer sdepth, compute stripe buffer size
        l.stride = int(np.round(l.ishape[-2]/l.oshape[-2]))
        #if (l.oshape[-2]==((l.ishape[-2]-2)/2)) and (l.oshape[-3]==((l.ishape[-3]-2)/2)):
        #    l.stride = 2
        #else:
        #    l.stride = 1
        #l.waddr = int(np.ceil(np.log2(np.prod(l.wshape)+len(l.bias)/l.oshape[-1])))
        l.wdepth = np.prod(l.wshape)+len(l.bias)//l.oshape[-1] # TODO assumes int8 TDATA
        l.waddr = int(np.ceil(np.log2(l.wdepth)))
        rate = ((l.ishape[-2]*l.ishape[-3]*args.fps)/(l.stride*l.stride))*l.wshape[-1]*l.wshape[-2]*l.wshape[-3]*l.oshape[-1]
        nmac = np.ceil(rate/args.clk)
        #print('j',j,'rate',rate,'nmac',nmac)
        #print(((l.ishape[-2]*l.ishape[-3]*args.fps)/(l.stride*l.stride)), l.wshape[-1]*l.wshape[-2]*l.wshape[-3])
        l.nstripe = int(np.ceil(nmac/l.oshape[-1]))
        #l.saddr = int(np.ceil(np.log2(((l.nstripe*2*l.stride+l.ishape[-2])*(l.wshape[-2]+l.stride)*l.ishape[-1])/l.nstripe)))
        l.sdepth = (l.ishape[-2]*l.ishape[-1]*(l.wshape[-3]+l.stride)) // l.nstripe
        layers.append(l)

# top level module
s=''
s+='module {} (\n'.format(args.model)
s+='    input wire clk,\n'
s+='    input wire reset,\n'
s+='    input wire [{}*{}-1:0] s_axis_data,\n'.format(layers[0].ishape[-1], args.tdata)
s+='    input wire s_axis_tvalid,\n'
s+='    input wire s_axis_tlast,\n'
s+='    output wire s_axis_tready,\n'
s+='    output wire [{}*{}-1:0] m_axis_data,\n'.format(layers[-1].oshape[-1], args.tdata)
s+='    output wire m_axis_tvalid,\n'
s+='    output wire m_axis_tlast,\n'
s+='    input wire m_axis_tready\n'
s+=');\n\n'

for j,l in enumerate(layers):
    s+='wire [{}*{}-1:0] axis_data_{};\n'.format(l.oshape[-1], args.tdata,j+1)
    
for j,l in enumerate(layers):
    s+='wire axis_tvalid_{};\n'.format(j)
    s+='wire axis_tlast_{};\n'.format(j)
    s+='wire axis_tready_{};\n'.format(j)
    
for j,l in enumerate(layers):
    s+='wire [{}*{}-1:0] weight_rd_{};\n'.format(l.oshape[-1], args.tdata,j)
    s+='wire [{}*{}-1:0] weight_ra_{};\n'.format(l.oshape[-1], l.waddr,j)
 
s+='\n'
for j,l in enumerate(layers):
    s+='// conv2d #(TDATA,OCHAN,NSTRIPE,ICHAN,SDEPTH,WDEPTH,IWIDTH,IHEIGHT,KWIDTH,KHEIGHT,STRIDE)\n'
    s+='conv2d #({},{},{},{},{},{},{},{},{},{},{}) u{} (\n'.format(
        args.tdata, l.oshape[-1], l.nstripe, l.ishape[-1], l.sdepth, l.wdepth, l.ishape[-2], l.ishape[-3], l.wshape[-2], l.wshape[-3], l.stride, j)
    s+='.clk(clk),\n'
    s+='.reset(reset),\n'
    s+='.weight_rd(weight_rd_{}),\n'.format(j)
    s+='.weight_ra(weight_ra_{}),\n'.format(j)
    if j==0:
        s+='.s_axis_data(s_axis_data),\n'
        s+='.s_axis_tvalid(s_axis_tvalid),\n'
        s+='.s_axis_tlast(s_axis_tlast),\n'
        s+='.s_axis_tready(s_axis_tready),\n'
    else:
        s+='.s_axis_data(axis_data_{}),\n'.format(j)
        s+='.s_axis_tvalid(axis_tvalid_{}),\n'.format(j)
        s+='.s_axis_tlast(axis_tlast_{}),\n'.format(j)
        s+='.s_axis_tready(axis_tready_{}),\n'.format(j)

    if j==len(layers)-1:
        s+='.m_axis_data(m_axis_data),\n'
        s+='.m_axis_tvalid(m_axis_tvalid),\n'
        s+='.m_axis_tlast(m_axis_tlast),\n'
        s+='.m_axis_tready(m_axis_tready)\n'
    else:
        s+='.m_axis_data(axis_data_{}),\n'.format(j+1)
        s+='.m_axis_tvalid(axis_tvalid_{}),\n'.format(j+1)
        s+='.m_axis_tlast(axis_tlast_{}),\n'.format(j+1)
        s+='.m_axis_tready(axis_tready_{})\n'.format(j+1)
    s+=');\n'

    s+='// weight_rom\n'
    s+='weight_rom_{} rom{} (\n'.format(j,j)
    s+='.clk(clk),\n'
    s+='.addr(weight_ra_{}),\n'.format(j)
    s+='.data(weight_rd_{})\n'.format(j)
    s+=');\n\n'
s+='endmodule\n'

w=''
for j,l in enumerate(layers):
    #print('l.weight.shape',l.weight.shape)
    #print('l.bias.shape',l.bias.shape)
    w+='module weight_rom_{} (clk, addr, data);\n'.format(j)
    w+='input clk;\n'
    w+='input [{}*{}-1:0] addr;\n'.format(l.oshape[-1], l.waddr)
    w+='output reg [{}*{}-1:0] data;\n'.format(l.oshape[-1], args.tdata)
    w+='\n'
    for i in range(l.oshape[-1]):
        #w+='(*rom_style = "block" *) reg [{}:0] data_{};\n'.format(args.tdata-1,i)
        w+='(*rom_style = "distributed" *) reg [{}:0] data_{};\n'.format(args.tdata-1,i)
        w+='always @(posedge clk)\n'
        w+='begin\n'
        w+='case(addr[{}:{}])\n'.format(i*l.waddr+l.waddr-1,i*l.waddr)
        k=0
        for w0 in l.weight[i].flatten():
            w+='{}\'d{}: data_{} <= \'d{};\n'.format(l.waddr,k,i,w0)
            k+=1
        for w0 in l.bias[i*4+3:i*4]:
            w+='{}\'d{}: data_{} <= \'d{};\n'.format(l.waddr,k,i,w0)
            k+=1
        w+='default: data_{} <= \'bx;\n'.format(i)
        w+='endcase\n'
        w+='end\n'
        w+='always @(posedge clk) data[{}:{}] <= data_{};\n'.format(i*args.tdata+args.tdata-1,i*args.tdata,i)
        #s+='assign data[{}:{}] = data_{};\n'.format(i*args.tdata+args.tdata-1,i*args.tdata,i)
        w+='\n'
    w+='endmodule\n'
    w+='\n'

with open('./{}.v'.format(args.model), 'w') as f:
    print(s,file=f)
with open('./{}_rom.v'.format(args.model), 'w') as f:
    print(w,file=f)
