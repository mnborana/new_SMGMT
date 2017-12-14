package com.servletStore.settings.school.model;

import java.util.List;

public interface SchoolDAO {
	
	public void addSchool(SchoolPOJO schoolPojo);
	public List<SchoolPOJO> getSchoolInfo();
	public List<SchoolPOJO> getSchoolDetails();
	public void updateSchoolDetails(SchoolPOJO schoolPojo);
	public List<SchoolPOJO> getSection();
	public List<SchoolPOJO> selectSchoolDetails(SchoolPOJO schoolPojo,int id);
	public int deleteSchool(int id);
	public void insertSection(List list);
	public String selectSection(int id);
	
	
}
