import socket
# from djitellopy import tello
from djitellopy import tello
drone_1 = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
drone_1.setsockopt(socket.SOL_SOCKET, 25, 'wlx1cbfcebd58ef'.encode())

drone_2 = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
drone_2.setsockopt(socket.SOL_SOCKET, 25, 'wlx1cbfcebd57d6'.encode())



# drone_1.sendto('command'.encode(), 0, ('192.168.10.1', 8889))
# drone_2.sendto('command'.encode(), 0, ('192.168.10.1', 8889))
#
# #%%Code to takeoff:
#
# drone_1.sendto('takeoff'.encode(), 0, ('192.168.10.1', 8889))
# drone_2.sendto('takeoff'.encode(), 0, ('192.168.10.1', 8889))
#
# #%%Code to land:
#
# drone_1.sendto('land'.encode(), 0, ('192.168.10.1', 8889))
# drone_2.sendto('land'.encode(), 0, ('192.168.10.1', 8889))