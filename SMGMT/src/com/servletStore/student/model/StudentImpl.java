package com.servletStore.student.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;

public class StudentImpl implements StudentDAO {
	DBConnection con=new DBConnection();
	Connection connection=con.getConnection();
	PreparedStatement pstmt=null;

	@Override
	public int insertStudent(StudentPojo theStudent) {
		int flag=0;
//		System.out.println("School Details");
//		System.out.println("===============");
//		System.out.println("schoolId=="+theStudent.getSchoolId());
//		System.out.println("admissionDate=="+theStudent.getAdmissionDate());
//		
//		System.out.println("Personal Details");
//		System.out.println("=================");
//		System.out.println("firstName=="+theStudent.getFirstName());
//		System.out.println("middleName=="+theStudent.getMiddleName());
//		System.out.println("lastName=="+theStudent.getLastName());
//		System.out.println("gender=="+theStudent.getGender());
//		System.out.println("dob=="+theStudent.getDob());
//		System.out.println("bloodGroop=="+theStudent.getBloodGroop());
//		System.out.println("heigth=="+theStudent.getHeigth());
//		System.out.println("weight=="+theStudent.getWeight());
//		System.out.println("minority=="+theStudent.getMinority());
//		System.out.println("physicalHandicap=="+theStudent.getPhysicalHandicap());
//		System.out.println("physicalHandicapType=="+theStudent.getPhysicalHandicapType());
//
//
//		System.out.println("Family Details");
//		System.out.println("==============");
//				System.out.println("fatherName=="+theStudent.getFatherName());
//		System.out.println("motherName=="+theStudent.getMotherName());
//		System.out.println("nationality=="+theStudent.getNationality());
//		System.out.println("fatherDesignation=="+theStudent.getFatherDesignation());
//		System.out.println("fatherIncome=="+theStudent.getFatherIncome());
//		System.out.println("motherTongue=="+theStudent.getMotherTongue());
//		System.out.println("castCategoryId=="+theStudent.getCastCategoryId());
//		System.out.println("religiousId=="+theStudent.getReligiousId());
//		 System.out.println("castId=="+theStudent.getCastId());
//
//		System.out.println("Contact Details ");
//		System.out.println("=============== ");
//		System.out.println("addressOne=="+theStudent.getAddressOne());
//		 System.out.println("state=="+theStudent.getState());
//		 System.out.println("pinCode=="+theStudent.getPinCode());
//		 System.out.println("country=="+theStudent.getCountry());
//
//		 System.out.println(" Bank Details");
//		System.out.println("=============== ");
//		 System.out.println("bankId=="+theStudent.getBankName());
//		 System.out.println("ifscId=="+theStudent.getIfscCode());
//		System.out.println("accountNo=="+theStudent.getAccountNo());

		try {
			ResultSet rs = null;
			String id="";
			
			String query="SELECT AUTO_INCREMENT FROM information_schema.TABLES WHERE TABLE_SCHEMA='smgmt' AND TABLE_NAME='student_details'";
			pstmt=connection.prepareStatement(query);
			rs=pstmt.executeQuery();
			while (rs.next()) {
				id=String.valueOf(rs.getInt(1));
			}
			
			pstmt = connection.prepareStatement("INSERT INTO `student_details`"
					+ "(`id`, `first_name`, `middle_name`, `last_name`, `dob`, `age`, `birth_place`, `gender`, `blood_group`, `height`, `weight`,"
					+ " `aadhar_no`, `mother_tongue`, `religion_id`, `caste_id`, `category_id`, `nationality`, `minority`, `physical_handicap`, "
					+ "`physical_handicap_type`, `pin_code`, `taluka`, `district`, `state`, `address`, `bank_name`, `ifsc_code`, `account_no`) VALUES "
					+ "(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

			pstmt.setString(1, id);
			pstmt.setString(2, theStudent.getFirstName());
			pstmt.setString(3, theStudent.getMiddleName());
			pstmt.setString(4, theStudent.getLastName());
			String[] dob=theStudent.getDob().split("-");
			String dobString=dob[2]+"-"+dob[1]+"-"+dob[0];
			pstmt.setString(5, dobString);
			pstmt.setString(6, theStudent.getAge());
			pstmt.setString(7, theStudent.getBirthPlace());
			pstmt.setString(8, theStudent.getGender());
			pstmt.setString(9, theStudent.getBloodGroop());
			pstmt.setString(10, theStudent.getHeigth());
			pstmt.setString(11, theStudent.getWeight());
			pstmt.setString(12, theStudent.getStudAadharNumber());
			pstmt.setString(13, theStudent.getMotherTongue());
			pstmt.setString(14, theStudent.getReligiousId());
			pstmt.setString(15, theStudent.getCastId());
			pstmt.setString(16, theStudent.getCastCategoryId());
			pstmt.setString(17, theStudent.getNationality());
			if (theStudent.getMinority() != null) {
				pstmt.setString(18, theStudent.getMinority());
			}else {
				pstmt.setString(18, "0");
			}
			if (theStudent.getPhysicalHandicap() != null) {
				pstmt.setString(19, theStudent.getPhysicalHandicap());
				pstmt.setString(20, theStudent.getPhysicalHandicapType());
			}else {
				pstmt.setString(19, "0");
				pstmt.setString(20, "");
			}
			
			pstmt.setString(21, theStudent.getPinCode());
			pstmt.setString(22, theStudent.getTaluk());
			pstmt.setString(23, theStudent.getDistrict());
			pstmt.setString(24, theStudent.getState());
			pstmt.setString(25, theStudent.getAddressOne());
			pstmt.setString(26, theStudent.getBankName());
			pstmt.setString(27, theStudent.getIfscCode());
			pstmt.setString(28, theStudent.getAccountNo());
			
			int studentDetailQuery=pstmt.executeUpdate();
			if (studentDetailQuery >0) {
				System.out.println("Student Detail Inserted Successfully");
				flag++;
			}
					
			pstmt = connection.prepareStatement("INSERT INTO `student_parent_details`"
					+ "(`student_id`, `father_name`, `father_mobileno`, `father_aadharno`, `father_occupation`, "
					+ "`father_income`, `father_email`, `mother_name`, `mother_mobileno`, `mother_aadharno`, `mother_occupation`, "
					+ "`mother_income`, `mother_email`) VALUES"
					+ "(?,?,?,?,?,?,?,?,?,?,?,?,?)");

			pstmt.setString(1, id);
			pstmt.setString(2, theStudent.getFatherName());
			pstmt.setString(3, theStudent.getFatherMobileNo());
			pstmt.setString(4, theStudent.getFatherAaadharNo());
			pstmt.setString(5, theStudent.getFatherDesignation());
			pstmt.setString(6, theStudent.getFatherIncome());
			pstmt.setString(7, theStudent.getFatherEmail());
			pstmt.setString(8, theStudent.getMotherName());
			pstmt.setString(9, theStudent.getMotherMobileNo());
			pstmt.setString(10, theStudent.getMotherAaadharNo());
			pstmt.setString(11, theStudent.getMotherDesignation());
			pstmt.setString(12, theStudent.getMotherIncome());
			pstmt.setString(13, theStudent.getMotherEmail());
			
			int parentQuery=pstmt.executeUpdate();
			if (parentQuery > 0) {
				System.out.println("Parent Details Inserted Successfully!");
				flag++;
			}

			pstmt = connection.prepareStatement("INSERT INTO `student_official_details`"
					+ "(`student_id`, `fk_class_master`, `academic_year`, `book_no`, `gr_no`, "
					+ "`admission_date`, `previous_school_name`, `medium`) VALUES"
					+ "(?,?,?,?,?,?,?,?)");

			pstmt.setString(1, id);
			pstmt.setString(2, theStudent.getStdId());
			pstmt.setString(3, theStudent.getAcademicYearId());
			pstmt.setString(4, theStudent.getBookNo());
			pstmt.setString(5, theStudent.getGrNo());
			String[] admisDate=theStudent.getAdmissionDate().split("-");
			String admisDateString=admisDate[2]+"-"+admisDate[1]+"-"+admisDate[0];
			pstmt.setString(6, admisDateString);
			pstmt.setString(7, theStudent.getPreviousSchool());
			pstmt.setString(8, theStudent.getMedium());
			
			int studentOfficialDetailsQuery=pstmt.executeUpdate();
			if (studentOfficialDetailsQuery > 0) {
				System.out.println("Student Official Details Inserted Successfully!");
				flag++;
			}
			if (theStudent.getClassAllow() != null) {
				pstmt = connection.prepareStatement("INSERT INTO `class_allocation`"
						+ "(`student_id`, `fk_class_master`, `academic_year`) VALUES"
						+ "(?,?,?)");

				pstmt.setString(1, id);
				pstmt.setString(2, theStudent.getCurrentStdId());
				pstmt.setString(3, theStudent.getAcademicYearId());
				
				int classAllocationQuery=pstmt.executeUpdate();
				if (classAllocationQuery>0) {
					System.out.println("Class Allocation Successfully!");
					flag++;
				}
			}
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return flag;
		
	}

	@Override
	public List<StudentPojo> getSectionList(StudentPojo theStudent) {
		
		ResultSet rs = null;
		String maxid="SELECT sections_master.name FROM sections_master,fk_school_section_details,fk_class_master WHERE\n" + 
				"fk_class_master.id="+theStudent.getSchoolId()+" AND\n" + 
				"fk_school_section_details.id=fk_class_master.fk_school_sec_id AND\n" + 
				"sections_master.id=fk_school_section_details.section_id";
		List sectionList=new ArrayList<>();
		try {
			pstmt=connection.prepareStatement(maxid);
			rs=pstmt.executeQuery();
			while (rs.next()) {
				sectionList.add(rs.getString("name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sectionList;
	}

	@Override
	public List getStandardList(StudentPojo theStudent) {
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
	}

	@Override
	public List getReligionList() {
		ResultSet rs = null;
		String query="SELECT `id`, `religion_name` FROM `religion`";
		List religionList=new ArrayList<>();
		try {
			pstmt=connection.prepareStatement(query);
			rs=pstmt.executeQuery();
			while (rs.next()) {
				religionList.add(rs.getString("id"));
				religionList.add(rs.getString("religion_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return religionList;
	}

	@Override
	public List getCasteList(StudentPojo theStudent) {
		ResultSet rs = null;
		String query="SELECT `id`,`caste_name` FROM `caste` WHERE `religion_id`="+theStudent.getCastId();
		List casteList=new ArrayList<>();
		try {
			pstmt=connection.prepareStatement(query);
			rs=pstmt.executeQuery();
			while (rs.next()) {
				casteList.add(rs.getString("id"));
				casteList.add(rs.getString("caste_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return casteList;
	}

	@Override
	public List getCategoryList(StudentPojo theStudent) {
		ResultSet rs = null;
		String query="SELECT caste_category.id,caste_category.category_name FROM `caste`,caste_category WHERE caste_category.id=caste.category_id AND caste.id="+theStudent.getCastCategoryId();
		List categoryList=new ArrayList<>();
		try {
			pstmt=connection.prepareStatement(query);
			rs=pstmt.executeQuery();
			while (rs.next()) {
				categoryList.add(rs.getString("id"));
				categoryList.add(rs.getString("category_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return categoryList;
	}

}
