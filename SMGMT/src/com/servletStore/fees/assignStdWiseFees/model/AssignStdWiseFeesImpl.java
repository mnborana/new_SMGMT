package com.servletStore.fees.assignStdWiseFees.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import com.dbconnect.DBConnection;

public class AssignStdWiseFeesImpl implements AssignStdWiseFeesDao {

	PreparedStatement ps;
	
	@Override
	public HashMap<Integer, String> getStandards(String schoolId) {
		
		DBConnection dbconnect = new DBConnection();
		Connection connection = dbconnect.getConnection();
		
		HashMap<Integer, String> stdList = new HashMap<>();
		
		String getstandardList = "SELECT fk_class_master.id, std_master.name FROM std_master, fk_class_master, fk_school_section_details WHERE fk_class_master.std_id=std_master.id AND fk_class_master.fk_school_sec_id=fk_school_section_details.id AND fk_school_section_details.school_id=? ORDER BY `std_master`.`name`  ASC";
		try {
			
			ps = connection.prepareStatement(getstandardList);
			ps.setInt(1, Integer.parseInt(schoolId));
			ResultSet rs = ps.executeQuery();
			AssignStdWiseFeesPojo pojo = new AssignStdWiseFeesPojo();
			
			while(rs.next())
			{
				
				stdList.put(rs.getInt(1), rs.getString(2));
			}
			
			connection.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return stdList;
	}

	@Override 
	public List<AssignStdWiseFeesPojo> getFeestypeList() {
		
		DBConnection dbConnect = new DBConnection();
		Connection connection = dbConnect.getConnection();
		
		List<AssignStdWiseFeesPojo> FeesTypeList = new ArrayList<>();
		
		String getQuery = "SELECT `id`, `fees_type`, `fees`, `term_1`, `term_2` FROM `fee_type`  WHERE caste=0";
		
		try{
			
			ps = connection.prepareStatement(getQuery);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				
				AssignStdWiseFeesPojo pojo = new AssignStdWiseFeesPojo();
				
				int id = rs.getInt(1);
				String feesType = rs.getString(2);
				String fees = rs.getString(3);
				String termOne = rs.getString(4);
				String termTwo = rs.getString(5);
				
				String termOneFees = "0";
				String termTwoFees = "0";
				
				
				if(termOne.equals("1")){
					termOneFees = fees;
				}
				
				if(termTwo.equals("1")){
					termTwoFees = fees;
				}
				
				pojo.setId(id);
				pojo.setFeesType(feesType);
				pojo.setTermOneFees(Integer.parseInt(termOneFees));
				pojo.setTermTwoFees(Integer.parseInt(termTwoFees));	
				
				FeesTypeList.add(pojo);
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return FeesTypeList;
	}

	@Override
	public int insert(List<AssignStdWiseFeesPojo> asList, String academicYear) {
		
		DBConnection dbConnect = new DBConnection();
		Connection connection = dbConnect.getConnection();
		int insertStatus = 0;
		
		Iterator<AssignStdWiseFeesPojo> itr = asList.iterator();
		String insertQuery = "INSERT INTO `std_wise_fees_assignment`(`fk_class_master_id`, `fees_type_id`, `term_1_fees`, `term_2_fees`, `priority`, `academic_year`) VALUES (?, ?, ?, ?, ?, ?)";
		
		try {
			ps = connection.prepareStatement(insertQuery);
			
			while(itr.hasNext()){
				AssignStdWiseFeesPojo asPojo = itr.next();
				
				ps.setInt(1, asPojo.getFkClassMasterId());
				ps.setInt(2, asPojo.getFeesTypeId());
				ps.setInt(3, asPojo.getTermOneFees());
				ps.setInt(4, asPojo.getTermTwoFees());
				ps.setInt(5, asPojo.getPriority());
				ps.setString(6, academicYear);
				
				ps.addBatch();
			}
			
			ps.executeBatch();
			connection.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return insertStatus;
	}

	@Override
	public List<String> getCategoryList() {
		DBConnection dbConnect = new DBConnection();
		Connection connection = dbConnect.getConnection();
		
		List<String> categoryList = new ArrayList<>();
		String str = "SELECT `category_name` FROM `caste_category` ORDER BY `caste_category`.`id` ASC";

		try {
			ps = connection.prepareStatement(str);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				categoryList.add(rs.getString(1));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return categoryList;
	}

	
	@Override
	public List<String> getFeesAssignedStds(String schoolId) {
		DBConnection dbConnect = new DBConnection();
		Connection connection = dbConnect.getConnection();
		
		
		List<String> stdList = new ArrayList<>();
		String str = "SELECT std_wise_fees_assignment.fk_class_master_id, std_master.name FROM std_master INNER JOIN fk_class_master ON fk_class_master.std_id=std_master.id INNER JOIN fk_school_section_details ON fk_school_section_details.school_id="+schoolId+" AND fk_class_master.fk_school_sec_id=fk_school_section_details.id INNER JOIN std_wise_fees_assignment ON std_wise_fees_assignment.fk_class_master_id=fk_class_master.id GROUP BY std_wise_fees_assignment.fk_class_master_id";

		try {
			ps = connection.prepareStatement(str);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				stdList.add(rs.getString(1).trim());
				stdList.add(rs.getString(2).trim());
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return stdList;
	}

	
	@Override
	public List<String> getFeesStructure(String stdId) {
		DBConnection dbConnect = new DBConnection();
		Connection connection = dbConnect.getConnection();
		
		
		List<String> feesStructure = new ArrayList<>();
		String str = "SELECT fee_type.fees_type, std_wise_fees_assignment.term_1_fees, std_wise_fees_assignment.term_2_fees FROM `std_wise_fees_assignment`, fee_type WHERE std_wise_fees_assignment.fk_class_master_id="+stdId+" AND fee_type.id=std_wise_fees_assignment.fees_type_id";

		try {
			ps = connection.prepareStatement(str);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				feesStructure.add(rs.getString(1).trim());
				feesStructure.add(rs.getString(2).trim());
				feesStructure.add(rs.getString(3).trim());
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return feesStructure;
	}

	@Override
	public List<String> getCategoryWiseFeesList(String stdId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> getCategoryWiseFeesList2(String stdId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> getCategoryFeesTypes(String stdId) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
