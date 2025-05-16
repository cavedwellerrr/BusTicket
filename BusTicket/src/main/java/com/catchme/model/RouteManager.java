package com.catchme.model;

public class RouteManager extends Staff{

	public RouteManager() {
		this.sRole= "Route Manager";
		
	}
	
	public RouteManager(int sID, String sName, String sUsername,String sEmail, String sPassword,  
			String sPhone) {
		super(sID, sName, sUsername, sEmail, sPassword,  "Route Manager", sPhone);
		
	}
	
	@Override
	public void showDashboard() {
		System.out.println("Welcome Route Manager: "+ getsUsername());
	}
}
