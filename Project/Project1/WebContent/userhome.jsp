<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
  <%@page import="Respository.*,Utilities.*, entities.*"%>
  <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>


<%
HttpSession hs= request.getSession();
out.print(hs.getAttribute("Email"));
if(hs.getAttribute("Email")!=null){
	
%>	

<!DOCTYPE html>
<html lang="en">
<head>
  <title>User Homepage</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <style>
  /* Make the image fully responsive */
  .carousel-inner img {
	padding-left:400px;
      width:70%;
      height: 70%;
  }
#demo{background-color: #4CAF50;}
body{
background-color:gray;
}

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  background:purple;
}

li a:hover:not(.active) {

  background:#0097bd;
  color:white;
  transition: background ease-in .1s;
  
}

.card{
background:black;
}
.card-body{
color:white;
}

.btn:hover{color:black;}




  </style>
</head>
<body>
<ul>
<li style="float:left" ><a href="Status.jsp" button type="button">Status</a></li>
  <li style="float:right" ><a href="UserLogout"button type="button" >LOGOUT</a></li>
   <li style="float:right" ><a href="Mycart.jsp" button type="button">My Cart</a></li>
</ul>

<div id="demo" class="carousel slide" data-ride="carousel">
  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="log1.jpg" width="800" height="400" >
    </div>
    <div class="carousel-item">
      <img src="regi.jpg"  width="800" height="400" >
    </div>
    <div class="carousel-item">
      <img src="logg.jpg"  width="800" height="400">
    </div>
  </div>
  </div>
  
  
  <div class="container">
  <div class="container-fluid">
    <div class="row" style="padding-top:30px" >
      
      <%
      
		int cust_id=0;
      	
	try{

		Connection con=Myconnect.connect();
		PreparedStatement stmnt=con.prepareStatement("select * from product");
		ResultSet rs= stmnt.executeQuery();
		String email1=(String)hs.getAttribute("Email");
		PreparedStatement ps=con.prepareStatement("select id from customer where Email='"+email1+"'");
		ResultSet em= ps.executeQuery();
		while(em.next()){
			cust_id=em.getInt(1);
		}
		HttpSession cid= request.getSession();
		cid.setAttribute("cid1", cust_id );      
       while(rs.next()){ %>
	      <div class="col-md">
      	<div class="card" >
    		<div class="card-body">
    		<form action="AddToCart" method="get">
    		<input type="hidden" value="<%=cust_id %>" name="cust_id"/>
    		<input type="hidden" value="<%=rs.getString("product_Id") %>" name="prod_id"/>
      			<h4 class="card-title"><%=rs.getString("product_Name") %></h4>
      			<p class="card-text"><%=rs.getString("product_Price") %></p>
      			<p class="card-text"><%=rs.getString("product_Desc") %></p>
				<input name="product_qty" type="text" id="num" placeholder="Quantity" id="num"></p><br>
      			<br><p><input type="submit" class="btn btn-primary " value="Add to cart"/>  
				</form>
    		</div>
  		</div>
      </div>  
      <% } 
	} catch (Exception e) {
		e.printStackTrace();
		}
      
      %>

</body>
</html>
<% 
}
else{
	response.sendRedirect("index.html");
} %>