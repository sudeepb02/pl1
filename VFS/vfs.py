import shelve

current_dir = []
def current_directory():
	d = vfs[""]
	for key in current_dir:
		d = d[key]
	return d
#	print d

def displisting(args):
	print("$-->	/" + "/".join(current_dir))
	for i in current_directory():
		print i

def cd(args):
	if len(args)!= 1:
		print("Invalid command. Refer man page for help")
		return
	if args[0]=="..":
		if len(current_dir) == 0:
			print("Already at root")
		else:
			current_dir.pop()
	elif args[0] not in current_directory():
		print("cd :"+ "/".join(current_dir) + "No such file or directory")
	else:
		current_dir.append(args[0])

def makedir(args):
	if len(args)!=1:
		print("Invalid command or usage. Refer man page for help")
		return
	d = current_directory()[args[0]] = {}
	vfs.sync()

def currd():
	print("/" + "/".join(current_dir))
	for i in current_directory():
		print i,

def rmdir(args):
	if len(args)!=1:
		print("Invalid command or usage. Refer man page for help")
		return
	if args[0] not in current_directory():
		print("rmdir" + "No such file or directory")
	elif((current_directory()[args[0]]=={})):
		del current_directory()[args[0]]
	else:
		if((current_directory()[args[0]]!={})):
			print("Unable to delete. Directory not empty")
			
def dispman():
	print("Commands :\nlist\ncd\nmakedir\nrmdir\ncurrdir\nexit\n")
	print("cd : Change directory\nUsage : cd <directory>\n\n")
	print("list : List contents of directory\n\n")
	print("makedir : Make directory\nUsage : mkdir <directory>\n\n")
	print("rmdir : Remove directory\nUsage : rmdir <directory>\n\n")
	print("currd : View present working directory\n\n")
	print("exit : Exit\n\n")

vfs = shelve.open('vfs.fs',writeback=True)
username = raw_input("ENter username : ",)
vfs[""] = {"System": {}, "Users": {username:{}}}

#current_directory()
#Display terminal and read commands
while(True):
	name = raw_input("$-->")
	cmd = name.split()[0]
	if cmd=="list":
		displisting(name.split()[1:])
	elif cmd=="cd":
		cd(name.split()[1:])
	elif cmd=="makedir":
		makedir(name.split()[1:])
	elif cmd=="rmdir":
		rmdir(name.split()[1:])
	elif cmd=="currd":
		currd()
	elif cmd=="man":
		dispman()
	elif cmd=="exit":
		break;
	else:
		print("Invalid command. Enter man for help")

