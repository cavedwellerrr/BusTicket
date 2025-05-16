package com.catchme.model;

public class Admin extends Staff {

	public Admin() {
		this.sRole= "Admin";
	}

	public Admin(int sID, String sName, String sUsername, String sEmail, String sPassword, 
			String sPhone) {
		super(sID, sName, sUsername, sEmail, sPassword, "Admin", sPhone);
		
	}
	
	@Override
	public void showDashboard() {
		System.out.println("Welcome Admin: "+ getsUsername());
	}
	
	
	
	

}
