package com.catchme.auth;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteBusServlet")
public class DeleteBusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DeleteBusServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("staff") == null) {
            response.sendRedirect(request.getContextPath() + "/staff/staffLogin.jsp");
            return;
        }

        String busIdParam = request.getParameter("busId");

        if (busIdParam != null) {
            try {
                int busId = Integer.parseInt(busIdParam);
                BusDAO dao = new BusDAO();
                dao.deleteBus(busId);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect(request.getContextPath() + "/ListBusServlet");
    }
}
