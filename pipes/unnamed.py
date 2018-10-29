import os,sys
r,w=os.pipe()

child_id=os.fork()

if child_id:
	os.close(r)
	w1=os.fdopen(w,'w')
	a=raw_input("Enter any message you want to send :\n")
	w1.write(a)
	print "\n\nThis is child process.Child is sending message as :",a
else:
	os.close(w)
	r1=os.fdopen(r)
	s1=r1.read()
	print "\nThis parent process which got message from child as :",s1[::-1]
