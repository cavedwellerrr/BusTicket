<%@ page import="com.catchme.model.Passenger" %>
<%
    Passenger passenger = (Passenger) request.getAttribute("passenger");
    if (passenger == null) {
        response.sendRedirect("PassengerController");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Account</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <!-- Link accountcss.css  -->
    <link rel="stylesheet" type="text/css" href="css/accountcss.css">
</head>

<body class="">
<div class="container-fluid register-container">
<div class="col-md-6 form-container d-flex flex-column justify-content-center ">

        <div class="crd" >
            <div class="">
                <div class="">
   					 <h2>Edit Your Account </h2>
   				</div>
                  <div class="card-body ">
                    <form method="post" action="PassengerController">
                        <div class="mb-3">
                            <label for="name" class="form-label">Name:</label>
                            <input type="text" class="form-control" id="name" name="name" value="<%= passenger.getName() %>" required>
                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label">Email:</label>
                            <input type="email" class="form-control" id="email" name="email" value="<%= passenger.getEmail() %>" required>
                        </div>

                        <div class="mb-3">
                            <label for="phone" class="form-label">Phone:</label>
                            <input type="text" class="form-control" id="phone" name="phone" value="<%= passenger.getPhone() %>" required>
                        </div>

                        <div class="d-flex justify-content-between">
                            <button type="submit" class="btn btn-primary">Save Changes</button>
                            <a href="PassengerController" class="btn btn-secondary">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


<div class="col-md-6 register-img2 d-none d-md-block"></div>

</div>
</body>
</html>
