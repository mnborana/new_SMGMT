package com.servletStore.settings.bank.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;

import com.dbconnect.DBConnection;


public class addBankImpl implements addBankDAO 
{
	
	DBConnection dbConnect = new DBConnection();
	Connection connection;
	public addBankImpl()
	{
		connection=dbConnect.getConnection();
		
	}
	@Override
	public void insertBankDetails(addBankPojo addbank) throws SQLException 
	{
		
		String query="insert into bank_master(`bank_name`,`short_form`) values(?,?) ";
		PreparedStatement ps=(PreparedStatement) connection.prepareStatement(query);
		ps.setString(1, addbank.getBankname());
		ps.setString(2, addbank.getShortform());
		ps.executeUpdate();
		System.out.println(query);
	}
	@Override
	public List<addBankPojo> getRecordDetails() throws SQLException 
	{
		List<addBankPojo> list=new ArrayList<addBankPojo>();
		String query="select `id`,`bank_name`,`short_form` from `bank_master` where delete_status=0";
		PreparedStatement ps=(PreparedStatement) connection.prepareStatement(query);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			addBankPojo pojo=new addBankPojo();
			pojo.setId(rs.getInt("id"));
			pojo.setBankname(rs.getString("bank_name"));
			pojo.setShortform(rs.getString("short_form"));
			list.add(pojo);			
		}
		
		return list;
	}
	@Override
	public void deleteRecord(String id) throws SQLException 
	{
		String query="update bank_master set delete_status=1 where id=?";
		PreparedStatement ps=(PreparedStatement) connection.prepareStatement(query);
		ps.setString(1, id);
		ps.executeUpdate();
		
		
	}
		
	

	
}
