This repository contains a proof of concept implementation of a streaming CNN compiler using Verilog code.

Assuming you've installed python3, please, install the following libraries.

- python3 -m pip install opencv-python
- python3 -m pip install pyqt5
- python3 -m pip install pyqtwebengine
- python3 -m pip install tensorflow
- python3 -m pip install numpy
- python3 -m pip install tflite
- python3 -m pip install argparse

Make targets: From the directory "sim"
- to run full simulation run : make all  ( Starts with full training, takes around ~ one week hours on CPU/ ~ 36 hours on GPU)
- to run lazy simulation run : make lazy  (Lazy simulation does not run the training to any significant precision around 10 minutes )
- to run hw creation run     : make hardware (Notice that hw creation uses results of training in ./artifacts takes around 36 seconds)

Hardware generation from existing trained cnns :From the directory "sim"
- ./hw_gen.sh               : displays usage/help
- ./hw_gen.sh --cnns        : displays available pretrained models (Please, notice that the main cnns , used in our projects, are passing. The others are for further development of the project)
- ./hw_gen.sh --c <name>    : generates Hardware for the named cnn (from the list provided by --cnns)

Contact zarin.said@rapidsilicon.com for non-GPL Commercial Licensing option.

