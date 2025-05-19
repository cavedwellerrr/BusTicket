<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>

<%@ page import="com.catchme.model.Staff" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inquiry Dashboard</title>

<!-- font awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<!-- Bootstrap css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<!-- Bootstrap js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</head>
<body>
<%
	Staff staff = (Staff) session.getAttribute("staff");

	if(staff == null){
		response.sendRedirect("/BusTicket/staff/staffLogin.jsp");
	}
	
	

%>





<!-- Logout Button -->
<div class="container mt-3 text-end">
    <a href="/BusTicket/staff/staffLogout.jsp" class="btn btn-outline-danger">
        <i class="fas fa-sign-out-alt"></i> Logout
    </a>
</div>






<div class="container mt-5" style="max-width: 1300px;">
  <h2 class="text-center mb-4">Customer Support Inquiries</h2>
  <table class="table table-bordered table-hover">
    <thead class="table-dark">
      <tr>
        <th>Support ID</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Subject</th>
        <th>Inquiry</th>
        <th>status</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="inquiries" items="${inquiries}">
        <tr>
          <td>${inquiries.support_id}</td>
          <td>${inquiries.phone}</td>
          <td>${inquiries.email}</td>
          <td>${inquiries.suject}</td>
          <td>${inquiries.inquiry}</td>
          <td>
<form method="post" action="EditInquiryServlet">
    <input type="hidden" name="support_id" value="${inquiries.support_id}" />

    <div class="mb-3">
        <label for="status" class="form-label">Status</label>
        <select class="form-select" name="status" id="status" required>
            <option value="pending" ${inquiries.status == 'pending' ? 'selected' : ''}>Pending</option>
            <option value="resolved" ${inquiries.status == 'resolved' ? 'selected' : ''}>Resolved</option>
        </select>
    </div>

    <button type="submit" class="btn btn-success" >Update</button>
</form>

</td>

          <td>
            <a href="DeleteInquiryServlet?support_id=${inquiries.support_id}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this inquiry?');">Delete</a>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</div>



</body>
</html>
