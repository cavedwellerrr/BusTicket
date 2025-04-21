package com.catchme.model;

public class Admin extends Staff {

	public Admin() {
		this.sRole= "Admin";
	}

	public Admin(int sID, String sName, String sUsername, String sPassword, String sEmail, 
			String sPhone) {
		super(sID, sName, sUsername, sPassword, sEmail, "Admin", sPhone);
		
	}
	
	@Override
	public void showDashboard() {
		System.out.println("Welcome Admin: "+ getsUsername());
	}
	
	
	
	

}
