package com.servletStore.settings.school.model;

import java.sql.SQLException;
import java.util.List;

public interface SchoolDAO {
	
	
	public List<SchoolPOJO> getSchoolDetails();
	public void updateSchoolDetails(SchoolPOJO schoolPojo);
	public List<SchoolPOJO> getSection();
	public List<SchoolPOJO> selectSchoolDetails(SchoolPOJO schoolPojo,int id);
	public int deleteSchool(int id);
	public void insertSection(List list);
	public String selectSection(int id);
	
	public int insertSchoolSection(int schoolId,int sectionId);
	
	public List getSectionDetails();
	
	public List getSchoolForActivation() throws SQLException;
	
	public int activateSchool(int schoolId) throws SQLException;
	
	public int getTotalSchools() throws SQLException;
	
	public int updateTotalSchools(int available,int updated) throws SQLException;
	
	
	
	
}
