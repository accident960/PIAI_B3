import socket
import cv2
import numpy as np
import time

#socket에서 수신한 버퍼를 반환하는 함수
def recvall(sock, count):
    # 바이트 문자열
    buf = b''
    while count:
        newbuf = sock.recv(count)
        if not newbuf: return None
        buf += newbuf
        count -= len(newbuf)
    return buf
 
HOST=''
PORT=8485
 
#TCP 사용
s=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
print('Socket created')
 
#서버의 아이피와 포트번호 지정
s.bind((HOST,PORT))
print('Socket bind complete')
# 클라이언트의 접속을 기다린다. (클라이언트 연결을 10개까지 받는다)
s.listen(10)
print('Socket now listening')
 
#연결, conn에는 소켓 객체, addr은 소켓에 바인드 된 주소
conn,addr=s.accept()
 
while True:
    check = False
    for count in range(0,100):
        # client에서 받은 stringData의 크기 (==(str(len(stringData))).encode().ljust(16))
        length = recvall(conn, 16)
        stringData = recvall(conn, int(length))
        data = np.fromstring(stringData, dtype = 'uint8')
    

        #data를 디코딩한다.
        frame = cv2.imdecode(data, cv2.IMREAD_COLOR)
        cv2.imwrite("../바탕화면/capture/frame%d.jpg" %count, frame)
        print("Saved framed%d.jpg" %count)

        cv2.imshow('ImageWindow', frame)
        cv2.waitKey(1)
        
        if count == 99:
            check = True
            break
    
    for num in range(0,100):
        #num0 = num.to_bytes(num)
        print(num)
        num0 = num.tostring()
        s.sendall(str(len(num0)).encode().ljust(16))
        
        #img = cv2.imread("../바탕화면/capture/frame%d.jpg" %num)
        #img2 = np.array(img)
        #img3 = img2.tostring()
        #s.sendall((str(len(img3))).encode().ljust(16))
        
        if num == 99:
            check = True
            break

