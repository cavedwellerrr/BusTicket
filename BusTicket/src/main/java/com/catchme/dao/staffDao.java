package com.catchme.dao;

import com.catchme.model.*;
import com.catchme.db.DBconnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class staffDao {
	
	public static List<Staff> getAllStaff() throws SQLException{
		
		List<Staff> staffList= new ArrayList<>(); 
		
		Connection conn= DBconnection.getConnection();
		String query= "SELECT * FROM staff ";
		
		try {
			PreparedStatement ps= conn.prepareStatement(query);
			ResultSet rs= ps.executeQuery();
			
			while(rs.next()) {
				int sID= rs.getInt("sID");
				String sName= rs.getString("Name");
				String sUser= rs.getString("Username");
				String sEmail= rs.getString("Email");
				String sPass= rs.getString("Password");
				String sRole= rs.getString("Role");
				String sPhone= rs.getString("Phone");
				
				Staff staff=null;
				switch(sRole) {
					
				case "Admin":
					 staff= new Admin(sID, sName, sUser, sPass, sEmail, sPhone);
					staffList.add(staff);
					break;
					
				case "Route Manager":
					 staff= new RouteManager(sID, sName, sUser, sPass, sEmail, sPhone);
					staffList.add(staff);
					break;
					
				case "Customer Support":
					 staff= new CustomerSupport(sID, sName, sUser, sPass, sEmail, sPhone);
					staffList.add(staff);
					break;
					
				default:continue;
				
				
				
				}
				
				
				
				
			}
				conn.close();	
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return staffList;
		
		
		
	}

}
