package Respository;

import java.io.IOException;
import java.sql.*;


import Utilities.Myconnect;
import entities.CartBean;
import entities.ogs;

public class CartDAO {

	static Connection dbConnection = null;
	public static int addCartDetails(CartBean cart) throws ClassNotFoundException, IOException, SQLException {
		
		
		dbConnection=Myconnect.connect();
		PreparedStatement ps=dbConnection.prepareStatement("insert into Cart (Cust_id, product_Id, product_qty) values(?,?,?)");
		ps.setInt(1, cart.getCust_id());
		ps.setInt(2, cart.getProduct_Id());
		ps.setInt(3, cart.getProduct_qty());
		
		System.out.println(ps);
		int status=ps.executeUpdate();
		return status;
	}

public static CartBean getStatusById(int id) throws ClassNotFoundException, SQLException, IOException {
	dbConnection = Myconnect.connect();

	CartBean cart=new CartBean();
     
        try{  
           
            PreparedStatement ps=dbConnection.prepareStatement("select * from cart where order_id=?");  
            ps.setInt(1,id);  
            ResultSet rs=ps.executeQuery();  
            if(rs.next()){  

                cart.setstatus(rs.getString(5));
                cart.setOrder_id(rs.getInt(1));
             System.out.println(rs);
            }  
            dbConnection.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return cart;  
}  

}