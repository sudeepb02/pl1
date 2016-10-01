#include<iostream>
#include<fstream>
using namespace std;

int main()
{
	int choice;
	float num1,num2,result;
	cout<<"SIMPLE CALCULATOR\n";

	ifstream f;
	f.open("input.txt",ios::in);
	f>>num1;
	f>>num2;
	cout<<"Two numbers are : \t"<<num1<<"\t"<<num2<<endl;
	f.close();


	cout<<" 1.Add\n 2.Subtract\n 3.Multiply\n 4.Divide\n";
	cout<<"Please enter your choice : ";
	cin>>choice;
	switch(choice)
	{
		case 1:
			result = num1 + num2;
			break;
		case 2:
			result = num1 - num2;
			break;
		case 3:
			result = num1 * num2;
			break;
		case 4:
			result = num1 / num2;
			break;
		default :
			cout<<"Please enter correct choice\n";
	}

	ofstream g;
	g.open("output.txt",ios::out | ios::app);
	cout<<result;
	g<<result<<endl;

	return 0;
}

