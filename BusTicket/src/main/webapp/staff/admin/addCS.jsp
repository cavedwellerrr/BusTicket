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
<title>add Customer Support</title>

<!-- css file -->
<link rel="stylesheet" href="../../css/addCS.css">


</head>
<body>

<%@ include file="../staffNavbar.jsp" %>

<%
	Staff staff = (Staff) session.getAttribute("staff");

	if(staff == null){
		response.sendRedirect("/BusTicket/staff/staffLogin.jsp");
	}

%>

<div class="add-cs-container">

	
	<form action="/BusTicket/addCSServlet" method="post" class="add-CS">
		<h2 style="text-align: center;" class="my-5">Add New Customer Support</h2>
		
		<label for="name" name="admin-name-label">Name</label><br>
		<input type="text" name="CS-name" required><br><br>
		
		<label for="username" name="admin-user-label">Username</label><br>
		<input type= "text" name="CS-username" required><br><br>
		
		<label for="email" name="admin-email-label">Email</label><br>
		<input type= "email" name="CS-email" required><br><br>
		
		<label for="password" name="admin-pass-label">Password</label><br>
		<input type= "text" name="CS-password" required><br><br>
		
		<label for="password" name="admin-pass-label">Role</label><br>
		<input type="text" class="form-control" id="role" value="Customer Support" readonly><br>
  		<input type="hidden" name="CS-role" value="Admin">
		
		<label for="phone" name="admin-user-phone">Phone</label><br>
		<input type= "text" name="CS-phone" required><br><br>
		
		
		
		<button type="submit" name="add-CS-button" class="btn btn-success">Add Customer Support</button>
		<button type="reset" class="btn btn-danger">Cancel</button>
	
	
	</form>



</div>

</body>
</html>