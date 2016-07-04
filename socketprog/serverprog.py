
import socket,sys

s = socket.socket()
hostname = socket.gethostname()
port = 1025
s.bind((hostname,port))

s.listen(1)
c,addr = s.accept()
print 'Client connected ; ',addr
c.send('Request accepted')
c.close()


