import cv2
import math
import torch
import os
from datetime import datetime
import pymysql
import time
cap = cv2.VideoCapture(r"C:\Users\smart\Desktop\sample2.mp4")
frame_width = int(cap.get(3))
frame_height = int(cap.get(4))

model = torch.hub.load('ultralytics/yolov5', 'custom', path=r"C:\Users\smart\Desktop\content\yolov5\runs\train\yolov5s_result\weights\best.pt")
classNames = ['honey_bee', 'vespa_mandarinia', 'vespa_velutina', 'varroa_mite']
output_folder = "images"
detection_file = "detections.txt"
current_time = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

while True:
    success, img = cap.read()
    results = model(img)
    class_name=""
    for det in results.pred[0]:
        print(det)
        x1, y1, x2, y2 = map(int, det[0:4])
        conf = det[4].item()
        cls = int(det[5].item())
        class_name = classNames[cls]
        if class_name == "honey_bee":
            continue
        

        if conf > 0.20:

            if class_name == 'honey_bee':
                color = (0, 204, 255)
            elif class_name == "vespa_mandarinia":
                color = (222, 82, 175)
            elif class_name == "vespa_velutina":
                color = (0, 149, 255)
            else:
                color = (85, 45, 255)

            cv2.rectangle(img, (x1, y1), (x2, y2), color, 3)
            label = f'{class_name} {conf:.2f}'
            t_size = cv2.getTextSize(label, 0, fontScale=1, thickness=2)[0]
            c2 = x1 + t_size[0], y1 - t_size[1] - 3
            cv2.rectangle(img, (x1, y1), c2, color, -1, cv2.LINE_AA)
            cv2.putText(img, label, (x1, y1 - 2), 0, 1, [255, 255, 255], thickness=1, lineType=cv2.LINE_AA)
            
    if not success:
        print("동영상 x")
        cap.release()
        cv2.destroyWindow()
        break
    cv2.imshow('video',img)
    k=cv2.waitKey(20)
    if k==49:
        cap.release()
        cv2.destroyWindow()
        break