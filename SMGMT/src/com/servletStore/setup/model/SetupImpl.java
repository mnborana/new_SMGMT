package com.servletStore.setup.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.dbconnect.DBConnection;

public class SetupImpl implements SetupDAO {

	PreparedStatement pstmt=null;
	
	@Override
	public int insertTrusteeInfo(SetupPOJO setup) throws SQLException {
		int status=0;
		
		DBConnection dbconnect=new DBConnection();
		Connection connection=dbconnect.getConnection();
		
		pstmt=connection.prepareStatement("INSERT INTO `trustee_info`(`edu_society_name`, `no_of_schools`) VALUES (?,?)");
		pstmt.setString(1,setup.getSocietyName());
		pstmt.setInt(2, setup.getNoOfSchools());
		status=pstmt.executeUpdate();
			
		connection.close();
		
		
		return status;
	}

	@Override
	public int insertInstituteDetails(SetupPOJO setup) throws SQLException {
		
		int status=0;
		
		DBConnection dbconnect=new DBConnection();
		Connection connection=dbconnect.getConnection();
		
		pstmt=connection.prepareStatement("INSERT INTO `institute_details`(`school_name`) VALUES (?)");
		pstmt.setString(1,setup.getSchoolName());
		status=pstmt.executeUpdate();
		connection.close();
				
		return status;
	}

	@Override
	public int insertPrincipalDetails(SetupPOJO setup,int maxSchoolId) throws SQLException {
		
		int status=0;
		DBConnection dbconnect=new DBConnection();
		Connection connection=dbconnect.getConnection();
		
		pstmt=connection.prepareStatement("INSERT INTO `user_master`(`username`, `password`, `user_roll_id`, `institute_id`) VALUES (?,?,?,?)");
		pstmt.setString(1,setup.getPrincipalUserName());
		pstmt.setString(2, setup.getPrincipalPassword());
		pstmt.setInt(3, 3);
		pstmt.setInt(4, maxSchoolId);
			
		status=pstmt.executeUpdate();
			
		connection.close();
				
		return status;
	}

	@Override
	public int getMaxSchoolId() throws SQLException {
		
		int maxId=0;
		DBConnection dbconnect=new DBConnection();
		Connection connection=dbconnect.getConnection();
		
			
		pstmt=connection.prepareStatement("SELECT max(id) from institute_details");
		ResultSet rs=pstmt.executeQuery();
		while(rs.next())
		{
			maxId=rs.getInt(1);
		}
			
		connection.close();
		
		return maxId;
	}

	@Override
	public int insertTrusteeLoginDetails(SetupPOJO setup) throws SQLException {
		
		int status=0;
		DBConnection dbconnect=new DBConnection();
		Connection connection=dbconnect.getConnection();
		
		
		pstmt=connection.prepareStatement("INSERT INTO `user_master`(`username`, `password`, `user_roll_id`) VALUES (?,?,?)");
		pstmt.setString(1,setup.getTrusteeUsername());
		pstmt.setString(2,setup.getTrusteePassword());
		pstmt.setInt(3, 2);
			
		status=pstmt.executeUpdate();
			
		connection.close();
				
		return status;
	}

	@Override
	public int setAceessControl(ArrayList access, int userRoll) throws SQLException {
		
		int status=0;
		int counter=0;
		DBConnection dbconnect=new DBConnection();
		Connection connection=dbconnect.getConnection();
		
		
			pstmt=connection.prepareStatement("INSERT INTO `access_control_master`(`dashboard`, `setting`, `management`, `admission`, `fee`, `attendance`, `exam`, `teacher`, `register`, `cashbook`, `transport`, `salary`, `library`, `other`, `e_msg`, `user_roll_id`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			//System.out.println(access.size());
			for(int i=1;i<=access.size();i++)
			{
				pstmt.setString(i, (String) access.get(counter));
				//System.out.println(i+","+access.get(counter));
				counter++;
			}
			pstmt.setInt(16, userRoll);
			status=pstmt.executeUpdate();
			
			connection.close();
				
		return status;
	}

}
