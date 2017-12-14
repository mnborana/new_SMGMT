package com.servletStore.settings.classRoom.model;

public class AddClassPOJO 
{

	private int id, fkClassMasterId, schoolId, sectionId ;
	private String division, shift;
	
	public int getSchoolId() {
		return schoolId;
	}
	public void setSchoolId(int schoolId) {
		this.schoolId = schoolId;
	}
	public int getSectionId() {
		return sectionId;
	}
	public void setSectionId(int sectionId) {
		this.sectionId = sectionId;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getFkClassMasterId() {
		return fkClassMasterId;
	}
	public void setFkClassMasterId(int fkClassMasterId) {
		this.fkClassMasterId = fkClassMasterId;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getShift() {
		return shift;
	}
	public void setShift(String shift) {
		this.shift = shift;
	}
	

	
	
}
