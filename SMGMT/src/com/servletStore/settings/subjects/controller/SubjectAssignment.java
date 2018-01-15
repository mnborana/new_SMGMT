package com.servletStore.settings.subjects.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SubjectAssignment extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		if(request.getParameter("subjectAssignSubmit")!=null){
			
			int counter = Integer.parseInt(request.getParameter("counter"));
			System.out.println(counter);
			String subjectId = request.getParameter("subjectId");
			
			for(int i=1; i<=counter; i++)
			{
				String stds = request.getParameter("stds"+i);
				String optinal = request.getParameter("optinal"+i);
				String subjectCode = request.getParameter("subject_code"+i);
				
			}
			
		}
		
	}

}
