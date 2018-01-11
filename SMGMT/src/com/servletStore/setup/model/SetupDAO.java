package com.servletStore.setup.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public interface SetupDAO {

	public int insertTrusteeInfo(SetupPOJO setup) throws SQLException;
	
	public int getMaxSchoolId() throws SQLException;
	
	public int insertInstituteDetails(SetupPOJO setup, String status) throws SQLException;
	
	public int insertPrincipalDetails(SetupPOJO setup,int maxSchoolId) throws SQLException;
	
	public int insertTrusteeLoginDetails(SetupPOJO setup) throws SQLException;
	
	public int setAceessControl(ArrayList access,int userRoll) throws SQLException;
	
	public List getAccessControlDetails(int userRoll) throws SQLException;
	
	
}
