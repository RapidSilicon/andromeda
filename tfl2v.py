#import numpy as np ; print('numpy',np.__version__)
#import tensorflow as tf ; print('tensorflow', tf.__version__)
#from tensorflow import keras
#from tensorflow.keras import layers
import argparse
import random

parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument('--ochan', help='OCHAN parameter, weight_rom output channels',default=8, type=int)
parser.add_argument('--waddr', help='WADDR parameter, weight_rom read address width',default=10, type=int)
parser.add_argument('--tdata', help='TDATA parameter, weight_rom width',default=8, type=int)
parser.add_argument('--depth', help='weight_rom depth',default=1024, type=int)
parser.add_argument('--rom', help='rom file',default='weight_rom.v')
parser.add_argument('--clk', help='FPGA clock rate',default=500000000., type=float)
parser.add_argument('--fps', help='first layer input shape arrival rate',default=100., type=float)
parser.add_argument('--tflite', help='flatbuffer model',default='model.tflite')
args = parser.parse_args()
print(args)

s=''
s+='module weight_rom (clk, addr, data);\n'
s+='input clk;\n'
s+='input [{}:0] addr;\n'.format(args.ochan*args.waddr-1)
s+='output [{}:0] data;\n'.format(args.ochan*args.tdata-1)
s+='\n'
for i in range(args.ochan):
    s+='(*rom_style = "block" *) reg [{}:0] data_{};\n'.format(args.tdata-1,i)
    s+='always @(posedge clk)\n'
    s+='begin\n'
    s+='case(addr[{}:{}])\n'.format(i*args.waddr+args.waddr-1,i*args.waddr)
    for j in range(args.depth):
        s+='{}\'d{}: data_{} <= \'d{};\n'.format(args.waddr,j,i,random.randint(0,2**args.tdata))
    s+='endcase\n'
    s+='end\n'
    s+='assign data[{}:{}] = data_{};\n'.format(i*args.tdata+args.tdata-1,i*args.tdata,i)
    s+='\n'
s+='\n'
s+='endmodule\n'

with open(args.rom,'w',encoding="utf-8") as f:
    print(s,file=f)

exit()


'''
assign dout = data;
(*rom_style = "block" *) reg [19:0] data;

always @(posedge clk)
begin
if (en)
case(addr)
6'b000000: data <= 20'h0200A; 6'b100000: data <= 20'h02222;
6'b000001: data <= 20'h00300; 6'b100001: data <= 20'h04001;
6'b000010: data <= 20'h08101; 6'b100010: data <= 20'h00342;
'''

f = open("{}.mem".format(layer.name), "w")
print(s,file=f)
exit()

'''
// ROMs Using Block RAM Resources.
// File: rams_sp_rom_1.v
//
module rams_sp_rom_1 (clk, en, addr, dout);
input clk;
input en;
input [5:0] addr;
output [19:0] dout;

(*rom_style = "block" *) reg [19:0] data;

always @(posedge clk)
begin
if (en)
case(addr)
6'b000000: data <= 20'h0200A; 6'b100000: data <= 20'h02222;
6'b000001: data <= 20'h00300; 6'b100001: data <= 20'h04001;
6'b000010: data <= 20'h08101; 6'b100010: data <= 20'h00342;
6'b000011: data <= 20'h04000; 6'b100011: data <= 20'h0232B;
6'b000100: data <= 20'h08601; 6'b100100: data <= 20'h00900;
6'b000101: data <= 20'h0233A; 6'b100101: data <= 20'h00302;
6'b000110: data <= 20'h00300; 6'b100110: data <= 20'h00102;
6'b000111: data <= 20'h08602; 6'b100111: data <= 20'h04002;
6'b001000: data <= 20'h02310; 6'b101000: data <= 20'h00900;
6'b001001: data <= 20'h0203B; 6'b101001: data <= 20'h08201;
6'b001010: data <= 20'h08300; 6'b101010: data <= 20'h02023;
6'b001011: data <= 20'h04002; 6'b101011: data <= 20'h00303;
6'b001100: data <= 20'h08201; 6'b101100: data <= 20'h02433;
6'b001101: data <= 20'h00500; 6'b101101: data <= 20'h00301;
6'b001110: data <= 20'h04001; 6'b101110: data <= 20'h04004;
6'b001111: data <= 20'h02500; 6'b101111: data <= 20'h00301;
6'b010000: data <= 20'h00340; 6'b110000: data <= 20'h00102;
6'b010001: data <= 20'h00241; 6'b110001: data <= 20'h02137;
6'b010010: data <= 20'h04002; 6'b110010: data <= 20'h02036;
6'b010011: data <= 20'h08300; 6'b110011: data <= 20'h00301;
6'b010100: data <= 20'h08201; 6'b110100: data <= 20'h00102;
6'b010101: data <= 20'h00500; 6'b110101: data <= 20'h02237;
6'b010110: data <= 20'h08101; 6'b110110: data <= 20'h04004;
6'b010111: data <= 20'h00602; 6'b110111: data <= 20'h00304;
6'b011000: data <= 20'h04003; 6'b111000: data <= 20'h04040;
6'b011001: data <= 20'h0241E; 6'b111001: data <= 20'h02500;
6'b011010: data <= 20'h00301; 6'b111010: data <= 20'h02500;
6'b011011: data <= 20'h00102; 6'b111011: data <= 20'h02500;
6'b011100: data <= 20'h02122; 6'b111100: data <= 20'h0030D;
6'b011101: data <= 20'h02021; 6'b111101: data <= 20'h02341;
6'b011110: data <= 20'h00301; 6'b111110: data <= 20'h08201;
6'b011111: data <= 20'h00102; 6'b111111: data <= 20'h0400D;
endcase
end

assign dout = data;

endmodule
'''

(x_train, y_train), (x_test, y_test) = keras.datasets.mnist.load_data()
model = keras.models.load_model("mnist_model")
model.summary()

i=0
for layer in model.layers:
    #print(dir(layer))
    #print(layer.get_config())
    #print(layer.__class__.__name__)
    #exit()
    if layer.__class__.__name__=="Conv2D":
        get_relu_output = keras.backend.function(model.layers[0].input, layer.output)
        relu_output = get_relu_output(x_test)
        #print(layer.name, layer.input_shape, layer.output_shape, layer.weights[0].shape, np.amin(layer.weights[0]), np.amax(layer.weights[0]),np.std(relu_output.flatten()))
        odec = int(np.ceil(np.log2(args.sigma*np.std(relu_output.flatten()))))
        # conv2d #(.ICHAN(1),.IWIDTH(28),.OCHAN(32),.KHEIGHT(3),.KWIDTH(3),.STRIDE(1),.ODECIMAL(5),.WEIGHTS("conv2d_00.mem")) conv2d_00 (
        print('conv2d #(.ICHAN({}),.IWIDTH({}),.OCHAN({}),.KHEIGHT({}),.KWIDTH({}),.STRIDE({}),.ODECIMAL({}),.WEIGHTS("{}.mem")) {} ('.format(
            layer.weights[0].shape[2],layer.input_shape[2],layer.output_shape[3],layer.weights[0].shape[0],layer.weights[0].shape[1],
            layer.get_config()['strides'][0], # stride
            odec,
            layer.name,
            layer.name
            )
        )
        print("\t.clk(clk),")
        print("\t.reset(reset),")
        print("\t.tdata_i(tdata[{}]),".format(i))
        print("\t.tvalid_i(tvalid[{}]),".format(i))
        print("\t.tlast_i(tlast[{}]),".format(i))
        print("\t.tdata_o(tdata[{}]),".format(i+1))
        print("\t.tvalid_o(tvalid[{}]),".format(i+1))
        print("\t.tlast_o(tlast[{}]),".format(i+1))
        print("\t.S_AXI_ACLK(clk),")
        print("\t.S_AXI_ARESETN(~reset),")
        print("\t.S_AXI_AWVALID(1'b0),")
        print("\t.S_AXI_BREADY(1'b0),")
        print("\t.S_AXI_ARVALID(1'b0),")
        print("\t.S_AXI_RREADY(1'b0)")
        print(");")

        # write layer weights to .mem file
        f = open("{}.mem".format(layer.name), "w")
        for w in np.array(layer.weights[0]).flatten():
            # convert floating point weight [0,1] to s.17 fixed point
            q = int(w*(2**17))
            if q>=0:
                s = bin(q)[2:].zfill(18)
            else:
                s = bin(2**18 + q)[2:]
            #print(w,q,s)
            print(s,file=f)
        f.close()
        i+=1

        #conv2d #(.ICHAN(1), .IWIDTH(32), .OCHAN(16), .KHEIGHT(3), .KWIDTH(3), .STRIDE(1)) u0 (
    	#parameter ICHAN=1, 	// number of input channels
    	#parameter IWIDTH=32,	// width of row buffer
    	#parameter OCHAN=32,	// number of output channels
    	#parameter KHEIGHT=3,	// kernel height
    	#parameter KWIDTH=3,	// kernel width
    	#parameter STRIDE=1,	// stride
        #get_relu_output = keras.backend.function([model.layers[0].input], [layer.output])
        #print(layer.weights[0])
        #print(np.amin(layer.weights[0]), np.amax(layer.weights[0]))
        #break
