package com.servletStore.staff.model;

import java.util.List;

import com.servletStore.student.model.StudentPojo;

public interface StaffDAO {
	public List getCasteList(StaffPojo pojo);
	
	//public List getReligionList();
	
	public List<StaffPojo> getBankName();
	
	public List getDepartmentList();
	
	public List getDesignationList();
	
	//public int insertDept(String deptName);
	
	public int insertStaffInfo(StaffPojo pojo);
	
}
