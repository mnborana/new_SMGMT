package com.servletStore.settings.subjects.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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
		
		
		return subjectList;
	}


	@Override
	public HashMap<Integer, String> getClassList(String schoolId) {
		
		HashMap<Integer, String> stdList = new HashMap<>();
		
		try{
			
			String getStdQuery = "SELECT fk_class_master.id, std_master.name FROM fk_class_master, std_master WHERE fk_class_master.id IN ( SELECT fk_class_master.id FROM fk_class_master WHERE fk_class_master.fk_school_sec_id IN (SELECT fk_school_section_details.id FROM fk_school_section_details WHERE fk_school_section_details.school_id="+schoolId+")) AND std_master.id=fk_class_master.std_id";
			ps = connection.prepareStatement(getStdQuery);
			rs = ps.executeQuery();
			
			while(rs.next()){
				stdList.put(rs.getInt(1), rs.getString(2));
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return stdList;
	}
	
	
	
}
