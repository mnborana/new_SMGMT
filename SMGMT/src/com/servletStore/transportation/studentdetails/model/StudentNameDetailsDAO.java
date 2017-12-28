package com.servletStore.transportation.studentdetails.model;

import java.util.List;

import com.servletStore.transportation.route.model.RoutePOJO;

public interface StudentNameDetailsDAO {

	//public void addS(StudentDetailsPOJO rp);
	public List<StudentNameDetailsPOJO> getStudentNameDetails();
	//public void EditRoute(RoutePOJO rp);
	//public void deleteRoute(int id);
}
