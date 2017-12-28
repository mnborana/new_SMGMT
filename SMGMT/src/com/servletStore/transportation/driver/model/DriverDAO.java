package com.servletStore.transportation.driver.model;

import java.util.List;

public interface DriverDAO {
	public void addDriver(DriverPOJO dp);
	public List<DriverPOJO> getDriverDetails();
	public void editDriver(DriverPOJO dp);
	public void deleteDriver(int id);

}
