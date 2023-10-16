import numpy as np ; print('numpy',np.__version__)
import argparse
import random
import tflite
import array
import struct

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

if args.analyze:
    import tensorflow as tf ; print('tensorflow', tf.__version__)
    tf.lite.experimental.Analyzer.analyze(model_path=args.tflite)
    exit()

def emit_prefix(graph,args):
    s=''
    s+='module {} (\n'.format(args.top)
    s+='    input wire clk,\n'
    s+='    input wire reset,\n'
    for k in range(graph.InputsLength()):
        ishape = graph.Tensors(graph.Inputs(k)).ShapeAsNumpy()
        s+='    input wire [{}-1:0] s_{}_row,\n'.format(int(np.ceil(np.log2(ishape[-3]))),k)
        s+='    input wire [{}-1:0] s_{}_col,\n'.format(int(np.ceil(np.log2(ishape[-2]))),k)
        s+='    input wire [{}*{}-1:0] s_{}_data,\n'.format(ishape[-1],args.dtype,k)
        s+='    input wire s_{}_valid,\n'.format(k)
    for k in range(graph.OutputsLength()):
        oshape = graph.Tensors(graph.Outputs(k)).ShapeAsNumpy()
        s+='    output wire [{}-1:0] m_{}_row,\n'.format(int(np.ceil(np.log2(oshape[-3]))),k)
        s+='    output wire [{}-1:0] m_{}_col,\n'.format(int(np.ceil(np.log2(oshape[-2]))),k)
        s+='    output wire [{}*{}-1:0] m_{}_data,\n'.format(oshape[-1],args.dtype,k)
        s+='    output wire m_{}_valid,\n'.format(k)
    s=s[:-2] # chop last comma
    s+='\n);\n\n'
    return s

def emit_wires(graph,args):
    # first scan the graph for wire interconnects
    wires={}
    for j in range(graph.OperatorsLength()):
        if model.OperatorCodes(graph.Operators(j).OpcodeIndex()).BuiltinCode() == tflite.BuiltinOperator.CONV_2D:
            wires[graph.Operators(j).Inputs(0)]=True
            wires[graph.Operators(j).Outputs(0)]=True
        if model.OperatorCodes(graph.Operators(j).OpcodeIndex()).BuiltinCode() == tflite.BuiltinOperator.ADD:
            wires[graph.Operators(j).Inputs(0)]=True
            wires[graph.Operators(j).Inputs(1)]=True
            wires[graph.Operators(j).Outputs(0)]=True
        if model.OperatorCodes(graph.Operators(j).OpcodeIndex()).BuiltinCode() == tflite.BuiltinOperator.RESIZE_NEAREST_NEIGHBOR:
            wires[graph.Operators(j).Inputs(0)]=True
            wires[graph.Operators(j).Outputs(0)]=True
        if model.OperatorCodes(graph.Operators(j).OpcodeIndex()).BuiltinCode() == tflite.BuiltinOperator.CONCATENATION:
            wires[graph.Operators(j).Inputs(0)]=True
            wires[graph.Operators(j).Inputs(1)]=True
            wires[graph.Operators(j).Outputs(0)]=True
        if model.OperatorCodes(graph.Operators(j).OpcodeIndex()).BuiltinCode() == tflite.BuiltinOperator.QUANTIZE:
            wires[graph.Operators(j).Inputs(0)]=True
            wires[graph.Operators(j).Outputs(0)]=True

    s=''
    for w in wires.keys():
        shape=graph.Tensors(w).ShapeAsNumpy()
        s+='wire [{}*{}-1:0] T{}_data;\n'.format(shape[-1], args.dtype,w)
        s+='wire [{}-1:0] T{}_col;\n'.format(int(np.ceil(np.log2(shape[-2]))),w)
        s+='wire [{}-1:0] T{}_row;\n'.format(int(np.ceil(np.log2(shape[-3]))),w)
        s+='wire T{}_valid;\n'.format(w)

    for k in range(graph.InputsLength()):
        s+='assign T{}_data=s_{}_data;\n'.format(graph.Inputs(k),k)
        s+='assign T{}_row=s_{}_row;\n'.format(graph.Inputs(k),k)
        s+='assign T{}_col=s_{}_col;\n'.format(graph.Inputs(k),k)
        s+='assign T{}_valid=s_{}_valid;\n'.format(graph.Inputs(k),k)
    for k in range(graph.OutputsLength()):
        s+='assign m_{}_data=T{}_data;\n'.format(k,graph.Outputs(k))
        s+='assign m_{}_row=T{}_row;\n'.format(k,graph.Outputs(k))
        s+='assign m_{}_col=T{}_col;\n'.format(k,graph.Outputs(k))
        s+='assign m_{}_valid=T{}_valid;\n'.format(k,graph.Outputs(k))
    s+='\n'
    return s

def emit_conv2d(j,graph,args):
    # compute parameters
    relu=1 # TODO: need command line arg to provide list of operators for relu=0
    ishape = graph.Tensors(graph.Operators(j).Inputs(0)).ShapeAsNumpy()
    wshape = graph.Tensors(graph.Operators(j).Inputs(1)).ShapeAsNumpy()
    bshape = graph.Tensors(graph.Operators(j).Inputs(2)).ShapeAsNumpy()
    oshape = graph.Tensors(graph.Operators(j).Outputs(0)).ShapeAsNumpy()
    weight = model.Buffers(graph.Tensors(graph.Operators(j).Inputs(1)).Buffer()).DataAsNumpy().reshape(wshape).astype(np.int8)
    bias = model.Buffers(graph.Tensors(graph.Operators(j).Inputs(2)).Buffer()).DataAsNumpy().tobytes()
    if args.dtype==8:
        bias = struct.unpack('<'+str(len(bias)//4)+'i',bias)
        bias = np.array(bias, dtype=np.int32)
    if args.dtype==16:
        bias = struct.unpack('<'+str(len(bias)//8)+'q',bias)
        bias = np.array(bias, dtype=np.int64)
    scale=[]
    for i in range(oshape[-1]):
        s1 = graph.Tensors(graph.Operators(j).Inputs(0)).Quantization().Scale(0)
        s2 = graph.Tensors(graph.Operators(j).Inputs(1)).Quantization().Scale(i)
        sbias = graph.Tensors(graph.Operators(j).Inputs(2)).Quantization().Scale(i) # == s1*s2
        s3 = graph.Tensors(graph.Operators(j).Outputs(0)).Quantization().Scale(0)
        scale.append((s1*s2)/s3)

    stride = int(np.round(ishape[-2]/oshape[-2]))
    if oshape[-2]<wshape[-2]:
        stride=1; # HACK
    if oshape[-2]==(ishape[-2]-wshape[-2]+1):
        stride=1;
    wdepth = np.prod(wshape)//oshape[-1]
    waddr = int(np.ceil(np.log2(wdepth)))
    rate = oshape[-2]*oshape[-3]*args.fps*np.prod(wshape)
    feati = ishape[-2]*ishape[-3]*args.fps
    feato = oshape[-2]*oshape[-3]*args.fps
    if feati>args.clk or feato>args.clk:
        print('ERROR: feature rate > clock rate','feati',feati,'feato',feato,'clock',args.clk)
    nmac = rate/args.clk
    nstripe = int(np.ceil(nmac/oshape[-1])) # always compute ochan dot products in parallel, TODO enable single MAC layer
    nrow = wshape[-3]+stride
    ncol = ishape[-2]//nstripe
    if ncol == (ishape[-2]/2.):
        ncol -=1
    ocol = int(np.ceil(oshape[-2]/nstripe))

    if stride==1:
        overlap=2
    elif stride==2:
        overlap=1

    if nstripe==1:
        overlap=0

    stripe = np.zeros([nstripe,nrow,ncol+overlap,ishape[-1]])
    roms.append((j,oshape[-1],waddr,weight,bias,scale)) # will be emitted as a separate file

    s=''
    s+='wire [{}*{}-1:0] OP{}_weight_rd;\n'.format(oshape[-1], args.regb,j)
    s+='wire [{}*{}-1:0] OP{}_weight_ra;\n'.format(1, waddr,j)
    s+='wire [{}*{}-1:0] OP{}_bias_rd;\n'.format(oshape[-1], args.regz,j)
    s+='wire [{}*{}-1:0] OP{}_scale_rd;\n'.format(oshape[-1], 32,j)
    s+='wire [{}*{}-1:0] OP{}_shift_rd;\n'.format(oshape[-1], 6,j)

    s+='// conv2d #(DTYPE,NSTRIPE,SDEPTH,WDEPTH,IHEIGHT,IWIDTH,ICHAN,OHEIGHT,OWIDTH,OCHAN,KHEIGHT,KWIDTH,STRIDE,PREV_NSTRIPE,PREV_NCOL,NROW,NCOL,OCOL,OVERLAP,REGZ,REGB,RELU\n'
    s+='conv2d #({},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{}) u{} (\n'.format(
        args.dtype,nstripe,stripe.shape[1]*stripe.shape[2],wdepth,ishape[-3],ishape[-2],ishape[-1],oshape[-3],oshape[-2],oshape[-1],wshape[-3],wshape[-2],stride,0,0,nrow,ncol,ocol,overlap,args.regz,args.regb,relu,j)
    s+='.clk(clk),\n'
    s+='.reset(reset),\n'
    s+='.weight_rd(OP{}_weight_rd),\n'.format(j)
    s+='.weight_ra(OP{}_weight_ra),\n'.format(j)
    s+='.bias_rd(OP{}_bias_rd),\n'.format(j)
    s+='.scale_rd(OP{}_scale_rd),\n'.format(j)
    s+='.shift_rd(OP{}_shift_rd),\n'.format(j)
    s+='.s_axis_data(T{}_data),\n'.format(graph.Operators(j).Inputs(0))
    s+='.s_col(T{}_col),\n'.format(graph.Operators(j).Inputs(0))
    s+='.s_row(T{}_row),\n'.format(graph.Operators(j).Inputs(0))
    s+='.s_axis_tvalid(T{}_valid),\n'.format(graph.Operators(j).Inputs(0))
    s+='.m_axis_data(T{}_data),\n'.format(graph.Operators(j).Outputs(0))
    s+='.m_col(T{}_col),\n'.format(graph.Operators(j).Outputs(0))
    s+='.m_row(T{}_row),\n'.format(graph.Operators(j).Outputs(0))
    s+='.m_axis_tvalid(T{}_valid)\n'.format(graph.Operators(j).Outputs(0))
    s+=');\n'

    s+='// weight_rom\n'
    s+='weight_rom_{} rom{} (\n'.format(j,j)
    s+='.clk(clk),\n'
    s+='.addr(OP{}_weight_ra),\n'.format(j)
    s+='.data(OP{}_weight_rd)\n'.format(j)
    s+=');\n\n'

    s+='// bias_rom\n'
    s+='bias_rom_{} bias{} (\n'.format(j,j)
    s+='.data(OP{}_bias_rd)\n'.format(j)
    s+=');\n\n'

    s+='// scale_rom\n'
    s+='scale_rom_{} scale{} (\n'.format(j,j)
    s+='.scale(OP{}_scale_rd),\n'.format(j)
    s+='.shift(OP{}_shift_rd)\n'.format(j)
    s+=');\n\n'
    return s

def emit_concatenate(j,graph,args):
    i0shape = graph.Tensors(graph.Operators(j).Inputs(0)).ShapeAsNumpy()
    i1shape = graph.Tensors(graph.Operators(j).Inputs(1)).ShapeAsNumpy()
    oshape = graph.Tensors(graph.Operators(j).Outputs(0)).ShapeAsNumpy()
    s=''
    if (i0shape[-3]==i1shape[-3]) and (i0shape[-2]==i1shape[-2]) and (i0shape[-1]+i1shape[-1]==oshape[-1]):
        row=i0shape[-3]
        col=i0shape[-2]
        chan0=i0shape[-1]
        chan1=i1shape[-1]
        s+='concatenate #({},{},{},{},{}) u{} (\n'.format(args.dtype,row,col,chan0,chan1,j)
        s+='.clk(clk),\n'
        s+='.reset(reset),\n'
        s+='.s_0_data(T{}_data),\n'.format(graph.Operators(j).Inputs(0))
        s+='.s_0_col(T{}_col),\n'.format(graph.Operators(j).Inputs(0))
        s+='.s_0_row(T{}_row),\n'.format(graph.Operators(j).Inputs(0))
        s+='.s_0_valid(T{}_valid),\n'.format(graph.Operators(j).Inputs(0))
        s+='.s_1_data(T{}_data),\n'.format(graph.Operators(j).Inputs(1))
        s+='.s_1_col(T{}_col),\n'.format(graph.Operators(j).Inputs(1))
        s+='.s_1_row(T{}_row),\n'.format(graph.Operators(j).Inputs(1))
        s+='.s_1_valid(T{}_valid),\n'.format(graph.Operators(j).Inputs(1))
        s+='.m_0_data(T{}_data),\n'.format(graph.Operators(j).Outputs(0))
        s+='.m_0_col(T{}_col),\n'.format(graph.Operators(j).Outputs(0))
        s+='.m_0_row(T{}_row),\n'.format(graph.Operators(j).Outputs(0))
        s+='.m_0_valid(T{}_valid)\n'.format(graph.Operators(j).Outputs(0))
        s+=');\n'
    else:
        print('CONCATENATE shape mismatch',i0shape,i1shape,oshape)
    return s

def emit_add(j,graph,args):
    i0shape = graph.Tensors(graph.Operators(j).Inputs(0)).ShapeAsNumpy()
    i1shape = graph.Tensors(graph.Operators(j).Inputs(1)).ShapeAsNumpy()
    oshape = graph.Tensors(graph.Operators(j).Outputs(0)).ShapeAsNumpy()
    s=''
    if np.array_equal(i0shape,i1shape) and np.array_equal(i0shape,oshape):
        row=oshape[-3]
        col=oshape[-2]
        chan=oshape[-1]
        s+='add #({},{},{},{}) u{} (\n'.format(args.dtype,row,col,chan,j)
        s+='.clk(clk),\n'
        s+='.reset(reset),\n'
        s+='.s_0_data(T{}_data),\n'.format(graph.Operators(j).Inputs(0))
        s+='.s_0_col(T{}_col),\n'.format(graph.Operators(j).Inputs(0))
        s+='.s_0_row(T{}_row),\n'.format(graph.Operators(j).Inputs(0))
        s+='.s_0_valid(T{}_valid),\n'.format(graph.Operators(j).Inputs(0))
        s+='.s_1_data(T{}_data),\n'.format(graph.Operators(j).Inputs(1))
        s+='.s_1_col(T{}_col),\n'.format(graph.Operators(j).Inputs(1))
        s+='.s_1_row(T{}_row),\n'.format(graph.Operators(j).Inputs(1))
        s+='.s_1_valid(T{}_valid),\n'.format(graph.Operators(j).Inputs(1))
        s+='.m_0_data(T{}_data),\n'.format(graph.Operators(j).Outputs(0))
        s+='.m_0_col(T{}_col),\n'.format(graph.Operators(j).Outputs(0))
        s+='.m_0_row(T{}_row),\n'.format(graph.Operators(j).Outputs(0))
        s+='.m_0_valid(T{}_valid)\n'.format(graph.Operators(j).Outputs(0))
        s+=');\n'
    else:
        print('ADD shape mismatch',i0shape,i1shape,oshape)
    return s

def emit_identity(j,graph,args):
    ishape = graph.Tensors(graph.Operators(j).Inputs(0)).ShapeAsNumpy()
    oshape = graph.Tensors(graph.Operators(j).Outputs(0)).ShapeAsNumpy()
    s=''
    if (ishape[-3]==oshape[-3]) and (ishape[-2]==oshape[-2]):
        s+='assign T{}_data = T{}_data;\n'.format(graph.Operators(j).Outputs(0),graph.Operators(j).Inputs(0))
        s+='assign T{}_row = T{}_row;\n'.format(graph.Operators(j).Outputs(0),graph.Operators(j).Inputs(0))
        s+='assign T{}_col = T{}_col;\n'.format(graph.Operators(j).Outputs(0),graph.Operators(j).Inputs(0))
        s+='assign T{}_valid = T{}_valid;\n'.format(graph.Operators(j).Outputs(0),graph.Operators(j).Inputs(0))
    else:
        print('IDENTITY shape mismatch',ishape,oshape)
    return s

def emit_replicate(j,graph,args):
    ishape = graph.Tensors(graph.Operators(j).Inputs(0)).ShapeAsNumpy()
    oshape = graph.Tensors(graph.Operators(j).Outputs(0)).ShapeAsNumpy()
    s=''
    if (2*ishape[-3]==oshape[-3]) and (2*ishape[-2]==oshape[-2]):
        row=ishape[-3]
        col=ishape[-2]
        chan=ishape[-1]
        s+='replicate #({},{},{},{}) u{} (\n'.format(args.dtype,row,col,chan,j)
        s+='.clk(clk),\n'
        s+='.reset(reset),\n'
        s+='.s_0_data(T{}_data),\n'.format(graph.Operators(j).Inputs(0))
        s+='.s_0_col(T{}_col),\n'.format(graph.Operators(j).Inputs(0))
        s+='.s_0_row(T{}_row),\n'.format(graph.Operators(j).Inputs(0))
        s+='.s_0_valid(T{}_valid),\n'.format(graph.Operators(j).Inputs(0))
        s+='.m_0_data(T{}_data),\n'.format(graph.Operators(j).Outputs(0))
        s+='.m_0_col(T{}_col),\n'.format(graph.Operators(j).Outputs(0))
        s+='.m_0_row(T{}_row),\n'.format(graph.Operators(j).Outputs(0))
        s+='.m_0_valid(T{}_valid)\n'.format(graph.Operators(j).Outputs(0))
        s+=');\n'
    else:
        print('REPLICATE shape mismatch',ishape,oshape)
    return s

def emit_ops(graph,args):
    s=''
    for j in range(graph.OperatorsLength()):
        if model.OperatorCodes(graph.Operators(j).OpcodeIndex()).BuiltinCode() == tflite.BuiltinOperator.CONV_2D:
            s+= emit_conv2d(j,graph,args)
        elif model.OperatorCodes(graph.Operators(j).OpcodeIndex()).BuiltinCode() == tflite.BuiltinOperator.ADD:
            s+= emit_add(j,graph,args)
        elif model.OperatorCodes(graph.Operators(j).OpcodeIndex()).BuiltinCode() == tflite.BuiltinOperator.RESIZE_NEAREST_NEIGHBOR:
            s+= emit_replicate(j,graph,args)
        elif model.OperatorCodes(graph.Operators(j).OpcodeIndex()).BuiltinCode() == tflite.BuiltinOperator.CONCATENATION:
            s+= emit_concatenate(j,graph,args)
        elif model.OperatorCodes(graph.Operators(j).OpcodeIndex()).BuiltinCode() == tflite.BuiltinOperator.QUANTIZE:
            s+= emit_identity(j,graph,args)
        else:
            print('UNSUPPORTED OP',model.OperatorCodes(graph.Operators(j).OpcodeIndex()).BuiltinCode())
    return s

def emit_suffix(graph,args):
    s=''
    s+='endmodule\n'
    return s

def emit_roms(graph,args):
    w=''
    for (j,channels,waddr,weight,bias,scale) in roms:
        w+='module weight_rom_{} (clk, addr, data);\n'.format(j)
        w+='input clk;\n'
        w+='input [{}-1:0] addr;\n'.format(waddr)
        w+='output reg [{}*{}-1:0] data;\n'.format(channels, args.regb)
        w+='\n'
        for i in range(channels):
            w+='(*rom_style = "distributed" *) reg signed [{}:0] data_{};\n'.format(args.regb-1,i)
            w+='always @(posedge clk)\n'
            w+='begin\n'
            w+='case(addr)\n'
            k=0
            for w0 in weight[i].flatten():
                if w0<0:
                    w+='{}\'d{}: data_{} <= -{}\'d{};\n'.format(waddr,k,i,args.regb,abs(w0))
                else:
                    w+='{}\'d{}: data_{} <= {}\'d{};\n'.format(waddr,k,i,args.regb,w0)
                k+=1
            w+='default: data_{} <= \'bx;\n'.format(i)
            w+='endcase\n'
            w+='end\n'
            w+='always @(posedge clk) data[{}:{}] <= data_{};\n'.format(i*args.regb+args.regb-1,i*args.regb,i)
            w+='\n'
        w+='endmodule\n'
        w+='\n'

        bias_width = args.regz
        w+='module bias_rom_{} (data);\n'.format(j)
        w+='output signed [{}*{}-1:0] data;\n'.format(channels, bias_width)
        w+='\n'
        for i in range(channels):
            b = bias[i]
            if b<0:
                w+='assign data[{} +:{}] = -{}\'d{};\n'.format(i*bias_width,bias_width,bias_width,np.abs(b))
            else:
                w+='assign data[{} +:{}] = {}\'d{};\n'.format(i*bias_width,bias_width,bias_width,np.abs(b))
        w+='endmodule\n'
        w+='\n'

        w+='module scale_rom_{} (scale,shift);\n'.format(j)
        w+='output [{}*{}-1:0] scale;\n'.format(channels, 32)
        w+='output [{}*{}-1:0] shift;\n'.format(channels, 6)
        w+='\n'
        for i in range(channels):
            shift = int(np.ceil(np.log2(0.5/scale[i])))
            s0 = scale[i]*np.power(2,shift)
            w+='assign shift[{}:{}] = 6\'d{};\n'.format(i*6+5,i*6,shift+31)
            w+='assign scale[{}:{}] = 32\'h{};\n'.format(i*32+31,i*32,hex(int(s0*0x7fffffff))[2:])
        w+='endmodule\n'
        w+='\n'
    return w

# main()
with open(args.tflite, 'rb') as f:
    buf = f.read()
    model = tflite.Model.GetRootAsModel(buf, 0)
    graph = model.Subgraphs(0)

roms=[] # global
s=''
s+=emit_prefix(graph,args)
s+=emit_wires(graph,args)
s+=emit_ops(graph,args)
s+=emit_suffix(graph,args)
with open('./{}.v'.format(args.top), 'w') as f:
    print(s,file=f)

with open('./{}_rom.v'.format(args.top), 'w') as f:
    print(emit_roms(graph,args),file=f)
