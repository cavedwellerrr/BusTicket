<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<!-- font awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<!-- Boostrap css -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<!-- css file -->
<link rel="stylesheet" href="css/login.css">

</head>
<body>

	<a href="index.jsp" class="back">
		<i class="fa-solid fa-arrow-left" ></i>
	</a>
	
	
	<div class= "login-container">
		<h2>Passenger Login</h2>
		
		<%
			String error= request.getParameter("error");
		if(error!=null){
		%>
			<div class="alert alert-danger" role="alert">
				Invalid username or password. Please login again!
			</div>
			
		<%
			}		
		%>
		
		<form action="LoginServlet" method="post">
			Username: <input type= "text" name="username" required><br><br>
			Password: <input type= "password" name="password" required><br><br>	
			
			<a href="register.jsp">Don't have an account?</a>
			
			<button type="submit" class="btn btn-primary w-100 mt-4">Login as Passenger</button>
			
			<a href="staff/staffLogin.jsp">
				<button type="button" class="btn btn-primary w-100 mt-4">Login as Staff </button>			
			</a>
		
		</form>
	</div>
		

	

</body>
</html>