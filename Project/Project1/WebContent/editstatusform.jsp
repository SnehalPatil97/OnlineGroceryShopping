<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
       <%@page import="Respository.*,Utilities.*, entities.*" %>
    <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<%  
String id=request.getParameter("id"); 
System.out.println(id);
CartBean cart=CartDAO.getStatusById(Integer.parseInt(id));
System.out.println(id);

%>  
 <%System.out.println(cart.getOrder_id());%>
  <%System.out.println(cart.getstatus());%>
<h1>Edit Form</h1>  
<form action="editstatus.jsp" method="post">  
<input type="hidden" name="order_id" value="<%=cart.getOrder_id() %>"/>  
<table>  
<tr><td>STATUS</td><td>  

<input type="text" name="status"  value="<%=cart.getstatus()%>"/></td></tr>   
<tr><td colspan="2"><button type="submit">Edit Status</button></td></tr>  
</table>  
</form> 
</body>
</html>