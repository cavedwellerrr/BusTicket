<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add Customer Support</title>

<!-- css file -->
<link rel="stylesheet" href="../../css/addAdmin.css">


</head>
<body>

<%@ include file="../staffNavbar.jsp" %>



<div class="add-admin-container">

	
	<form action="#" method="post" class="add-admin">
		<h2 style="text-align: center;" class="my-5">Add New Customer Support</h2>
		
		<label for="name" name="admin-name-label">Name</label><br>
		<input type="text" name="cs-name" required><br><br>
		
		<label for="username" name="admin-user-label">Username</label><br>
		<input type= "text" name="cs-username" required><br><br>
		
		<label for="email" name="admin-email-label">Email</label><br>
		<input type= "email" name="cs-email" required><br><br>
		
		<label for="password" name="admin-pass-label">Password</label><br>
		<input type= "text" name="cs-password" required><br><br>
		
		<label for="phone" name="admin-user-phone">Phone</label><br>
		<input type= "text" name="cs-phone" required><br><br>
		
		
		
		<button type="submit" name="add-cs-button" class="btn btn-success">Add Customer Support</button>
		<button type="reset" class="btn btn-danger">Cancel</button>
	
	
	</form>



</div>

</body>
</html>