<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.catchme.model.Staff" %>
<%@ page import="com.catchme.model.Admin" %>
<%@ page import="com.catchme.model.RouteManager" %>
<%@ page import="com.catchme.model.CustomerSupport" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add Admin</title>

<!-- css file -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/addAdmin.css">


</head>
<body>

<%@ include file="../staffNavbar.jsp" %>

<%
	Staff staff = (Staff) session.getAttribute("staff");

	if(staff == null){
		response.sendRedirect("/BusTicket/staff/staffLogin.jsp");
	}

%>



<div class="add-admin-container">

	
	<form action="/BusTicket/addAdminServlet" method="post" class="add-admin">
		<h2 style="text-align: center;" class="my-5">Add New Admin</h2>
		
		<label for="name" name="admin-name-label">Name</label><br>
		<input type="text" name="admin-name" required><br><br>
		
		<label for="username" name="admin-user-label">Username</label><br>
		<input type= "text" name="admin-username" required><br><br>
		
		<label for="email" name="admin-email-label">Email</label><br>
		<input type= "email" name="admin-email" required><br><br>
		
		<label for="password" name="admin-pass-label">Password</label><br>
		<input type= "text" name="admin-password" required><br><br>
		
		<label for="password" name="admin-pass-label">Role</label><br>
		<input type="text" class="form-control" id="role" value="Admin" readonly><br>
  		<input type="hidden" name="admin-role" value="Admin">
		
		<label for="phone" name="admin-user-phone">Phone</label><br>
		<input type= "text" name="admin-phone" required><br><br>
		
		
		
		<button type="submit" name="add-admin-button" class="btn btn-success">Add Admin</button>
		<button type="reset" class="btn btn-danger">Cancel</button>
	
	
	</form>



</div>

</body>
</html>