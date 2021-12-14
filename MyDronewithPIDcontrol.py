import cv2 as cv2
import numpy as np
from djitellopy import tello
import time
import torch

model = torch.hub.load('ultralytics/yolov5', 'custom',
                       'face_detection_yolov5s')  # Path to custom model weights
model.conf = 0.4

fbRange = [6200, 6800]
# 부~드러운 움직임을 위해 pid 적
pid = [0.4, 0.4, 0]
pError = 0
w, h = 360, 240
MAX_SPEED_UPDOWN = 50
MOV_TIME = 0.15
def findFace(image):
    xg1 = yg1 = xg2 = yg2 = None

    image = model(image, size=416)
    df = image.pandas().xyxy[0]
    image = image.render()
    image = image[0]
    face_area = 0
    # 검출한 게 있다면,
    if len(df) != 0:
        for index, row in df.iterrows():
            temp_face_area = (row['xmax'] - row['xmin']) * (row['ymax'] - row['ymin'])
            if temp_face_area > face_area:
                face_area = temp_face_area
                xg1 = int(row['xmin'])
                xg2 = int(row['xmax'])

                yg1 = int(row['ymin'])
                yg2 = int(row['ymax'])
                row['name']='TARGETED'
        #cv2.putText(image, 'target', (xg1+10, yg2),1, cv2.FONT_HERSHEY_SIMPLEX,  (0, 255, 0),10)
        cv2.rectangle(image, (xg1, yg1), (xg2, yg2), (0, 255, 0), 2)
        cv2.circle(image, ((xg2 + xg1) //2 , (yg2 + yg1) //2), 5, (0, 255, 0), cv2.FILLED)
    if face_area != 0:
        # 얼굴이 검출이 되면!
        return image, [[(xg2 + xg1) // 2, (yg2 + yg1) // 2], face_area]

    else:
        return image, [[0, 0], 0]


def trackFace(me, info, w, pid, pError):
    velocity_ud=0
    area = info[1]
    x, y = info[0]
    fb = 0
    # 우리가 얼굴로부터 얼마나 먼지 알아내기
    error = x - w // 2
    ## 싱크 맞추기 위해서 사용
    speed = pid[0] * error + pid[1] * (error - pError)
    speed = int(np.clip(speed, -100, 100))
    if fbRange[0] < area < fbRange[1]:
        fb = 0
    if area > fbRange[1]:
        fb = -20
    ## 얼굴 검출을 했는데 너무 멀다면 앞으로 가까이 가도록 하자
    elif area < fbRange[0] and area != 0:
        fb = 20
    velocity_ud = calculate_velocity(240, y, MAX_SPEED_UPDOWN * -1)
    # 얼굴 검출이 되지 않았다면,
    if x == 0:
        speed = 0
        error = 0
        velocity_ud = 0

    me.send_rc_control(0, fb, velocity_ud, speed)

    return error

def calculate_velocity(frame_size, center_of_object, max_speed):
    center_of_frame = int(frame_size / 2)
    distance = center_of_object - center_of_frame
    return int(max_speed * (distance / frame_size)) * 2

me = tello.Tello()
me.connect()
print("=============Welcome========================")
print("=============Battery: {}===============".format(me.get_battery()))
# Initiate video stream
me.streamon()

me.takeoff()
me.send_rc_control(0, 0, 21, 0)
time.sleep(2.2)
frame_read = me.get_frame_read()

while True:
    frame = frame_read.frame
    img = cv2.resize(frame, (w, h))
    result_image, info = findFace(img)
    pError = trackFace(me, info, w, pid, pError)
    print("Center", info[0], "Area", info[1])
    cv2.imshow('Output', result_image)
    if cv2.waitKey(1) & 0xFF == ord('q'):
        me.land()
        break
