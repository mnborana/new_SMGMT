package com.servletStore.settings.classRoom.model;

import java.sql.SQLException;
import java.util.List;

public interface AddClassDAO 
{
	public List getStandards(String schoolId, String setionId);
	
}
