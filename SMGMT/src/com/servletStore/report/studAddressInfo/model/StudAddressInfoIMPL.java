package com.servletStore.report.studAddressInfo.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;


public class StudAddressInfoIMPL implements StudAddressInfoDAO {
	
	DBConnection conn=new DBConnection();
	Connection connection=conn.getConnection();
	PreparedStatement pstmt=null;
	@Override
	public List<StudAddressInfoPOJO> selectStdDiv(String schoolId) {
		List<StudAddressInfoPOJO> list=new ArrayList<>();
		String selectStdDiv="SELECT std_master.id,concat(std_master.name,' ',classroom_master.division) AS stdDiv FROM std_master,classroom_master,fk_class_master,fk_school_section_details WHERE classroom_master.fk_class_master_id=fk_class_master.id AND fk_class_master.std_id=std_master.id AND fk_class_master.fk_school_sec_id=fk_school_section_details.id AND fk_school_section_details.school_id="+schoolId+"";
		try {
			pstmt = connection.prepareStatement(selectStdDiv);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				StudAddressInfoPOJO pojo=new StudAddressInfoPOJO();
				pojo.setId(rs.getInt(1));
				pojo.setStdDiv(rs.getString(2));
				list.add(pojo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	@Override
	public StudAddressInfoPOJO selectSTDDiv(String stdDiv,String schoolId) {
		StudAddressInfoPOJO pojo=new StudAddressInfoPOJO();
		String StdDIV="SELECT std_master.name,classroom_master.division FROM classroom_master,std_master,fk_class_master,fk_school_section_details WHERE classroom_master.id="+stdDiv+" AND classroom_master.fk_class_master_id=fk_class_master.id AND fk_class_master.std_id=std_master.id AND fk_class_master.fk_school_sec_id=fk_school_section_details.id AND fk_school_section_details.school_id="+schoolId+"";
		try {
			pstmt = connection.prepareStatement(StdDIV);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				pojo.setStdDiv(rs.getString(1));
				pojo.setDivision(rs.getString(2));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return pojo;
	}
	@Override
	public StudAddressInfoPOJO selectSchoolDetails(String schoolId) {
		StudAddressInfoPOJO pojo=new StudAddressInfoPOJO();
		String schoolDetails="SELECT trustee_info.edu_society_name,school_master.name,school_master.address FROM trustee_info,school_master WHERE school_master.id="+schoolId+"";
		try {
			pstmt = connection.prepareStatement(schoolDetails);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				pojo.setTrustyInfo(rs.getString(1));
				pojo.setSchoolName(rs.getString(2));
				pojo.setAddress(rs.getString(3));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return pojo;
	}

}
