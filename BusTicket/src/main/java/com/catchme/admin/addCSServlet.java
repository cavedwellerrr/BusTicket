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
import com.catchme.model.CustomerSupport;

@WebServlet("/addCSServlet")
public class addCSServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String csName= request.getParameter("CS-name");
		String csUsername= request.getParameter("CS-username");
		String csEmail= request.getParameter("CS-email");
		String csPassword= request.getParameter("CS-password");
		String csRole= request.getParameter("CS-role");
		String csPhone= request.getParameter("CS-phone");
		
		Staff staff= new CustomerSupport( 0, csName, csUsername, csEmail, csPassword, csPhone);
		boolean success;
		//call the dao
		try {
			 success= staffDao.insertStaff(staff);
			 
			 if(success) {
				 HttpSession session= request.getSession();
				 session.setAttribute("staff", staff);
				 response.sendRedirect(request.getContextPath() + "/adminDashboardServlet");
			 }else {
				 response.sendRedirect("/staff/admin/addCS.jsp?error=insertFailed");
			 }
			 
		}catch (SQLException e) {
			
			e.printStackTrace();
			 response.sendRedirect("/staff/admin/addCS.jsp?error=databaseError");
		}
		
	}
	
}

