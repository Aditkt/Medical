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
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
	PreparedStatement pstmt = con.prepareStatement("select * from registration where email=? and password=?");
	

	pstmt.setString(1,email);
	pstmt.setString(2,password);
	
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next())
	{
		response.sendRedirect("homepage.html");
		
	}
	else
	{
		out.println("Invalid Password or username");
		
	}
	
	
	
	
	
}


catch(Exception e)

{
	
	
	System.out.println(e);
	
	
}









%>