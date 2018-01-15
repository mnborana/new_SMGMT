package com.servletStore.attendance.schoolTransfer.model;

import java.util.List;


public interface SchoolTransferDAO 
{
	//public void addDriver(DriverPOJO dp);
	//public List<SchoolTransferPOJO> getCatalogDetails();
	public void UpdateCatalog(String stddiv_id,String year,List<String> stud_ids);
	public List<String> getStandardList(SchoolTransferPOJO ap,String orderBy);
	public List<SchoolTransferPOJO> getStudentList(String id,String year);
	public List<SchoolTransferPOJO> getSchoolList();
	public List<SchoolTransferPOJO> getSectionList(String std_id);
	public List<SchoolTransferPOJO> getHigherSchoolList(String sec_id);
	public List<SchoolTransferPOJO> getAcademicYears();
	public List<SchoolTransferPOJO> getHigherStdList(String sec_id,String school_id);
	//public void deleteDriver(int id);
}
