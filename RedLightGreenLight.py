# 영상의 오리지날 크기는 720, 960
import cv2.cv2 as cv2
import torch
import numpy as np
import djitellopy as tello
import time

# 모델 로딩
model = torch.hub.load('ultralytics/yolov5', 'custom',
                       'face_detection_yolov5s')  # Path to custom model weights
model.conf = 0.2
KNOWN_DISTANCE = 45
KNOWN_WIDTH = 16
GREEN = (0, 255, 0)
RED = (0, 0, 255)
ORANGE = (0, 127, 255)
YELLOW = (0, 255, 255)
WHITE = (255, 255, 255)
# 드론이랑 무궁화꽃이 피었습니다 해요!!
# distance 가 일단 30 cm 일 때 뒤돌아서 도망가기 기능!!
DISTANCE_TO_YOUNGHEE = 500


def focalLength(measured_distance, real_width, width_in_rf_image):
    focal_length = (width_in_rf_image * measured_distance) / real_width
    return focal_length


def distanceFinder(focal_length, real_face_width, face_width_in_frame):
    distance = (real_face_width * focal_length) / face_width_in_frame
    return distance


def findYounghee(image):
    face_width = 0

    xg1 = yg1 = xg2 = yg2 = None
    # 모델 돌리기
    img = model(image, size=416)
    df = img.pandas().xyxy[0]
    img = img.render()
    detected_area = 0
    # 검출 시
    if len(df) != 0:
        for index, row in df.iterrows():
            temp_detected_area = (row['xmax'] - row['xmin']) * (row['ymax'] - row['ymin'])
            if temp_detected_area > detected_area:
                detected_area = temp_detected_area
                xg1 = int(row['xmin'])
                xg2 = int(row['xmax'])

                yg1 = int(row['ymin'])
                yg2 = int(row['ymax'])
                face_width = int(xg2 - xg1)
        # 물체 가운데에 동그라미 그려주기
        cv2.circle(img[0], ((xg2 + xg1) // 2, (yg2 + yg1) // 2), 5, (0, 255, 0), cv2.FILLED)

    # df, img, face_width_frame, info (인포는 가운데 점 위치를 이야기함)
    return df, img, face_width


def main():
    global DISTANCE_TO_YOUNGHEE
    ref_image = cv2.imread('REF_IMAGE.JPG', 0)
    ref_image = cv2.resize(ref_image, (416, 416), interpolation=cv2.INTER_AREA)

    # 처음에만 거리 계산의 기준점을 세우기 위해서 findYounghee 돌리기
    df, img, ref_image_face_width = findYounghee(ref_image)
    focal_length_found = focalLength(KNOWN_DISTANCE, KNOWN_WIDTH, ref_image_face_width)
    color = WHITE

    me = tello.Tello()
    me.connect()
    me.streamon()
    print(me.get_battery())
    me.takeoff()
    time.sleep(2.2)
    print("==========after taking off")
    me.send_rc_control(0, 0, 30, 0)
    time.sleep(2.2)
    frame_read = me.get_frame_read()

    try:
        while True:
            frame = frame_read.frame
            print("==========reading frame")
            # 영희 찾기 모델 돌리기
            df, img, face_width_frame = findYounghee(frame)

            # face_width_frame이 0이 아니어서 얼굴이 검출되었을 때, 거리 계산하는 함수 쓰기
            if face_width_frame != 0:
                distance = distanceFinder(focal_length_found, KNOWN_WIDTH, face_width_frame)
                DISTANCE_TO_YOUNGHEE = distance * 2.54
                if distance < 30:
                    color = RED
                elif distance < 60:
                    color = ORANGE
                else:
                    color = YELLOW
                cv2.putText(img[0], "Distance= {:.2f} CM".format(distance * 2.54), (50, 50), cv2.FONT_HERSHEY_COMPLEX,
                            2, color, 2)
            cv2.imshow("SQUID GAME", img[0])
            cv2.waitKey(1)
            # 영희와의 거리가 30 미만이 되면 이제 와일문을 탈출한다
            if DISTANCE_TO_YOUNGHEE < 50:
                break
            k = cv2.waitKey(3) & 0xFF
            if k == 27:  # ESC Key
                break
            # 얼굴 검출 되지 않았을 때 앞으로 무브
            if len(df) == 0:
                # me.move_forward(20)
                me.send_rc_control(0, 15, 0, 0)
            # 얼굴 검출 안됐을 때 멈춤
            else:
                print(f'df : {df}')
                me.send_rc_control(0, 0, 0, 0)
        # final=cv2.imread('Final.png', cv2.IMREAD_COLOR)
        #cv2.imshow("SQUID GAME OVER",final)
        #cv2.waitKey(1)
        # Once Distnace <=30, then let's return and run away!

        # me.set_speed(60)
        #me.rotate_clockwise(180)

        me.move_back(200)
        time.sleep(5)
        me.land()
        me.streamoff()
        me.end()

    finally:
        # 문제 생기면 랜딩하도록 함.
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
