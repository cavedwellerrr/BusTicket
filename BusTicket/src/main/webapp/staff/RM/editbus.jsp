<%@ page import="com.catchme.model.Staff" %>
<%@ page import="com.catchme.model.Bus" %>
<%@ page import="com.catchme.auth.BusDAO" %>
<%
    Staff staff = (Staff) session.getAttribute("staff");
    if (staff == null) {
        response.sendRedirect(request.getContextPath() + "/staff/staffLogin.jsp");
        return;
    }

    String busIdParam = request.getParameter("busId");
    int busId = 0;
    Bus bus = null;

    if (busIdParam != null) {
        try {
            busId = Integer.parseInt(busIdParam);
            BusDAO dao = new BusDAO();
            bus = dao.getBusById(busId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    if (bus == null) {
        out.println("<h4>Invalid or missing bus ID</h4>");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Bus</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
    <h2 class="text-center mb-4">Edit Bus</h2>
    <form action="/BusTicket/UpdateBusServlet" method="post">
        
        <input type="hidden" name="busId" value="<%= bus.getBusId() %>">

        <div class="mb-3">
            <label for="plateNo" class="form-label">Plate Number</label>
            <input type="text" class="form-control" id="plateNo" name="plateNo" value="<%= bus.getPlateNo() %>" required>
        </div>

        <div class="mb-3">
            <label for="seats" class="form-label">Total Seats</label>
            <input type="number" class="form-control" id="seats" name="seats" value="<%= bus.getSeats() %>" required>
        </div>

        <div class="mb-3">
            <label for="seatAvailable" class="form-label">Seats Available</label>
            <input type="number" class="form-control" id="seatAvailable" name="seatAvailable" value="<%= bus.getSeatAvailable() %>" required>
        </div>

        <div class="mb-3">
            <label for="deptTime" class="form-label">Departure Time</label>
            <input type="time" class="form-control" id="deptTime" name="deptTime" value="<%= bus.getDeptTime() %>" required>
        </div>

        <div class="mb-3">
            <label for="arrTime" class="form-label">Arrival Time</label>
            <input type="time" class="form-control" id="arrTime" name="arrTime" value="<%= bus.getArrTime() %>" required>
        </div>

        <div class="mb-3">
            <label for="route" class="form-label">Route</label>
            <input type="text" class="form-control" id="route" name="route" value="<%= bus.getRoute() %>" required>
        </div>

        <div class="mb-3">
            <label for="pricePerSeat" class="form-label">Price per Seat (Rs.)</label>
            <input type="number" step="0.01" class="form-control" id="pricePerSeat" name="pricePerSeat" value="<%= bus.getPricePerSeat() %>" required>
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-success me-2">Update Bus</button>
            <a href="<%= request.getContextPath() %>/ListBusServlet" class="btn btn-secondary">Cancel</a>
        </div>
    </form>
</body>
</html>
