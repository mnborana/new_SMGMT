package com.servletStore.setup.model;

import java.sql.SQLException;
import java.util.ArrayList;

public interface SetupDAO {

	public int insertTrusteeInfo(SetupPOJO setup) throws SQLException;
	
	public int getMaxSchoolId() throws SQLException;
	
	public int insertInstituteDetails(SetupPOJO setup) throws SQLException;
	
	public int insertPrincipalDetails(SetupPOJO setup,int maxSchoolId) throws SQLException;
	
	public int insertTrusteeLoginDetails(SetupPOJO setup) throws SQLException;
	
	public int setAceessControl(ArrayList access,int userRoll) throws SQLException;
	
	
}
