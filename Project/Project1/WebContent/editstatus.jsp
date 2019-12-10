<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@page import="Respository.*,Utilities.*, entities.*" %>
    <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>status</title>
</head>
<body>
<%

int id=Integer.parseInt(request.getParameter("order_id"));
String status=request.getParameter("status");
try
{
	
	System.out.println(id);
	System.out.println(status);
	
Class.forName("com.mysql.jdbc.Driver");
Connection con =Myconnect.connect();
Statement st=con.createStatement();

int i=st.executeUpdate("update cart set status='"+status+"'where order_id='"+id+"'");

System.out.println(i);
response.sendRedirect("Adminhome.jsp");  
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
</body>
</html>