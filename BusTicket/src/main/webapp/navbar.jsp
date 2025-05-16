<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>

<!-- font awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<!-- Boostrap css -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<!-- main css file -->
<link rel= "stylesheet" type="text/css" href="css/navbar.css">

</head>
<body>
	
	<!-- Boostrap js -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

	<nav class="navbar ">
  <div class="container-fluid d-flex justify-content-between align-items-center">
    
    <!-- Left: Bus Icon -->
    <a class="navbar-brand" href="index.jsp">
      <i class="fa-solid fa-bus fa-lg" style="color:black;"></i>
    </a>
    
  

    <!-- Center: Navigation Links -->
    <ul class="nav justify-content-center mx-auto">
      <li class="nav-item">
        <a class="nav-link" href="index.jsp">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="book.jsp">Book</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="contactUs.jsp">Contact Us</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="about.jsp">About</a>
      </li>
     
      
    </ul>
    
   	 

    <!-- Right: Empty space or something later -->
    <div style="width: 40px;"></div>
    
    
    
    <a href="account.jsp" class="navbar-brand">
      <i class="fa-solid fa-user"></i>  <!-- Account Icon -->
    </a>

  </div>
</nav>
	




</body>
</html>