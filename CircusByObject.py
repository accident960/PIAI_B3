import cv2.cv2 as cv2
import torch
import time
import numpy as np
import djitellopy as tello
import KeyPressModule as kp

model = torch.hub.load('ultralytics/yolov5',
                       'yolov5s', pretrained=True)  # Path to custom model weights
model.conf = 0.8

me = tello.Tello()
me.connect()
print(me.get_battery())

global img

# Initiate video stream
me.streamon()

me.takeoff()
me.send_rc_control(0, 0, 20, 0)
time.sleep(2.2)

while True:
    img = me.get_frame_read().frame
    img = model(img, size=416)
    df = img.pandas().xyxy[0]

    img = img.render()
    detected = set()
    for index, row in df.iterrows():
        detected.add(row['name'])
    if 'person' in detected:
        me.flip_forward()
        detected.discard('person')
        time.sleep(1.5)
    if 'cell phone' in detected:
        me.flip_forward()
        detected.discard('person')
    if 'chair' in detected:
        me.flip_back()
        detected.discard('person')
    if 'mouse' in detected:
        print('MOUSE')
        break
    print('detected: ', detected)
    cv2.imshow("Image", img[0])
    cv2.waitKey(1)
me.land()
