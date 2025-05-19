package com.catchme.inquiry;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import com.catchme.db.DBconnection;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

		int supportId1 = Integer.parseInt(request.getParameter("supportId"));

        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String subject = request.getParameter("subject");
        String inquiry = request.getParameter("inquiry");
        String status = "Pending";
        
        // Fallback if subject is empty
        if (subject == null || subject.trim().isEmpty()) {
            subject = "General";
        }

        try {
            Connection conn = DBconnection.getConnection();
            String sql = "INSERT INTO customer_support (support_id, email, phone, subject, inquiry, status) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setLong(1, supportId1);
            stmt.setString(2, email);
            stmt.setString(3, phone);
            stmt.setString(4, subject);
            stmt.setString(5, inquiry);
            stmt.setString(6, status);
            stmt.executeUpdate();

            request.setAttribute("supportId", supportId1);
            RequestDispatcher rd = request.getRequestDispatcher("SuccessSubmit.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Database error: " + e.getMessage());
        }
    }
}
