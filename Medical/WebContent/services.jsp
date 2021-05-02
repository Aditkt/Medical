<%@ page language="java" import="java.sql.*, java.util.*, java.io.*, java.lang.* " contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
page working
</body>
</html>



<%



try
{
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/medical","root","root");

	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String service = request.getParameter("service");
	String a = request.getParameter("age");
	int age = Integer.parseInt(a);
	String bloodtype = request.getParameter("bloodtype");
	String pn = request.getParameter("pno");
	double pno = Double.parseDouble(pn);
	
	PreparedStatement pstmt = con.prepareStatement("insert into services(name,email,age,bloodtype,pno,service) values(?,?,?,?,?,?)");
	
	
	
	pstmt.setString(1,name);
	pstmt.setString(2,email);
	pstmt.setInt(3,age);
    pstmt.setString(4,bloodtype);
	pstmt.setDouble(5,pno);
	pstmt.setString(6,service);
	
	
	int n = pstmt.executeUpdate();
	
	if(n>0)
	{
		response.sendRedirect("homepage.html");
		
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