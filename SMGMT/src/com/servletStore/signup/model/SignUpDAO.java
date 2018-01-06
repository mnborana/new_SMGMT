/**
 * Author : Omkar Shivadekar
 * Date : 06-Jan-2018
 */
package com.servletStore.signup.model;

import java.sql.SQLException;

public interface SignUpDAO
{
	public int insertUserMaster(String schoolId,String rollId,String userName,String password) throws SQLException;
}
