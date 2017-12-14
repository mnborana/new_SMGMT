package com.servletStore.campus.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;

import com.dbconnect.DBConnection;


public class CampusImpl implements CampusDAO 
{
	
	DBConnection dbConnect = new DBConnection();
	Connection connection;
	public CampusImpl()
	{
		connection=dbConnect.getConnection();
		
	}
		
	@Override
	public void insertRecord(CampusPojo camp) throws SQLException 
	{
		
		String query="insert into campus(`campus_name`,`campus_address`,`mobile_no`) values(?,?,?)";
		PreparedStatement ps=(PreparedStatement) connection.prepareStatement(query);
		ps.setString(1, camp.getName());
		ps.setString(2, camp.getAddress());
		ps.setString(3, camp.getMobileNo());
		
		ps.executeUpdate();
			
	}

	public List<CampusPojo> getCampusDetails() throws SQLException 
	{
		List<CampusPojo> list=new ArrayList<CampusPojo>();
		//String query="select * from campus;";
		String query="select `campus_id`,`campus_name`,`campus_address`,`mobile_no` from `campus` where delete_status=0";
	
		PreparedStatement ps=(PreparedStatement) connection.prepareStatement(query);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			CampusPojo camp=new CampusPojo();
			camp.setCampusid(rs.getInt("campus_id"));
			camp.setName(rs.getString("campus_name"));
			camp.setAddress(rs.getString("campus_address"));
			camp.setMobileNo(rs.getString("mobile_no"));
			list.add(camp);
		}

		return list;
	}
	
	public int deleteRecord(String campusid) throws SQLException
	{
	
		String query="update campus set delete_status=1 where campus_id=?";
		System.out.println(query);
		PreparedStatement ps=(PreparedStatement) connection.prepareStatement(query);
		ps.setString(1, campusid);
		return ps.executeUpdate();
		
	}

	
}
