<%
	if(session.getAttribute("username")==null){
		response.sendRedirect("login.jsp");
	}
%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Css link -->
<link rel="stylesheet" type="text/css" href="css/account.css">
</head>
<body>

<h1>Your Account Details</h1>

<%
	String username= (String) session.getAttribute("username");
%>

<h1>Welcome, <%= username %>!</h1>

<a href="logout.jsp">Logout</a>

</body>
</html>