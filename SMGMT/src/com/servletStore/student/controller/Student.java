package com.servletStore.student.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servletStore.student.model.StudentDAO;
import com.servletStore.student.model.StudentImpl;
import com.servletStore.student.model.StudentPojo;

/**
 * Servlet implementation class Student
 */
public class Student extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private StudentDAO sd;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		System.out.println("in Post");
		String submit=request.getParameter("submit");
		if(submit!=null)
		{
			System.out.println("in Loop");
//	=================OFFICIAL DETAILS (13{1})=================
			String schoolId=request.getParameter("schoolId");
			String academicYearId=request.getParameter("academicYearId");
			String sectionId=request.getParameter("sectionId");
			String stdId=request.getParameter("stdId");
			String divId=request.getParameter("divId");
			String bookNo=request.getParameter("bookNo");
			String grNo=request.getParameter("grNo");
			String admissionDate=request.getParameter("admissionDate");
			
			String classAllow=request.getParameter("classAllow");
			String previousSchool=request.getParameter("previousSchool");
			
			String currentStdId=request.getParameter("currentStdId");
			String currentdivId=request.getParameter("currentdivId");
			String medium=request.getParameter("medium");
			String semiEnglish=request.getParameter("semiEnglish");

//=================Personal Details (19)=================
			String firstName=request.getParameter("firstName");
			String middleName=request.getParameter("middleName");
			String lastName=request.getParameter("lastName");
			String dob=request.getParameter("dob");
			String age=request.getParameter("age");
			String birthPlace=request.getParameter("birthPlace");
			String gender=request.getParameter("gender");
			String bloodGroop=request.getParameter("bloodGroop");
			String heigth=request.getParameter("heigth");
			String weight=request.getParameter("weight");
			String studAadharNumber=request.getParameter("studAadharNumber");
			String nationality=request.getParameter("nationality");
			String motherTongue=request.getParameter("motherTongue");
			String religiousId=request.getParameter("religious");
			String castId=request.getParameter("cast");
			String castCategoryId=request.getParameter("castCategory");
			String minority=request.getParameter("minority");
			String physicalHandicap=request.getParameter("physicalHandicap");
			String physicalHandicapType=request.getParameter("physicalHandicapType");


//=================Father Details(6)=================
			String fatherName=request.getParameter("fatherName");
			String fatherMobileNo=request.getParameter("fatherMobileNo");
			String fatherAaadharNo=request.getParameter("fatherAaadharNo");
			String fatherDesignation=request.getParameter("fatherDesignation");
			String fatherIncome=request.getParameter("fatherIncome");
			String fatherEmail=request.getParameter("fatherEmail");
			
//=================Mother Details(6)=================
			String motherName=request.getParameter("motherName");
			String motherMobileNo=request.getParameter("motherMobileNo");
			String motherAaadharNo=request.getParameter("motherAaadharNo");
			String motherDesignation=request.getParameter("motherDesignation");
			String motherIncome=request.getParameter("motherIncome");
			String motherEmail=request.getParameter("motherEmail");
			
//=================Contact Details(5{1})=================
			String pinCode=request.getParameter("pinCode");
			String taluk=request.getParameter("taluk");
			String district=request.getParameter("district");
			String state=request.getParameter("state");
			String country="INDIA";
			String addressOne=request.getParameter("addressOne");

//	=================Bank Details(3)=================
			String bankName=request.getParameter("bankName");
			String ifscCode=request.getParameter("ifscCode");
			String accountNo=request.getParameter("accountNo");

//	=================Transportation Details=================
			String busStop=request.getParameter("busStop");
			String vehicleMonth=request.getParameter("vehicleMonth");
			String totRate=request.getParameter("totRate");


//	=================Profile Picture=================
			
			String profilePicture=request.getParameter("profilePicture");

//******************************************Set Values*****************************************************
			StudentPojo theStudent=new StudentPojo();
			//OFFICIAL DETAILS
			theStudent.setSchoolId(schoolId);
			theStudent.setAcademicYearId(academicYearId);
			theStudent.setSectionId(sectionId);
			theStudent.setStdId(stdId);
			theStudent.setDivId(divId);
			theStudent.setBookNo(bookNo);
			theStudent.setGrNo(grNo);
			theStudent.setAdmissionDate(admissionDate);
			theStudent.setClassAllow(classAllow);
			theStudent.setPreviousSchool(previousSchool);
			theStudent.setCurrentStdId(currentStdId);
			theStudent.setCurrentdivId(currentdivId);
			theStudent.setMedium(medium);
			theStudent.setSemiEnglish(semiEnglish);
			//Personal Details
			theStudent.setFirstName(firstName);
			theStudent.setMiddleName(middleName);
			theStudent.setLastName(lastName);
			theStudent.setDob(dob);
			theStudent.setAge(age);
			theStudent.setBirthPlace(birthPlace);
			theStudent.setGender(gender);
			theStudent.setBloodGroop(bloodGroop);
			theStudent.setHeigth(heigth);
			theStudent.setWeight(weight);
			theStudent.setStudAadharNumber(studAadharNumber);
			theStudent.setNationality(nationality);
			theStudent.setMotherTongue(motherTongue);
			theStudent.setReligiousId(religiousId);
			theStudent.setCastId(castId);
			theStudent.setCastCategoryId(castCategoryId);
			theStudent.setMinority(minority);
			theStudent.setPhysicalHandicap(physicalHandicap);
			theStudent.setPhysicalHandicapType(physicalHandicapType);
			//Father Details
			theStudent.setFatherName(fatherName);
			theStudent.setFatherMobileNo(fatherMobileNo);
			theStudent.setFatherAaadharNo(fatherAaadharNo);
			theStudent.setFatherDesignation(fatherDesignation);
			theStudent.setFatherIncome(fatherIncome);
			theStudent.setFatherEmail(fatherEmail);
			//Mother Details
			theStudent.setMotherName(motherName);
			theStudent.setMotherMobileNo(motherMobileNo);
			theStudent.setMotherAaadharNo(motherAaadharNo);
			theStudent.setMotherDesignation(motherDesignation);
			theStudent.setMotherIncome(motherIncome);
			theStudent.setMotherEmail(motherEmail);
			//Contact Details
			theStudent.setPinCode(pinCode);
			theStudent.setTaluk(taluk);
			theStudent.setDistrict(district);
			theStudent.setState(state);
			theStudent.setAddressOne(addressOne);
			theStudent.setCountry(country);
			//Bank Details
			theStudent.setBankName(bankName);
			theStudent.setIfscCode(ifscCode);
			theStudent.setAccountNo(accountNo);
			//Transportation Details
			theStudent.setBusStop(busStop);
			theStudent.setVehicleMonth(vehicleMonth);
			theStudent.setTotRate(totRate);
			//Profile Picture
			theStudent.setProfilePicture(profilePicture);
			
			
			
			
			
			out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
			out.println("StudentPojo [schoolId=" + schoolId + ", sectionId=" + sectionId + ", classId=" 
					+ ", admissionDate=" + admissionDate + ", firstName=" + firstName + ", middleName=" + middleName
					+ ", lastName=" + lastName + ", gender=" + gender + ", dob=" + dob + ", bloodGroop=" + bloodGroop
					+ ", heigth=" + heigth + ", weight=" + weight + ", minority=" + minority + ", physicalHandicap="
					+ physicalHandicap + ", physicalHandicapType=" + physicalHandicapType + ", fatherName=" + fatherName
					+ ", motherName=" + motherName + ", nationality=" + nationality + ", fatherDesignation="
					+ fatherDesignation + ", fatherIncome=" + fatherIncome + ", motherTongue=" + motherTongue
					+ ", castCategoryId=" + castCategoryId + ", religiousId=" + religiousId + ", castId=" + castId
					+ ", addressOne=" + addressOne + ", state=" + state
					+ ", pinCode=" + pinCode + ", country=" + country + ", accountNo="
					+ accountNo + ", profilePicture=" + profilePicture + "]");
			
			sd=new StudentImpl();
			
			sd.insertStudent(theStudent);
			
		}
		
	}

}
