package com.servletStore.settings.subjects.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;

import com.dbconnect.DBConnection;

public class SubjectAssignmentImpl implements SubjectAssignmentDAO{
	
	DBConnection dbconnect=new DBConnection();
	Connection connection;
	PreparedStatement ps;
	ResultSet rs;
	
	public SubjectAssignmentImpl() {
		connection=dbconnect.getConnection();
	}


	@Override
	public HashMap<Integer, String> getSubjectList(String schoolId) {
		
		HashMap<Integer, String> subjectList = new HashMap<>();
		
		try {
			
			String selectSubjectQuery = "SELECT `id`, `subject_name` FROM `subject_master` where school_id="+schoolId;
			ps = connection.prepareStatement(selectSubjectQuery);
			rs = ps.executeQuery();
			
			while(rs.next()){
				subjectList.put(rs.getInt(1), rs.getString(2));
			}	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return subjectList;
	}


	@Override
	public HashMap<Integer, String> getClassList(String schoolId) {
		
		HashMap<Integer, String> stdList = new LinkedHashMap<>();
		
		try{
			
			String getStdQuery = "SELECT fk_class_master.id, std_master.name FROM fk_class_master, std_master WHERE fk_class_master.id IN ( SELECT fk_class_master.id FROM fk_class_master WHERE fk_class_master.fk_school_sec_id IN (SELECT fk_school_section_details.id FROM fk_school_section_details WHERE fk_school_section_details.school_id="+schoolId+")) AND std_master.id=fk_class_master.std_id ORDER BY `std_master`.`name`  ASC";
			ps = connection.prepareStatement(getStdQuery);
			rs = ps.executeQuery();
			
			while(rs.next()){
				stdList.put(rs.getInt(1), rs.getString(2));
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return stdList;
	}


	@Override
	public int AssignCommonSubjects(SubjectAssignmentPOJO AssignSubPojo) 
	{
		int insertStatus=0;
		
		try{
			String insertQuery = "INSERT INTO `subject_assignment`(`fk_class_master_id`, `subject_id`, `subject_code`, `optional_status`) VALUES ("+AssignSubPojo.getFkClassMasterId()+", "+AssignSubPojo.getSubjectId()+", '"+AssignSubPojo.getSubjectCode()+"', "+AssignSubPojo.getOptinalStatus()+")";
			//System.out.println(insertQuery);
			ps = connection.prepareStatement(insertQuery);
			insertStatus = ps.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return insertStatus;
	}


	@Override
	public List AssignedSubjectList(String schoolId) {
		
		List AssignedSubjectsList = new ArrayList<>();  
		try{
			
			String showData = "SELECT subject_assignment.id, std_master.name, subject_master.subject_name, subject_assignment.subject_code, subject_assignment.optional_status FROM `subject_assignment`, subject_master, std_master, fk_class_master, fk_school_section_details WHERE subject_assignment.fk_class_master_id=fk_class_master.id AND fk_class_master.std_id=std_master.id AND fk_school_section_details.id=fk_class_master.fk_school_sec_id AND fk_school_section_details.school_id="+schoolId+" AND subject_assignment.subject_id=subject_master.id   ORDER BY `std_master`.`name` ASC";
			//System.out.println(showData);
			ps = connection.prepareStatement(showData);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				SubjectAssignmentPOJO subAPojo = new SubjectAssignmentPOJO();
				
				subAPojo.setId(rs.getInt(1));
				subAPojo.setStdName(rs.getString(2));
				subAPojo.setSubjectName(rs.getString(3));
				subAPojo.setSubjectCode(rs.getString(4));
				subAPojo.setOptinalStatus(rs.getInt(5));
				
				AssignedSubjectsList.add(subAPojo);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}	
		
		return AssignedSubjectsList;
	}
	
	
	
}
