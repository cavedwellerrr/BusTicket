
<%@ page import="com.catchme.model.Staff" %>
<%@ page import="java.util.List" %>
<%@ page import="com.catchme.model.Bus" %>
<%
    Staff staff = (Staff) session.getAttribute("staff");
    if (staff == null) {
        response.sendRedirect(request.getContextPath() + "/staff/staffLogin.jsp");
        return;
    }

    List<Bus> busList = (List<Bus>) request.getAttribute("busList");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Route Manager Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">

    <h2>Welcome, Route Manager </h2>
    <a href="<%= request.getContextPath() %>/staff/staffLogout.jsp" class="btn btn-secondary mb-3">Logout</a>
    <a href="<%= request.getContextPath() %>/staff/RM/addbus.jsp" class="btn btn-primary mb-3">Add New Bus</a>

    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>Bus ID</th>
                <th>Plate No</th>
                <th>Total Seats</th>
                <th>Available Seats</th>
                <th>Departure Time</th>
                <th>Arrival Time</th>
                <th>Route</th>
                <th>Price per Seat</th> 
                <th>Action</th> 
            </tr>
        </thead>
        <tbody>
            <%
                if (busList != null && !busList.isEmpty()) {
                    for (Bus bus : busList) {
            %>
            <tr>
                <td><%= bus.getBusId() %></td>
                <td><%= bus.getPlateNo() %></td>
                <td><%= bus.getSeats() %></td>
                <td><%= bus.getSeatAvailable() %></td>
                <td><%= bus.getDeptTime() %></td>
                <td><%= bus.getArrTime() %></td>
                <td><%= bus.getRoute() %></td>
                <td>Rs.<%= String.format("%.2f", bus.getPricePerSeat()) %></td> 
                <td> 
                    <a href="<%= request.getContextPath() %>/staff/RM/editbus.jsp?busId=<%= bus.getBusId() %>" class="btn btn-sm btn-warning">Edit</a>
                    <a href="<%= request.getContextPath() %>/DeleteBusServlet?busId=<%= bus.getBusId() %>" class="btn btn-sm btn-danger">Delete</a>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="9">No buses found in the system.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>


