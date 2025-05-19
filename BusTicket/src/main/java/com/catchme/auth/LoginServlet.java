package com.catchme.auth;

import com.catchme.util.PasswordUtil;
import com.catchme.db.DBconnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
		String username = request.getParameter("username");
		String rawPassword = request.getParameter("password");

		// Hash password
		String hashedPassword = PasswordUtil.hashPassword(rawPassword);
		
		//to see details in console(to check password when it has error)
		System.out.println("Submitted username: " + username); 
		System.out.println("Submitted raw password: " + rawPassword);
		System.out.println("Submitted hashed password: " + hashedPassword);

		try (Connection con = DBconnection.getConnection()) {
			if (con == null) {
				System.out.println("Database connection failed");
				response.sendRedirect("login.jsp?error=Database connection error");
				return;
			}

			PreparedStatement checkUser = con.prepareStatement("SELECT * FROM passenger WHERE Username = ?");
			checkUser.setString(1, username);
			ResultSet rs = checkUser.executeQuery();

			if (rs.next()) {
				String dbPassword = rs.getString("Password");
				

				if (hashedPassword.equals(dbPassword)) {
					HttpSession session = request.getSession();
					session.setAttribute("username", username);
					System.out.println("Login successful");
					response.sendRedirect("index.jsp");
				} else {
					System.out.println("Password mismatch");
					response.sendRedirect("login.jsp?error=Invalid username or password");
				}
			} else {
				System.out.println("Username not found in database");
				response.sendRedirect("login.jsp?error=Invalid username or password");
			}

			rs.close();
			checkUser.close();
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("login.jsp?error=Database error");
		}
	}
}
