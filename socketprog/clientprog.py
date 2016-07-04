
import socket,sys

c = socket.socket()
hname = socket.gethostname()
port = 1025

c.connect((hname,port))

print c.recv(1025)
c.close()
