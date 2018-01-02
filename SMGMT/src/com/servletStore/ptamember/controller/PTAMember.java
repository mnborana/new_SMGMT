package com.servletStore.ptamember.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servletStore.ptamember.model.PTAMemberDAO;
import com.servletStore.ptamember.model.PTAMemberImpl;
import com.servletStore.ptamember.model.PTAMemberPojo;


@WebServlet("/PTAMember")
public class PTAMember extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		PTAMemberDAO dao=new PTAMemberImpl();
		
		
		PTAMemberPojo insertPojo=new PTAMemberPojo();
		
		String standardList=request.getParameter("standardList");			
		String studentNameList=request.getParameter("studentNameList");		
		String parentName=request.getParameter("parentName");		
		String mobileNo=request.getParameter("mobileNo");	
		
		String studentId=request.getParameter("studentId");
		String relation=request.getParameter("relation");
		System.out.println("relation:"+relation);
		
		String thisYear=session.getAttribute("thisYear").toString();
		System.out.println("this is:"+thisYear);
		
		insertPojo.setStudName(studentId);
		insertPojo.setAccYear(thisYear);
		insertPojo.setRelation(relation);
		dao.getStudentParentDetails(insertPojo);
		
		
		if (standardList != null) {
			PTAMemberPojo theStudent=new PTAMemberPojo();
			theStudent.setSchoolId(standardList);
			List theStandardList=dao.getStandardList(theStudent);
			Iterator irt=theStandardList.iterator();
			while (irt.hasNext()) {
				out.print(irt.next()+"~");
			}
		}
				
		if (studentNameList != null) {
			PTAMemberPojo theStudent1=new PTAMemberPojo();
			theStudent1.setStandardDivId(studentNameList);
			List list=dao.getStudentNameList(theStudent1);
			Iterator irt1=list.iterator();
			while (irt1.hasNext()) {
				out.print(irt1.next()+",");
			}
		}
		
		if (parentName != null) {
			PTAMemberPojo theStudent2=new PTAMemberPojo();
			theStudent2.setParentId(parentName);
			List list1=dao.getParentDetails(theStudent2);
			Iterator irt2=list1.iterator();
			while (irt2.hasNext()) {
				out.print(irt2.next()+",");
			}
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
