package com.catchme.auth;

import java.sql.Statement;

import com.catchme.db.DBconnection;
import com.catchme.model.Bus;

public class BusDAO {
	
	public void Addbus(Bus bus) {
		try {
			
			String query = "INSERT INTO bus (plateNo, seats, seat_available, dept_time, arr_time, route) VALUES ('"
	                + bus.getPlateNo() + "','" 
	                + bus.getSeats() + "','" 
	                + bus.getSeatAvailable() + "','" 
	                + bus.getDeptTime() + "','" 
	                + bus.getArrTime() + "','" 
	                + bus.getRoute() + "')";
			
			Statement statement = DBconnection.getConnection().createStatement();
            statement.executeUpdate(query);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
