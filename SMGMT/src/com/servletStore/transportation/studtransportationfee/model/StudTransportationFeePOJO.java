package com.servletStore.transportation.studtransportationfee.model;

public class StudTransportationFeePOJO 
{
	public int getStud_id() {
		return stud_id;
	}
	public void setStud_id(int stud_id) {
		this.stud_id = stud_id;
	}
	public int getRoute_id() {
		return route_id;
	}
	public void setRoute_id(int route_id) {
		this.route_id = route_id;
	}
	public int getDest_id() {
		return dest_id;
	}
	public void setDest_id(int dest_id) {
		this.dest_id = dest_id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public double getFee() {
		return fee;
	}
	public void setFee(double fee) {
		this.fee = fee;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	public String getMonths() {
		return months;
	}
	public void setMonths(String months) {
		this.months = months;
	}
	private int stud_id,route_id,dest_id,id;
	private double fee,discount;
	private String months;
	
}
