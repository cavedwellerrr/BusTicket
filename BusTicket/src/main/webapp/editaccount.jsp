<%@ page import="java.sql.*" %>
<%@ include file="userdetails.jsp" %>
<%@ page import="com.catchme.db.DBconnection" %>

<%


    //  Update block
    if ("POST".equalsIgnoreCase(request.getMethod())) {
         name = request.getParameter("name");
         email = request.getParameter("email");
         phone = request.getParameter("phone");

        try {
            Connection conn = DBconnection.getConnection();
            PreparedStatement ps = conn.prepareStatement("UPDATE passenger SET Name=?, Email=?, phone=? WHERE Username=?");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, username);
            ps.executeUpdate();
            ps.close();
            conn.close();

            response.sendRedirect("account.jsp?updated=true");

            return;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Reuse this to load current values
    request.setAttribute("username", username); // pass username in case not declared in userdetails
    %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Account</title>
    <link rel="stylesheet" type="text/css" href="css/account.css">
</head>
<body>
    <h1>Edit Your Account</h1>
    <form method="post" action="editaccount.jsp">
        <label>Name:</label><br>
        <input type="text" name="name" value="<%= name %>" required ><br><br>

        <label>Email:</label><br>
        <input type="email" name="email" value="<%= email %>" required><br><br>

        <label>Phone:</label><br>
        <input type="text" name="phone" value="<%= phone %>" required ><br><br>

        <button type="submit">Save Changes</button>
        <a href="account.jsp"><button type="button">Cancel</button></a>
    </form>
</body>
</html>
