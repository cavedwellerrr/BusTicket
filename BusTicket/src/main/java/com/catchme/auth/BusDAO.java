package com.catchme.auth;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.catchme.db.DBconnection;
import com.catchme.model.Bus;

public class BusDAO {

    
    public void Addbus(Bus bus) {
        try {
            String query = "INSERT INTO bus (plateNo, seats, seat_available, dept_time, arr_time, route, price_per_seat) VALUES ('"
                    + bus.getPlateNo() + "','"
                    + bus.getSeats() + "','"
                    + bus.getSeatAvailable() + "','"
                    + bus.getDeptTime() + "','"
                    + bus.getArrTime() + "','"
                    + bus.getRoute() + "','"
                    + bus.getPricePerSeat() + "')";

            Statement statement = DBconnection.getConnection().createStatement();
            statement.executeUpdate(query);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    
    public List<Bus> getAllBuses() {
        List<Bus> buses = new ArrayList<>();
        try {
            Connection con = DBconnection.getConnection();
            String query = "SELECT * FROM bus";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                Bus bus = new Bus();
                bus.setBusId(rs.getInt("busId"));
                bus.setPlateNo(rs.getString("plateNo"));
                bus.setSeats(rs.getString("seats"));
                bus.setSeatAvailable(rs.getInt("seat_available"));
                bus.setDeptTime(rs.getString("dept_time"));
                bus.setArrTime(rs.getString("arr_time"));
                bus.setRoute(rs.getString("route"));
                bus.setPricePerSeat(rs.getDouble("price_per_seat"));  
                buses.add(bus);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return buses;
    }
}

