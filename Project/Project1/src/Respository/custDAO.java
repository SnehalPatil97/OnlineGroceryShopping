package Respository;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import Utilities.Myconnect;
import entities.cust;
import entities.ogs;

public class custDAO {
	static Connection dbConnection = null;
	
	public static int save(cust e) throws ClassNotFoundException, IOException, SQLException{
		dbConnection = Myconnect.connect();
		int status=0;
		try{
			
			PreparedStatement ps=dbConnection.prepareStatement("insert into customer(first_name, Last_name, contact, Email, Address, password,Reenter_password) values (?,?,?,?,?,?,?)");
			ps.setString(1,e.getfirst_name());
			ps.setString(2,e.getLast_name());
			ps.setString(3,e.getcontact());
			ps.setString(4,e.getEmail());
			ps.setString(5,e.getAddress());
			ps.setString(6,e.getpassword());
			ps.setString(7,e.getReenter());
			
			status=ps.executeUpdate();
			
			dbConnection.close();
		}catch(Exception ex){ex.printStackTrace();}
		
		return status;
	}
	public static List<cust> getAllCustomers() throws ClassNotFoundException, IOException, SQLException{
		
		dbConnection = Myconnect.connect();

		List<cust> list=new ArrayList<cust>();
          
		
			
			PreparedStatement ps=dbConnection.prepareStatement("select * from customer");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				cust e=new cust();
				e.setid(rs.getInt(1));
				e.setfirst_name(rs.getString(2));
				e.setLast_name(rs.getString(3));
				e.setcontact(rs.getString(4));
				e.setEmail(rs.getString(5));
				e.setAddress(rs.getString(6));
				e.setpassword(rs.getString(7));
				e.setReenter(rs.getString(8));
				list.add(e);
			}
			dbConnection.close();
	
		
		return list;
	}

}
