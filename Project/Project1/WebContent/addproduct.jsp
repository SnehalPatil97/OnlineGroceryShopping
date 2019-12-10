<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Respository.*,Utilities.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String product_Name=request.getParameter("product_Name");
int product_Price =Integer.parseInt(request.getParameter("product_Price"));
String product_Desc=request.getParameter("product_Desc");


try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con =Myconnect.connect();
Statement st=con.createStatement();

int i=st.executeUpdate("insert into product(product_Name,product_Price,product_Desc) values('"+product_Name+"','"+product_Price+"','"+product_Desc+"')");
%>
<h1><style>="color:white" </style>Data is successfully inserted!</h1>
<%
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