package com.servletStore.settings.division.model;

public class DivisionPOJO 
{

	private int id;
	private String school;
	private String section;
	private String stdclass;
	private String division;
	
	
	public DivisionPOJO() 
	{
		
	}
		
	public DivisionPOJO(String school, String section, String addclass,String division) 
	{
		
		this.school = school;
		this.section = section;
		this.stdclass = addclass;
		this.division=division;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public String getAddclass() {
		return stdclass;
	}
	public void setAddclass(String addclass) {
		this.stdclass = addclass;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}
	
	
	
}
