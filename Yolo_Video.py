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
    model = torch.hub.load('ultralytics/yolov5', 'custom', path=r"C:\Users\smart\Desktop\content\yolov5\runs\train\best (2).pt")
    classNames = ['honey_bee', 'vespa_mandarinia', 'vespa_velutina', 'varroa_mite']
    conn1 = pymysql.connect(host='project-db-campus.smhrd.com', port=3312, user='goh1234', password='goh1234', db='goh1234')
    try:
        with conn1.cursor() as cursor1:
            cursor1.execute("SELECT alarm_status FROM t_camera WHERE camera_idx = '4'")
            result = cursor1.fetchone()
            if result:
                alarm_status = result[0]
            else:
                alarm_status = 60
            cursor1.execute("SELECT max(stillcut_idx) FROM t_camera_stillcut")
            another_result = cursor1.fetchone()
            if another_result:
                i = another_result[0]+1
            else:
                i = 1
    finally:
        cursor1.close()
        conn1.close()
    last_time = datetime.now()
    a=True
    while True:
        success, img = cap.read()
        results = model(img)
        class_name=""
        current_time=datetime.now()
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
                time_difference = (current_time - last_time).total_seconds()
                if a or (int(time_difference) >= alarm_status):
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
                                last_time = current_time
                                current_time_str = current_time.strftime('%Y-%m-%d %H:%M:%S')
                                cursor.execute("INSERT INTO t_alarm (alarm_idx, alarm_date, alarm_content, camera_idx) VALUES (null, %s, %s, 4)", (current_time_str,alarm_name))
                                cursor.execute("INSERT INTO t_camera_stillcut VALUES (null, 4, sysdate(), %s)", f"4-{i}-{class_name}")
                                conn.commit()
                                current_time=datetime.now()
                                i+=1
                        finally:
                            cursor.close()
                            conn.close()
                        cv2.imwrite(f'C:/Users/smart/git/BCF/Bee Careful/src/main/webapp/resources/stillcut/4-{i}-{class_name}.jpg', img)
                    a=False
        yield img, class_name
cv2.destroyAllWindows()