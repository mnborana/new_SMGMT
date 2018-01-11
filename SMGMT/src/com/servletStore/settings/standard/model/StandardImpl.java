package com.servletStore.settings.standard.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;
import com.servletStore.settings.school.model.SchoolPOJO;
import com.servletStore.settings.section.model.SectionPojo;

public class StandardImpl implements StandardDAO{

	DBConnection dbconnect=new DBConnection();
	Connection connection;
	PreparedStatement ps;
	
	public StandardImpl() 
	{
	
		connection=dbconnect.getConnection();

	}

	@Override
	public int addStandard(StandardPOJO standardPojo) 
	{
		int status=0;
		String query="insert into std_master(`name`) values (?)";
		PreparedStatement ps;
		try {
			ps = connection.prepareStatement(query);
			ps.setString(1, standardPojo.getStdName());
			status = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}
	
	@Override
	public List<StandardPOJO> getStandardForClass( String schoolId) 
	{
		List<StandardPOJO> list=new ArrayList<StandardPOJO>();
		String query="SELECT std_master.id, std_master.name FROM std_master WHERE std_master.id NOT IN (SELECT fk_class_master.std_id FROM fk_class_master WHERE fk_class_master.fk_school_sec_id IN (SELECT fk_school_section_details.id FROM fk_school_section_details WHERE fk_school_section_details.school_id="+schoolId+")) ORDER BY id ASC";
		PreparedStatement ps;
		try {
			ps = connection.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				//System.out.println("id "+rs.getInt("id") + " "+ rs.getString("name"));
				StandardPOJO stdpojo=new StandardPOJO();
				stdpojo.setId(rs.getInt("id"));
				stdpojo.setStdName(rs.getString("name"));
				list.add(stdpojo);			
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	@Override
	public List<StandardPOJO> getStandardDetails() 
	{
		List<StandardPOJO> list=new ArrayList<StandardPOJO>();
		String query="SELECT std_master.id, std_master.name FROM std_master ORDER BY id ASC";
		PreparedStatement ps;
		try {
			ps = connection.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				//System.out.println("id "+rs.getInt("id") + " "+ rs.getString("name"));
				StandardPOJO stdpojo=new StandardPOJO();
				stdpojo.setId(rs.getInt("id"));
				stdpojo.setStdName(rs.getString("name"));
				list.add(stdpojo);			
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	
	@Override
	public List<SchoolPOJO> getSchoolDetails() 
	{
		List<SchoolPOJO> list=new ArrayList<SchoolPOJO>();
		String query="SELECT `id`, `name` FROM `school_master` where school_master.status=1";
		
		try {
			ps = connection.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				//System.out.println("id "+rs.getInt("id") + " "+ rs.getString("name"));
				SchoolPOJO schoolpojo=new SchoolPOJO();
				schoolpojo.setId(rs.getInt("id"));
				schoolpojo.setSchoolName(rs.getString("name"));
				list.add(schoolpojo);			
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return list;
		
	}

	@Override
	public int addClass(StandardPOJO standardPojo, String schoolID, int sectionId){
		int r=0;
		String selectQuery = "SELECT `id` FROM `fk_school_section_details` WHERE school_id="+schoolID+" AND section_id="+sectionId;
		try {
			ps = connection.prepareStatement(selectQuery);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()){
				int fkId = rs.getInt(1);
				String insertQuery = "INSERT INTO `fk_class_master`(`std_id`, `fk_school_sec_id`) VALUES (?, ?)";
				ps = connection.prepareStatement(insertQuery);
				ps.setInt(1, standardPojo.getStdId());
				ps.setInt(2, fkId);
				r+=ps.executeUpdate();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return r;
	}

	@Override
	public List<StandardPOJO> getClassDetails() {
		
		List<StandardPOJO> list=new ArrayList<StandardPOJO>();
		String query="SELECT fk_class_master.id, school_master.name as school_name, sections_master.name as sections_name, std_master.name as std_name FROM school_master, sections_master, std_master, fk_class_master WHERE std_master.id=fk_class_master.std_id AND  fk_class_master.fk_school_sec_id IN (SELECT fk_school_section_details.id FROM fk_school_section_details WHERE school_master.id=fk_school_section_details.school_id AND sections_master.id=fk_school_section_details.section_id)";
		try {
			ps = connection.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				StandardPOJO stdPojo = new StandardPOJO();
				stdPojo.setFkClassId(rs.getInt(1));
				stdPojo.setSchoolName(rs.getString(2));
				stdPojo.setSectionName(rs.getString(3));
				stdPojo.setStdName(rs.getString(4));
				list.add(stdPojo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
		
}
