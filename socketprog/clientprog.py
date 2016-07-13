
import socket,sys

c = socket.socket()
hname = socket.gethostname()
port = 1025

c.connect(("localhost",port))

#print(c.recv(1024))

f = open('recdfile.txt','wb')

while(True):
	l = c.recv(1024)
	while(l):
		f.write(l)
		l = sc.recv(1024)
f.close()
c.close()
