package com.servletStore.settings.classRoom.model;

import java.sql.SQLException;
import java.util.List;

import com.servletStore.settings.section.model.SectionPojo;

public interface AddClassRoomDAO 
{
	public List getStandards(String schoolId, String setionId);
	public int addClassRoom(AddClassRoomPOJO classPojo, String stdName);
	public List<AddClassRoomPOJO> getClassRoomDetails(String schoolId);
	
}
