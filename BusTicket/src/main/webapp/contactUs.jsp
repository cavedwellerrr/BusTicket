<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.text.SimpleDateFormat, java.util.Date" %>

<%
    int id = 10 + (int)(Math.random() * 90);
%>



    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
<!-- Bootstrap CSS -->
<link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
  rel="stylesheet"
/>

<!-- Optional Bootstrap JS (for components like modals) -->
<script
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
></script>

</head>
<body>

<%@ include file="navbar.jsp" %>


<%@ page import="java.util.UUID" %>


<div class="container mt-5">
  <h2>Contact Us</h2>
  <form action="ContactServlet" method="post">
    
<div class="mb-3">
<label for="id" class="form-label">Support ID</label>
      <input type="text" name="supportId" value="<%= id %>" class="form-control" readonly />


</div>

  <div class="mb-3">
  <label for="phone" class="form-label">Phone Number</label>
  <input type="tel" class="form-control" id="phone" name="phone" required />
</div>


    <div class="mb-3">
      <label for="email" class="form-label">Email address</label>
      <input type="email" class="form-control" id="email" name="email" required />
    </div>

    <div class="mb-3">
      <label for="Subject" class="form-label">Subject</label>
      <select class="form-select" id="subject" name="subject" required>
        <option value="">Select an option</option>
        <option value="General">General</option>
        <option value="Support">Support</option>
        <option value="Complaint">Complaint</option>
      </select>
    </div>

    <div class="mb-3">
      <label for="inquiry" class="form-label">Inquiry</label>
      <textarea class="form-control" id="inquiry" name="inquiry" rows="4" required></textarea>
    </div>

    <button type="submit" class="btn btn-primary">Submit Inquiry</button>
  </form>
</div>




</body>
</html>