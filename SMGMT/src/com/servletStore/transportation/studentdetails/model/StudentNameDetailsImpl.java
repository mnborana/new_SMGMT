package com.servletStore.transportation.studentdetails.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;

public class StudentNameDetailsImpl implements StudentNameDetailsDAO
{
	DBConnection dbconnect=new DBConnection();
	Connection connection=dbconnect.getConnection();
	
	PreparedStatement pstmt=null;


	@Override
	public List<StudentNameDetailsPOJO> getStudentNameDetails() {
		// TODO Auto-generated method stub
		System.out.println("GETDETAILS");
			List<StudentNameDetailsPOJO> list=new ArrayList<>();
			try {
				pstmt=connection.prepareStatement("SELECT * FROM student_details1");
				ResultSet rs= pstmt.executeQuery();
				while(rs.next()){
					StudentNameDetailsPOJO studPojo=new StudentNameDetailsPOJO();
					studPojo.setId(rs.getInt("id"));
					studPojo.setName(rs.getString("name"));
					list.add(studPojo);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
	}

}
