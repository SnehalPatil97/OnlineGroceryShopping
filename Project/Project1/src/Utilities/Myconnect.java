package Utilities;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.*;
import java.util.Properties;
public class Myconnect 
{
public static String password;
static public Connection connect() throws IOException, SQLException, ClassNotFoundException
{
	Properties dbProperties=new Properties();
	FileInputStream fis= new FileInputStream("C:\\Users\\Sanjay Patil\\Desktop\\OS Project\\Project\\Project1\\src\\Utilities\\ogs.properties");
	dbProperties.load(fis);
	String driver1= dbProperties.getProperty("sql.driver");
	String url= dbProperties.getProperty("sql.url");
	String username= dbProperties.getProperty("sql.username"); 
	Myconnect.password= dbProperties.getProperty("sql.password");
	
	Class.forName(driver1);
	Connection con= DriverManager.getConnection(url,username,password);
	return con;
}
}