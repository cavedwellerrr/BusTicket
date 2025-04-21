package com.catchme.auth;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.catchme.db.DBconnection;
import com.catchme.model.Passenger;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Passenger passenger= new Passenger();
		passenger.setUsername(request.getParameter("username"));
		passenger.setPassword(request.getParameter("password"));
		
		try {
			Connection con= DBconnection.getConnection();
			
			if(con!=null) {
				System.out.println("Database connected");
			}else
			{
				System.out.println("Unsuccessful");
			}
			
			
			PreparedStatement pst= con.prepareStatement("SELECT * FROM passenger WHERE Username=? AND Password=?");
			
			pst.setString(1, passenger.getUsername());
			pst.setString(2, passenger.getPassword());
			
			ResultSet rs= pst.executeQuery();
			
			if(rs.next()) {
				HttpSession session= request.getSession();
				session.setAttribute("username", passenger.getUsername());
				response.sendRedirect("account.jsp");
			}else {
				System.out.println("Login fail for user: "+ passenger.getUsername());
				response.sendRedirect("login.jsp?error=Invalid Username or Password");
			}
			
		}catch(Exception e){
			System.out.println(e);
			
		}
	}

}
