package com.servletStore.transportation.conductor.model;

public class ConductorPOJO {
	public String getVeh_no() {
		return veh_no;
	}

	public void setVeh_no(String veh_no) {
		this.veh_no = veh_no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTemp_addrs() {
		return temp_addrs;
	}

	public void setTemp_addrs(String temp_addrs) {
		this.temp_addrs = temp_addrs;
	}

	public String getPerm_addrs() {
		return perm_addrs;
	}

	public void setPerm_addrs(String perm_addrs) {
		this.perm_addrs = perm_addrs;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getPhone_no() {
		return phone_no;
	}

	public void setPhone_no(String phone_no) {
		this.phone_no = phone_no;
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	public int getVeh_id() {
		return veh_id;
	}

	public void setVeh_id(int veh_id) {
		this.veh_id = veh_id;
	}
	private String veh_no,name,temp_addrs,perm_addrs,dob,phone_no;
	private int id,veh_id;

}
