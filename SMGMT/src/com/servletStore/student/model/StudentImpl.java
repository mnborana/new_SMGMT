package com.servletStore.student.model;

import java.util.List;

public class StudentImpl implements StudentDAO {

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
	public List<StudentPojo> getSectionDetails() {
		
		return null;
	}

}
