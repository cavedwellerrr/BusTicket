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

        String route = request.getParameter("route");
        String travelDateStr = request.getParameter("travel_date");
        int seatsRequested = Integer.parseInt(request.getParameter("seats"));

        // Get user from session
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        if (username == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try (Connection conn = DBconnection.getConnection()) {

            // Get user ID
            PreparedStatement getUser = conn.prepareStatement("SELECT pID FROM passenger WHERE Username = ?");
            getUser.setString(1, username);
            ResultSet userRs = getUser.executeQuery();
            if (!userRs.next()) {
                response.sendRedirect("error.jsp?msg=user_not_found");
                return;
            }
            int userId = userRs.getInt("pID");

            // Get bus for route
            PreparedStatement getBus = conn.prepareStatement("SELECT * FROM bus WHERE route = ?");
            getBus.setString(1, route);
            ResultSet busRs = getBus.executeQuery();

            boolean booked = false;

            while (busRs.next()) {
                int busId = busRs.getInt("busID");
                int totalSeats = busRs.getInt("seat_available");

                // Get seats already booked
                PreparedStatement bookedSeatsStmt = conn.prepareStatement(
                    "SELECT SUM(seats_booked) FROM booking WHERE bus_id = busId ");
                  bookedSeatsStmt.setInt(1, busId);
                  System.out.println("busID: " + busId);
                //bookedSeatsStmt.setDate(2, Date.valueOf(travelDateStr));
                ResultSet bookedRs = bookedSeatsStmt.executeQuery();

                int alreadyBooked = 0;
                if (bookedRs.next()) {
                    alreadyBooked = bookedRs.getInt("booked");
                }

                int remaining = totalSeats - alreadyBooked;

               // if (remaining >= seatsRequested) {
                    // Insert booking
                    PreparedStatement insertBooking = conn.prepareStatement(
                        "INSERT INTO booking(user_id, bus_id, travel_date, dept_time, seats_booked) VALUES (?, ?, ?, ?, ?)");
                    insertBooking.setInt(1, userId);
                    insertBooking.setInt(2, busId);
                    insertBooking.setDate(3, Date.valueOf(travelDateStr));
                    insertBooking.setTime(4, busRs.getTime("dept_time"));
                    insertBooking.setInt(5, seatsRequested);

                    insertBooking.executeUpdate();
                    booked = true;
                    break;
               // }
            }

            if (booked==true) {
                response.sendRedirect("booking_success.jsp");
            } else {
                response.sendRedirect("book.jsp?error=not_enough_seats");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("book.jsp?error=server_error");
        }
    }
}
