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
import com.catchme.model.RouteManager;


@WebServlet("/addRMServlet")
public class addRMServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rmName= request.getParameter("rm-name");
		String rmUsername= request.getParameter("rm-username");
		String rmEmail= request.getParameter("rm-email");
		String rmPassword= request.getParameter("rm-password");
		String rmRole= request.getParameter("rm-role");
		String rmPhone= request.getParameter("rm-phone");
		
		Staff staff= new RouteManager( 0, rmName, rmUsername, rmEmail, rmPassword, rmPhone);
		boolean success;
		//call the dao
		try {
			 success= staffDao.insertStaff(staff);
			 
			 if(success) {
				 HttpSession session= request.getSession();
				 session.setAttribute("staff", staff);
				 response.sendRedirect(request.getContextPath() + "/adminDashboardServlet");
			 }else {
				 response.sendRedirect("/staff/admin/addAdmin.jsp?error=insertFailed");
			 }
			 
			 
			 
		} catch (SQLException e) {
			
			e.printStackTrace();
			 response.sendRedirect("/staff/admin/addAdmin.jsp?error=databaseError");
		}
		
	}

}
