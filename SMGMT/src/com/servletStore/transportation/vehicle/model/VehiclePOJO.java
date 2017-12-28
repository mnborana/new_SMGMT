package com.servletStore.transportation.vehicle.model;

public class VehiclePOJO {
	private String veh_no,veh_type;
	
	public String getVeh_no() {
		return veh_no;
	}
	public void setVeh_no(String veh_no) {
		this.veh_no = veh_no;
	}
	public String getVeh_type() {
		return veh_type;
	}
	public void setVeh_type(String veh_type) {
		this.veh_type = veh_type;
	}
	public int getNo_seats() {
		return no_seats;
	}
	public void setNo_seats(int no_seats) {
		this.no_seats = no_seats;
	}
	public int getMax_seats() {
		return max_seats;
	}
	public void setMax_seats(int max_seats) {
		this.max_seats = max_seats;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	private int no_seats,max_seats,id;
}
