import socket
import threading
import time

HOST = '141.223.140.36' # dayoni 141.223.140.34
PORT = 33333
BUFFER = 1024

def send_msg(socket):
    try:
        while True:
            sendData = input("CLIENT ▶ ")
            socket.send(sendData.encode('utf-8'))
    except:
        print("send_msg 스레드 종료!")
    finally:
        socket.close()

def recv_msg(socket):
    try:
        while True:
            recvData = socket.recv(BUFFER)
            print('SERVER ▷ ', recvData.decode('utf-8'))
    except:
        print("recv_msg 스레드 종료!")
    finally:
        socket.close()

# try:
client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client_socket.connect((HOST, PORT))

print("Connect Success!!")

sender = threading.Thread(target=send_msg, args=(client_socket, ))
receiver = threading.Thread(target=recv_msg, args=(client_socket, ))

sender.start()
receiver.start()

while True:
    time.sleep(1)
    pass

# except KeyboardInterrupt:
#     print("KeyboardInterrupt!")
#     client_socket.close()
#
# finally:
#     client_socket.close()