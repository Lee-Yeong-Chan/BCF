import cv2
import math
import torch
import os
from datetime import datetime
import pymysql
import time
def video_detection(path_x):
    video_capture = path_x
    cap = cv2.VideoCapture(video_capture)
    frame_width = int(cap.get(3))
    frame_height = int(cap.get(4))
    model = torch.hub.load('ultralytics/yolov5', 'custom', path=r"C:\Users\smart\Desktop\content\yolov5\runs\train\yolov5n_result\weights\best.pt")
    classNames = ['honey_bee', 'vespa_mandarinia', 'vespa_velutina', 'varroa_mite']
    output_folder = "images"
    detection_file = "detections.txt"
    last_time=time.time()
    conn1 = pymysql.connect(host='project-db-campus.smhrd.com', port=3312, user='goh1234', password='goh1234', db='goh1234')
    try:
        with conn1.cursor() as cursor:
            cursor.execute("SELECT alarm_status FROM t_camera WHERE camera_idx = '4'")
            result = cursor.fetchone()
            if result:
                alarm_status = result[0]
            else:
                alarm_status = 60
    finally:
        conn1.close()
    while True:
        success, img = cap.read()
        results = model(img)
        class_name=""
        current_time=time.time()
        for det in results.pred[0]:
            x1, y1, x2, y2 = map(int, det[0:4])
            conf = det[4].item()
            cls = int(det[5].item())
            class_name = classNames[cls]
            if class_name == "honey_bee":
                continue
            if conf > 0.60:
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
                # with open(detection_file, 'a') as file:
                #     file.write(f'{current_time}, Class: {class_name}, Confidence: {conf:.2f}\n')
                # class_dir = os.path.join(output_folder, class_name)
                # os.makedirs(class_dir, exist_ok=True)
                # frame_filename = os.path.join(class_dir, f'frame_{class_name}_{conf:.2f}.jpg')
                # cv2.imwrite(frame_filename, img)
                if (current_time-last_time)>=alarm_status:
                    alarm_name=""
                    if class_name == "vespa_mandarinia":
                        alarm_name="H"
                    elif class_name == "vespa_velutina":
                        alarm_name="Y"
                    elif class_name=="varroa_mite":
                        alarm_name="M"
                    else:
                        alarm_name=""
                    if alarm_name!="":
                        conn = pymysql.connect(host='project-db-campus.smhrd.com', port=3312, user='goh1234', password='goh1234', db='goh1234')
                        try:
                            with conn.cursor() as cursor:
                                last_time=current_time
                                current_time = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
                                cursor.execute("INSERT INTO t_alarm (alarm_idx, alarm_date, alarm_content, camera_idx) VALUES (null, %s, %s, 4)", (current_time,alarm_name))
                                conn.commit()
                        finally:
                            conn.close()
        yield img, class_name
cv2.destroyAllWindows()