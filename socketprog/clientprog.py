import socket,sys

c = socket.socket()
hname = socket.gethostname()
port = 2000

c.connect((hname,port))

print(c.recv(1024))

fname = raw_input("Please enter file name : ")

c.send(fname)

f = open('recdfile','wb')
l = c.recv(1024)
f.write(l)

f.close()
c.close()

