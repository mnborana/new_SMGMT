package com.servletStore.setup.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;
import com.servletStore.login.model.Encryption;

public class SetupImpl implements SetupDAO {

	PreparedStatement pstmt=null;
	Encryption encrypt = new Encryption();
	
	
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
	public int insertInstituteDetails(SetupPOJO setup, String status) throws SQLException {
		
		int sucessStatus=0;
		
		DBConnection dbconnect=new DBConnection();
		Connection connection=dbconnect.getConnection();
		
		pstmt=connection.prepareStatement("INSERT INTO `school_master`(`name`,`status`) VALUES (?,?)");
		pstmt.setString(1,setup.getSchoolName());
		pstmt.setString(2, status);
		sucessStatus=pstmt.executeUpdate();
		connection.close();
				
		return sucessStatus;
	}

	@Override
	public int insertPrincipalDetails(SetupPOJO setup,int maxSchoolId) throws SQLException {
		
		int status=0;
		DBConnection dbconnect=new DBConnection();
		Connection connection=dbconnect.getConnection();
		
		String password = setup.getPrincipalPassword();
		
		String encryptedPassword=encrypt.signup(password);
		
		pstmt=connection.prepareStatement("INSERT INTO `user_master`(`school_id`, `user_roll_id`, `username`, `password`) VALUES (?,?,?,?)");
		pstmt.setInt(1, maxSchoolId);
		pstmt.setInt(2, 3);
		pstmt.setString(3,setup.getPrincipalUserName());
		pstmt.setString(4, encryptedPassword);
			
		status=pstmt.executeUpdate();
			
		connection.close();
				
		return status;
	}

	@Override
	public int getMaxSchoolId() throws SQLException {
		
		int maxId=0;
		DBConnection dbconnect=new DBConnection();
		Connection connection=dbconnect.getConnection();
		
			
		pstmt=connection.prepareStatement("SELECT max(id) from school_master");
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
		
		//institute_id=1 : Trustee (All Login)
		int status=0;
		DBConnection dbconnect=new DBConnection();
		Connection connection=dbconnect.getConnection();
		
		String password = setup.getTrusteePassword();
		
		String encryptedPassword=encrypt.signup(password);
		
		 
		pstmt=connection.prepareStatement("INSERT INTO `user_master`(`username`, `password`, `user_roll_id`) VALUES (?,?,?)");
		//pstmt.setInt(1, 1);
		pstmt.setString(1,setup.getTrusteeUsername());
		pstmt.setString(2,encryptedPassword);
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

	@Override
	public List getAccessControlDetails(int userRoll) throws SQLException {
		
		DBConnection dbconnect=new DBConnection();
		Connection connection=dbconnect.getConnection();
		
		List list = new ArrayList<>();
		SetupPOJO setup = new SetupPOJO();
		
		
		pstmt=connection.prepareStatement("SELECT `dashboard`, `setting`, `management`, `admission`, `fee`, `attendance`, `exam`, `teacher`, `register`, `cashbook`, `transport`, `salary`, `library`, `other`, `e_msg` FROM `access_control_master` WHERE access_control_master.user_roll_id=?");
		pstmt.setInt(1, userRoll);
		ResultSet rs=pstmt.executeQuery();
		while(rs.next())
		{
			setup.setDashboard(rs.getInt(1));
			setup.setSetting(rs.getInt(2));
			setup.setManagement(rs.getInt(3));
			setup.setAdmission(rs.getInt(4));
			setup.setFee(rs.getInt(5));
			setup.setAttendance(rs.getInt(6));
			setup.setExam(rs.getInt(7));
			setup.setTeacher(rs.getInt(8));
			setup.setRegister(rs.getInt(9));
			setup.setCashbook(rs.getInt(10));
			setup.setTransport(rs.getInt(11));
			setup.setSalary(rs.getInt(12));
			setup.setLibrary(rs.getInt(13));
			setup.setOther(rs.getInt(14));
			setup.setEmsg(rs.getInt(15));
			
			list.add(setup);
		}
		
		
		connection.close();
		
		return list;
	}

}
