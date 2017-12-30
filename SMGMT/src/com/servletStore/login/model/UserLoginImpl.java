package com.servletStore.login.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;

public class UserLoginImpl implements UserLoginDAO {
	
	PreparedStatement pstmt=null;
	

	@Override
	public String getLoginStatus(UserLoginPojo ul) {
		String status="noData";
		boolean isPresent=false;
		try {
			DBConnection dbConnection = new DBConnection();
			String query="SELECT `username`, `password`, `roll`, `status`,`activation_key` FROM `user_master` WHERE roll=1";
			PreparedStatement ps=dbConnection.getConnection().prepareStatement(query);
			ResultSet rs=ps.executeQuery(query);
			String username=ul.getUsername();
			String password=ul.getPassword();
			while(rs.next()) {
					String name=rs.getString(1);
					String pwd=rs.getString(2);
					if(name.equalsIgnoreCase(username) && pwd.equals(password)) {
						isPresent=true;
					}
					else {
						status= "wrongUser";
					}
				}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		if(isPresent) {
			status="success";
		}
		return status;
	}

	@Override
	public List getUserCredentials(String userName) throws SQLException {
		
		DBConnection dbconnect=new DBConnection();
		Connection connection=dbconnect.getConnection();
		
		ArrayList list = new ArrayList<>();
		
		pstmt=connection.prepareStatement("SELECT username,password FROM user_master WHERE username=?");
		pstmt.setString(1, userName);
		
		ResultSet rs=pstmt.executeQuery();
		
		while(rs.next())
		{
			list.add(rs.getString(1));
			list.add(rs.getString(2));
		}
		
		connection.close();
		
		
		return list;
	}

	@Override
	public Boolean checkUserExist(String userName) throws SQLException {
		
		DBConnection dbconnect=new DBConnection();
		Connection connection=dbconnect.getConnection();
		
		
		Boolean result=false;
		
		pstmt=connection.prepareStatement("SELECT username FROM user_master WHERE username=?");
		pstmt.setString(1, userName);
		
		ResultSet rs=pstmt.executeQuery();
		
		while(rs.next())
		{
			result=true;
		}
		
		connection.close();
		
		return result;
	}

	@Override
	public List getSessionDetails(String userName) throws SQLException {
		
		
		DBConnection dbconnect=new DBConnection();
		Connection connection=dbconnect.getConnection();
		
		List list = new ArrayList<>();
		
		pstmt = connection.prepareStatement("SELECT user_roll_id,institute_id FROM user_master WHERE username=?");
		pstmt.setString(1, userName);
		ResultSet rs=pstmt.executeQuery();
		while(rs.next())
		{
			list.add(rs.getInt(1));
			list.add(rs.getInt(2));
			
		}
	
		connection.close();
		
		return list;
	}

}
