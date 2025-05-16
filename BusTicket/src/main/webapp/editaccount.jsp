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
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    
    <link rel="stylesheet" type="text/css" href="css/account.css">
</head>
<body class="container py-5">
 <div class="row justify-content-center">
        <div class="col-md-7">
            <div class="card shadow-lg">
                <div class="card-header bg-dark text-white text-center ">
   					 <h2>Edit Your Account </h2>
   				</div>
                  <div class="card-body">
                    <form method="post" action="editaccount.jsp">
                        <div class="mb-3">
                            <label for="name" class="form-label">Name:</label>
                            <input type="text" class="form-control" id="name" name="name" value="<%= name %>" required>
                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label">Email:</label>
                            <input type="email" class="form-control" id="email" name="email" value="<%= email %>" required>
                        </div>

                        <div class="mb-3">
                            <label for="phone" class="form-label">Phone:</label>
                            <input type="text" class="form-control" id="phone" name="phone" value="<%= phone %>" required>
                        </div>

                        <div class="d-flex justify-content-between">
                            <button type="submit" class="btn btn-primary">Save Changes</button>
                            <a href="account.jsp" class="btn btn-secondary">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</body>
</html>
