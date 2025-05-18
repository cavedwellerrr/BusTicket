package com.catchme.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.catchme.dao.passengerDao;
import com.catchme.model.Passenger;

@WebServlet("/PassengerController")
public class PassengerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Handles viewing and edit loading
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");

		if (username == null) {
			response.sendRedirect("login.jsp");
			return;
		}

		Passenger passenger = passengerDao.getPassengerByUsername(username);
		request.setAttribute("passenger", passenger);

		String action = request.getParameter("action");
		if ("edit".equals(action)) {
			request.getRequestDispatcher("editaccount.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("account.jsp").forward(request, response);
		}
	}

	// Handles form submission from editaccount.jsp
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");

		if (username == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		
		String action=request.getParameter("action");
		
		if("delete".equals(action)) {
			boolean deleted=passengerDao.deletePassengerByUserName(username);
			if(deleted) {
				session.invalidate();
				response.sendRedirect("index.jsp?deleted=true");

			}else {
				response.sendRedirect("about.jsp?error=delete_failed");
			}
			return;
		}

		Passenger updated = new Passenger();
		updated.setUsername(username);  // Use session value, not string "username"
		updated.setName(request.getParameter("name"));
		updated.setEmail(request.getParameter("email"));
		updated.setPhone(request.getParameter("phone"));

		boolean success = passengerDao.updatePassenger(updated);

		if (success) {
			// Reload account page
			response.sendRedirect("PassengerController?success=true");
		} else {
			request.setAttribute("error", "Update Failed!");
			request.setAttribute("passenger", updated); // So form stays filled
			request.getRequestDispatcher("editaccount.jsp").forward(request, response);
		}
		
		
		
	}
	

}
