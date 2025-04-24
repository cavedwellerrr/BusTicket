<%
	if(session.getAttribute("username")==null){
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserAccount</title>

<!-- Css link -->
<link rel="stylesheet" type="text/css" href="css/account.css">
</head>
<body>
<%@ include file="navbar.jsp" %>

<h1>Your Account Details</h1>


<h1>Welcome, <%= username %>!</h1>
<div>
    <p><strong>User Name</strong><br><%=name %></p>
    <p><strong>Email</strong><br><%= email %></p>
    <p><strong>Phone</strong><br><%= phone %></p>
</div>
<div style="margin-top: 20px;">
    <form action="logout.jsp" method="post" style="display:inline;">
        <button type="submit">Logout</button>
    </form>

    <form action="editaccount.jsp" method="get" style="display:inline; margin-left:10px;">
        <button type="submit">Edit Account</button>
    </form>
</div>

</body>
</html>