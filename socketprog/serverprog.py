
import socket,sys

s = socket.socket()
hname = socket.gethostname()
port = 2000

s.bind((hname,port))

s.listen(10)

while(True):
	c,addr = s.accept()
	c.send('1.File1 2.File2 3.File3')
	
	fname = c.recv(1024)
	print(str(fname) + 'selected. Sending file...')

	f= open(fname,'rb')
	l = f.read(1024)
	c.send(l)

	c.close()

