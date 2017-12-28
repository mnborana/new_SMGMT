package com.servletStore.transportation.vehicle.model;

import java.util.List;

public interface VehicleDAO {

		public void addVehicle(VehiclePOJO vp);
		public List<VehiclePOJO> getVehicleDetails();
		public void editVehicle(VehiclePOJO vp);
		public void deleteVehicle(int id);
}
