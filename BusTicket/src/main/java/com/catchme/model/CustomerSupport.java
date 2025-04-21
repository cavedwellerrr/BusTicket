package com.catchme.model;

public class CustomerSupport extends Staff {

	public CustomerSupport() {
		this.sRole= "Customer Support";
		
	}
	
	public CustomerSupport(int sID, String sName, String sUsername, String sPassword, String sEmail, 
			String sPhone) {
		super(sID, sName, sUsername, sPassword, sEmail, "Customer Support", sPhone);
		
	}
	
	@Override
	public void showDashboard() {
		System.out.println("Welcome Customer Support: "+ getsUsername());
	}
}
