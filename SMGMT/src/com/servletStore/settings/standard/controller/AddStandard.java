package com.servletStore.settings.standard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servletStore.settings.school.model.SchoolPOJO;
import com.servletStore.settings.section.model.SectionDAO;
import com.servletStore.settings.section.model.SectionImpl;
import com.servletStore.settings.section.model.SectionPojo;
import com.servletStore.settings.standard.model.StandardDAO;
import com.servletStore.settings.standard.model.StandardImpl;
import com.servletStore.settings.standard.model.StandardPOJO;

public class AddStandard extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		if(request.getParameter("standard_name")!=null){
			String std_name = request.getParameter("standard_name");
		
			StandardPOJO stdPojo = new StandardPOJO();
			stdPojo.setStdName(std_name);
			
			StandardDAO stdDao = new StandardImpl();
			int i = stdDao.addStandard(stdPojo);
			
			if(i>0){
				System.out.println("insert success");
			}
			else{
				System.out.println("insert fail");
			}
			
			response.sendRedirect("View/settings/standard/addStandard.jsp");
		}
		
		
		if(request.getParameter("schoolId")!=null){
			
			SectionDAO secImpl = new SectionImpl();
			List<SectionPojo> sectionList = secImpl.getSectionDetailsBySchoolId(request.getParameter("schoolId"));
			Iterator itr = sectionList.iterator();
			
			String s="";
			while(itr.hasNext()){
				
				SectionPojo pojo = (SectionPojo)itr.next();
				s+=pojo.getId()+","+pojo.getName()+",";
			}
			out.print(s);

		}
		
	}

}
