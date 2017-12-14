package com.servletStore.campus.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public interface CampusDAO 
{
	
	public void insertRecord(CampusPojo camp) throws SQLException;

	public List<CampusPojo> getCampusDetails() throws SQLException;
	
	//public List<CampusPojo> getAllRecordById(int id) throws SQLException;
	public int deleteRecord(String campusid) throws SQLException;
	
}
