import numpy as np ; print('numpy',np.__version__)
import tensorflow as tf ; print('tensorflow', tf.__version__)
from tensorflow import keras
from tensorflow.keras import layers
import argparse

parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument('--sigma', help='number of standard deviations for quantization',default=3, type=float)
args = parser.parse_args()
print(args)

(x_train, y_train), (x_test, y_test) = keras.datasets.mnist.load_data()
model = keras.models.load_model("mnist_model")
model.summary()

for layer in model.layers:
    #print(dir(layer))
    if layer.name.startswith("conv2d"):
        get_relu_output = keras.backend.function(model.layers[0].input, layer.output)
        relu_output = get_relu_output(x_test)
        #print(layer.name, layer.input_shape, layer.output_shape, layer.weights[0].shape, np.amin(layer.weights[0]), np.amax(layer.weights[0]),np.std(relu_output.flatten()))
        #print(layer.get_config())
        odec = int(np.ceil(np.log2(args.sigma*np.std(relu_output.flatten()))))
        print("conv2d #(.ICHAN({}),.IWIDTH({}),.OCHAN({}),.KHEIGHT({}),.KWIDTH({}),.STRIDE({}),.ODECIMAL({})) {}".format(
            layer.weights[0].shape[2],layer.input_shape[2],layer.output_shape[3],layer.weights[0].shape[0],layer.weights[0].shape[1],
            layer.get_config()['strides'][0], # stride
            odec,
            layer.name
            )
        )

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
