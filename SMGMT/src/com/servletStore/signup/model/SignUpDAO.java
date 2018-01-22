/**
 * Author : Omkar Shivadekar
 * Date : 06-Jan-2018
 */
package com.servletStore.signup.model;

import java.sql.SQLException;
import java.util.List;

public interface SignUpDAO
{
	public int insertUserMaster(String schoolId,String rollId,String userName,String password) throws SQLException;
	
	public int insertLibrarian(String rollId,String userName,String password) throws SQLException;
	
	public List<SignupPojo> getUserInfo(String schoolId) throws SQLException;
	
	public List getSchoolForAdmin() throws SQLException;
	
	public List <SignupPojo> getUserInfoForAdmin() throws SQLException;
}
