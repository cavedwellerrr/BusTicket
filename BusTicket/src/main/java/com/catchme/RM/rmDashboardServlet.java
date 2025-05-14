package com.catchme.RM;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.catchme.dao.staffDao;
import com.catchme.model.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/rmDashboardServlet")
public class rmDashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try {
			System.out.println("fetching staff List");
			List<Staff> staffList= staffDao.getAllStaff();
			
			if(staffList!=null && !staffList.isEmpty()) {
				request.setAttribute("staffList", staffList);
			}else {
				System.out.println("No staff found");
			}
			
			RequestDispatcher rd= request.getRequestDispatcher("/staff/RM/rmDashboard.jsp");
			rd.forward(request, response);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}

	

}
