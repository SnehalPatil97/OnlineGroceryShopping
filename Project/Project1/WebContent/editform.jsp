<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
       <%@page import="Respository.*,Utilities.*, entities.*" %>
    <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
h1{color:white; font-size:40px;}
body{
 display: grid;
  justify-items: center;
  padding-top:300px;
	 background-image:url(logg.jpg);
	 background-size:100%;
	 background-repeat:repeat;
	 color:gray;
}

button[type="submit"] {
  width:40%;
  height:10%;
  padding:10px;
  background:#0097bd;
  color:black;
  font:bold 14px Times New Roman, sans-serif;
  border-radius:4px;
  cursor:pointer;
  }
  button[type="submit"]:hover {
  background:indigo;
  color:white;
  transition: background ease-in .1s;
}
</style>
</head>
<body>

<%  
String id=request.getParameter("id");  
ogs o=ogsDAO.getProductsById(Integer.parseInt(id));  

%>  
  
<h1>Edit Form</h1>  
<form action="editproduct.jsp" method="post">  
<input type="hidden" name="product_Id" value="<%=o.getId() %>"/>  
<table>  
<tr><td>Product Name</td><td>  
<input type="text" name="product_Name" value="<%= o.getNm()%>"/></td></tr>  
<tr><td>Product Price:</td><td>  
<input type="text" name="product_Price" value="<%= o.getPrice()%>"/></td></tr>  
<tr><td>Product Description</td><td>  
<input type="text" name="product_Desc" value="<%= o.getDesc()%>"/></td></tr>   

<tr><td colspan="2"><button type="submit">Edit product</button></td></tr>  
</table>  
</form>  
  

</body>
</html>