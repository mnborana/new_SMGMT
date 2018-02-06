package com.servletStore.report.StudGeneralInfo.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;

public class StudGeneralInfoIMPL implements StudGeneralInfoDAO{

	DBConnection conn=new DBConnection();
	Connection connection=conn.getConnection();
	PreparedStatement pstmt=null;
	@Override
	public List<StudGeneralInfoPOJO> selectSchoolDetails(String schoolId) {
		List<StudGeneralInfoPOJO> schoolList=new ArrayList<>();
		String selectQuery="SELECT trustee_info.edu_society_name,school_master.name,school_master.address FROM trustee_info,school_master WHERE school_master.id="+schoolId+"";
		try {
			pstmt = connection.prepareStatement(selectQuery);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				StudGeneralInfoPOJO pojo1=new StudGeneralInfoPOJO();
				pojo1.setTrustyName(rs.getString(1));
				pojo1.setSchoolName(rs.getString(2));
				pojo1.setSchoolAddress(rs.getString(3));
				schoolList.add(pojo1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return schoolList;
	}
	@Override
	public List<StudGeneralInfoPOJO> selectStandard(String schoolId) {
		List<StudGeneralInfoPOJO> list=new ArrayList<>();
		String selectQuery="SELECT std_master.id,std_master.name FROM std_master,classroom_master,fk_class_master,fk_school_section_details WHERE classroom_master.fk_class_master_id=fk_class_master.id AND fk_class_master.std_id=std_master.id AND fk_class_master.fk_school_sec_id=fk_school_section_details.id AND fk_school_section_details.school_id="+schoolId+"";
		try {
			pstmt = connection.prepareStatement(selectQuery);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				StudGeneralInfoPOJO pojo=new StudGeneralInfoPOJO();
				pojo.setId(rs.getInt(1));
				pojo.setStandard(rs.getString(2));
				list.add(pojo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}		
}
