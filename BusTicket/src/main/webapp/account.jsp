<%-- <% if(session.getAttribute("name")==null){
response.sendRedirect("login.jsp"); } %> --%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>

    <!-- Css link -->
    <link rel="stylesheet" type="text/css" href="css/account.css" />
  </head>
  <%@ include file="navbar.jsp" %>
  <body>
    <div class="account-container">
      <h2>My Account</h2>
      <div class="user-details">
        <div>
          <label><strong>Name:</strong></label>
          <input
            type="text"
            name="name"
            class="form"
            value=""
            placeholder="Enter first name"
            readonly
          />
        </div>

        <div>
          <label><strong>Email:</strong></label>
          <input
            type="email"
            name="email"
            class="form"
            value=""
            placeholder="Enter email"
            readonly
          />
        </div>

        <div>
          <label><strong>Phone No:</strong></label>
          <input
            type="tel"
            name="phone"
            class="form"
            value=""
            placeholder="Enter Phone No:"
            readonly
          />
        </div>

        <div></div>
        <label><strong>Address:</strong></label>
        <input
          type="text"
          name="address"
          class="form"
          value=""
          placeholder="Enter Address"
          readonly
        />
      </div>

      <div class="account-actions">
        <button onclick="location.href='editaccount.jsp'">
          Edit Account Details
        </button>
        <form action="logout.jsp" method="post" style="display: inline">
          <button type="submit">Log Out</button>
        </form>
      </div>
    </div>
  </body>
</html>
