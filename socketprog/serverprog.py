
import socket,sys

s = socket.socket()
hostname = socket.gethostname()
port = 1025
s.bind(("localhost",port))

s.listen(5)
c,addr = s.accept()

print('Client connected : ',addr)
#c.send('Request accepted')

f = open("orgfile.txt","rb")
l = f.read(1024)

while(l):
	s.send(l)
	l = f.read(1024)

c.close()


