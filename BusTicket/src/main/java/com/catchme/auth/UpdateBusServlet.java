package com.catchme.auth;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.catchme.model.Bus;
import com.catchme.model.Staff;

@WebServlet("/UpdateBusServlet")
public class UpdateBusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateBusServlet() {
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
        bus.setBusId(Integer.parseInt(request.getParameter("busId")));
        bus.setPlateNo(request.getParameter("plateNo"));
        bus.setSeats(Integer.parseInt(request.getParameter("seats")));
        bus.setSeatAvailable(Integer.parseInt(request.getParameter("seatAvailable")));
        bus.setDeptTime(request.getParameter("deptTime"));
        bus.setArrTime(request.getParameter("arrTime"));
        bus.setRoute(request.getParameter("route"));
        bus.setPricePerSeat(Double.parseDouble(request.getParameter("pricePerSeat")));

        
        BusDAO dao = new BusDAO();
        dao.updateBus(bus);

        
        response.sendRedirect(request.getContextPath() + "/ListBusServlet");
    }
}
