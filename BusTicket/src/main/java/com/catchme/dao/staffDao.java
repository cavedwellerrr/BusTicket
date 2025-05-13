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
					 staff= new Admin(sID, sName, sUser, sEmail, sPass, sPhone);
					staffList.add(staff);
					break;
					
				case "Route Manager":
					 staff= new RouteManager(sID, sName, sUser, sEmail, sPass, sPhone);
					staffList.add(staff);
					break;
					
				case "Customer Support":
					 staff= new CustomerSupport(sID, sName, sUser, sEmail, sPass, sPhone);
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
	
	public static boolean insertStaff(Staff staff) throws SQLException {
		
		boolean success= false;
		String query= "insert into staff(Name, Username, Email, Password, Role, Phone) values(?,?,?,?,?,?)";
		
		try(Connection con= DBconnection.getConnection();
			PreparedStatement ps= con.prepareStatement(query);){
			ps.setString(1, staff.getsName());
			ps.setString(2, staff.getsUsername());
			ps.setString(3, staff.getsEmail());
			ps.setString(4, staff.getsPassword());
			ps.setString(5, staff.getsRole());
			ps.setString(6, staff.getsPhone());
			
			success=ps.executeUpdate()>0;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return success;

	}
	
	public static Staff getStaffByID(int sID) {
		
		Staff staff=null;
		
		try {
			Connection con= DBconnection.getConnection();
			String query= "select * from staff where sID= ?";
			PreparedStatement ps= con.prepareStatement(query);
			ps.setInt(1, sID);
			ResultSet rs= ps.executeQuery();
			
			if(rs.next()) {
				String role= rs.getString("Role");
				
				if("Admin".equals(role)) {
					staff= new Admin();
					
				}else if("Customer Support".equals(role)) {
					staff= new CustomerSupport();
					
				}else if("Route Manager".equals(role)) {
					staff= new RouteManager();
				}
				
				staff.setsID(rs.getInt("sID"));
				staff.setsName(rs.getString("Name"));
				staff.setsUsername(rs.getString("Username"));
				staff.setsEmail(rs.getString("Email"));
				staff.setsPassword(rs.getString("Password"));
				staff.setsRole(rs.getString("Role"));
				staff.setsPhone(rs.getString("Phone"));
			}
			
			con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return staff;
	}
	
	public boolean updateStaff(Staff s) {
		boolean updated= false;
		
		try {
			Connection con= DBconnection.getConnection();
			String sql= "update staff set Name=?, Username=?, Email=?, Password=?, Phone=? where sID=?";
			PreparedStatement ps= con.prepareStatement(sql);
			
			ps.setString(1, s.getsName());
			ps.setString(2, s.getsUsername());
			ps.setString(3, s.getsEmail());
			ps.setString(4, s.getsPassword());
			ps.setString(5, s.getsPhone());
			ps.setInt(6, s.getsID());
			
			int rows=ps.executeUpdate();
			updated= rows>0;
			con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return updated;
	}
	
	public boolean deleteStaff(int sID) {
		
		boolean deleted= false;
		String query= "delete from staff where sID=?";
		
		try (Connection con= DBconnection.getConnection();
			 PreparedStatement ps= con.prepareStatement(query)){
			
			
			ps.setInt(1, sID);
			deleted= ps.executeUpdate()>0;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
		return deleted;
	}

}
