#include<iostream>
#include<string.h>
#include <unistd.h>			//for read

#include <sys/stat.h>		//for open
#include <fcntl.h>			//for open
using namespace std;

int main(){

ssize_t bytes_read;
char message[100];
int fd=open("fifo",O_RDONLY);
bytes_read=read(fd,message,100);
cout<<"Reading from other pipe\n"<<message<<"\n";
return 0;

}
