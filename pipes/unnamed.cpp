#include<iostream>
#include <unistd.h>
#include<string.h>

using namespace std;

int main(){
int fd[2];
int i=0,j=-1;
char buffread[100];
ssize_t bytes_written,bytes_read;
char buff[100]="TE COMP1";
char temp;
int a=pipe(fd);
pid_t ch=fork();

if(ch==0){
cout<<"\nThis is child process";
close(fd[0]);
bytes_written=write(fd[1],buff,sizeof(buff));
cout<<" "<<buff<<"\n";
}
else{
cout<<"\nThis is parent process";
close(fd[1]);
bytes_read=read(fd[0],buffread,sizeof(buffread));


while(buffread[++j]!='\0');
j=j-1;

while(i<j){
temp=buffread[i];
buffread[i]=buffread[j];
buffread[j]=temp;

i++;
j--;
}


cout<<" "<<buffread<<"\n";
}
return 0;
}
