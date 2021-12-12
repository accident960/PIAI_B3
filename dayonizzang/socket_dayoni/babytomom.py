# SERVER
from socket import *

PORT = 33333
BUFFER = 1024

def send(sock, data):
    #sendData = input('ME : ')
    sock.send(data.encode('utf-8'))

def receive(sock):
    recvData = sock.recv(BUFFER)
    #print('MOM :', recvData.decode('utf-8'))
    return recvData.decode('utf-8')

serverSock = socket(AF_INET, SOCK_STREAM)
serverSock.bind(('', PORT))
serverSock.listen(1)

print('애기드론 서버랍니다.')

connectionSock, addr = serverSock.accept()

print(str(addr), '에서 접속되었습니다.')

try:
    command = receive(connectionSock)

    if command == 'FLIP':
        print('SUCCESS : ', command)
        send(connectionSock, 'OK')
    else:
        print('ERROR : ', command)

except KeyboardInterrupt:
    print('키보드 감지')
    exit()
print('main 종료!!!')