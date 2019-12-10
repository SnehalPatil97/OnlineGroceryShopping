<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
  <%@page import="Respository.*,Utilities.*"%>
  <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>

<%


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View</title>
</head>
<body>
  
<h1>Product List</h1>  
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
<td><%=rs.getString("product_Price") %></td>
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


</body>
</html>