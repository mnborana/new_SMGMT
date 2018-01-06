package com.servletStore.transportation.studentdetails.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sound.midi.VoiceStatus;

import com.dbconnect.DBConnection;
import com.servletStore.transportation.vehicle.model.VehiclePOJO;

public class StudentDetailsImpl implements StudentDetailsDAO
{
	DBConnection dbconnect=new DBConnection();
	Connection connection=dbconnect.getConnection();
	PreparedStatement pstmt=null;
	@Override
	public void addStudentDetails(StudentDetailsPOJO sp) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<StudentDetailsPOJO> getStudentDetails(){
		// TODO Auto-generated method stub
		List<StudentDetailsPOJO> list=new ArrayList<>();
		String sql="SELECT student_details.id,student_details.first_name,student_official_details.gr_no,std_master.name,classroom_master.division FROM student_details,student_official_details,class_allocation,fk_class_master,fk_school_section_details,classroom_master,std_master WHERE student_official_details.student_id=student_details.id AND student_official_details.lc_status=0 AND class_allocation.student_id=student_details.id AND class_allocation.catalog_status=0 AND classroom_master.id=class_allocation.classroom_master AND fk_class_master.id=classroom_master.fk_class_master_id AND std_master.id=fk_class_master.std_id AND fk_school_section_details.id=fk_class_master.fk_school_sec_id AND fk_school_section_details.school_id=1";
		
		try {
			pstmt = connection.prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				StudentDetailsPOJO pojo=new StudentDetailsPOJO();
				pojo.setId(rs.getInt(1));
				pojo.setName(rs.getString(2));
				pojo.setStd(rs.getString(4));
				pojo.setDiv(rs.getString(5));
				pojo.setGrNo(rs.getString(3));
			//	System.out.println("Id:"+rs.getInt(1));
				//System.out.println("Name:"+rs.getString(2));
				//System.out.println("GR No:"+rs.getString(3));
				///System.out.println("STD:"+rs.getString(4));
				//System.out.println("Div:"+rs.getString(5));
				list.add(pojo);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
		
	}

	@Override
	public void editStudentDetails(StudentDetailsPOJO vp) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteStudentetails(int id) {
		// TODO Auto-generated method stub
		
	}

}
