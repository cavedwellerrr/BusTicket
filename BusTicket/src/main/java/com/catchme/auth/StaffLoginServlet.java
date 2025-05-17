package com.catchme.auth;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.catchme.model.Staff;
import com.catchme.db.DBconnection;
import com.catchme.model.Admin;
import com.catchme.model.CustomerSupport;
import com.catchme.model.RouteManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession; 



@WebServlet("/StaffLoginServlet")
public class StaffLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sUser= request.getParameter("staffusername");
		String sPass= request.getParameter("staffpassword");
		String Role= request.getParameter("role");
		
		try {
			Connection con= DBconnection.getConnection();
			
			PreparedStatement pst= con.prepareStatement("SELECT * FROM staff WHERE Username=? AND Password=? AND Role=?");
			pst.setString(1, sUser);
			pst.setString(2, sPass);
			pst.setString(3, Role);
			
			ResultSet rs= pst.executeQuery();
			
			if(rs.next()) {
				
				int sID= rs.getInt("sID");
				String sName= rs.getString("Name");
				String sEmail= rs.getString("Email");
				String sPhone= rs.getString("Phone");
				
				Staff staff=null;
				switch(Role) {
				case "Admin":
					staff= new Admin(sID, sName, sUser, sPass, sEmail, sPhone);
					break;
				
				case "Customer Support":
					staff= new CustomerSupport(sID, sName, sUser, sPass, sEmail, sPhone);
					break;
					
				case "Route Manager":
					staff= new RouteManager(sID, sName, sUser, sPass, sEmail, sPhone);
					break;
				
				}
				
				HttpSession session= request.getSession();
				session.setAttribute("staff", staff);
				
				switch(Role) {
				
				case "Admin":
					 response.sendRedirect("adminDashboardServlet");
					break;
					
				case "Customer Support":
					response.sendRedirect("staff/CS/csDashboard.jsp");
					break;
					
				case "Route Manager":
					response.sendRedirect("ListBusServlet");
					break;
				
				}
				
			}else {
				response.sendRedirect("staff/staffLogin.jsp?error=invalid!");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
