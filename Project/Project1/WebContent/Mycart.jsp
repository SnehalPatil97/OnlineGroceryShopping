<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="Respository.*,Utilities.*"%>
  <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
  font-family: Arial;
  font-size: 17px;
  padding: 8px;
}

* {
  box-sizing: border-box;
}

.row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
}

.col-25 {
  -ms-flex: 25%; /* IE10 */
  flex: 25%;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
}

.col-75 {
  -ms-flex: 75%; /* IE10 */
  flex: 75%;
}

.col-25,
.col-50,
.col-75 {
  padding: 0 16px;
}

.container {
  background-color: #f2f2f2;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
}

input[type=text] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

label {
  margin-bottom: 10px;
  display: block;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

.btn {
  background-color: #4CAF50;
  color: white;
  padding: 12px;
  margin: 10px 0;
  border: none;
  width: auto;
  border-radius: 3px;
  cursor: pointer;
  font-size: 17px;
}

.btn:hover {
  background-color: #45a049;
}

a {
  color: #2196F3;
}

hr {
  border: 1px solid lightgrey;
}

span.price {
  float: right;
  color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media (max-width: 800px) {
  .row {
    flex-direction: column-reverse;
  }
  .col-25 {
    margin-bottom: 20px;
  }
}
</style>
</head>
</head>
<body>


<h2>Your bill details and Payment</h2>

<div class="row">
  <div class="col-50">
    <div class="container">
      <form action="/action_page.php">
	  <div class="col-50">
    <div class="container">
      
  
<style>
table, td, th {
  border: 1px solid black;
}

table {
  border-collapse: collapse;
  width: 100%;
}

th {
  height: 50px;
}
</style>
</head>
<body>

<table border="2">
  <tr>
    <th>Product Id</th>
    <th>Product Name</th>
    <th>Product Price</th>
    <th>Product Quantity</th>
  </tr>
  <%
  int count=0, total=0, grand=0, pr=0,qty=0;
try{

Connection con=Myconnect.connect();
HttpSession cid= request.getSession();
Object n=cid.getAttribute("cid1");
//PreparedStatement stmnt=con.prepareStatement("select order_id,product_Id,product_qty from cart where Cust_id="+n);

PreparedStatement stmnt=con.prepareStatement("select p.product_Id, p.product_Name,p.product_Price,c.product_qty from product p join cart c on p.product_Id=c.product_Id");
ResultSet rs= stmnt.executeQuery();

while(rs.next()){
%>
<tr>

<td><%=rs.getInt("product_Id") %></td>
<td><%=rs.getString("product_Name") %></td>
<td><%=rs.getInt("product_Price") %></td>
<td><%=rs.getInt("product_qty") %></td>
</tr>

<% 
pr=rs.getInt("product_Price");
qty=rs.getInt("product_qty");
total=pr*qty;
grand=grand+total;
count=count+1;
}

System.out.println(count);
} catch (Exception e) {
e.printStackTrace();
}
%> 

  
</table>

</body>
</html>
<h4>Cart <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <b><%=count %></b></span></h4>
      <p>Total <span class="price" style="color:black"><b><%=grand%></b></span></p>
    </div>
  </div>
                 <div class="col-50">
            <h2>Payment</h2>
			<div class="container">
			<h2>Pay via</h2>
			<div class="btn-group">
				<a href= "#"><button type="button" class="btn btn-primary">Online Payment</button></a>
				<button type="button"  class="btn btn-primary">cash on delivery </button>
				             </div>
          </div>
		  </div>
      </form>
    </div>
  </div>
  
</div>

</body>
</html>

</body>
</html>