<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/busticket", "root", "197768Std");
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