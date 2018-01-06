package com.servletStore.attendance.schoolTransfer.model;

public class SchoolTransferPOJO 
{
	private int id;
	private String gr_no,name,roll_no,std,div,school_name,aca_year,shift;
	private String schoolId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getGr_no() {
		return gr_no;
	}
	public void setGr_no(String gr_no) {
		this.gr_no = gr_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRoll_no() {
		return roll_no;
	}
	public void setRoll_no(String roll_no) {
		this.roll_no = roll_no;
	}
	public String getStd() {
		return std;
	}
	public void setStd(String std) {
		this.std = std;
	}
	public String getDiv() {
		return div;
	}
	public void setDiv(String div) {
		this.div = div;
	}
	public String getSchoolId() {
		return schoolId;
	}
	public void setSchoolId(String schoolId) {
		this.schoolId = schoolId;
	}
	public String getSchool_name() {
		return school_name;
	}
	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}
	public String getAca_year() {
		return aca_year;
	}
	public void setAca_year(String aca_year) {
		this.aca_year = aca_year;
	}
	public String getShift() {
		return shift;
	}
	public void setShift(String shift) {
		this.shift = shift;
	}
}
