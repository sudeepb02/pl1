<%@ page import="java.sql.*" %>
<html>
	<head>
		<style></style>
		<title>EmployeeDB - Insert</title>
	</head>
	<body>
		<script type="text/javascript">
			function confirmGetMessage(){
				alert("New record inserted successfully");
			}
		</script>
		
		<h1> Add a new employee</h1>
		<br><br>
		
		<form method="post" name="form">
		Enter name of the employee
		<input type="text" name="name"><br>
		Enter street of the employee
		<input type="text" name="street"><br>
		Enter city of the employee
		<input type="text" name="city"><br>
		<input type="submit" name="b1" value="Insert"
		onclick="confirmGetMessage()"><br><br>
		
		<%
		Connection con = null;
		String url = "jdbc:mysql://localhost:3306/empdb";
		String driver = "com.mysql.jdbc.Driver";
		String username = "sudeep";
		String passwd = "peedus";
		
		String ename = request.getParameter("name");
		String estreet = request.getParameter("street");
		String ecity = request.getParameter("city");
		PreparedStatement st;
		try{
			Class.forName(driver).newInstance();
			con = DriverManager.getConnection(url,username,passwd);
			st = con.prepareStatement("INSERT INTO empdetails VALUES(?,?,?)");
			st.setString(1,ename);
			st.setString(2,estreet);
			st.setString(3,ecity);
			ResultSet rs = st.executeQuery("SELECT * FROM empdetails;");
	%>
	Updated Table:
	<br>
	<table border="1">
	<tr><th>Employee name</th><th>Street</th><th>City</th></tr>
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
	
	
