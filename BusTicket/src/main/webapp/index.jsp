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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<% if ("true".equals(request.getParameter("deleted"))) {%>
<script>
Swal.fire({
	icon:'success',
	title: 'Acount Deleted',
	text: 'Your account has been successfully deleted',
	timer:4000,
	showConfirmButton : false
	});
</script>
<%}%>

<video autoplay muted loop class="background-video">
    <source src="images/215268.mp4" type="video/mp4">
    
 </video>
 
 <%@ include file="navbar.jsp" %>
	<!-- Main Content Section -->
   <section class="main-section d-flex align-items-center">
    <div class="container d-flex align-items-center">
      <div class="row w-100">
        <!-- Left: Bus Image -->
       <!--   <div class="col-md-6">
          <img src="images/bus.png" alt="Bus" class="img-fluid">
        </div>-->
        
        <!-- Right: Text Content -->
        <div class="col-md-6">
          <h1 class="display-4 fw-bold">Welcome to CatchMe</h1>
          <p class="lead">Your online bus ticket reservation site. Book your ticket with us and enjoy your travels!!</p>
          
          <!-- Call to Action Button -->
          <div class="mt-4">
            <a href="book.jsp" class="btn btn-success btn-lg">Book Your Ticket Now</a>
          </div>
          
        </div>
        
      </div>
      
    </div>
   
  </section>
 <div style="background-color: rgba(0, 0, 0, 0.5); padding-left: 120px; padding-right: 120px;">
 <hr  style="color: white;">
 </div> 


<%@ include file="footer.jsp" %>

</body>

</html>