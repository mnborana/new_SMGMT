package com.servletStore.attendance.catalogYearChange.model;

import java.util.List;

import com.servletStore.attendance.schoolTransfer.model.SchoolTransferPOJO;
import com.servletStore.student.model.StudentPojo;

public interface CatalogYearChangeDAO 
{
	//public void addDriver(DriverPOJO dp);
	public List<CatalogYearChangePOJO> getCatalogDetails();
	public void UpdateCatalog(String stddiv_id,String year,List<String> stud_ids);
	public List<String> getStandardList(CatalogYearChangePOJO ap);
	public List<CatalogYearChangePOJO> getStudentList(String id,String year);
	public List<CatalogYearChangePOJO> getAcademicYears();
	//public void deleteDriver(int id);
}
