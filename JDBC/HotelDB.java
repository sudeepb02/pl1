import java.io.*;
import java.util.*;
import java.sql.*;

public class HotelDB {
	
	private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private static final String USER = "root";
	private static final String PWD = "peedus";
	
	public static void main(String[] args) throws SQLException, IOException {
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String url = "jdbc:mysql://localhost/hoteldb";	
		
		Connection con = null;
		try{
			//Register JDBC Driver
			Class.forName(JDBC_DRIVER);
			con = DriverManager.getConnection(url,USER,PWD);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		Statement st = con.createStatement();
		String query;
		
		int ch,rows,flag=1;
		while(flag==1){
			System.out.println(" 1.Display all guests\n 2.Add a guest\n 3.Delete\n 4.Update details\n 5.Exit");
			System.out.print("Please enter your choice : ");
			ch = Integer.parseInt(br.readLine());
			
			switch(ch){
			case 1:
					System.out.println("Guest No.\t Name \t\tAddress\n");
					query = "SELECT * FROM Guest;";
					ResultSet rs = st.executeQuery(query);
					
					while(rs.next()){
						int guest_no = rs.getInt(1);
						String guest_name = rs.getString(2);
						String addr = rs.getString(3);
						System.out.println(guest_no + "\t\t" + guest_name + "\t\t" + addr);
					}
					System.out.println("\n");
					break;
			
			case 2:
					System.out.print("Enter guest number : ");
					int guest_no = Integer.parseInt(br.readLine());
					System.out.print("Enter name of guest : ");
					String guest_name = br.readLine();
					System.out.print("Enter address : ");
					String addr = br.readLine();
					
					query = "INSERT INTO Guest VALUES(" + guest_no + ",\"" + guest_name + "\",\"" + addr + "\");";
					
					rows = st.executeUpdate(query);
					System.out.println("Query OK. " +rows + " rows affected");
					break;
				
			case 3:
					System.out.println("Enter guest id to be deleted : ");
					int id = Integer.parseInt(br.readLine());
					
					query = "DELETE FROM Guest WHERE guest_no=" + id + ";";
					rows = st.executeUpdate(query);
					System.out.println("Query OK. " +rows + " rows affected");
					break;
					
			case 4:
					System.out.println("Enter guest number to be updated : ");
					int guest_id = Integer.parseInt(br.readLine());
					
					System.out.println("Enter new name of guest : ");
					String new_name = br.readLine();
					System.out.println("Enter address : ");
					String new_addr = br.readLine();
					
					query = "UPDATE Guest SET guest_name=\"" +new_name + "\",addr = \"" + new_addr + "\" WHERE guest_no=" + guest_id +";";
					rows = st.executeUpdate(query);
					
					System.out.println("Query OK. " +rows + " rows affected");
					break;
					
			case 5:
					flag = 0;
					break;
					
			default:
					System.out.println("Please enter correct choice");
					
			}//Exit switch
		}//Exit while
		
	}//Exit main
}

