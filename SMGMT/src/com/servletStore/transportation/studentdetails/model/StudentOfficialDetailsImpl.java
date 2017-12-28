package com.servletStore.transportation.studentdetails.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;

public class StudentOfficialDetailsImpl implements StudentOfficialDetailsDAO 
{

	DBConnection dbconnect=new DBConnection();
	Connection connection=dbconnect.getConnection();
	
	PreparedStatement pstmt=null;
	@Override
	public List<StudentOfficialDetailsPOJO> getStudentOfficialDetails() {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				System.out.println("GETDETAILS");
					List<StudentOfficialDetailsPOJO> list=new ArrayList<>();
					try {
						pstmt=connection.prepareStatement("SELECT * FROM student_details1");
						ResultSet rs= pstmt.executeQuery();
						while(rs.next()){
							StudentOfficialDetailsPOJO studPojo=new StudentOfficialDetailsPOJO();
							studPojo.setId(rs.getInt("id"));
							studPojo.setGr_no("");
							list.add(studPojo);
						}
						
					} catch (SQLException e) {
						e.printStackTrace();
					}
					return list;
	}

}
