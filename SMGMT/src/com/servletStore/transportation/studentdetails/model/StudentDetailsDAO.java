package com.servletStore.transportation.studentdetails.model;

import java.util.List;

public interface StudentDetailsDAO 
{
	public void addStudentDetails(StudentDetailsPOJO sp);
	public List<StudentDetailsPOJO> getStudentDetails();
	public void editStudentDetails(StudentDetailsPOJO vp);
	public void deleteStudentetails(int id);
}
