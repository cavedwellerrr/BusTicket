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
import com.catchme.admin.*;

@WebServlet("/updateStaffServlet")
public class updateStaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sID= Integer.parseInt(request.getParameter("staff-sID"));
		String sName= request.getParameter("staff-name");
		String sUsername= request.getParameter("staff-username");
		String sEmail= request.getParameter("staff-email");
		String sPass= request.getParameter("staff-password");
		String sRole = request.getParameter("staff-role");
		String sPhone= request.getParameter("staff-phone");
		
		staffDao dao= new staffDao();
		Staff staff= dao.getStaffByID(sID);
		
		staff.setsName(sName);
		staff.setsUsername(sUsername);
		staff.setsEmail(sEmail);
		staff.setsPassword(sPass);
		staff.setsRole(sRole);
		staff.setsPhone(sPhone);
		
		boolean updated= dao.updateStaff(staff);
		
		if(updated) {
			response.sendRedirect("/BusTicket/adminDashboardServlet");
		}else {
			response.sendRedirect("staff/admin/editStaff.jsp?sID="+ sID+ "&error=true");
		}
	}

}
