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
<title>add Route Manager</title>

<!-- css file -->
<link rel="stylesheet" href="../../css/addRM.css">


</head>
<body>

<%@ include file="../staffNavbar.jsp" %>



<div class="add-rm-container">

	
	<form action="/BusTicket/addRMServlet" method="post" class="add-RM">
		<h2 style="text-align: center;" class="my-5">Add New Route Manager</h2>
		
		<label for="name" name="admin-name-label">Name</label><br>
		<input type="text" name="rm-name" required><br><br>
		
		<label for="username" name="admin-user-label">Username</label><br>
		<input type= "text" name="rm-username" required><br><br>
		
		<label for="email" name="admin-email-label">Email</label><br>
		<input type= "email" name="rm-email" required><br><br>
		
		<label for="password" name="admin-pass-label">Password</label><br>
		<input type= "text" name="rm-password" required><br><br>
		
		<label for="password" name="admin-pass-label">Role</label><br>
		<input type="text" class="form-control" id="role" value="Route Manager" readonly><br>
  		<input type="hidden" name="rm-role" value="Route Manager">
		
		<label for="phone" name="admin-user-phone">Phone</label><br>
		<input type= "text" name="rm-phone" required><br><br>
		
		
		
		<button type="submit" name="add-rm-button" class="btn btn-success">Add Route Manager</button>
		<button type="reset" class="btn btn-danger">Cancel</button>
	
	
	</form>



</div>

</body>
</html>