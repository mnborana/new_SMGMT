package com.servletStore.student.model;

import java.util.List;

public interface StudentDAO {
	public int insertStudent(StudentPojo theStudent);
	
	public List<StudentPojo> getSectionList(StudentPojo theStudent);

	public List getStandardList(StudentPojo theStudent);

	public List getReligionList();

	public List getCasteList(StudentPojo theStudent);

	public List getCategoryList(StudentPojo theStudent);
	

}
