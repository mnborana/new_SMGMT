package com.servletStore.attendance.catalogYearChange.model;

import java.util.List;

import com.servletStore.student.model.StudentPojo;

public interface CatalogYearChangeDAO 
{
	//public void addDriver(DriverPOJO dp);
	public List<CatalogYearChangePOJO> getCatalogDetails();
	public void UpdateCatalog(CatalogYearChangePOJO cp);
	public List<String> getStandardList(CatalogYearChangePOJO ap);
	public List<CatalogYearChangePOJO> getStudentList(String id,String year);
	//public void deleteDriver(int id);
}
