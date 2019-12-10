package com.niit.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Respository.custDAO;
import entities.cust;

/**
 * Servlet implementation class Saveservlet
 */
public class Saveservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Saveservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String first_name=request.getParameter("first_name");
		String Last_name=request.getParameter("Last_name");
		String contact=request.getParameter("contact");
		String Email=request.getParameter("Email");
		String Address=request.getParameter("Address");
		String password=request.getParameter("password");
		String Rpassword=request.getParameter("Reenter");
		
		cust e=new cust();
		e.setfirst_name(first_name);
		e.setLast_name(Last_name);
		e.setcontact(contact);
		e.setEmail(Email);
		e.setAddress(Address);
		e.setpassword(password);
		e.setReenter(Rpassword);
		
		int status = 0;
		try {
			status = custDAO.save(e);
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if(status>0){
			out.print("<p><h3>Record saved successfully!<h3></p>");
			request.getRequestDispatcher("index.html").include(request, response);
		}else{
			out.println("Sorry! unable to save record");
		}
		
		out.close();
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
