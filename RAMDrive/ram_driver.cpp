#include<iostream>
#include<stdlib.h>
using namespace std;

int main()
{
	//system("sudo umount /mnt/Ram2");
	//system("sudo rm -r /mnt/Ram2");
	//system("sudo rmdir /mnt/Ram2");
	
	system("sudo mkdir /mnt/Ram2");
	system("sudo chmod 777 /mnt/Ram2");
	system("sudo df -h");
	cout<<"\nCreating Ram drive......\n";
	system("sudo mount -t tmpfs -o size=300M tmpfs /mnt/Ram2");
	system("sudo df -h");
	
	cout<<"\nCopying files to new Ram drive.......\n";
	system("sudo cp input.txt /mnt/Ram2");
	system("sudo cp calculator.cpp /mnt/Ram2");
	system("sudo cp output.txt /mnt/Ram2");
	system("sudo chmod 777 /mnt/Ram2/calculator.cpp");
	system("sudo chmod 777 /mnt/Ram2/input.txt");
	system("sudo chmod 777 /mnt/Ram2/output.txt");
	system("sudo df -h");
	system("sudo g++ /mnt/Ram2/calculator.cpp");
	system("sudo ./a.out");
}





