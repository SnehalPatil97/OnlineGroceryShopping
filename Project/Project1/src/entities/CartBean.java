package entities;

public class CartBean {
	private int order_id;
	private int Cust_id;
	private int product_Id;
	private int product_qty;
	private String status;
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getCust_id() {
		return Cust_id;
	}
	public void setCust_id(int cust_id) {
		Cust_id = cust_id;
	}
	public int getProduct_Id() {
		return product_Id;
	}
	public void setProduct_Id(int product_Id) {
		this.product_Id = product_Id;
	}
	public int getProduct_qty() {
		return product_qty;
	}
	public void setProduct_qty(int product_qty) {
		this.product_qty = product_qty;
	}
	public String getstatus() {
		return status;
	}
	public void setstatus(String status) {
		this.status = status;
	}
	
}
