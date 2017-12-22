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
	public void insertStudent(StudentPojo theStudent) {
		
		System.out.println("School Details");
		System.out.println("===============");
		System.out.println("schoolId=="+theStudent.getSchoolId());
		System.out.println("sectionId=="+theStudent.getSectionId());
		System.out.println("admissionDate=="+theStudent.getAdmissionDate());
		
		System.out.println("Personal Details");
		System.out.println("=================");
		System.out.println("firstName=="+theStudent.getFirstName());
		System.out.println("middleName=="+theStudent.getMiddleName());
		System.out.println("lastName=="+theStudent.getLastName());
		System.out.println("gender=="+theStudent.getGender());
		System.out.println("dob=="+theStudent.getDob());
		System.out.println("bloodGroop=="+theStudent.getBloodGroop());
		System.out.println("heigth=="+theStudent.getHeigth());
		System.out.println("weight=="+theStudent.getWeight());
		System.out.println("minority=="+theStudent.getMinority());
		System.out.println("physicalHandicap=="+theStudent.getPhysicalHandicap());
		System.out.println("physicalHandicapType=="+theStudent.getPhysicalHandicapType());


		System.out.println("Family Details");
		System.out.println("==============");
				System.out.println("fatherName=="+theStudent.getFatherName());
		System.out.println("motherName=="+theStudent.getMotherName());
		System.out.println("nationality=="+theStudent.getNationality());
		System.out.println("fatherDesignation=="+theStudent.getFatherDesignation());
		System.out.println("fatherIncome=="+theStudent.getFatherIncome());
		System.out.println("motherTongue=="+theStudent.getMotherTongue());
		System.out.println("castCategoryId=="+theStudent.getCastCategoryId());
		System.out.println("religiousId=="+theStudent.getReligiousId());
		 System.out.println("castId=="+theStudent.getCastId());

		System.out.println("Contact Details ");
		System.out.println("=============== ");
		System.out.println("addressOne=="+theStudent.getAddressOne());
		 System.out.println("state=="+theStudent.getState());
		 System.out.println("pinCode=="+theStudent.getPinCode());
		 System.out.println("country=="+theStudent.getCountry());

		 System.out.println(" Bank Details");
		System.out.println("=============== ");
		 System.out.println("bankId=="+theStudent.getBankName());
		 System.out.println("ifscId=="+theStudent.getIfscCode());
		System.out.println("accountNo=="+theStudent.getAccountNo());

		System.out.println(" Transportation Details");
		System.out.println("====================== ");
		 System.out.println("vehicleId=="+theStudent.getBusStop());
		 System.out.println("vehicleRate=="+theStudent.getVehicleMonth());
		 System.out.println("vehicleDiscount=="+theStudent.getTotRate());

		 System.out.println("Profile Picture");
		 System.out.println("=================");
		 System.out.println("profilePicture=="+theStudent.getProfilePicture());


		
	}

	@Override
	public List<StudentPojo> getSectionList(StudentPojo theStudent) {
		
		ResultSet rs = null;
		String maxid="SELECT fk_school_section_details.id,sections_master.name FROM `fk_school_section_details`,sections_master WHERE fk_school_section_details.school_id="+theStudent.getSchoolId()+" AND sections_master.id=fk_school_section_details.section_id";
		List sectionList=new ArrayList<>();
		try {
			pstmt=connection.prepareStatement(maxid);
			rs=pstmt.executeQuery();
			while (rs.next()) {
				sectionList.add(rs.getString("id"));
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
		String query="SELECT fk_class_master.id,std_master.name,classroom_master.division,classroom_master.shift FROM std_master,classroom_master,fk_class_master WHERE \n" + 
				"fk_class_master.fk_school_sec_id="+theStudent.getSchoolId()+" AND \n" + 
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

}
