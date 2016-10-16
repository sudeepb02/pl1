import com.mongodb.*;
import com.mongodb.client.MongoDatabase;
import com.mongodb.gridfs.*;

import java.applet.*;
import java.awt.*;
import java.io.*;

public class Grid extends Applet{
	Image img;
	MediaTracker tr;
	File temp;
	public void init(){
		
		try{
			setBackground(Color.orange);
			this.setSize(new Dimension(500,500));
			
			MongoClient c = new MongoClient("localhost",27017);
			DB db = c.getDB("filegf");
			
			File file = new File("/home/sudeep/i1.png");
			
			//Save file 
			GridFS gfs = new GridFS(db,"img");
			GridFSInputFile gfsFile = gfs.createFile(file);
			gfsFile.save();
					
			//Read File 
			GridFSDBFile out = gfs.findOne(gfsFile.getFilename());
			
			//Write output to temp file
			temp = File.createTempFile("temp123", ".tmp");
			System.out.println(temp.getPath());
			
			out.writeTo(temp);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void paint(Graphics g){
		
		tr = new MediaTracker(this);
		img = getImage(getCodeBase(),temp.getPath());
		tr.addImage(img, 0);
		g.drawImage(img, 50, 50, 600, 600, this);
	}
}
