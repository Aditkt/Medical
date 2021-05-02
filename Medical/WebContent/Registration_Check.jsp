<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>



<%



try
{
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/medical","root","root");

	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
	PreparedStatement pstmt = con.prepareStatement("insert into registration(email,password) values(?,?,?)");
	
	
	pstmt.setString(1,name);
	pstmt.setString(2,email);
	pstmt.setString(3,password);
	
	
	int n = pstmt.executeUpdate();
	
	if(n>0)
	{
		response.sendRedirect("signin.html");
		
	}
	else
	{
		out.println("Invalid ");
	}
	
	
	
	
	
}


catch(Exception e)

{
	
	
	System.out.println(e);
	
	
}









%>