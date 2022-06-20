<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String name=request.getParameter("name");
String aadhar=request.getParameter("aadhar");
String date=request.getParameter("date");
String gender=request.getParameter("gender");
String state=request.getParameter("state");
String city=request.getParameter("city");
String center=request.getParameter("center");
String time=request.getParameter("time");
String type=request.getParameter("type");



String email = (String)session.getAttribute("user");  
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "c##yogesh", "yogesh");	

PreparedStatement ps=con.prepareStatement("insert into cvuserdata values(?,?,?,?,?,?,?,?,?,?)");
ps.setString(1,email);
ps.setString(2, name);
ps.setString(3, aadhar);
ps.setString(4, date);
ps.setString(5, gender);
ps.setString(6, state );
ps.setString(7, city);
ps.setString(8,center);
ps.setString(9, time);
ps.setString(10, type);

int k=ps.executeUpdate();



response.sendRedirect("maindash.html");

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>