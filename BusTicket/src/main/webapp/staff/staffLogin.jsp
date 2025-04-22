<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Staff Login</title>

<!-- font awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<!-- Boostrap css -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">


<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>

	<a href="../login.jsp" class="back">
		<i class="fa-solid fa-arrow-left" ></i>
	</a>
	
	
	
	
	<div class= "login-container">
	
		<%
			String logout= request.getParameter("logout");
			if(logout!=null && logout.equals("success")){
		%>
			<div class="alert alert-success" role="alert">
					Successfully logged out!
			</div>
		<%
			}
		%>
		
		<h2>Staff Login</h2>
		
		
		
		<%
			String error = request.getParameter("error");
			if(error!=null){
		%>
			<div class="alert alert-danger" role="alert">
					Invalid username,password, or role. Please login again!
			</div>
		<%
			}		
		%>
		
		
		<form action="../StaffLoginServlet" method="post">
			Username: <input type= "text" name="staffusername" required><br><br>
			Password: <input type="password" name="staffpassword" required><br><br>	
			
			<label for="role">Select Role: </label>
				<select id="role" name="role" class="form-control">
				    <option value="Admin">Admin</option>
				    <option value="Customer Support">Customer Support</option>
				    <option value="Route Manager">Route Manager</option>
				</select>
			
			<button type="submit" class="btn btn-primary w-100 mt-4">Login as Staff Member</button>
		
		</form>
	</div>
		


</body>
</html>