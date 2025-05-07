<%@ page import="com.catchme.model.Staff" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Staff staff = (Staff) session.getAttribute("staff");

    if (staff == null) {
        
        response.sendRedirect(request.getContextPath() + "/staff/staffLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Route Manager Dashboard</title>
</head>
<body>
    <a href="<%= request.getContextPath() %>/staff/RM/addbus.jsp" class="btn btn-primary">Add New Bus</a>
     
    <h2>Welcome, <%= staff.getsUsername() %>!</h2>
    <a href="<%= request.getContextPath() %>/staff/staffLogout.jsp">Logout</a>
</body>
</html>