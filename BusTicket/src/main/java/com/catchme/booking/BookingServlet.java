package com.catchme.booking;

import com.catchme.db.DBconnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session= request.getSession(false);
        if(session==null || session.getAttribute("username")==null) {
        	response.sendRedirect("login.jsp");
        	return;
        }
        
        String username= (String)session.getAttribute("username");
        
        try {
        	Connection con= DBconnection.getConnection();
        	
        	int passengerId=0;
        	PreparedStatement ps1= con.prepareStatement("select pID from passenger where Username=?");
        	ps1.setString(1, username);
        	ResultSet rs1 = ps1.executeQuery();
        	
        	if(rs1.next()) {
        		passengerId= rs1.getInt("pID");
        	}else {
        		session.setAttribute("error", "Passenger not found");
        		response.sendRedirect("error.jsp");
        		return;
        	}
        	
        	int busId= Integer.parseInt(request.getParameter("busID"));
        	int numSeats= Integer.parseInt(request.getParameter("numSeats"));
        	String travelDate= request.getParameter("travel_date");
        	
        	
        	
        	
        	double pricePerSeat=0;
        	
        	PreparedStatement ps2= con.prepareStatement("select seat_available, price_per_seat from bus where busID=?");
        	ps2.setInt(1, busId);
        	ResultSet rs2= ps2.executeQuery();
        	
        	
        	if(rs2.next()) {
        		int availableSeats= rs2.getInt("seat_available");
        		pricePerSeat= rs2.getDouble("price_per_seat");
        		
        		if(numSeats> availableSeats) {
        			session.setAttribute("error", "Not enough seats available");
        			response.sendRedirect("bookBus.jsp?busId=" + busId);
        			return;
        		}
        		
        		int newAvailableSeats= availableSeats- numSeats;
        		PreparedStatement ps3= con.prepareStatement("update bus set seat_available=? where busID=?");
        		ps3.setInt(1, newAvailableSeats);
        		ps3.setInt(2, busId);
        		ps3.executeUpdate();
        		
        		
        		
        	}else {
        		session.setAttribute("error", "Bus not found");
        		response.sendRedirect("error.jsp");
        		
        	}
        	
        	double totalPrice= numSeats * pricePerSeat;
        	
        	PreparedStatement ps4= con.prepareStatement("insert into booking(passenger_id, bus_id, num_seats, total_price, booking_date) values(?,?,?,?,?)");
        	ps4.setInt(1, passengerId);
        	ps4.setInt(2, busId);
        	ps4.setInt(3, numSeats);
        	ps4.setDouble(4, totalPrice);
        	ps4.setString(5, travelDate);
        	
        	int rowsInserted= ps4.executeUpdate();
        	
        	if(rowsInserted>0) {
        		session.setAttribute("success", "Booking successful");
        		response.sendRedirect("payment.jsp");
        	}else {
        		session.setAttribute("error", "Failed to book ticket");
        		response.sendRedirect("bookBus.jsp?busId="+ busId);
        	}
        	
        	
        }catch(Exception e) {
        	e.printStackTrace();
        	session.setAttribute("error", "Something went wrong: "+ e.getMessage());
        	response.sendRedirect(username);
        }
        
    }
}
