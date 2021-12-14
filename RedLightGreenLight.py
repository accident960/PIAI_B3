# 영상의 오리지날 크기는 720, 960
import cv2.cv2 as cv2
import torch
import numpy as np
import djitellopy as tello
import time

# 모델 로딩
model = torch.hub.load('ultralytics/yolov5', 'custom',
                       'face_detection_yolov5s')  # Path to custom model weights
model.conf = 0.5


# 드론이랑 무궁화꽃이 피었습니다 해요!!
def main():
    me = tello.Tello()
    me.connect()
    print(me.get_battery())
    me.takeoff()
    time.sleep(5)
    print("==========after taking off")
    me.send_rc_control(0, 0, 20, 0)
    time.sleep(2.2)
    frame_read = me.get_frame_read()

    try:
        while True:
            frame = frame_read.frame
            print("==========reading frame")
            # 모델 돌리기
            img = model(frame, size=416)
            # 여기에는 검출한 것들의 정보가 담긴다.
            df = img.pandas().xyxy[0]
            img = img.render()

            cv2.imshow("Temp Frame", img[0])
            cv2.waitKey(1)
            k = cv2.waitKey(3) & 0xFF
            if k == 27:  # ESC Key
                break
            # 얼굴 검출 됐을 때
            if len(df) != 0:
                me.send_rc_control(0, 15, 0, 0)
    finally:
        #문제 생기면 랜딩하도록 함.
        me.land()
        me.streamoff()
        me.end()

        # 끝나고 화면 지워주기
        cv2.destroyAllWindows()


if __name__ == '__main__':
    main()

####### media pipe version ###########
# import cv2.
# import mediapipe as mp
# import time
#
# cap = cv2.VideoCapture(0)
# pTime = 0
#
# mpFaceDetection = mp.solutions.face_detection
# mpDraw = mp.solutions.drawing_utils
# faceDetection = mpFaceDetection.FaceDetection(0.75)
#
#
# while True:
#     _,img = cap.read()
#     imgRGB = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
#     results = faceDetection.process(imgRGB)
#     print(results)
#
#     if results.detections:
#         for id,detection in enumerate(results.detections):
#             mpDraw.draw_detection(img, detection)
#             # print(id,detection)
#             # print(detection.score)
#             # print(detection.location_data.relative_bounding_box)
#
#             bboxC = detection.location_data.relative_bounding_box
#             h,w,c = img.shape
#             bbox = int(bboxC.xmin * w), int(bboxC.ymin * h), \
#                    int(bboxC.width * w), int(bboxC.height * h)
#
#             cv2.rectangle(img,bbox,(255,0,255),2)
#
#
#     cTime = time.time()
#     fps = 1/(cTime-pTime)
#     pTime = cTime
#     cv2.putText(img,f'FPS: {int(fps)}',(20,70),cv2.FONT_HERSHEY_PLAIN,3,(0,255,0),1)
#     cv2.imshow("Res",img)
#     cv2.waitKey(1)
#
# cap.release()
# cv2.destroyAllWindows()
