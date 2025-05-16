package com.catchme.model;

public abstract class Staff {
	
	protected int sID;
	protected String sName;
	protected String sUsername;
	protected String sEmail;
	protected String sPassword;
	protected String sRole;
	protected String sPhone;
	
	public Staff() {}

	public Staff(int sID, String sName, String sUsername, String sEmail, String sPassword,  String sRole, String sPhone) {
		this.sID= sID;
		this.sUsername= sUsername;
		this.sName= sName;
		this.sEmail= sEmail;
		this.sPassword= sPassword;
		this.sRole= sRole;
		this.sPhone= sPhone;
	}
	
	
	//getters and setters
	
	public int getsID() {
		return sID;
	}

	public void setsID(int sID) {
		this.sID = sID;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getsUsername() {
		return sUsername;
	}

	public void setsUsername(String sUsername) {
		this.sUsername = sUsername;
	}
	
	public String getsEmail() {
		return sEmail;
	}

	public void setsEmail(String sEmail) {
		this.sEmail = sEmail;
	}

	public String getsPassword() {
		return sPassword;
	}

	public void setsPassword(String sPassword) {
		this.sPassword = sPassword;
	}


	public String getsRole() {
		return sRole;
	}

	public void setsRole(String sRole) {
		this.sRole = sRole;
	}

	public String getsPhone() {
		return sPhone;
	}

	public void setsPhone(String sPhone) {
		this.sPhone = sPhone;
	}

	//abstract method
	
	public abstract void showDashboard();
	
	
}
