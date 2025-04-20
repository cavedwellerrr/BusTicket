<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>

<link rel="stylesheet" href="css/index.css">

</head>
<body>

<%@ include file="navbar.jsp" %>

	<!-- Main Content Section -->
   <section class="main-section d-flex align-items-center">
    <div class="container d-flex align-items-center">
      <div class="row w-100">
        <!-- Left: Bus Image -->
        <div class="col-md-6">
          <img src="images/bus.png" alt="Bus" class="img-fluid">
        </div>
        
        <!-- Right: Text Content -->
        <div class="col-md-6">
          <h1 class="display-4">Welcome to Our Bus Ticket Reservation</h1>
          <p class="lead">Book your bus tickets online with ease. Explore destinations and make your journey comfortable!</p>
          
          <!-- Call to Action Button -->
          <div class="mt-4">
            <a href="book.jsp" class="btn btn-primary btn-lg">Book Your Ticket Now</a>
          </div>
        </div>
      </div>
    </div>
  </section>
	
</body>
</html>