package com.niit.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Utilities.Myconnect;

/**
 * Servlet implementation class adminLogin
 */
public class adminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminLogin() {
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
		
		String Email=request.getParameter("uname");
		String password=request.getParameter("psw");
		
		Connection con;
		try {
			con = Myconnect.connect();
		 
		PreparedStatement stmnt=con.prepareStatement("select ad_password from admin where ad_email=?");
		stmnt.setString(1,Email);
		ResultSet rs= stmnt.executeQuery();
		
		while(rs.next()){
			
		if(password.equals(rs.getString(1)) ){
			HttpSession hs= request.getSession();
			hs.setAttribute("Email", Email );
			response.sendRedirect("Adminhome.jsp");
			
		
		
		}
		
		else
		{
			out.println("Invalid Credentials");
			request.getRequestDispatcher("Admin_login.html").include(request, response);
		break; 
		}
		}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
