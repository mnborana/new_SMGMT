package com.servletStore.transportation.destination.model;

import java.util.List;

public interface DestinationDAO {
	public void addDestination(DestinationPOJO dp);
	public List<DestinationPOJO> getDestinationDetails();
	public void editDestination(DestinationPOJO cp);
	public void deleteDestination(int id);
	
}
