package com.niit.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import Respository.*;
import Utilities.*;
import entities.*;

/**
 * Servlet implementation class custLogin
 */
public class custLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public custLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String Email=request.getParameter("username");
		String password=request.getParameter("password");
		
		Connection con;
		try {
			con = Myconnect.connect();
		 
		PreparedStatement stmnt=con.prepareStatement("select password from customer where Email=?");
		stmnt.setString(1,Email);
		ResultSet rs= stmnt.executeQuery();
		
		while(rs.next()){
			
		if(password.equals(rs.getString(1)) ){
		HttpSession hs= request.getSession();
		hs.setAttribute("Email", Email );
			
			//request.getRequestDispatcher("userhome.jsp").include(request, response);
		response.sendRedirect("userhome.jsp");
		
		}
		
		else
		{
			out.println("Invalid Credentials");
			request.getRequestDispatcher("index.html").include(request, response);
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
