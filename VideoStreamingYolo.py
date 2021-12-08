from djitellopy import tello

import cv2
import numpy as np
import os
#
os.environ["CUDA_DEVICE_ORDER"] = "PCI_BUS_ID"
os.environ["CUDA_VISIBLE_DEVICES"] = "0"

me = tello.Tello()
me.connect()
print("Hello")
print(me.get_battery())
me.streamon()
fourcc = cv2.VideoWriter_fourcc(*'DIVC')
out = cv2.VideoWriter('output.avi', fourcc, 20.0, (416, 416))
# Load Yolo
net = cv2.dnn.readNetFromDarknet('yolov4.cfg','yolov4.weights')

with open('coco.names', 'r') as f:
    classes = [line.strip() for line in f.readlines()]
colors = np.random.uniform(0, 255, size=(len(classes), 3))
layer_names = net.getLayerNames()

output_layers = [layer_names[i - 1] for i in net.getUnconnectedOutLayers()]
i = 1
while True:
    # 프레임 하나씩 읽어오기
    img = me.get_frame_read().frame

    img = cv2.resize(img, None, fx=0.5, fy=0.5)

    height, width, channels = img.shape
    net.setPreferableBackend(cv2.dnn.DNN_BACKEND_CUDA)
    net.setPreferableTarget(cv2.dnn.DNN_TARGET_CUDA)
    # 디텍팅
    blob = cv2.dnn.blobFromImage(img, 0.00392, (320, 320), (0, 0, 0), True, crop=False)
    net.setInput(blob)
    outs = net.forward(output_layers)

    class_ids = []
    confidences = []
    boxes = []

    for out in outs:
        for detection in out:
            scores = detection[5:]
            class_id = np.argmax(scores)
            confidence = scores[class_id]
            if confidence > 0.7:
                # Object detected
                center_x = int(detection[0] * width)
                center_y = int(detection[1] * height)
                w = int(detection[2] * width)
                h = int(detection[3] * height)
                # Rectangle coordinates
                x = int(center_x - w / 2)
                y = int(center_y - h / 2)
                boxes.append([x, y, w, h])
                confidences.append(float(confidence))
                class_ids.append(class_id)

    indexes = cv2.dnn.NMSBoxes(boxes, confidences, 0.5, 0.4)
    font = cv2.FONT_HERSHEY_PLAIN

    # 박스랑 텍스트 프레임 그려주기
    for i in range(len(boxes)):
        if i in indexes:
            x, y, w, h = boxes[i]
            label = str(classes[class_ids[i]])
            color = colors[i]
            cv2.rectangle(img, (x, y), (x + w, y + h), color, 2)
            cv2.putText(img, label, (x, y + 30), font, 3, color, 3)

    cv2.imwrite(f'resources/images/{i}.jpg', img)
    i += 1
    cv2.imshow("Image", img)
    # cv2.waitKey(1)

    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

out.release()
