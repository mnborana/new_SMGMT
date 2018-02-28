package com.servletStore.report.icardReport.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;
import com.servletStore.fees.feescollection.model.FeesCollectionPOJO;

public class IcardGenerateImpl implements IcardGenerateDAO {
	DBConnection dbconnect=new DBConnection();
	Connection connection=dbconnect.getConnection();
	
	PreparedStatement pstmt=null;
	
	/* (non-Javadoc)
	 * @see com.servletStore.fees.feescollection.model.FeesCollectionDAO#getStadardDivisionDetails()
	 */
	@Override
	public List<IcardGeneratePOJO> getStadardDivisionDetails(String schoolId) {

		List<IcardGeneratePOJO> list = new ArrayList<>();
		
		try {
			
			String query="SELECT classroom_master.id,std_master.name,classroom_master.division,classroom_master.shift FROM std_master,classroom_master,fk_class_master,fk_school_section_details WHERE\n" + 
					"fk_school_section_details.school_id="+schoolId+" AND\n" + 
					"fk_class_master.fk_school_sec_id=fk_school_section_details.id AND\n" + 
					"std_master.id=fk_class_master.std_id AND\n" + 
					"classroom_master.fk_class_master_id=fk_class_master.id";
			
			
			pstmt = connection.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				IcardGeneratePOJO pojo=new IcardGeneratePOJO();
				
				pojo.setClassRoomMasterId(rs.getInt("id"));
				pojo.setStdName(rs.getString("name"));
				pojo.setDivName(rs.getString("division"));
				pojo.setShift(rs.getString("shift"));
				list.add(pojo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
				
		return list;
	}

	@Override
	public List getStudentInfo(String standard_id) {
		
		ResultSet rs = null;
		String query = "SELECT student_details.id, concat(student_details.first_name,' ',student_details.middle_name,' ',student_details.last_name) "
					 + "AS full_name FROM student_details, class_allocation WHERE class_allocation.student_id = student_details.id AND "
					 + "class_allocation.classroom_master="+standard_id;
		
		List studInfo=new ArrayList<>();
		
		try {
			pstmt=connection.prepareStatement(query);
			rs=pstmt.executeQuery();
			while (rs.next()) {
				studInfo.add(rs.getString("id"));
				studInfo.add(rs.getString("full_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		
		return studInfo;
	}


}
