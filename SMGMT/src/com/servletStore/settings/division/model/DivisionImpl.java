package com.servletStore.settings.division.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;

public class DivisionImpl implements DivisionDAO
{
	DBConnection dbconnect=new DBConnection();
	Connection connection;

	public DivisionImpl() 
	{
		connection=dbconnect.getConnection();
	}

	@Override
	public void insertDivisionDetails(DivisionPOJO division) throws SQLException 
	{
		String query="insert into division(`school`,`section`,`class`,`division`) values(?,?,?,?)";
		PreparedStatement ps=connection.prepareStatement(query);
		ps.setString(1, division.getSchool());
		ps.setString(2, division.getSection());
		ps.setString(3, division.getAddclass());
		ps.setString(4, division.getDivision());
		ps.executeUpdate();
		
	}

	
}
