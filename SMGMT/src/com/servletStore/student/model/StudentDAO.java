package com.servletStore.student.model;

import java.util.List;

public interface StudentDAO {
	public void insertStudent(StudentPojo theStudent);
	
	public List<StudentPojo> getSectionDetails();

}
