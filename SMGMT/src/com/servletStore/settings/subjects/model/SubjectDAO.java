package com.servletStore.settings.subjects.model;

import java.sql.SQLException;
import java.util.List;

public interface SubjectDAO {
	
	public int addSubject(SubjectPOJO SubjectPojo) throws SQLException;
	public List<SubjectPOJO> getSubjectDetails(String schoolId);
	
}
