package com.catchme.inquiry;

import com.catchme.db.DBconnection;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.*;

@WebServlet("/DeleteInquiryServlet")
public class DeleteInquiryServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String supportId = request.getParameter("support_id");

        try (Connection con = DBconnection.getConnection()) {
            String sql = "DELETE FROM customer_support WHERE support_id = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, supportId);
            stmt.executeUpdate();

            response.sendRedirect("InquiryDashboardServlet");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error deleting inquiry: " + e.getMessage());
        }
    }
}
