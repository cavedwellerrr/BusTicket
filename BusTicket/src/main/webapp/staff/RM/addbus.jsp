<%@ page import="com.catchme.model.Staff" %>
<%
    Staff staff = (Staff) session.getAttribute("staff");
    if (staff == null) {
        response.sendRedirect(request.getContextPath() + "/staff/staffLogin.jsp");
        return;
    }
%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Bus</title>

    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"><link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">Add New Bus</h2>
        <form action="<%= request.getContextPath() %>/AddBusServlet" method="post">
            <div class="mb-3">
                <label for="plateNo" class="form-label">Plate Number</label>
                <input type="text" class="form-control" id="plateNo" name="plateNo" required>
            </div>

            <div class="mb-3">
                <label for="seats" class="form-label">Total Seats</label>
                <input type="number" class="form-control" id="seats" name="seats" required>
            </div>

            <div class="mb-3">
                <label for="seatAvailable" class="form-label">Seats Available</label>
                <input type="number" class="form-control" id="seatAvailable" name="seatAvailable" required>
            </div>

            <div class="mb-3">
                <label for="deptTime" class="form-label">Departure Time</label>
                <input type="time" class="form-control" id="deptTime" name="deptTime" required>
            </div>

            <div class="mb-3">
                <label for="arrTime" class="form-label">Arrival Time</label>
                <input type="time" class="form-control" id="arrTime" name="arrTime" required>
            </div>

            <div class="mb-3">
                <label for="route" class="form-label">Route</label>
                <input type="text" class="form-control" id="route" name="route" required>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary me-2">Add Bus</button>
                <button type="reset" class="btn btn-secondary">Reset</button>
            </div>
        </form>
    </div>
</body>
</html>
