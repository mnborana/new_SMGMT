package com.servletStore.ptamember.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;
import com.mysql.jdbc.Connection;

public class PTAMemberImpl implements PTAMemberDAO {
		DBConnection conn=new DBConnection();
		Connection connection=(Connection) conn.getConnection();
		PreparedStatement pstmt=null;

	/*@Override
	public List getStandardList(PTAMemberPojo theStudent) {
		ResultSet rs = null;
		String query="SELECT fk_class_master.id,std_master.name,classroom_master.division,classroom_master.shift FROM std_master,classroom_master,fk_class_master,fk_school_section_details WHERE\n" + 
				"fk_school_section_details.school_id="+theStudent.getSchoolId()+" AND\n" + 
				"fk_class_master.fk_school_sec_id=fk_school_section_details.id AND\n" + 
				"std_master.id=fk_class_master.std_id AND\n" + 
				"classroom_master.fk_class_master_id=fk_class_master.id";
		List standardList=new ArrayList<>();
		try {
			pstmt=connection.prepareStatement(query);
			rs=pstmt.executeQuery();
			while (rs.next()) {
				standardList.add(rs.getString("id"));
				standardList.add(rs.getString("name"));
				standardList.add(rs.getString("division"));
				standardList.add(rs.getString("shift"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return standardList;
	}*/
		
		@Override
		public List getStandardList(PTAMemberPojo theStudent) {
			ResultSet rs = null;
			String query="SELECT classroom_master.id,std_master.name,classroom_master.division,classroom_master.shift FROM std_master,classroom_master,fk_class_master,fk_school_section_details WHERE\n" + 
					"fk_school_section_details.school_id="+theStudent.getSchoolId()+" AND\n" + 
					"fk_class_master.fk_school_sec_id=fk_school_section_details.id AND\n" + 
					"std_master.id=fk_class_master.std_id AND\n" + 
					"classroom_master.fk_class_master_id=fk_class_master.id";
			List standardList=new ArrayList<>();
			try {
				pstmt=connection.prepareStatement(query);
				rs=pstmt.executeQuery();
				while (rs.next()) {
					standardList.add(rs.getString("id"));
					standardList.add(rs.getString("name"));
					standardList.add(rs.getString("division"));
					standardList.add(rs.getString("shift"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return standardList;
		}
		
	@Override
	public List getStudentNameList(PTAMemberPojo pojo) {
		String id=pojo.getStandardDivId(); 
		System.out.println("id is:"+id);
		String studentList="SELECT student_details.id, student_details.first_name,student_details.middle_name,student_details.last_name FROM student_details,student_official_details,class_allocation WHERE student_official_details.classroom_master='"+pojo.getStandardDivId()+"' AND student_official_details.student_id =student_details.id AND student_official_details.lc_status=0 AND class_allocation.catalog_status=0 AND class_allocation.academic_year='2016-2017' AND class_allocation.student_id=student_details.id";
		List list=new ArrayList<>();
		ResultSet rs=null;
		
		try {
			pstmt = connection.prepareStatement(studentList);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				list.add(rs.getInt(1));
				list.add(rs.getString(2));
				list.add(rs.getString(3));
				list.add(rs.getString(4));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

}
