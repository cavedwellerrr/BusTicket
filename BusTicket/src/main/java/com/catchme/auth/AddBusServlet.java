package com.catchme.auth;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.catchme.model.Bus;
import com.catchme.model.Staff;

@WebServlet("/AddBusServlet")
public class AddBusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddBusServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        Staff staff = (session != null) ? (Staff) session.getAttribute("staff") : null;

        if (staff == null) {
           
            response.sendRedirect(request.getContextPath() + "/staff/staffLogin.jsp");
            return;
        }

        
        Bus bus = new Bus();
        bus.setPlateNo(request.getParameter("plateNo"));
        bus.setSeats(request.getParameter("seats"));
        bus.setSeatAvailable(Integer.parseInt(request.getParameter("seatAvailable")));
        bus.setDeptTime(request.getParameter("deptTime"));
        bus.setArrTime(request.getParameter("arrTime"));
        bus.setRoute(request.getParameter("route"));

        
        BusDAO service = new BusDAO();
        service.Addbus(bus);

        
        response.sendRedirect(request.getContextPath() + "/staff/RM/rmDashboard.jsp");
    }
}
