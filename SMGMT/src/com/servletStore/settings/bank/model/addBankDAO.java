package com.servletStore.settings.bank.model;

import java.sql.SQLException;
import java.util.List;


public interface addBankDAO 
{
	public void insertBankDetails(addBankPojo addbank) throws SQLException;
	
	public List<addBankPojo> getRecordDetails() throws SQLException;	
	
	public void deleteRecord(String id) throws SQLException;

	
}
