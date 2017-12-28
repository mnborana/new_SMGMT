package com.servletStore.transportation.route.model;

import java.util.List;

public interface RouteDAO 
{
	public void addRoute(RoutePOJO rp);
	public List<RoutePOJO> getRouteDetails();
	public void EditRoute(RoutePOJO rp);
	public void deleteRoute(int id);
	//public String selectSection(int id);
}
