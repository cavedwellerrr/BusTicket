<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.catchme.model.Staff" %>
<%@ page import="com.catchme.model.Admin" %>
<%@ page import="com.catchme.model.RouteManager" %>
<%@ page import="com.catchme.model.CustomerSupport" %>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit staff information</title>

<!-- font awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<!-- Boostrap css -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
 
</head>
<body>

<style>
	.back {
    display: flex;               /* Makes arrow and text align horizontally */
    align-items: center;
    gap: 8px;                    /* Space between arrow and text */
    position: fixed;
    top: 20px;
    left: 30px;
    text-decoration: none;
    background: none;
    border: none;
    outline: none;
    cursor: pointer;
    z-index: 10;

    /* Force anchor itself to never affect color */
    color: unset;
}

.back:link,
.back:visited,
.back:hover,
.back:active {
    color: unset;
    text-decoration: none;
}

.back i {
    font-size: 30px;
    color: black;
    transition: color 0.2s ease;
}

.back p {
    color: black;
    margin: 0;
    font-size: 16px;
    transition: color 0.2s ease;
}

.back i:hover {
    color: #d5d5d5;
}

.back p:hover {
    color: black;
}


	
	body,html{
		margin:0;
		padding:0;
	}
	
	.edit-staff-container{
	height:100%;
	display: flex;
	justify-content: center;
	align-items: flex-start; /* Align form to top */
	margin-top:0;
	padding-top: 100px;
	padding-bottom: 50px;
	min-height: 100vh;       /* Ensure full screen height if content is short */
	background-color: #f2f2f2;
	
}

.edit-staff{
	border: 4px solid #e0e0e0;
	background-color: #eaeaea;
	padding-top: 0px;
	padding-bottom: 10px;
	padding-left: 10px;
	border-radius: 10px;
	width: 600px;
	box-shadow: 0 4px 8px rgba(0,0,0,0.1);
	
}

.edit-staff input{
	width: 65%;
	padding: 8px;
	margin-botton: 20px;
	border-radius: 5px;
	border: none;
	box-shadow: 0 4px 8px #d3d3d3;
}
	@media (max-width: 768px) {
    .back {
        left: 20px; /* Move back button slightly to the left on smaller screens */
        top: 10px;  /* Reduce top margin for smaller screens */
    }

    .edit-staff-container {
        padding: 10px;  /* Add some padding for smaller screens */
    }

    .edit-staff {
        width: 90%; /* Make the form width 90% of the screen */
        padding: 20px 30px; /* Reduce padding */
    }

    .edit-staff input {
        width: 100%; /* Make the input fields 100% width on smaller screens */
    }

    .back i {
        font-size: 25px; /* Make the back button icon smaller */
    }

    .back p {
        font-size: 14px; /* Reduce font size for back button text */
    }


</style>


<c:if test="${empty staff }">
	<c:redirect url='../staff/staffLogin.jsp'/>
</c:if>


<div class="edit-staff-container">
	<a href="/BusTicket/adminDashboardServlet" class="back">
		<i class="fa-solid fa-arrow-left" ></i>
		
	</a>
	
	<form action="updateStaffServlet" method="post" class="edit-staff">
		<h2 style="text-align: center;" class="mb-3;">Edit Staff Details</h2>
		
		<input type="hidden" name="staff-sID" value="${staff.sID }" required><br><br>
		
		<label for="name" name="name">Name</label><br>
		<input type="text" name="staff-name" value="${staff.sName }"required><br><br>
		
		<label for="username" name="username">Username</label><br>
		<input type= "text" name="staff-username" value="${staff.sUsername }" required><br><br>
		
		<label for="password" name="password">Password</label><br>
		<input type= "text" name="staff-password" value="${staff.sPassword }"required><br><br>
		
		<label for="email" name="email">Email</label><br>
		<input type= "email" name="staff-email" value="${staff.sEmail }"required><br><br>
		
		
		<label for="role" name="role">Role</label><br>
		<input type="text" name="staff-role" value="${staff.sRole }"readonly><br><br>
  		
		
		<label for="phone" name="phone">Phone</label><br>
		<input type= "text" name="staff-phone" value="${staff.sPhone }"required><br><br>
		
		
		
		<button type="submit" name="edit-staff-btn" class="btn btn-success">Submit Changes</button>
		
		<button type="reset" class="btn btn-danger">Cancel</button>
		
		
	</form>



</div>


</body>
</html>