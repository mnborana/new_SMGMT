/**
 * Author : Omkar Shivadekar
 * Date : 06-Jan-2018
 */
package com.servletStore.signup.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.dbconnect.DBConnection;
import com.servletStore.login.model.Encryption;

public class SignupImpl implements SignUpDAO
{
	PreparedStatement pstmt=null;
	
	@Override
	public int insertUserMaster(String schoolId, String rollId, String userName, String password) throws SQLException
	{
		DBConnection dbconnect=new DBConnection();
		Connection connection=dbconnect.getConnection();
		Encryption encrypt = new Encryption();
		
		String encryptedPassword=encrypt.signup(password);
		
		pstmt=connection.prepareStatement("INSERT INTO `user_master`(`school_id`, `user_roll_id`, `username`, `password`) VALUES (?,?,?,?)");
		pstmt.setString(1,schoolId);
		pstmt.setString(2,rollId);
		pstmt.setString(3,userName);
		pstmt.setString(4,encryptedPassword);
		
		int status=pstmt.executeUpdate();
		
		
		connection.close();
		return status;
	}

}
