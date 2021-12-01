from math import radians, cos, sin, asin, sqrt, atan2, degrees
from pyparrot.Bebop import *
from DroneCamera import DroneVisionGUI
import threading
import sys
import keyboard # 키모드 입력 감지 모듈

class UserVision:
    def __init__(self, vision):
        self.vision = vision
    def savePic(self,args):
        self.vision._buffer_vision()

# GPS 기반 드론 제어를 위한 클래스
class ControlByGPS:
    def __init__(self, bebop):
        self.bebop = bebop
        self.last_pt = (0, 0)
        self.direct = 0
        self.move = 0
        self.isArrive = False

    # 두 GPS 좌표 간의 비교를 통한 각도 계산 함수
    def initial_bearing(self, pointA, pointB):
        if (type(pointA) != tuple) or (type(pointB) != tuple):
            raise TypeError("Only tuples are supported as arguments")

        lat1 = radians(pointA[0]) # 출발지 위도
        lat2 = radians(pointB[0]) # 도착지 위도
        
        diffLong = radians(pointB[1] - pointA[1])
        x = sin(diffLong) * cos(lat2)
        y = cos(lat1) * sin(lat2) - (sin(lat1)
                                     * cos(lat2) * cos(diffLong))
        initial_bearing = atan2(x, y)
        initial_bearing = degrees(initial_bearing)
        compass_bearing = (initial_bearing + 360) % 360
        # 두 좌표 간의 각도 반환
        return compass_bearing
    
    # 현재 위치로부터 새롭게 주어진 좌표로의 진행 방향 계산
    def get_moving_direct(self, new_pt):
        # 현재 위도 입력받기
        self.lat = self.bebop.sensors.sensors_dict['GpsLocationChanged_latitude']
        # 현재 경도 입력받기
        self.lon = self.bebop.sensors.sensors_dict['GpsLocationChanged_longitude']
        self.last_pt = (self.lat, self.lon)
        # 진행 방향 설정: 시작 좌표와 새로운 좌표 간 GPS 비교
        self.direct = self.initial_bearing(self.last_pt, new_pt)
        # 진행 방향 반환
        return self.direct

    def check_arrive(self, point_index, new_pt, point_num):
        self.isArrive = False
        print("출발합니다!")
        self.direct = self.get_moving_direct(new_pt)
        print(f"진행 방향: {self.direct}")
        # 정해진 좌표 인근 도착을 확인하기 위한 최소 거리
        target_distance = 0.0002
            
        # 정해진 좌표에 도착하하지 않은 경우(호도법 활용)
        if (abs(self.lon - new_pt[1]) > target_distance) and (abs(self.lat - new_pt[0]) > target_distance): 
            # 새로운 좌표 방향으로 회전하여 전방으로 1미터 이동 
            self.bebop.move_relative(dx = 1, dy = 0, dz = 0, dradians = self.direct)
            print(f'남은 위도: {abs(self.lat - new_pt[0])}, 남은 경도: {abs(self.lon - new_pt[1])}')
            self.isArrive = False

        # 정해진 좌표에 도착한 경우(호도법 활용)
        else:
            self.isArrive = True
            if point_num > point_index:
                point_index +=1
                print(f"{point_index}번째 좌표 도착!")
            else:
                print("최종 목적지 도착!")
        return point_index, self.isArrive

def flying_drone():
    print("이륙합니다. 착륙을 희망하시면 l 버튼을 입력하세요!")
    bebop.safe_takeoff(5) # 이륙
    # 최대 고도 및 거리 설정
    drone_setup()
    # GPS 좌표값 불러오기
    gps_point_list = get_gps_point()
    gps_point_num = len(gps_point_list) # 이동할 좌표 개수
    gps_point_index = 0 # 좌표 인덱싱
    # 드론 GPS 기반 제어를 위한 인스턴스 생성
    gpsk = ControlByGPS(bebop)
    while True:
        gps_point_index, isArrive = gpsk.check_arrive(gps_point_index, gps_point_list[gps_point_index], gps_point_num)
        # 키보드 l 입력 시 긴급 착륙 수행
        if keyboard.is_pressed("l") or keyboard.is_pressed("L"):
            print('***긴급 착륙!!!***')
            bebop.safe_land(10)
            break       
        # 최종 목적지 도착 후 착륙
        if isArrive == True:
            print("최종 목적지에 도착했습니다. 착륙합니다.")
            # 3초 뒤 착륙
            bebop.smart_sleep(3)
            bebop.safe_land(10)
            break
    
    print("드론과의 연결을 종료합니다.\n")
    bebop.disconnect()

# 드론 최대 고도 및 이동거리 설정
def drone_setup():
    # 드론의 최대 고도 제한
    max_altitude = 0.5 # 최대 고도: 0.5미터
    bebop.set_max_altitude(max_altitude)
    print(f"The maximum altitude to fly: {max_altitude}")

    #드론의 최대 이동 거리 제한
    max_distance = 30
    bebop.set_max_distance(max_distance)
    print(f"The maximum distance of the bebop from you: {max_distance}")

# GPS 좌표값 가져오기
def get_gps_point():
    # 이동할 좌표 저장할 리스트 생성: 시작점 무관
    point_list = []
    # 좌표 = (위도, 경도)
    # 포스텍 운동장 입구쪽 트랙 내 정중앙 좌표(이미지 내 ①)
    point_list.append((36.01274486770964, 129.31967134016713))
    # 환경공학동 근처 트랙 끝자락 좌표(이미지 내 ②)
    point_list.append((36.01246067888178, 129.3192249597691))
    # 위 좌표에서 우회전하여 직진 코스 진입로 좌표(이미지 내 ③)
    point_list.append((36.01247600888385, 129.31913114527956))
    # 농구코트 방향 직진 트랙 끝자락(이미지 내 ④)
    point_list.append((36.01292121632584, 129.31870614177137))
    # 위 좌표에서 우회전하여 직진 코스 진입로 좌표(이미지 내 ⑤)
    point_list.append((36.0129706361824, 129.31871313490936))
    # 농구코트쪽 트랙 내 정중앙 좌표(이미지 내 ⑥)
    point_list.append((36.01326361734178, 129.31917086416948))
    
    return point_list

if __name__ == "__main__":
    global bebop
    bebop = Bebop()
    global bebopVision
    # 드론-라즈베리파이 간 연결 시도
    connection_success = bebop.connect(5)
    # 이륙되어 있는 경우라면 착륙
    bebop.safe_land(3)

    bebopVision = DroneVisionGUI(bebop, is_bebop=True, user_code_to_run=None, user_args=None)
    userVision = UserVision(bebopVision)
    bebopVision.set_user_callback_function(userVision.savePic, user_callback_args=None)
    bebopVision.open_video()

    global status
    # 드론 연결이 성공한 경우
    if (connection_success):
        print("드론-라즈베리파이 간 연결 성공!")
        status = input("이륙 희망 시 takeoff 입력: ")
        if status == 'takeoff':
            flying_drone()
        bebopVision.close_exit()
        sys.exit()
    else:
        print("Bebop 연결 실패!")
