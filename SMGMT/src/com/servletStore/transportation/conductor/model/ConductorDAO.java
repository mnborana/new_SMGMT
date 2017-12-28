package com.servletStore.transportation.conductor.model;

import java.util.List;

public interface ConductorDAO {
	public void addConductor(ConductorPOJO dp);
	public List<ConductorPOJO> getConductorDetails();
	public void editConductor(ConductorPOJO cp);
	public void deleteConductor(int id);
}
