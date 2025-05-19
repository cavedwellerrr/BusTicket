<%@ page import="com.catchme.model.Passenger" %>
<%
    Passenger passenger = (Passenger) request.getAttribute("passenger");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>UserAccount</title>

<!-- link accountcss.css file -->
<link rel="stylesheet" type="text/css" href="css/accountcss.css">

<!-- link bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<!-- link sweetalert to get success massage -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<% if ("true".equals(request.getParameter("success"))) { %>
<script>
Swal.fire({
  icon: 'success',
  title: 'Success!',
  text: 'Your account has been successfully updated!',
  timer: 3000,
  showConfirmButton: false
});
<% } %>

</script>

<!-- link navbar -->
<div class="navedit"><%@ include file="navbar.jsp" %></div>


<div class="container-fluid register-container">
<div class="row g-0 w-100">
<div class="col-md-6 register-img d-none d-md-block"></div>

 
<div class="col-md-6 form-container d-flex flex-column justify-content-center">

	<div class="text-center mb-4 wl">
        <h2>Welcome, <%= passenger.getUsername() %>!</h2>
    </div>
 <div class="register-card">

    
       <h4 class="mb-3 text-center">Your Account Details</h4>
        <div class="mb-3">
            <label class="form-label fw-bold">User Name</label>
            <p class="form-control-plaintext dt"><%= passenger.getName() %></p>
        </div>
        <div class="mb-3">
            <label class="form-label fw-bold">Email</label>
            <p class="form-control-plaintext dt"><%= passenger.getEmail() %></p>
        </div>
        <div class="mb-3">
            <label class="form-label fw-bold">Phone</label>
            <p class="form-control-plaintext dt"><%= passenger.getPhone() %></p>
        </div>

        <div class="d-flex justify-content-between  mx-5 my-5">
            <form action="logout.jsp" method="post">
                <button type="submit" class="btn btn-danger">Logout</button>
            </form>

            <form action="PassengerController" method="get">
            <input type="hidden" name="action" value="edit">
                <button type="submit" class="btn btn-primary"  >Edit Account</button>
            </form>
            
            <form action="PassengerController" method="post" onsubmit="return confirm('Are you sure? Do you want to delete your account? This cannot be undone');">
            	<input type="hidden" name="action" value="delete">
            	<button type="submit" class="btn btn-danger">Delete Account</button>
            
            </form>
       </div>
 </div>
 </div>
</div>
</div>
</body>
</html>

