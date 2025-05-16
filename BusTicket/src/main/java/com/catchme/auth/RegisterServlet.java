package com.catchme.auth;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.catchme.db.DBconnection;
import com.catchme.model.Passenger;
/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			Passenger passenger = new Passenger();
			passenger.setUsername(request.getParameter("username"));
			passenger.setName(request.getParameter("name"));
			passenger.setEmail(request.getParameter("email"));
			passenger.setPhone(request.getParameter("phone"));
			passenger.setPassword(request.getParameter("password"));
			
			try {
				Connection con = DBconnection.getConnection();
				
				// Check if username exists
				PreparedStatement check = con.prepareStatement("SELECT * FROM passenger WHERE Username = ?");
				check.setString(1, passenger.getUsername());
				ResultSet rs = check.executeQuery();
				
				if (rs.next()) {
					// Username exists
					response.sendRedirect("register.jsp?error=Username already exists");
				}else {
					// Insert user
					PreparedStatement pst = con.prepareStatement(
							"INSERT INTO passenger (Name, Username, Password, Email, phone) VALUES (?, ?, ?, ?, ?)");
					pst.setString(1, passenger.getName());
					pst.setString(2, passenger.getUsername());
					pst.setString(3, passenger.getPassword());
					pst.setString(4, passenger.getEmail());
					pst.setString(5, passenger.getPhone());

					int rows = pst.executeUpdate();
					if (rows > 0) {
						response.sendRedirect("login.jsp?message=Registration successful");
					}else {
						response.sendRedirect("register.jsp?error=Registration failed");
					}
					pst.close();
				}
				
				rs.close();
				check.close();
				con.close();

			}catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("register.jsp?error=Database error");
			}



	}

}
