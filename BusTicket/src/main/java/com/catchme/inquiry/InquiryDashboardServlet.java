package com.catchme.inquiry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.catchme.model.contactUs;

import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/InquiryDashboardServlet")
public class InquiryDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        ArrayList<contactUs> cs = new ArrayList<>();

        try (Connection conn = com.catchme.db.DBconnection.getConnection()) {
            String sql = "SELECT * FROM customer_support";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                contactUs cus = new contactUs(0, sql, sql, sql, sql, sql);
                cus.setSupport_id(rs.getInt("support_id"));
                cus.setEmail(rs.getString("email"));
                cus.setPhone(rs.getString("phone"));
                cus.setSuject(rs.getString("subject"));
                cus.setInquiry(rs.getString("inquiry"));
                cus.setStatus(rs.getString("status"));
                cs.add(cus);
            }

            request.setAttribute("inquiries", cs);  // ✅ Match with JSP

            RequestDispatcher dispatcher = request.getRequestDispatcher("/staff/CS/csDashboard.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Database error: " + e.getMessage());
        }
    }
}
