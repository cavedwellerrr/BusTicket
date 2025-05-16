<%@ page import="java.sql.*" %>
<%@ page import="com.catchme.db.DBconnection" %>

<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String name = "";
    String email = "";
    String phone = "";

    try {

        Connection conn = DBconnection.getConnection();

        PreparedStatement ps = conn.prepareStatement("SELECT Name, Email, phone FROM passenger WHERE Username = ?");
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            name = rs.getString("Name");
            email = rs.getString("Email");
            phone = rs.getString("phone");
        }

        rs.close();
        ps.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
