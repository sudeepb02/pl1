import os,sys,stat,time

def main():
	n=int(input("Enter the no of files: "))
	fname=[]
	for i in range(n):
		fname.append(str(input("Enter the file name: ")))
		
	print('==========================')
	for i in range(n):
		info=os.stat(fname[i])
		print(fname[i],end='\t')
		if(stat.S_ISREG(info.st_mode)):
			print('Regular file')
		elif(stat.S_ISDIR(info.st_mode)):
			print('Directory')
		elif(stat.S_ISFIFO(info.st_mode)):
			print('FIFO file')
		elif(stat.S_ISBLK(info.st_mode)):
			print('Block file')
		elif(stat.S_ISLNK(info.st_mode)):
			print('Symbolic link')
		elif(stat.S_ISCHR(info.st_mode)):
			print('Character file')

		print("Inode:",info.st_ino)
		print("UID of file:",info.st_uid)
		print("GID of file:",info.st_gid)
		print("Size of file:",info.st_size)
		print("Number of links:",info.st_nlink)
		print("Last accessed:",time.ctime(info.st_atime))
		print("Last changed:",time.ctime(info.st_ctime))
		print("Last modified:",time.ctime(info.st_mtime))
		print('-----------------')
		
main()

