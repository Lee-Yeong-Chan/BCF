from flask import Flask, render_template, Response,jsonify,request,session,redirect
#FlaskForm--> it is required to receive input from the user
# Whether uploading a video file  to our object detection model
from flask_wtf import FlaskForm
from wtforms import FileField, SubmitField,StringField,DecimalRangeField,IntegerRangeField
from werkzeug.utils import secure_filename
from wtforms.validators import InputRequired,NumberRange
import os
# Required to run the YOLOv8 model
import cv2
import pymysql
from datetime import datetime
# YOLO_Video is the python file which contains the code for our object detection model
#Video Detection is the Function which performs Object Detection on Input Video
from Yolo_Video  import video_detection
app = Flask(__name__)
app.config['SECRET_KEY'] = 'hyeok'

def generate_frames_web(path_x):
    gen = video_detection(path_x)
    for img, class_name in gen:
        ret, frame = cv2.imencode('.jpg', img)
        if ret:
            frame = frame.tobytes()
            yield (b'--frame\r\n'
                   b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n')

@app.route('/', methods=['GET','POST'])

@app.route("/main", methods=['GET','POST'])

def main():
    session.clear()
    return redirect("http://localhost:8084/controller/main.do")


@app.route('/video_feed')
def video_feed():
    return Response(generate_frames_web(path_x=0), mimetype='multipart/x-mixed-replace; boundary=frame')

if __name__ == "__main__":
    app.run(debug=True)