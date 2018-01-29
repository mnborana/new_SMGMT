package com.servletStore.report.generalRegister.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;

public class GeneralRegisterIMPL implements GeneralRegisterDAO {
	DBConnection connection=new DBConnection();
	Connection connection2=connection.getConnection();
	PreparedStatement pstmt=null;

	@Override
	public List selectSectionList(String id) {
		List list=new ArrayList<>();
		String selectQuery="SELECT sections_master.id,sections_master.name FROM sections_master,school_master WHERE school_master.id IN(SELECT fk_school_section_details.school_id FROM fk_school_section_details WHERE fk_school_section_details.school_id="+id+")";
		try {
			pstmt = connection2.prepareStatement(selectQuery);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				GeneralRegisterPOJO pojo=new GeneralRegisterPOJO();
				pojo.setId(rs.getInt(1));
				pojo.setSection_name(rs.getString(2));
				list.add(pojo);				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public GeneralRegisterPOJO selectSection(String schoolId, String sectionId) {
		GeneralRegisterPOJO pojo=new GeneralRegisterPOJO();
		String sectionQuery="SELECT sections_master.name FROM sections_master,school_master WHERE school_master.id IN(SELECT fk_school_section_details.school_id FROM fk_school_section_details WHERE fk_school_section_details.school_id="+schoolId+" AND sections_master.id="+sectionId+")";
		try {
			pstmt = connection2.prepareStatement(sectionQuery);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{				
				pojo.setSection_name(rs.getString(1));				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return pojo;
		
	}

	@Override
	public List getSchoolDetails(GeneralRegisterPOJO pojo,String schoolId) {
		List<GeneralRegisterPOJO> list=new ArrayList<>();
		String schoolDetails="SELECT trustee_info.edu_society_name,school_master.name,school_master.address FROM school_master,trustee_info WHERE school_master.id="+schoolId+"";
		try {
			pstmt = connection2.prepareStatement(schoolDetails);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				GeneralRegisterPOJO pojo1=new GeneralRegisterPOJO();
				pojo1.setTrustyName(rs.getString(1));
				pojo1.setSchoolName(rs.getString(2));
				pojo1.setAddress(rs.getString(3));
				list.add(pojo1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	

}
