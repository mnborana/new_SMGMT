package com.servletStore.settings.section.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CORBA.Request;

import com.servletStore.settings.section.model.SectionDAO;
import com.servletStore.settings.section.model.SectionImpl;
import com.servletStore.settings.section.model.SectionPojo;


public class Section extends HttpServlet 
{
	
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		String section_name = request.getParameter("section_name");	
		SectionPojo sectionPojo = new SectionPojo();
		sectionPojo.setName(section_name);
		
		SectionDAO sectiondao = new SectionImpl();
		
		int insertStatus = sectiondao.addSection(sectionPojo);
		if(insertStatus!=0){
			System.out.println("insert susccess");
		}
		else{
			System.out.println("insert fail");
		}
		
		
		response.sendRedirect("View/settings/sections/section.jsp");
	}

	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}
		
}
