package com.catchme.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.catchme.model.Staff;
import com.catchme.dao.staffDao;
import com.catchme.db.DBconnection;
import com.catchme.model.Admin;



@WebServlet("/addAdminServlet")
public class addAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String adminName= request.getParameter("admin-name");
		String adminUsername= request.getParameter("admin-username");
		String adminEmail= request.getParameter("admin-email");
		String adminPassword= request.getParameter("admin-password");
		String adminRole= request.getParameter("admin-role");
		String adminPhone= request.getParameter("admin-phone");
		
		Staff staff= new Admin( 0, adminName, adminUsername, adminEmail, adminPassword, adminPhone);
		boolean success;
		//call the dao
		try {
			 success= staffDao.insertStaff(staff);
			 
			 if(success) {
				 HttpSession session= request.getSession();
				 session.setAttribute("staff", staff);
				 response.sendRedirect(request.getContextPath() + "/adminDashboardServlet");
			 }else {
				 response.sendRedirect("admin/addAdmin.jsp?error=insertFailed");
			 }
			 
			 
			 
		} catch (SQLException e) {
			
			e.printStackTrace();
			 response.sendRedirect("admin/addAdmin.jsp?error=databaseError");
		}
		
		
		
		
		
		
	}

}
