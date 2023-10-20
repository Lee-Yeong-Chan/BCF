import cv2

# 원본 동영상 파일 경로
input_video_path = r"C:\Users\smart\Desktop\sample.mp4"

# 새로운 프레임 속도 설정 (예: 30fps로 변경)
new_fps = 10

# 새로운 동영상 파일 경로
output_video_path = fr"C:\Users\smart\Desktop\sample{new_fps}.mp4"

# 동영상 불러오기
cap = cv2.VideoCapture(input_video_path)

# 원본 동영상의 프레임 속도
original_fps = int(cap.get(cv2.CAP_PROP_FPS))

# 동영상 저장을 위한 VideoWriter 생성
# fourcc = cv2.VideoWriter_fourcc(*'XVID')  # 코덱 설정
fourcc = cv2.VideoWriter_fourcc(*'mp4v')  # 코덱을 설정하는 함

frame_width = int(cap.get(3))
frame_height = int(cap.get(4))
out = cv2.VideoWriter(output_video_path, fourcc, new_fps, (frame_width, frame_height))

while True:
    ret, frame = cap.read()
    if not ret:
        break

    # 프레임 속도 변경
    out.write(frame)  # 프레임 저장

cap.release()
out.release()
cv2.destroyAllWindows()
