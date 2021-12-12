# CLIENT
from socket import *
import time
import djitellopy as tello

HOST = '127.0.0.1'
PORT = 33333
BUFFER = 1024

def send(sock, data):
    # sendData = input('ME : ')
    sock.send(data.encode('utf-8'))

def receive(sock):
    recvData = sock.recv(BUFFER)
    print('BABY : ', recvData.decode('utf-8'))
    return recvData.decode('utf-8')

clientSock = socket(AF_INET, SOCK_STREAM)
clientSock.connect((HOST, PORT))

print('엄마드론 서버랍니다.')

me = tello.Tello()
me.connect()
print('Tello Battery : ', me.get_battery())
me.takeoff()

try:
    me.flip_forward()
    time.sleep(1)

    send(clientSock, 'FLIP')
    response = receive(clientSock)

    if response == 'OK':
        me.flip_back()
        time.sleep(1)
        me.land()
    else:
        me.land()

except KeyboardInterrupt:
    print('키보드 감지')
    exit()
print('main 종료!!!')