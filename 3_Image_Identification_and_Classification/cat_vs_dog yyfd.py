import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import keras
from keras.models import Sequential
from keras.layers import Conv2D, Dense, MaxPool2D, Flatten, Dropout
from keras_preprocessing.image import ImageDataGenerator, img_to_array, load_img

train_datagen = ImageDataGenerator(rescale=1/255)
test_datagen = ImageDataGenerator(rescale=1/255)
train_path = 'datasets/train'
train_set = train_datagen.flow_from_directory(directory=train_path, target_size=(
    128, 128), batch_size=32, color_mode="rgb", class_mode='binary')
test_path = 'datasets/validation'
test_set = train_datagen.flow_from_directory(directory=train_path, target_size=(
    128, 128), batch_size=30, color_mode="rgb", class_mode='binary')

img = load_img(train_path + "/cats/cat.10.jpg")
plt.imshow(img)
plt.axis("off")
plt.title("Sample Cat Image")
plt.show()

plt.figure()

img = load_img(train_path + "/dogs/dog.100.jpg")
plt.imshow(img)
plt.axis("off")
plt.title("Sample Dog Image")
plt.show()

model = Sequential()
model.add(Conv2D(filters=32, kernel_size=(5, 5),
          activation="relu", input_shape=(128, 128, 3)))
model.add(MaxPool2D(pool_size=(2, 2)))
model.add(Conv2D(filters=64, kernel_size=(5, 5), activation="relu"))
model.add(MaxPool2D(pool_size=(2, 2)))
# model.add(Dropout(0.25))
model.add(Conv2D(filters=128, kernel_size=(5, 5), activation="relu"))
model.add(MaxPool2D(pool_size=(2, 2)))
# model.add(Dropout(0.25))
model.add(Flatten())
# model.add(Dense(units = 256, activation = "relu"))
# model.add(Dropout(0.5))
model.add(Dense(units=1, activation="sigmoid"))

model.compile(optimizer='Adam', loss='binary_crossentropy',
              metrics=['accuracy'])

model.summary()

hist = model.fit(train_set, validation_data=test_set, epochs=20)

plt.figure(figsize=(6, 6))
plt.style.use("ggplot")
plt.plot(hist.history['loss'], color='b', label="Training loss")
plt.plot(hist.history['val_loss'], color='r', label="Validation loss")
plt.legend()
plt.show()

plt.figure()

plt.figure(figsize=(6, 6))
plt.style.use("ggplot")
plt.plot(hist.history['accuracy'], color='b', label="Training accuracy")
plt.plot(hist.history['val_accuracy'], color='r', label="Validation accuracy")
plt.legend(loc="lower right")
plt.show()
