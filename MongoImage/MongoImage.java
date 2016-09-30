import com.mongodb.*;
import com.mongodb.gridfs.*;
import java.applet.*;
import java.awt.*;
import java.io.*;
public class MongoImage extends Applet{
	
	private static final long serialUID = 1L;
	Image img,i;
	MediaTracker tr;
	File tmp;
	public void init(){
//		setSize(300,300);
		try{
			//Connection
			MongoClient mc = new MongoClient("localhost",27017);
			//Create database
			DB db = mc.getDB("file");
			File file = new File("/home/sudeep/i1.jpg");
			
			//Save file
			GridFS gridfs = new GridFS(db,"img");
			GridFSInputFile gfsFile = gridfs.createFile(file);
			
			gfsFile.save();
			
			//Read file 
			GridFSDBFile out = gridfs.findOne(gfsFile.getFilename());
			
			//Write output to temp file
			tmp = File.createTempFile("delme", ".tmp");
			System.out.println(tmp.getPath());
			out.writeTo(tmp);
			
		}catch(IOException e){}
	}
	
	public void paint(Graphics g){
		tr = new MediaTracker (this);
		img = getImage(getCodeBase(),tmp.getPath());
		
		tr.addImage(img, 0);
		g.drawImage(img, 0, 0, 0, 0,this);
		
	}
}

