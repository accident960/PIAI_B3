from djitellopy import tello

import cv2
import numpy as np

me = tello.Tello()
me.connect()
print("Hello")
print(me.get_battery())
me.streamon()
fourcc = cv2.VideoWriter_fourcc(*'DIVC')
out = cv2.VideoWriter('output.avi', fourcc, 20.0, (416, 416))
# Load Yolo
net = cv2.dnn.readNet('yolov4.weights', 'yolov4.cfg')

with open('coco.names', 'r') as f:
    classes = [line.strip() for line in f.readlines()]
colors = np.random.uniform(0, 255, size=(len(classes), 3))
layer_names = net.getLayerNames()

output_layers = [layer_names[i - 1] for i in net.getUnconnectedOutLayers()]
while True:
    img = me.get_frame_read().frame
    #img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    img = cv2.resize(img, (416, 416))

    # img = cv2.resize(img, None, fx=0.7, fy=0.7)

    height, width, channels = img.shape
    #height, width, channels = img.shape
    # Detecting
    blob = cv2.dnn.blobFromImage(img, 0.00392, (416, 416), (0, 0, 0), True, crop=False)
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
            if confidence > 0.5:
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
    for i in range(len(boxes)):
        if i in indexes:
            x, y, w, h = boxes[i]
            label = str(classes[class_ids[i]])
            color = colors[i]
            cv2.rectangle(img, (x, y), (x + w, y + h), color, 2)
            cv2.putText(img, label, (x, y + 30), font, 3, color, 3)
    # out.write(img)
    cv2.imshow("Image", img)
    # cv2.waitKey(1)

    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

out.release()
