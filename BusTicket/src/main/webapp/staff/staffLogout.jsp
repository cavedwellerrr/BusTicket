<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ page language="java" session="true" %>
<%
    // Invalidate the current session
    session.invalidate();

    // Redirect to login page
    response.sendRedirect("staffLogin.jsp?logout=success");
%>


</body>
</html>