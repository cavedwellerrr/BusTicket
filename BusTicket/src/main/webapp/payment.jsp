<%@ page import="com.catchme.db.DBconnection" %>
<%@ page import= "java.sql.Connection" %>
<%@ page import= "java.sql.PreparedStatement" %>
<%@ page import= "java.sql.ResultSet" %>




<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Page</title>

<!-- font awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<!-- Boostrap css -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<!-- Boostrap js -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>


<style>
	body{
		overflow-x: hidden;
	}
	
	body::before {
	content: "";
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-image: url('images/busform.jpg'); 
	background-size: cover;
	background-position: center;
	filter: blur(8px);
	z-index: -1; 
}

	.book-bus-container{
		display: flex;
		justify-content: center;
		align-items: center;
		min-height: 100vh;
		padding: 20px;
		flex-wrap: wrap;
	}
	
	@keyframes fadeInUp {
	from {
		opacity: 0;
		transform: translateY(30px);
	}
	to {
		opacity: 1;
		transform: translateY(0);
	}
}

	
	.payment-form {
	background-color: transparent; 
	animation: fadeInUp 0.6s ease-in-out;
	box-sizing: border-box;
	padding: 30px;
	border-radius: 15px;
	box-shadow: none;
	max-width:500px;
	width: 100%;
	color: white; 
}

	.payment-form label {
	color: white;
}

	.payment-form input,
	.payment-form button {
		background-color: rgba(255, 255, 255, 0.2);
		border: 1px solid rgba(255, 255, 255, 0.4);
		color: white;
	}
	
	.payment-form input::placeholder {
		color: rgba(255, 255, 255, 0.7);
	}	
	
	.booking-header{
		border-bottom: 2px solid white;
		padding-bottom: 10px;
		margin-bottom: 20px;
		display: inline-block;
	}
	
	@media (max-width: 600px) {
    .payment-form {
        width: 100%;
        padding: 20px;
    }

</style>

</head>
<body>

<%
String username = (String) session.getAttribute("username");
if (username == null) {
    response.sendRedirect("login.jsp");
    return;
}

%>


Successful Payment


</body>
</html>