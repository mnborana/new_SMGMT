package com.servletStore.campus.model;

public class CampusPojo 
{
    private int campusid;
	private String name;
	private String address;
	private String mobileNo;
	
	public int getCampusid() 
	{
		return campusid;
	}
		
	public CampusPojo(String name, String address, String mobileno) 
	{
			this.name=name;
			this.address=address;
			this.mobileNo=mobileno;
	}

	public void setCampusid(int campusid) {
		this.campusid = campusid;
	}

	public CampusPojo() {
		// TODO Auto-generated constructor stub
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	
}
