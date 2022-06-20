package com.covidvaccine;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;


import javax.servlet.*;
import javax.servlet.annotation.*;

@SuppressWarnings("serial")
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	
	
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
	{
		String uname=req.getParameter("uname");
		String password=req.getParameter("password");
		String email=req.getParameter("email");
		String mobile=req.getParameter("mobile");
		PrintWriter pw=res.getWriter();
		res.setContentType("text/html");
		
		
		try
		{
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "c##yogesh", "yogesh");
			
			PreparedStatement ps=con.prepareStatement("insert into cvuser values(?,?,?,?)");
			ps.setString(1, uname);
			ps.setString(2, mobile);
			ps.setString(3, email);
			ps.setString(4, password);
			
			int k=ps.executeUpdate();
			
			
			

			 if(k>0)
			 {

				 pw.println("<script> alert('Registration Successfull! Click Ok to Login');</script>");
				 RequestDispatcher rd=req.getRequestDispatcher("index.html");
					rd.include(req, res);
				 
			 }
			 
		
		
			
			
			
			
			
		}
		catch(Exception e)
		{
			
		
			 pw.println("<script> alert('Registration failed! Click Ok to Regsiter Again');</script>");
			 RequestDispatcher rd=req.getRequestDispatcher("register.html");
				rd.include(req, res);
			
			
		}
		
		
		
	}

	
	
}
