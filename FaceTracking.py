import cv2
import numpy as np
from djitellopy import tello
import time

fbRange = [6200, 6800]
# 싱크 맞추기 위해 사용
pid = [0.4, 0.4, 0]
pError = 0
w, h = 360, 240

me = tello.Tello()
me.connect()
print("Hello")
print(me.get_battery())
me.streamon()
## 이륙 및 키높이까지 리프트
me.takeoff()
me.send_rc_control(0, 0, 27, 0)
time.sleep(2.2)


def findFace(img):
    faceCascade = cv2.CascadeClassifier('resources/haarcascade_frontalface_default.xml')
    imgGray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    faces = faceCascade.detectMultiScale(imgGray, 1.2, 8)

    myFaceListC = []
    myFaceListArea = []

    for (x, y, w, h) in faces:
        cv2.rectangle(img, (x, y), (x + w, y + h), (0, 0, 255), 2)
        ## 사람 얼굴 사각형 그려주고 사각형의 센터가 어디인지 계산
        cx = x + w // 2
        cy = y + h // 2
        area = w * h
        cv2.circle(img, (cx, cy), 5, (0, 255, 0), cv2.FILLED)
        myFaceListC.append([cx, cy])
        myFaceListArea.append(area)
    ## 얼굴을 검출을 했다면,
    if len(myFaceListArea) != 0:
        i = myFaceListArea.index(max(myFaceListArea))
        return img, [myFaceListC[i], myFaceListArea[i]]
    else:
        return img, [[0, 0], 0]


def trackFace(me, info, w, pid, pError):
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
    ## 얼굴 검출을 했는데 너무 멀다면 가까이 가도록 하자
    elif area < fbRange[0] and area != 0:
        fb = 20
    if x == 0:
        speed = 0
        error = 0
    me.send_rc_control(0, fb, 0, speed)

    return error




while True:
    img = me.get_frame_read().frame
    img = cv2.resize(img, (w, h))
    img, info = findFace(img)
    pError = trackFace(me, info, w, pid, pError)
    print("Center", info[0], "Area", info[1])
    cv2.imshow('Output', img)
    if cv2.waitKey(1) & 0xFF == ord('q'):
        me.land()
        break
