package Respository;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Utilities.Myconnect;
import entities.ogs;

public class ogsDAO {
	static Connection dbConnection = null;

	
	public static int save(ogs o) throws ClassNotFoundException, SQLException, IOException {
		dbConnection = Myconnect.connect();

		int status = 0;
		try {
			
			PreparedStatement ps = dbConnection.prepareStatement("insert into product(product_Name,product_Price,product_Desc) values (?,?,?)");
			
			ps.setString(1,o.getNm());
			ps.setString(2,o.getPrice());
			ps.setString(3,o.getDesc());

			status = ps.executeUpdate();
         System.out.println("rows inserted");
			dbConnection.close();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}
	 public static int update(ogs o) throws ClassNotFoundException, SQLException, IOException{  
			dbConnection = Myconnect.connect();

	        int status=0;  
	        try{  
	            
	            PreparedStatement ps=dbConnection.prepareStatement(  
	                         "update product set product_Name=?,product_Price=?,product_Desc=? where product_Id=?");  
	            ps.setString(1,o.getNm());
	    		ps.setString(2,o.getPrice());
	    		ps.setString(3,o.getDesc());
	    		ps.setInt(4,o.getId());;  
	            
	              
	            status=ps.executeUpdate();  
	              
	            dbConnection.close();  
	        }catch(Exception ex){ex.printStackTrace();}  
	          
	        return status;  
	    } 
	 public static int delete(int id) throws ClassNotFoundException, SQLException, IOException{  
			dbConnection = Myconnect.connect();

	        int status=0;  
	        try{  
	          
	            PreparedStatement ps=dbConnection.prepareStatement("delete from product where product_Id=?");  
	            ps.setInt(1,id);  
	            status=ps.executeUpdate();  
	              
	            dbConnection.close();  
	        }catch(Exception e){e.printStackTrace();}  
	          
	        return status;  
	    }  
	 public static List<ogs> getAllProducts() throws ClassNotFoundException, SQLException, IOException{  
			dbConnection = Myconnect.connect();

	        List<ogs> list=new ArrayList<ogs>();  
	          
	        try{  
	            PreparedStatement ps=dbConnection.prepareStatement("select * from product");  
	            ResultSet rs=ps.executeQuery();  
	            while(rs.next()){  
	                ogs o=new ogs();  
	                o.setId(rs.getInt(1));  
	                o.setNm(rs.getString(2));  
	                o.setPrice(rs.getString(3));  
	                o.setDesc(rs.getString(4));  
	                
	                list.add(o);  
	            }  
	            dbConnection.close();  
	        }catch(Exception e){e.printStackTrace();}  
	          
	        return list;  
	    }

	public static ogs getProductsById(int id) throws ClassNotFoundException, SQLException, IOException {
		dbConnection = Myconnect.connect();

		 ogs o=new ogs();  
         
	        try{  
	           
	            PreparedStatement ps=dbConnection.prepareStatement("select * from product where product_Id=?");  
	            ps.setInt(1,id);  
	            ResultSet rs=ps.executeQuery();  
	            if(rs.next()){  
	                o.setId(rs.getInt(1));  
	                o.setNm(rs.getString(2));  
	                o.setPrice(rs.getString(3));  
	                o.setDesc(rs.getString(4));  
	                
	            }  
	            dbConnection.close();  
	        }catch(Exception ex){ex.printStackTrace();}  
	          
	        return o;  
	}  
	

}