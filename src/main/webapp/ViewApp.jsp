<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <style>

body{

background-image: url("images/dashboard.jpg");
background-repeat: no-repeat;
background-attachment: fixed;

}
.container{
    margin-left: 17%;
margin-top: 3%;
width: 800px;
height: 500px;
    background-color:white;
}
.block{

display: inline;
font-family: Arial, Helvetica, sans-serif;
font-size: large;

}
.p1
{

    margin-left: 2cm;
    height: 5%;
    width: 4cm;
}
.p2
{

margin-left: 300px;
    height: 5%;
    width: 4cm;
}
.p3
{
margin-top: -1cm;
    margin-left: 550px;
    height: 5%;
    width: 4cm;
}
button{

    background-color: #075eff;
  color: white;
  padding: 10px 16px;
  margin: 8px 0;
  border: none;
 width: 10%;
   margin-left: 85%;
  
  cursor: pointer;
  

}

h3{
background-color:blue;
padding: 10px;
color: white;
}

th{
  padding: 10px;
  text-align: left;
}

td{
  padding: 15px;
  text-align: left;

}


    </style>
</head>
<body >
    

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
          <a class="navbar-brand" href="#">C19V</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
             <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="maindash.html">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="about.html">About</a>
              </li>
              <li class="nav-item">
                  <a class="nav-link" href="contact.html">Contact Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="howitswork.html">How it Works</a>
                  </li>
              
           
            </ul>
          <a href="Index.html"><img src="images/lg.jpg" height="30px" width="30px"></a>
          <h5 style="color:white">Log Out</h5>
          
          </div>
        </div>
      </nav>

      <div class="container">
<br>
<h3>Appointment Details </h3>

<br>
<%


 String email = (String)session.getAttribute("user");





Class.forName("oracle.jdbc.driver.OracleDriver");

Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "c##yogesh", "yogesh");	

Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from cvuserdata where email='"+email+"' ");

%>

<% try{ while(rs.next()){ %>

<table >

  <tr>
    <th>Name</th>
    <th>:</th>
    <td><%=rs.getString(2)%></td>
    
  </tr>
  <tr>
    <th>Aadhar Number</th>
    <th>:</th>
    <td><%=rs.getString("aadhar")%></td>
  </tr>
  <tr>
    <th>Time</th>
    <th>:</th>
    <td><%=rs.getString("time")%></td>
  </tr>
  <tr>
    <th>Date of Appointment</th>
    <th>:</th>
    <td><%=rs.getString("cdate")%></td>
  </tr>
  <tr>
    <th>Center</th>
    <th>:</th>
    <td><%=rs.getString("center")%></td>
  </tr>

  
  <tr>
    <th>Vaccine </th>
    <th>:</th>
    <td><%=rs.getString("type")%></td>
     
  </tr>




</table>

<%}

} catch (Exception e) {
e.printStackTrace();
}

%>

      
<button  onclick="window.print()">Print</button>

</div>
        

      </div>
      



</body>
</html>