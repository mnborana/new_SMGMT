package com.servletStore.transportation.assignroute.model;

import java.util.List;

public interface AssignRouteDAO 
{
	public void assignRoute(AssignRoutePOJO dp);
	public List<AssignRoutePOJO> getAssignRouteDetails();
	public void editAssignRoute(AssignRoutePOJO dp);
	public void deleteAssignRoute(int id);
	
	public List<Integer> getVehicleRoutesById(int id);
	public List<AssignRoutePOJO> getVehicleN();
	public List searchVehicleNo(String vehicleNo);
	public List searchDestination(String dest);
	public List searchRoute(String routename);
	
}
