from djitellopy import tello
import KeyPressModule as kp
import cv2
import time
#kp.init()

me = tello.Tello()
me.connect()
print("Hello")
print(me.get_battery())
user = 0
me.streamon()
#global img


# def getKeyboardInput():
#     if kp.getKey('z'):
#         cv2.imwrite(f'resources/images/{time.time()}.jpg', img)
#         return True


while True:
    #res = getKeyboardInput()
    img = me.get_frame_read().frame
    img = cv2.resize(img, (416, 416))

    cv2.imshow("Image", img)
    cv2.waitKey(1)
