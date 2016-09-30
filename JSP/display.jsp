<%@ page import="java.sql.*" %>
<html>
	<head>
		<style>
			table{ border:5px;}
			th td{ padding : 5px; margin : 5px;}
		</style>
		
		<title>EmployeeDB - Display</title>
	</head>
	<body>
		<h1>Display all information</h1>
		<br><br>
		<form method="post" name="form">
		
			<table>
				<tr><th>Employee name</th><th>Street</th><th>City</th></tr>
				<%
					Connection con = null;
					String url = "jdbc:mysql://localhost:3306/empdb";
					String driver = "com.mysql.jdbc.Driver";
					String username = "sudeep";
					String passwd = "peedus";
				
					int sumcount=0;
					Statement st;
					try{
						Class.forName(driver).newInstance();
						con = DriverManager.getConnection(url,username,passwd);
						String query = "SELECT * FROM empdetails;";
						st = con.createStatement();
						ResultSet rs = st.executeQuery(query);
				
						%>
						<%
						while(rs.next()){
						%>
						<tr>
							<td><%=rs.getString(1)%></td>
							<td><%=rs.getString(2)%></td>
							<td><%=rs.getString(3)%></td>
						</tr>
						<% } %>		<!--while end -->
						<% }
					catch(Exception e){
						e.printStackTrace();
					}
					%>
			</table>
			<a href = "http://localhost:8080/jsp/index.jsp"> Back</a>
		</form>
	</body>
</html>

						
