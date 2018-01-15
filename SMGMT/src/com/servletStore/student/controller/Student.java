package com.servletStore.student.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servletStore.student.model.StudentDAO;
import com.servletStore.student.model.StudentImpl;
import com.servletStore.student.model.StudentPojo;

import utility.CommonStudent;

/**
 * Servlet implementation class Student
 */
public class Student extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private StudentDAO sd;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String sectionList=request.getParameter("sectionList");
		String standardList=request.getParameter("standardList");
		String religionList=request.getParameter("religionList");
		String casteList=request.getParameter("casteList");
		String categoryList=request.getParameter("categoryList");
		
		if (sectionList != null) {
			StudentPojo theStudent=new StudentPojo();
			theStudent.setSchoolId(sectionList);
			sd=new StudentImpl();
			List theSectionList=sd.getSectionList(theStudent);
			Iterator irt=theSectionList.iterator();
			while (irt.hasNext()) {
				out.print(irt.next()+"~");
			}
		}
		if (standardList != null) {
			CommonStudent cs=new CommonStudent();
			List<Object> theStandardList=cs.getStandardList(standardList);
			Iterator<Object> irt=theStandardList.iterator();
			while (irt.hasNext()) {
				out.print(irt.next()+"~");
			}
		}
		if (religionList != null) {
			sd=new StudentImpl();
			List theReligionList=sd.getReligionList();
			Iterator irt=theReligionList.iterator();
			while (irt.hasNext()) {
				out.print(irt.next()+"~");
			}
		}
		if (casteList != null) {
			StudentPojo theStudent=new StudentPojo();
			theStudent.setCastId(casteList);
			sd=new StudentImpl();
			List theCasteList=sd.getCasteList(theStudent);
			Iterator irt=theCasteList.iterator();
			while (irt.hasNext()) {
				out.print(irt.next()+"~");
			}
		}
		if (categoryList != null) {
			StudentPojo theStudent=new StudentPojo();
			theStudent.setCastCategoryId(categoryList);
			sd=new StudentImpl();
			List theCategoryList=sd.getCategoryList(theStudent);
			Iterator irt=theCategoryList.iterator();
			while (irt.hasNext()) {
				out.print(irt.next()+"~");
			}
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		System.out.println("in Post");
		String submit=request.getParameter("submitBtn");
		
		if(submit!=null)
		{
			System.out.println("in Loop");
//	=================OFFICIAL DETAILS (13{1})=================
			HttpSession session = request.getSession();
			
			String schoolId=session.getAttribute("schoolId").toString();
			String academicYearId=request.getParameter("academicYearId");
			String stdId=request.getParameter("stdId");
			String bookNo=request.getParameter("bookNo");
			String grNo=request.getParameter("grNo");
			String admissionDate=request.getParameter("admissionDate");
			String previousSchool=request.getParameter("previousSchool");
			String medium=request.getParameter("medium");
			String classAllow=request.getParameter("classAlo");
			String currentStdId=request.getParameter("stdIdAlo");

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
			String religiousId=request.getParameter("religionId");
			String castId=request.getParameter("casteId");
			String castCategoryId=request.getParameter("categoryId");
			String minority=request.getParameter("minority");
			String physicalHandicap=request.getParameter("handicap");
			String physicalHandicapType=request.getParameter("handitype");


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



//******************************************Set Values*****************************************************
			StudentPojo theStudent=new StudentPojo();
			//OFFICIAL DETAILS
			theStudent.setSchoolId(schoolId);
			theStudent.setAcademicYearId(academicYearId);
			theStudent.setStdId(stdId);
			theStudent.setBookNo(bookNo);
			theStudent.setGrNo(grNo);
			theStudent.setAdmissionDate(admissionDate);
			theStudent.setClassAllow(classAllow);
			theStudent.setPreviousSchool(previousSchool);
			theStudent.setCurrentStdId(currentStdId);
			theStudent.setMedium(medium);
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
			
			sd=new StudentImpl();
			
			int flag=sd.insertStudent(theStudent);
			if (flag > 0) {
				session.setAttribute("flag", "Student record has been saved.");
				response.sendRedirect("/SMGMT/View/student/addStudent.jsp");
			}else {
				out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
				out.println("Student Not Inserted!");
			}
			
		}
		
	}

}
