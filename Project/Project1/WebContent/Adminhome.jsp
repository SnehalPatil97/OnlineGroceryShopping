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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<html lang="en">
<title>Admin</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">


<style>
button {
  background-color:#0097bd;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}
.Add{
 background-color:#0097bd;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width:20%;
  height:10%

}

button:hover {
	
	background: #4CAF50;
}
body,h1,h5 {font-family: "Raleway", sans-serif}
h3{
color:white;
padding-left:700px;
padding-top:250px;
font-size:100px;
font-family: bold "Raleway", sans-serif;
}
body{
  display: grid;
 
	 background-image:url(logg.jpg);
	 background-size:100%;
  

}
.btn:hover{color:black;}

.container{
width:500px;
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
#num{
width:100px;
background-color:black;
color:white;
font-size:20px;
	border:none;
	border-radius:3px;
	outline:0;
	padding:7px;
	font-family: Times New Roman;
	
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
.btton{float:right}


</style>
</head>
<body>

<ul>
  <li style="float:right" ><a href="AdminLogout" button type="btton" >LOGOUT</a></li>
</ul>

	<h3>Welcome</h3>
  <div class="w3-display-middle w3-container w3-xlarge">
	<p><button onclick="document.getElementById('Order').style.display='block'" class="w3-button w3-pink">View Orders</button></p>
    <p><button onclick="document.getElementById('Products').style.display='block'" class="w3-button w3-pink">View Products</button></p>
	<p><button onclick="document.getElementById('Customers').style.display='block'" class="w3-button w3-pink">View Customers</button></p>
  </div>
  
</div>

<!-- Products Modal -->
<div id="Products" class="w3-modal">
  <div class="w3-modal-content w3-animate-zoom">
    <div class="w3-container w3-black w3-display-container">
      <span onclick="document.getElementById('Products').style.display='none'" class="w3-button w3-display-topright w3-large">x</span>
      <h1>Here are our products</h1>
    </div>
    <div class="w3-container">
    <table border="2">
<tr>
<td>Product Id</td>
<td>Product Name</td>
<td>Product Price</td>
<td>Product Description</td>
<td>Edit</td>
<td>Delete</td>
</tr>
	 <%
try{

Connection con=Myconnect.connect();
PreparedStatement stmnt=con.prepareStatement("select * from product");
ResultSet rs= stmnt.executeQuery();

while(rs.next()){
%>

<tr>
<td><%=rs.getInt("product_Id") %></td>
<td><%=rs.getString("product_Name") %></td>
<td><%=rs.getInt("product_Price") %></td>
<td><%=rs.getString("product_Desc") %></td>
<td><a href="editform.jsp?id=<%=rs.getInt("product_Id")%>">Edit</a></td>  
<td><a href="deleteproduct.jsp?id=<%=rs.getInt("product_Id")%>">Delete</a></td>
</tr>

<%
}

} catch (Exception e) {
e.printStackTrace();
}
%> 
</table>

<br><a href="addproductform.jsp"><button type="button" class="Add">Add Product</button></a>
    </div>
    
  </div>
</div>
<!-- Orders Modal -->
<div id="Order" class="w3-modal">
  <div class="w3-modal-content w3-animate-zoom">
    <div class="w3-container w3-black w3-display-container">
      <span onclick="document.getElementById('Order').style.display='none'" class="w3-button w3-display-topright w3-large">x</span>
      <h1>Here are our orders</h1>
    </div>
    <div class="w3-container">
	  <table border="2">
	<tr>
	<td>OrderId</td>
	<td>CustomerId</td>
	<td>ProductID</td>
	<td>Product Name</td>
	<td>Product Price</td>
	<td>Product Quantity</td>
	
	<td>Status</td>
	<td>Edit</td>
	</tr>
	<%
	try{

		Connection con=Myconnect.connect();
		PreparedStatement stmnt=con.prepareStatement("select c.order_id,c.Cust_id,c.product_Id,p.product_Name,p.product_Price,c.product_qty,c.status from cart c join product p on c.product_Id=p.product_Id");
		ResultSet rs= stmnt.executeQuery();

		while(rs.next()){
		%>

		<tr>
		<td><%=rs.getInt("order_id") %></td>
		<td><%=rs.getInt("Cust_id") %></td>
		<td><%=rs.getInt("product_Id") %></td>
		<td><%=rs.getString("product_Name") %></td>
		<td><%=rs.getInt("product_Price") %></td>
		<td><%=rs.getInt("product_qty") %></td>
		<td><%=rs.getString("status") %></td>
		<td><a href="editstatusform.jsp?id=<%=rs.getInt("order_id")%>">Edit</a></td>
		</tr>

		<%
		}

		} catch (Exception e) {
		e.printStackTrace();
		}

	%>
	</table>
	
    </div>
    
  </div>
</div>

<!-- Customers Modal -->
<div id="Customers" class="w3-modal">
  <div class="w3-modal-content w3-animate-zoom">
    <div class="w3-container w3-black w3-display-container">
      <span onclick="document.getElementById('Customers').style.display='none'" class="w3-button w3-display-topright w3-large">x</span>
      <h1>Here are our Customers</h1>
    </div>
    <div class="w3-container">
	  <table border="2">
	<tr>
	<td>Customer Id</td>
	<td>First Name</td>
	<td>Last Name</td>
	<td>Contact</td>
	<td>EmailId</td>
	<td>Address</td>
	<td>Password</td>
	<td>Re-entered Password</td>
	</tr>
	<%
	List<cust> list1=custDAO.getAllCustomers();
	for(cust e:list1){
		out.print("<tr><td>"+e.getid()+"</td><td>"+e.getfirst_name()+"</td><td>"+e.getLast_name()+"</td><td>"+e.getcontact()+"</td><td>"+e.getEmail()+"</td><td>"+e.getAddress()+"</td> <td>"+e.getpassword()+"</td>  <td>"+e.getReenter()+"</td>");
	}
	%>
	</table>
    </div>
    
  </div>
</div>
</body>
</html>
<% 
}
else{
	response.sendRedirect("Admin_login.html");
} %>

