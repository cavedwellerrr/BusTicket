
<%@ page import="com.catchme.model.Staff" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<!-- font awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<!-- Boostrap css -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

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


<a href="../staffLogout.jsp">Logout</a>


</body>
</html>