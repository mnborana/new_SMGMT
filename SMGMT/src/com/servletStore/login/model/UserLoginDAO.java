package com.servletStore.login.model;

import java.sql.SQLException;
import java.util.List;

public interface UserLoginDAO {

	String getLoginStatus(UserLoginPojo ul);
	
	public List getUserCredentials(String userName) throws SQLException;
	
	public Boolean checkUserExist(String userName) throws SQLException;
	
	//public List
	public List getSessionDetails(String userName) throws SQLException;
	
	public List getYear() throws SQLException;

}
