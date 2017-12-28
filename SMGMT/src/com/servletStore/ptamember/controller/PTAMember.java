package com.servletStore.ptamember.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servletStore.ptamember.model.PTAMemberDAO;
import com.servletStore.ptamember.model.PTAMemberImpl;
import com.servletStore.ptamember.model.PTAMemberPojo;


@WebServlet("/PTAMember")
public class PTAMember extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		PTAMemberDAO dao=new PTAMemberImpl();
		
		String standardList=request.getParameter("standardList");
		String studentNameList=request.getParameter("studentNameList");
		
		
		System.out.println("studnt id is:"+studentNameList);
		
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
			theStudent1.setSchoolId(studentNameList);
			List list=dao.getStudentNameList(theStudent1);
			Iterator irt1=list.iterator();
			while (irt1.hasNext()) {
				out.print(irt1.next()+"~");
			}
		}
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
