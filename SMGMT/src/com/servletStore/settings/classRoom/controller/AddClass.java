package com.servletStore.settings.classRoom.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servletStore.settings.classRoom.model.AddClassDAO;
import com.servletStore.settings.classRoom.model.AddClassImpl;
import com.servletStore.settings.classRoom.model.AddClassPOJO;


public class AddClass extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out = response.getWriter();
		String sectionId = request.getParameter("sectionId");
		String schoolId = request.getParameter("schoolId");
		
		
		AddClassDAO classDao = new AddClassImpl();
		AddClassPOJO classPOJO = new AddClassPOJO();
		
		List list = classDao.getStandards(schoolId, sectionId);
		Iterator itr = list.iterator();
		String s="";
		
		while(itr.hasNext()){
			s += itr.next()+",";
		}
		out.print(s);
		//response.sendRedirect("View/Settings/Class/AddClass.jsp");	
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

}
