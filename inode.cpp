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

/*	if(argc<2)
	{
		cout<<"Error! No command line arguments";
		exit(1);
	}
*/
	retvalue = stat(argv[1],&buffer);

	if(S_ISREG(buffer.st_mode))
	{
		cout<<"Regular file\n";
	}
	else
	{
		cout<<"Not a regular file";
	}

	cout<<"==============================\n";
	cout<<argv[1]<<endl;
	cout<<"Inode number : \t\t\t"<<buffer.st_ino<<endl;
	cout<<"Number of links: \t\t"<<buffer.st_nlink<<endl;
	cout<<"UID of owner : \t\t\t"<<buffer.st_uid<<endl;
	cout<<"Total size(bytes):\t\t"<<buffer.st_size<<endl;
	cout<<"Last accessed:\t\t\t"<<time_t(buffer.st_atime)<<endl;
	cout<<"Last modified:\t\t\t"<<time_t(buffer.st_mtime)<<endl;
	cout<<"Last changed:\t\t\t"<<time_t(buffer.st_ctime)<<endl;


	return 0;
}

