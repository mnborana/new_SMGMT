package com.servletStore.attendance.removeCatlog.model;

public class removeStudentPOJO
{
	int id;
	int stud_id;
	int std_id;
	String remove_date,academic_year,stud_name,std_name,div,reason;
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getDiv() {
		return div;
	}
	public void setDiv(String div) {
		this.div = div;
	}
	public String getStud_name() {
		return stud_name;
	}
	public void setStud_name(String stud_name) {
		this.stud_name = stud_name;
	}
	public String getStd_name() {
		return std_name;
	}
	public void setStd_name(String std_name) {
		this.std_name = std_name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStud_id() {
		return stud_id;
	}
	public void setStud_id(int i) {
		this.stud_id = i;
	}
	public int getStd_id() {
		return std_id;
	}
	public void setStd_id(int i) {
		this.std_id = i;
	}
	public String getRemove_date() {
		return remove_date;
	}
	public void setRemove_date(String remove_date) {
		this.remove_date = remove_date;
	}
	public String getAcademic_year() {
		return academic_year;
	}
	public void setAcademic_year(String academic_year) {
		this.academic_year = academic_year;
	}

}
