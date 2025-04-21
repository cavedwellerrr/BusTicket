<%@ page import="com.catchme.model.Staff" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	Staff staff = (Staff) session.getAttribute("staff");

	if(staff != null){
%>
	
	<h2>Welcome, <%= staff.getsUsername() %>!</h2>
<%
	}else{
		response.sendRedirect("../staff/staffLogin.jsp");
	}

%>

</body>
</html>