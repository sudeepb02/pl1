#include<iostream>
#include<stdlib.h>
#include<sys/stat.h>
#include<sys/types.h>
#include<time.h>
using namespace std;
int main(int argc,char *argv[])
{
	struct stat buffer;
	int retvalue;
	if(argc<1)
	{
	cout<<"Error! No command line arguments";
	exit(1);
	}
	
	for(int i=1;i<argc;i++)
	{
		retvalue = lstat(argv[i],&buffer);
		
		if(retvalue!=0)
		{
			cout<<"Error processing file\n";
			exit(1);
		}
		
		cout<<"=================================\n";
		cout<<argv[i]<<"\t\t\t";

		if(S_ISREG(buffer.st_mode))
		{
			cout<<"Regular file\n";
		}
		else if(S_ISCHR(buffer.st_mode))
		{
			cout<<"Character file \n";
		}
		else if(S_ISFIFO(buffer.st_mode))
		{
			cout<<"FIFO special file\n";
		}
		else if(S_ISDIR(buffer.st_mode))
		{
			cout<<"Directory\n";
		}
		else if(S_ISLNK(buffer.st_mode))
		{
			cout<<"Symbolic link\n";
		}
		else
		{
			cout<<"Block file\n";
		}
		cout<<"Inode number : \t\t\t"<<buffer.st_ino<<endl;
		cout<<"Number of links: \t\t"<<buffer.st_nlink<<endl;
		cout<<"UID of owner : \t\t\t"<<buffer.st_uid<<endl;
		cout<<"Total size(bytes):\t\t"<<buffer.st_size<<endl;
		cout<<"Last accessed:\t\t\t"<<ctime(&buffer.st_atime)<<endl;
		cout<<"Last modified:\t\t\t"<<ctime(&buffer.st_mtime)<<endl;
		cout<<"Last changed:\t\t\t"<<ctime(&buffer.st_ctime)<<endl;
	}	
	return 0;
}

