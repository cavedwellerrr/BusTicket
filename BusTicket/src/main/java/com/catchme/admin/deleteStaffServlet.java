package com.catchme.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
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


@WebServlet("/deleteStaffServlet")
public class deleteStaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int sID= Integer.parseInt(request.getParameter("sID"));
		staffDao dao= new staffDao();
		boolean deleted= dao.deleteStaff(sID);
		
		if(deleted) {
			response.sendRedirect("adminDashboardServlet");
		}else {
			response.sendRedirect("adminDashboardServlet?error=deleteFailed");
		}
	}

	

}
