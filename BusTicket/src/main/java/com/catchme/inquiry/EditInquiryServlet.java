package com.catchme.inquiry;

import com.catchme.db.DBconnection;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.*;

@WebServlet("/EditInquiryServlet")
public class EditInquiryServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String supportId = request.getParameter("support_id");
        String status = request.getParameter("status");

        try (Connection con = DBconnection.getConnection()) {
            String sql = "UPDATE customer_support SET status = ? WHERE support_id = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, status);
            stmt.setString(2, supportId);
            stmt.executeUpdate();

            response.sendRedirect("InquiryDashboardServlet");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error updating inquiry: " + e.getMessage());
        }
    }
}
