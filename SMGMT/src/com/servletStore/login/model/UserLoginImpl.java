package com.servletStore.login.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dbconnect.DBConnection;

public class UserLoginImpl implements UserLoginDAO {

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

}
