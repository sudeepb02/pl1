import java.util.ArrayList;
import java.util.Date;
import java.util.Scanner;

import javax.print.Doc;

import org.bson.Document;

import com.mongodb.*;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;


public class Mongo {
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try{
		//Establish a connection with mongoDb server
		MongoClient c=new MongoClient("localhost",27017);
		MongoDatabase db=c.getDatabase("db83");
		System.out.println("Connection established successfully");
		MongoCollection<Document> col=db.getCollection("blog");
		int ex=0;
		String title;
		while (ex==0){
			System.out.println("1.Insert\n2.Delete\n3.Update\n4.Find_all\n5.Find with condition\n6.Exit\nEnter Your Choice");
			Scanner sc=new Scanner(System.in);
			int ch=sc.nextInt();
			Document rfdoc=new Document( );
			switch(ch){
			case 1://Create a document
				System.out.println("Enter the title : ");
				title=sc.nextLine();
				Document doc = new Document();
				doc.append("title", title);
				doc.append("description", "Implementation of java mongo");
				doc.append("by","ABCD" );
				doc.append("url", "www.yahoo.com");
				doc.append("likes",100 );
				ArrayList<String> s=new ArrayList<String>();
				s.add("tag1");
				s.add("tag2");
				doc.append("tags",s );
				
				//For Array of Embedded documents
				ArrayList<Document> aed=new ArrayList<Document>();
				Document ed=new Document();
				ed.append("user", "user1");
				ed.append("message", "I am DBA");
				ed.append("dateCreated", new Date(2015, 10, 31));
				ed.append("likes", 20);
				aed.add(ed);
				doc.append("comments", aed);
				
				col.insertOne(doc);
				
				System.out.println("Inserted a document");
					break;
			
			case 2:	//Remove a document
				System.out.println("Enter the title : ");
				title=sc.nextLine();
				rfdoc.append("title", title);
				col.deleteMany(rfdoc);
				System.out.println("Removed a document");
				break;
			case 3:
				//Update Collection
				System.out.println("Enter the title for search query : ");
				sc.nextLine();
				title=sc.nextLine();
				System.out.println("Enter new title value");
				String nt=sc.nextLine();
			
				Document sq=new Document().append("title", title);
				Document ud=new Document().append("$set", new Document().append("title", nt));
				col.updateMany(sq,ud);
				
				System.out.println("Updated likes in the document");
				break;
			case 4:
				//Retrieve and display all documents in collection
				for(Document co:col.find()){
					System.out.println(co.toJson());
				}
				break;
			case 5://Find with query
				System.out.println("Enter the title for search query : ");
				title=sc.next();
				rfdoc.append("title", title);
				for(Document d:col.find(rfdoc)){
					System.out.println(d.toJson());
				}
				break;
			case 6:ex=1;
					break;
			default:System.out.println("Invalid Entry");
			}
			
		}
		
		
		
		}
		catch (Exception e) {
			// TODO: handle exception
		}

	}

}