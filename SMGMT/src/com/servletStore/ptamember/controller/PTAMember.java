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


//@WebServlet("/PTAMember")
public class PTAMember extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		PTAMemberDAO dao=new PTAMemberImpl();
		
		
		PTAMemberPojo insertPojo=new PTAMemberPojo();		
		String standardList=request.getParameter("standardList");			
		String studentNameList=request.getParameter("studentNameList");	
		String parentName=	request.getParameter("parentName");
				
			
		
		String standard=request.getParameter("standard");
		System.out.println("standard:"+standard);
		String studentId=request.getParameter("studentId");
		System.out.println("student id is:"+studentId);
		String relation=request.getParameter("relation");	
				
		String thisYear=session.getAttribute("thisYear").toString();
		
		insertPojo.setStudName(studentId);
		insertPojo.setAccYear(thisYear);
		insertPojo.setRelation(relation);	
		
		//dao.checkStudent(studentId);
		
		dao.getStudentParentDetails(insertPojo);
		
		
		///////////////////////////////Fetch Data///////////////////////////////////
		
		if(request.getParameter("fetchPta")!=null)
		{
			String pta="";
			int count=1;
			List list=dao.fetchParentDetails();
			Iterator itr=list.iterator();
			while(itr.hasNext())
			{
				String id=itr.next().toString();
				String student=itr.next().toString();
				String parent=itr.next().toString();
				String rele=itr.next().toString();
				String classroom=itr.next().toString();			
			
				pta+="<tr><td>"+count+"</td>";
				count=count+1;
				pta+="<td>"+student+"</td>";
				pta+="<td>"+parent+"</td>";
				pta+="<td>"+rele+"</td>";
				pta+="<td>"+classroom+"</td>";
				pta+="<td><a class='edit' data-toggle='modal' data-placement='top' title='Update' href='#modal-4' onclick='updatePTAMembers("+id+")'><i class='fa fa-pencil text-warning'></i></a>"
                                        			+" | <a class='delete hidden-xs hidden-sm' data-toggle='tooltip' data-placement='top' title='Delete' href='/SMGMT/PTAMember?deleteId="+id+"'><i class='fa fa-trash text-danger'></i></a></td></tr>";
				
			}
			
			out.print(pta);
			
		}
		
		
		///////////////////////////////Select Data in model///////////////////////////
		
		String selectStudentId=request.getParameter("updateStudentId");
		
		if(selectStudentId!=null)
		{
			List list=dao.updatePTAMembers(selectStudentId);
		
			Iterator itr=list.iterator();
			while(itr.hasNext())
			{
				out.print(itr.next()+","+itr.next()+","+itr.next()+","+itr.next()+","+itr.next());
			}
		}
		
		//////////////////////////Delete Member////////////////////////////////////
		
		String deletePtaId=request.getParameter("deleteId");
		if(deletePtaId!=null)
		{
			int i=dao.deletePtaMember(deletePtaId);
			System.out.println("deleted Successfully");
			response.sendRedirect("View/ptaMember/ptaMember.jsp");
		}
		
		////////////////DropDown Part/////////////////////////////////////////////////
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
		
		/////////////update Part//////////////////////
		String updateId=request.getParameter("updateId");	
		String updateRelation=request.getParameter("updateRelation");
		System.out.println("upid:"+updateRelation);
		PTAMemberPojo updatePojo=new PTAMemberPojo();
		updatePojo.setRelation(updateRelation);
		if(request.getParameter("updateId")!=null)
		{
			dao.updatePTA(updatePojo, updateId);
			response.sendRedirect("View/ptaMember/ptaMember.jsp");
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
