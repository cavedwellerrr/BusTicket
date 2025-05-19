package com.catchme.model;

public class contactUs {
	 private int support_id;
	 private String email;
	 private String phone;
	 private String  suject;
	 private String inquiry;
	 private String status;
	 
	 public contactUs(int support_id, String email, String phone, String suject, String inquiry,String status) {
		super();
		this.support_id = support_id;
		this.email = email;
		this.phone = phone;
		this.suject = suject;
		this.inquiry = inquiry;
		this.status = status;
	 }

	 public String getStatus() {
		return status;
	}

	 public void setStatus(String status) {
		 this.status = status;
	 }

	 public int getSupport_id() {
		 return support_id;
	 }

	 public void setSupport_id(int support_id) {
		 this.support_id = support_id;
	 }

	 public String getEmail() {
		 return email;
	 }

	 public void setEmail(String email) {
		 this.email = email;
	 }

	 public String getPhone() {
		 return phone;
	 }

	 public void setPhone(String phone) {
		 this.phone = phone;
	 }

	 public String getSuject() {
		 return suject;
	 }

	 public void setSuject(String suject) {
		 this.suject = suject;
	 }

	 public String getInquiry() {
		 return inquiry;
	 }

	 public void setInquiry(String inquiry) {
		 this.inquiry = inquiry;
	 }
	 
	 
	 
	
}
