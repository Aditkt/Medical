import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Login_check")
public class Login_check extends HttpServlet
{
	
	
	
	public void service(HttpServletRequest req , HttpServletResponse res)
	{
		try
		{
			
			PrintWriter out = res.getWriter();
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/medical","root","root");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			PreparedStatement pstmt = con.prepareStatement("select * from registration where email=? and password=?");
			

			pstmt.setString(1,email);
			pstmt.setString(2,password);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				out.println("User Logged IN");
				RequestDispatcher rd = req.getRequestDispatcher("homepage.html");
				rd.forward(req,res);
				
				
			}
			else
			{
				out.println("Invalid Password or username");
				RequestDispatcher rd = req.getRequestDispatcher("signin.html");
				rd.forward(req,res);
			}
			
			
			
			
			
		}


		catch(Exception e)

		{
			
			
			System.out.println(e);
			
			
		}
	}
	
	
	
}