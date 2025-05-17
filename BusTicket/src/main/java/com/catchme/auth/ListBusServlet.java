package com.catchme.auth;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.catchme.model.Bus;
import com.catchme.model.Staff;

@WebServlet("/ListBusServlet")
public class ListBusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("staff") == null) {
            response.sendRedirect(request.getContextPath() + "/staff/staffLogin.jsp");
            return;
        }

        Staff staff = (Staff) session.getAttribute("staff");

        BusDAO dao = new BusDAO();
        List<Bus> busList = dao.getAllBuses();
        

        request.setAttribute("busList", busList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/staff/RM/rmDashboard.jsp");
        dispatcher.forward(request, response);
    }
}
