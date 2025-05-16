package com.catchme.model;

public class CustomerSupport extends Staff {

	public CustomerSupport() {
		this.sRole= "Customer Support";
		
	}
	
	public CustomerSupport(int sID, String sName, String sUsername, String sEmail,String sPassword,  
			String sPhone) {
		super(sID, sName, sUsername, sEmail, sPassword,  "Customer Support", sPhone);
		
	}
	
	@Override
	public void showDashboard() {
		System.out.println("Welcome Customer Support: "+ getsUsername());
	}
}
