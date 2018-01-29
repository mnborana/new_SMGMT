/**
 * 	  Author : SARANG KAMBLE
 * 	Document : FeesCollectionImpl.java
 *		Date : 22-Jan-2018
 * 		Time : 4:17:43 PM
 */
package com.servletStore.fees.feescollection.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;

public class FeesCollectionImpl implements FeesCollectionDAO {

	
	DBConnection dbconnect=new DBConnection();
	Connection connection=dbconnect.getConnection();
	
	PreparedStatement pstmt=null;
	
	/* (non-Javadoc)
	 * @see com.servletStore.fees.feescollection.model.FeesCollectionDAO#getStadardDivisionDetails()
	 */
	@Override
	public List<FeesCollectionPOJO> getStadardDivisionDetails(String schoolId) {

		List<FeesCollectionPOJO> list = new ArrayList<>();
		
		try {
			
			String query="SELECT classroom_master.id,std_master.name,classroom_master.division,classroom_master.shift FROM std_master,classroom_master,fk_class_master,fk_school_section_details WHERE\n" + 
					"fk_school_section_details.school_id="+schoolId+" AND\n" + 
					"fk_class_master.fk_school_sec_id=fk_school_section_details.id AND\n" + 
					"std_master.id=fk_class_master.std_id AND\n" + 
					"classroom_master.fk_class_master_id=fk_class_master.id";
			
			
			pstmt = connection.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				FeesCollectionPOJO feesCollectionPOJO = new FeesCollectionPOJO();
				
				feesCollectionPOJO.setClassRoomMasterId(rs.getInt("id"));
				feesCollectionPOJO.setStdName(rs.getString("name"));
				feesCollectionPOJO.setDivName(rs.getString("division"));
				feesCollectionPOJO.setShift(rs.getString("shift"));
				list.add(feesCollectionPOJO);
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

	/* (non-Javadoc)
	 * @see com.servletStore.fees.feescollection.model.FeesCollectionDAO#getStudentFeesInfo(java.lang.String)
	 */
	@Override
	public List getStudentFeesInfo(String student_id) {

		ResultSet rs = null;
		String query = "SELECT remaining_fees FROM fees_collection WHERE id=(SELECT MAX(id) FROM fees_collection WHERE stud_id='"+student_id+"')";
		String query1 = "SELECT date, paid_fees, remaining_fees, pay_mode, particulars FROM fees_collection WHERE stud_id="+student_id;
		
		List<Object> studFeesInfo=new ArrayList<>();
		
		try {
			pstmt=connection.prepareStatement(query);
			rs=pstmt.executeQuery();
			while (rs.next()) {
				studFeesInfo.add(rs.getString("remaining_fees"));
			}
			
			pstmt=connection.prepareStatement(query1);
			rs=pstmt.executeQuery();
			while (rs.next()) {
				
				studFeesInfo.add(rs.getString("date"));
				studFeesInfo.add(rs.getString("paid_fees"));
				studFeesInfo.add(rs.getString("remaining_fees"));
				studFeesInfo.add(rs.getString("pay_mode"));
				studFeesInfo.add(rs.getString("particulars"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		
		return studFeesInfo;
	}

	/* (non-Javadoc)
	 * @see com.servletStore.fees.feescollection.model.FeesCollectionDAO#insertFees(com.servletStore.fees.feescollection.model.FeesCollectionPOJO)
	 */
	@Override
	public void insertFees(FeesCollectionPOJO feesCollectionPOJO) {
		
		try {
			pstmt=connection.prepareStatement("INSERT INTO `fees_collection`(`stud_id`, `fk_classroom_master_id`, `date`, `paid_fees`, `remaining_fees`, `pay_mode`) VALUES (?,?,?,?,?,?)");
			
			pstmt.setString(1, feesCollectionPOJO.getStudId());
			pstmt.setString(2, feesCollectionPOJO.getStdId());
			pstmt.setString(3, feesCollectionPOJO.getCurrentDate());
			pstmt.setString(4, feesCollectionPOJO.getPaidFees());
			pstmt.setString(5, feesCollectionPOJO.getRemainingFees());
			pstmt.setString(6, feesCollectionPOJO.getPaymentMode());
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
