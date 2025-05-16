<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- font awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<!-- Boostrap css -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<!-- main css file -->


<link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css">


<!-- google fonts -->
<link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>

</head>
<body>

<nav class="navbar ">
  <div class="container-fluid d-flex justify-content-between align-items-center">
    
    <!-- Left: Bus Icon -->
    <a class="navbar-brand" >
      <i class="fa-solid fa-bus fa-lg" style="color:black;"></i>
    </a>

    <!-- Center: Navigation Links -->
    <ul class="nav justify-content-center mx-auto">
      <li class="nav-item">
        <a class="nav-link active" href="${pageContext.request.contextPath}/adminDashboardServlet">Dashboard</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/staff/admin/addAdmin.jsp">Admins</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/staff/admin/addRM.jsp">Route Managers</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/staff/admin/addCS.jsp">Customer Support</a>
      </li>
      
    </ul>
    
   

    <!-- Right: Empty space or something later -->
    <div style="width: 40px;"></div>
    
    
     <a class="nav-link" href="${pageContext.request.contextPath}/staff/staffLogout.jsp" style="color: red; font-weight:600; font-family:'Poppins' ;">Logout</a>
    

  </div>
</nav>
	





</body>
</html>