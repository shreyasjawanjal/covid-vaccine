<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*,java.util.*"%>
<%
String aadhar=request.getParameter("aadhar");
String email = (String)session.getAttribute("user");
Class.forName("oracle.jdbc.driver.OracleDriver");

Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "c##yogesh", "yogesh");	

Statement st= con.createStatement();
try{
	
int i=	st.executeUpdate("delete from cvuserdata where aadhar='"+aadhar+"' and email='"+email+"'");
response.sendRedirect("maindash.html");
}catch(Exception e)
{
	
	out.println(e);
}





%>