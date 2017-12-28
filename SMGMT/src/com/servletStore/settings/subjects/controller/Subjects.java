package com.servletStore.settings.subjects.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servletStore.settings.subjects.model.SubjectDAO;
import com.servletStore.settings.subjects.model.SubjectImpl;
import com.servletStore.settings.subjects.model.SubjectPOJO;

public class Subjects extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		SubjectPOJO subjectPojo = new SubjectPOJO();
		SubjectDAO subjectDao = new SubjectImpl();
		
		if(request.getParameter("subjectSubmit")!=null) {
			
			String subjectName = request.getParameter("subject_name");
			subjectPojo.setSubjectName(subjectName);
			int insertStatus;
			try {
				
				insertStatus = subjectDao.addSubject(subjectPojo);
				if(insertStatus>0){
					System.out.println("subject inserted");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			response.sendRedirect("View/settings/subjects/subjects.jsp");
			
		}
	}

}
