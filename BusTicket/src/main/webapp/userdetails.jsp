<%@page import="java.util.zip.CheckedOutputStream"%>
<%@page import="com.catchme.dao.passengerDao"%>
<%@page import="com.catchme.model.Passenger"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.catchme.db.DBconnection" %>

<%
    String username = (String) session.getAttribute("username");
    if(username==null){
    	response.sendRedirect("login.jsp");
    	return;
    }
    
    Passenger passenger=passengerDao.getPassengerByUsername(username);
    if(passenger==null){
    	out.println("User not found !");
    	return;
    }
    String name=passenger.getName();
    String email=passenger.getEmail();
    String phone=passenger.getPhone();
%>
