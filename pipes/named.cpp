#include<iostream>
#include<string.h>
#include <unistd.h>			//for read,write
#include <sys/types.h>		//for mkfifo
#include <sys/stat.h>		//for mkfifo
#include <sys/stat.h>		//for open
#include <fcntl.h>			//for open



using namespace std;

int main(){

 char message[100];

ssize_t bytes_written;
cout<<"enter any message:\n";
cin.getline(message,100);


mkfifo("fifo",0777);

int fd=open("fifo",O_WRONLY);
bytes_written=write(fd,message,strlen(message));
cout<<"Writing to the other file\n"<<message<<"\n";

return 0;

}
