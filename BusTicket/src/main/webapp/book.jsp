<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.catchme.dao.busDao" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking Page</title>

<!-- font awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<!-- Boostrap css -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<!-- Boostrap js -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>


</head>
<body>


<%@ include file="navbar.jsp" %>



<div class="container mt-5" style="max-width: 1300px;">
  <h2 class=" mb-4">Available Buses </h2>
  <table class="table table-bordered table-hover">
    <thead class="table-dark">
      <tr>
        <th>Plate No</th>
        <th>Route</th>
        <th>Seats Available</th>
        <th>Dept Time</th>
        <th>Arr Time</th>
        <th>Price Per Seat</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
   	
   	<c:forEach var="b" items="${busList}">
   	
    <tr>
        <td>${b.plateNo }</td>
        <td>${b.route }</td>
        <td>${b.seatAvailable }</td>
        <td>${b.deptTime }</td>
        <td>${b.arrTime }</td>
        <td>Rs. ${b.pricePerSeat }</td>
            
        

        <td>
          	<a href="bookBus.jsp?busId=${b.busId}" class="btn btn-sm btn-warning">Book Ticket</a>
          	
        </td>
    </tr>
  
   	
 </c:forEach>
    	
 	


</body>
</html>