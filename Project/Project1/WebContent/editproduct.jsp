<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Respository.*,Utilities.*" %>
    <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int id=Integer.parseInt(request.getParameter("product_Id"));
String name=request.getParameter("product_Name");
int price=Integer.parseInt(request.getParameter("product_Price"));
String desc=request.getParameter("product_Desc");


try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con =Myconnect.connect();
Statement st=con.createStatement();

int i=st.executeUpdate("update product set product_Name='"+name+"',product_Price="+price+",product_Desc='"+desc+"' where product_Id='"+id+"'");

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