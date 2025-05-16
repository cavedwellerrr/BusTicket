<%@ include file="userdetails.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserAccount</title>

<!-- Css link -->
<link rel="stylesheet" type="text/css" href="css/account.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="navbar.jsp" %>
<%
    String updated = request.getParameter("updated");
%>
<% if ("true".equals(updated)) { %>
    <div style="background-color: #d4edda; color: #155724; padding: 10px; border-radius: 5px; margin-bottom: 15px;">
        Account updated successfully!
    </div>
<% } %>

 <div class="text-center mb-4">
        <h2>Welcome, <%= username %>!</h2>
    </div>
<div class="card mx-auto shadow p-3" style="max-width: 600px;">
        <h4 class="mb-3 text-center">Your Account Details</h4>
        <div class="mb-3">
            <label class="form-label fw-bold">User Name</label>
            <p class="form-control-plaintext"><%= name %></p>
        </div>
        <div class="mb-3">
            <label class="form-label fw-bold">Email</label>
            <p class="form-control-plaintext"><%= email %></p>
        </div>
        <div class="mb-3">
            <label class="form-label fw-bold">Phone</label>
            <p class="form-control-plaintext"><%= phone %></p>
        </div>

        <div class="d-flex justify-content-between mt-4">
            <form action="logout.jsp" method="post">
                <button type="submit" class="btn btn-danger">Logout</button>
            </form>

            <form action="editaccount.jsp" method="get">
                <button type="submit" class="btn btn-primary">Edit Account</button>
            </form>
        </div>
 </div>
<!-- Bootstrap JS Bundle -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
 -->
</body>
</html>