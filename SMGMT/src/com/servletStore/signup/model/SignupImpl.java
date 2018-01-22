/**
 * Author : Omkar Shivadekar
 * Date : 06-Jan-2018
 */
package com.servletStore.signup.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

	@Override
	public int insertLibrarian(String rollId, String userName, String password) throws SQLException
	{
		DBConnection dbconnect=new DBConnection();
		Connection connection=dbconnect.getConnection();
		
		Encryption encrypt = new Encryption();
		
		String encryptedPassword=encrypt.signup(password);
		
		pstmt=connection.prepareStatement("INSERT INTO `user_master`(`user_roll_id`, `username`, `password`) VALUES (?,?,?)");
		pstmt.setString(1,rollId);
		pstmt.setString(2,userName);
		pstmt.setString(3,encryptedPassword);
		
		int status=pstmt.executeUpdate();
		
		connection.close();
		return status;
	}

	@Override
	public List<SignupPojo> getUserInfo(String schoolId) throws SQLException
	{
		List<SignupPojo> list =new ArrayList<SignupPojo>();
		
		DBConnection dbconnect=new DBConnection();
		Connection connection=dbconnect.getConnection();
		
		
		pstmt=connection.prepareStatement("SELECT user_master.id,user_roll_master.roll_name,user_master.username FROM user_roll_master,user_master WHERE user_roll_master.id=user_master.user_roll_id AND user_master.school_id=?");
		pstmt.setString(1, schoolId);
		ResultSet rs=pstmt.executeQuery();
		while(rs.next())
		{
			SignupPojo pojo = new SignupPojo();
			
			pojo.setId(rs.getInt(1));
			pojo.setUsertype(rs.getString(2));
			pojo.setUsername(rs.getString(3));
			
			list.add(pojo);
		}
		
		
		connection.close();
		return list;
	}

	@Override
	public List getSchoolForAdmin() throws SQLException
	{
		List list =new ArrayList();
		DBConnection dbconnect=new DBConnection();
		Connection connection=dbconnect.getConnection();
		
		pstmt=connection.prepareStatement("SELECT school_master.id,school_master.name FROM school_master WHERE status=1");
		ResultSet rs = pstmt.executeQuery();
		while(rs.next())
		{
			list.add(rs.getInt(1)); 
			list.add(rs.getString(2));
		}
		
		
		connection.close();
		return list;
	}

	@Override
	public List<SignupPojo> getUserInfoForAdmin() throws SQLException
	{
		List<SignupPojo> list =new ArrayList<SignupPojo>();
		
		DBConnection dbconnect=new DBConnection();
		Connection connection=dbconnect.getConnection();
		
		pstmt=connection.prepareStatement("SELECT user_master.id,user_roll_master.roll_name,user_master.username FROM user_roll_master,user_master WHERE user_roll_master.id=user_master.user_roll_id");
		ResultSet rs=pstmt.executeQuery();
		while(rs.next())
		{
			SignupPojo pojo = new SignupPojo();
			
			pojo.setId(rs.getInt(1));
			pojo.setUsertype(rs.getString(2));
			pojo.setUsername(rs.getString(3));
			
			list.add(pojo);
		}
		
		
		connection.close();
		return list;
	}

}
