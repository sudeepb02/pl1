import pymongo

client = pymongo.MongoClient("localhost",27017)			#establish a connection


db = client.DataBase		#creating datbase name "DataBase"

collect = db.Collection		#created object collection name "Collection"

def insert():
	rollNo=input("Enter the Roll no")
	name=raw_input("Enter your Name:")
	age=input("Enter your Age")
	c=0
	a=[]
	n=raw_input("Enter the number of Hobbies :")
	n=int(n)
	while c<n:
			
		i=raw_input("Enter the Hobby :")
		#i=int(i)
		a.append(i)
		c=c+1
	collect.insert({"RollNo":rollNo,"Name":name,"Age":age,"Hobbies":a})
	print "Inserted successfully"

def display():
	disp=collect.find()
	for i in disp:
		print i	

def update():
	upda=input("Enter the Roll Number to be updated")
	upd_name=raw_input("Enter the updated Name")
	upd_age=input("Enter updated Age")
	upd_hobbies=[]
	c=0
	n=raw_input("Enter the number of Hobbies :")
	n=int(n)
	while c<n:
			
		i=raw_input("Enter the Hobby :")
		#i=int(i)
		upd_hobbies.append(i)
		c=c+1
	collect.update_one({"RollNo":upda},{"$set":{"Name":upd_name,"Age":upd_age,"Hobbies":upd_hobbies}})
	print "Updated successfully"

def delete():
	dele=input("Enter the Roll Number to be deleted")
	c=collect.find({"RollNo":dele},{"RollNo":1})
	if c is not None:
		collect.delete_many({"RollNo":dele})
		print "Deleted successfully"
	else:
		print "Not found"
	
def main():
	loop=1

	while loop:
		print "What you want to perform?"
		print "\n1.Insert\n2.Display\n3.Update\n4.Delete\n5.Exit"

		ch=input("Enter your choice")
		
		if ch==1:
			insert()
		if ch==2:
			display()
		if ch==3:
			update()
		if ch==4:
			delete()
		if ch==5:
			loop=0
main()
