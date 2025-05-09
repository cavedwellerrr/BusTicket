
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.catchme.model.Staff" %>
<%@ page import="com.catchme.model.Admin" %>
<%@ page import="com.catchme.model.RouteManager" %>
<%@ page import="com.catchme.model.CustomerSupport" %>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<!-- font awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<!-- Boostrap css -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<!-- Boostrap js -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</head>
<body>

<%
	Staff staff = (Staff) session.getAttribute("staff");

	if(staff == null){
		response.sendRedirect("../staffLogin.jsp");
	}

%>

<%@ include file="../staffNavbar.jsp" %>




  
<div class="container mt-5" style="max-width: 1300px;">
  <h2 class="text-center mb-4">Employee Information </h2>
  <table class="table table-bordered table-hover">
    <thead class="table-dark">
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Username</th>
        <th>Email</th>
        <th>Role</th>
        <th>Phone</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
   	
   	<c:forEach var="s" items="${staffList}">
   	
    <tr>
        <td>${s.sID}</td>
        <td>${s.sName}</td>
        <td>${s.sUsername}</td>
        <td>${s.sEmail}</td>
        <td>${s.sRole}</td>
        <td>${s.sPhone}</td>
            
        

        <td>
          	<a href="#" class="btn btn-sm btn-primary">Edit</a>
          	<a href="#" class="btn btn-sm btn-danger">Delete</a>
        </td>
    </tr>
   	
 </c:forEach>
    	
    	
    
    
   
      
     
       
    
    
    </tbody>
  </table>
</div>




</body>
</html>