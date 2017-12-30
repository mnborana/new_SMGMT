package com.servletStore.settings.subjects.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

public interface SubjectAssignmentDAO {
	
	public HashMap<Integer, String> getSubjectList(String schoolId);
	public HashMap<Integer, String> getClassList(String schoolId);
	
}
