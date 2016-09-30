<%@ page import="java.sql.*" %>
<html>
	<head>
		<style></style>
		<title>EmployeeDB - Search</title>
	</head>
	<body>
	<br><br>
	
	<form method="post" name="form">
	Enter employee's name : 
	<input type = "text" name = "name"><br>
	<input type="submit" value="Submit">
	<table border="1">
		<tr><th>Emp name</th><th>Street</th><th>City</th></tr>
	<%
		Connection con = null;
		String url = "jdbc:mysql://localhost:3306/empdb";
		String driver = "com.mysql.jdbc.Driver";
		String username = "sudeep";
		String passwd = "peedus";
		
		String ename = request.getParameter("name");
		Statement st;
		try{
			Class.forName(driver).newInstance();
			con = DriverManager.getConnection(url,username,passwd);
			String query = "SELECT * FROM empdetails WHERE name = '"+ename + "'";
			st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
	%>
	<%
			while(rs.next()){
	%>
	<tr><td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td></tr>
		
	<%
		}
	%>
	<%
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	<a href="http://localhost:8080/jsp/index.jsp">Back</a>
	</form>
	</body>
</html>
	
