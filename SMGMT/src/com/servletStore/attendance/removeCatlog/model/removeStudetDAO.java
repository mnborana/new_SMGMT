package com.servletStore.attendance.removeCatlog.model;

import java.util.List;

import com.servletStore.transportation.studentdetails.model.StudentDetailsPOJO;

public interface removeStudetDAO 
{
	public void insert(removeStudentPOJO rp);
	public List<String> getStudentDetails(int std);
	public List<removeStudentPOJO> getRemoveStudentDetails();
	public void delete(int id);

}
