<%@ include file="userdetails.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/account.css" />
</head>

<%@ include file="navbar.jsp" %>
<body>
<h2>Edit Account Details</h2>
    <form action="save_account.jsp" method="post">
        <label>Full Name:</label><br>
        <input type="text" name="name" placeholder=<%=name %> required><br><br>

        <label>Email:</label><br>
        <input type="email" name="email" placeholder=<%=email %>required><br><br>

        <label>Phone:</label><br>
        <input type="text" name="phone" placeholder=<%=phone %>required><br><br>

        <button type="submit">Save Changes</button>
    </form>

</body>
</html>