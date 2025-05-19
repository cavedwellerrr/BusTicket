package com.catchme.dao;
import com.catchme.model.*;
import com.catchme.db.DBconnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class busDao {

	public static List<Bus> getAllBus() throws SQLException{
		
		List<Bus> busList= new ArrayList<>();
		
		Connection con= DBconnection.getConnection();
		String query= "select * from bus";
		
		try {
			PreparedStatement ps= con.prepareStatement(query);
			ResultSet rs= ps.executeQuery();
			
			while(rs.next()) {
				
				Bus bus= new Bus();
				
				int busID= rs.getInt("busID");
				String plateNo= rs.getString("plateNo");
				int seats= rs.getInt("seats");
				int seatAvailable= rs.getInt("seat_available");
				String deptTime= rs.getTime("dept_time").toString();
				String arrTime= rs.getTime("arr_time").toString();
				String route= rs.getString("route");
				Double pricePerSeat= rs.getDouble("price_per_seat");
				
				bus.setBusId(busID);
				bus.setPlateNo(plateNo);
				bus.setSeats(seats);
				bus.setSeatAvailable(seatAvailable);
				bus.setDeptTime(deptTime);
				bus.setArrTime(arrTime);
				bus.setRoute(route);
				bus.setPricePerSeat(pricePerSeat);
				
				
				busList.add(bus);
				
			}
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return busList;
	}
	
	
}
