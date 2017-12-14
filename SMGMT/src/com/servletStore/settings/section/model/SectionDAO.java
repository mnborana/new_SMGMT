package com.servletStore.settings.section.model;

import java.sql.SQLException;
import java.util.List;

public interface SectionDAO 
{

	public int addSection(SectionPojo section);
	public List<SectionPojo> getSectionDetails();
	List<SectionPojo> getSectionDetailsBySchoolId(String sid);
	public int getSectionIdFromName(String secName); 

}
