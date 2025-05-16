<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register here</title>

<!-- font awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<!-- Boostrap css -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<!-- css file -->
<link rel="stylesheet" href="css/register.css">

</head>
<body>

	<a href="login.jsp" class="back">
		<i class="fa-solid fa-arrow-left" ></i>
	</a>
	
	
	<div class= "register-container">
		<h2>Passenger Sign Up</h2>
		<form action="#" method="post">
			Name: <input type= "text" name="pname" required><br><br>
			Username: <input type= "text" name="username" required><br><br>
			Password: <input type= "password" name="password" required><br><br>	
			Email: <input type= "email" name="email" required><br><br>	
			Phone: <input type= "text" name="phone" required><br><br>	
			
			
			
			<button type="submit" class="btn btn-primary w-100 mt-4">Register as Passenger</button>
			
			
		
		</form>
	</div>

	

</body>
</html>