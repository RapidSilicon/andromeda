import numpy as np ; print('numpy',np.__version__)
import tensorflow as tf ; print('tensorflow', tf.__version__)
from tensorflow import keras
from tensorflow.keras import layers

"""
## Prepare the data
"""

# Model / data parameters
num_classes = 10
input_shape = (28, 28, 1)

# the data, split between train and test sets
(x_train, y_train), (x_test, y_test) = keras.datasets.mnist.load_data()

# Scale images to the [0, 1] range
x_train = x_train.astype("float32") / 255
x_test = x_test.astype("float32") / 255
# Make sure images have shape (28, 28, 1)
x_train = np.expand_dims(x_train, -1)
x_test = np.expand_dims(x_test, -1)
print("x_train shape:", x_train.shape)
print(x_train.shape[0], "train samples")
print(x_test.shape[0], "test samples")


# convert class vectors to binary class matrices
y_train = keras.utils.to_categorical(y_train, num_classes)
y_test = keras.utils.to_categorical(y_test, num_classes)

"""
## Build the model
"""

model = keras.Sequential(
    [
        keras.Input(shape=input_shape),
        layers.Conv2D(32, kernel_size=(3, 3), activation="relu", use_bias=False,name="mnist_00"),
        layers.Conv2D(32, kernel_size=(3, 3), activation="relu", use_bias=False,name="mnist_01"),
        layers.Conv2D(32, kernel_size=(3, 3), activation="relu", use_bias=False,name="mnist_02"),
        layers.Conv2D(32, kernel_size=(3, 3), activation="relu", use_bias=False,name="mnist_03"),
        layers.Conv2D(32, kernel_size=(3, 3), activation="relu", use_bias=False,name="mnist_04"),
        layers.Conv2D(32, kernel_size=(3, 3), activation="relu", use_bias=False,name="mnist_05"),
        layers.Conv2D(32, kernel_size=(3, 3), activation="relu", use_bias=False,name="mnist_06"),
        layers.Conv2D(32, kernel_size=(3, 3), activation="relu", use_bias=False,name="mnist_07"),
        layers.Conv2D(32, kernel_size=(3, 3), activation="relu", use_bias=False,name="mnist_08"),
        layers.Conv2D(32, kernel_size=(3, 3), activation="relu", use_bias=False,name="mnist_09"),
        layers.Conv2D(32, kernel_size=(3, 3), activation="relu", use_bias=False,name="mnist_10"),
        layers.Conv2D(32, kernel_size=(3, 3), activation="relu", use_bias=False,name="mnist_11"),
        layers.Conv2D(32, kernel_size=(3, 3), activation="relu", use_bias=False,name="mnist_12"),
        layers.Reshape((1,1,128)),
        layers.Conv2D(10, kernel_size=(1, 1), activation=None, use_bias=False,name="mnist_13"),
        layers.Reshape((10,)),
        layers.Softmax(),
    ]
)

model.summary()

"""
## Train the model
"""

batch_size = 128
epochs = 15

model.compile(loss="categorical_crossentropy", optimizer="adam", metrics=["accuracy"])

model.fit(x_train, y_train, batch_size=batch_size, epochs=epochs, validation_split=0.1)

"""
## Evaluate the trained model
"""

score = model.evaluate(x_test, y_test, verbose=0)
print("Test loss:", score[0])
print("Test accuracy:", score[1])

model.save("mnist_model")
