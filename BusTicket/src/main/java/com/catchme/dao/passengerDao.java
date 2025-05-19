package com.catchme.dao;
import java.sql.*;
import java.sql.Connection;
import java.sql.ResultSet;
import com.catchme.db.DBconnection;
import com.catchme.model.Passenger;

public class passengerDao {
	public static Passenger getPassengerByUsername(String Username) {
		Passenger passenger=null;
		
		try 
			(Connection conn=DBconnection.getConnection()){
				String query="SELECT * FROM passenger WHERE Username=?"
;
				java.sql.PreparedStatement ps=conn.prepareStatement(query);
				ps.setString(1, Username);
				ResultSet rs=ps.executeQuery();
				
				if(rs.next()) {
					//create passenger objct
					passenger = new Passenger();
					
					//asign values to object
					passenger.setPassengerID(rs.getInt("pID"));
					passenger.setName(rs.getString("Name"));
					passenger.setUsername(rs.getString("Username"));
					passenger.setPassword(rs.getString("Password"));
					passenger.setEmail(rs.getString("Email"));
					passenger.setPhone(rs.getString("Phone"));
				
				}
				rs.close();
				ps.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			return passenger;
		}
		
		public static boolean updatePassenger(Passenger p) {
			boolean updated=false;
			
			try (Connection conn=DBconnection.getConnection()){
				String query="UPDATE passenger SET Name=?, Email=?, phone=? WHERE Username=?"
;
				PreparedStatement  ps=conn.prepareStatement(query);
				ps.setString(1,p.getName());
				ps.setString(2,p.getEmail());
				ps.setString(3,p.getPhone());
				ps.setString(4,p.getUsername());
				
				updated=ps.executeUpdate()>0;
				ps.close();
			
			}catch (Exception e) {
				e.printStackTrace();
			}
			return updated;
		}
		
		public static boolean deletePassengerByUserName(String username) {
			
			boolean rowDelete=false;
			
			String sql = "DELETE FROM passenger WHERE username = ?";
			
			try (Connection conn=DBconnection.getConnection();
				PreparedStatement pst=conn.prepareStatement(sql)){
				
				pst.setString(1, username);
				rowDelete=pst.executeUpdate()>0;
			}catch(SQLException e) {
				e.printStackTrace();
			}
			return rowDelete;
			
		}
	}


