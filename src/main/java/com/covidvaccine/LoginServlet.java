package com.covidvaccine;

import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;

@SuppressWarnings("serial")
@WebServlet("/login")

public class LoginServlet extends HttpServlet{
	
	public void doPost(HttpServletRequest req ,HttpServletResponse res) throws ServletException,IOException
	{
	
		
		String email=req.getParameter("email");

		String password=req.getParameter("password");
		PrintWriter pw=res.getWriter();
		res.setContentType("text/html");
		
		HttpSession session=req.getSession();  
		
		try
		{
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "c##yogesh", "yogesh");	
		    
		    Statement st= con.createStatement();
		    ResultSet rs=st.executeQuery("select * from cvuser where email='"+email+"' and password='"+password+"'");
		    try{
		   
		    	rs.next();
		    	
		    if(rs.getString("password").equals(password)&&rs.getString("email").equals(email))
		    {
		    	
		  
		    	  
		    	session.setAttribute("user",email);
		    	res.sendRedirect("maindash.html");
		   
		    }
		    else{
		    	
		    	 pw.println("<script> alert('Registration failed! Click Ok to Login');</script>");
				 RequestDispatcher rd=req.getRequestDispatcher("index.html");
					rd.include(req, res);
		   
		    }
		    }
		    catch (Exception e) {
		    e.printStackTrace();
		    }
			
			
			
			
		} catch(Exception e)
		{
			
			
		}
		
		
	}

}
