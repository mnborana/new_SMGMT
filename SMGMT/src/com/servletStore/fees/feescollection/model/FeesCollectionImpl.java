/**
 * 	  Author : SARANG KAMBLE,OMKAR SHIVADEKAR
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

	@Override
	public String getStudentCast(String student_id) throws SQLException
	{
		DBConnection dbconnect=new DBConnection();
		Connection connection=dbconnect.getConnection();
		String cast_category="";
		
		String query="SELECT caste_category.category_name FROM student_details,caste_category WHERE student_details.category_id=caste_category.id AND student_details.id=?";
		pstmt = connection.prepareStatement(query);
		pstmt.setString(1, student_id);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){
			cast_category = rs.getString(1);
		}
		
		
		connection.close();
		return cast_category;
	}

	@Override
	public List getStandardWiseFee(String standard_id) throws SQLException
	{
		//standard_id=classroom_master_id
		
		DBConnection dbconnect=new DBConnection();
		Connection connection=dbconnect.getConnection();
		List list = new ArrayList<>();
		
		String query="SELECT fee_type.fees_type,std_wise_fees_assignment.term_1_fees,std_wise_fees_assignment.term_2_fees FROM fee_type,std_wise_fees_assignment,classroom_master WHERE classroom_master.fk_class_master_id=std_wise_fees_assignment.fk_class_master_id AND fee_type.id=std_wise_fees_assignment.fees_type_id AND classroom_master.id=?";
		pstmt = connection.prepareStatement(query);
		pstmt.setString(1, standard_id);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			list.add(rs.getString(1));
			list.add(rs.getInt(2));
			list.add(rs.getInt(3));
		}
		
		connection.close();
		
		return list;
	}

	@Override
	public List getStudentCastwiseFee(String student_id) throws SQLException
	{
		DBConnection dbconnect=new DBConnection();
		Connection connection=dbconnect.getConnection();
		List list = new ArrayList<>();
		
		String query="SELECT fee_type.fees_type,caste_wise_educational_fees.fees FROM fee_type,caste_wise_educational_fees,student_details WHERE fee_type.id=caste_wise_educational_fees.fees_type_id AND student_details.category_id=caste_wise_educational_fees.caste_category_id AND student_details.id=?";
		pstmt = connection.prepareStatement(query);
		pstmt.setString(1, student_id);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			list.add(rs.getString(1));
			list.add(rs.getInt(2));
		}
		
		connection.close();
		
		return list;
		
	}
	@Override
	public int assignStudentFee(AssignFeeDAO pojo) throws SQLException
	{
		DBConnection dbconnect=new DBConnection();
		Connection connection=dbconnect.getConnection();
		int status=0;
		
		String query="INSERT INTO `fees_collection`(`stud_id`, `fk_classroom_master_id`, `date`, `remaining_fees`, `particulars`) VALUES (?,?,?,?,'FEE ASSIGNED')";
		pstmt=connection.prepareStatement(query);
		pstmt.setString(1, pojo.getStudentId());
		pstmt.setString(2, pojo.getClassroomMasterId());
		pstmt.setString(3, pojo.getDate());
		pstmt.setString(4, pojo.getFee());
			
		status=pstmt.executeUpdate();
		
		connection.close();
		return status;
	}

	@Override
	public String getDateForCheck(String studId, String particulars) throws SQLException
	{
		DBConnection dbconnect=new DBConnection();
		Connection connection=dbconnect.getConnection();
		String date="";

		String query="SELECT date FROM `fees_collection` WHERE fees_collection.stud_id=? AND fees_collection.particulars=?";
		pstmt = connection.prepareStatement(query);
		pstmt.setString(1, studId);
		pstmt.setString(2, particulars);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			date=rs.getString(1);
		}
		
		connection.close();
		return date;
	}

	@Override
	public String getLastAcademicYear() throws SQLException
	{
		DBConnection dbconnect=new DBConnection();
		Connection connection=dbconnect.getConnection();
		String year="";

		String query="SELECT year FROM `academy_year` ORDER by academy_year.id DESC LIMIT 1";
		pstmt = connection.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			year=rs.getString(1);
		}
		
		connection.close();
		return year;
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
			pstmt.setInt   (5, feesCollectionPOJO.getRemainingFees());
			pstmt.setString(6, feesCollectionPOJO.getPaymentMode());
			
			
			if(feesCollectionPOJO.getCheckboxCashbook()!=null){
				
				System.out.println("cashbook1"+feesCollectionPOJO.getCheckboxCashbook());
			}
			
			//pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
