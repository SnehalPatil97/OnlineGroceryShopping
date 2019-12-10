<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="Respository.*,Utilities.*, entities.*"%>
  <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Check Status</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style> 
.login-container {
    min-width:200px;
    max-width:400px;
    background:#fff;
    border:none;
    margin-top:0;
  }
  
.card{
background:black;
}
.card-body{
color:white;
}
  
  </style>
</head>
<body>
<table border="2">
  <tr>
    <th>Product Id</th>
    <th>Product Name</th>
    <th>status</th>
  </tr>

 <%
  int count=0, total=0, grand=0, pr=0,qty=0;
try{

Connection con=Myconnect.connect();
HttpSession cid= request.getSession();
Object n=cid.getAttribute("cid1");
%>

<div class="container">
  <div class="container-fluid">
    <div class="row" style="padding-top:30px" >

<% PreparedStatement stmnt=con.prepareStatement("select p.product_Id, p.product_Name,c.status from product p join cart c on p.product_Id=c.product_Id");
 ResultSet rs= stmnt.executeQuery();

 while(rs.next()){%>
 <div class="col-md">
      	<div class="card" >
    		<div class="card-body">
    		<tr>
 	<td><%=rs.getInt("product_Id") %></td>
 	<td><%=rs.getString("product_Name") %></td>
 	<td><%=rs.getString("status") %></td>
 	</div>
    	</div>
  		</div>
      </div> 
 <%}

 } catch (Exception e) {
 e.printStackTrace();
 }%>

</table>

</div>
       

</body>
</html>