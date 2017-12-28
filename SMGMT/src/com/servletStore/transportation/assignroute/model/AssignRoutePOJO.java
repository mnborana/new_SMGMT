package com.servletStore.transportation.assignroute.model;

public class AssignRoutePOJO {
	private int id,veh_id,route_id;
	private String veh_no,route_name;
	
	
	public int getVeh_id() {
		return veh_id;
	}
	public void setVeh_id(int veh_id) {
		this.veh_id = veh_id;
	}
	public int getRoute_id() {
		return route_id;
	}
	public void setRoute_id(int route_id) {
		this.route_id = route_id;
	}
	

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getVeh_no() {
		return veh_no;
	}
	public void setVeh_no(String veh_no) {
		this.veh_no = veh_no;
	}
	public String getRoute_name() {
		return route_name;
	}
	public void setRoute_name(String route_name) {
		this.route_name = route_name;
	}

}
