package com.servletStore.fees.feescollection.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servletStore.fees.feescollection.model.FeesCollectionDAO;
import com.servletStore.fees.feescollection.model.FeesCollectionImpl;

public class FeesCollection extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		String standard_id = request.getParameter("standard_id");
		
		//ajax for searching standard wise student
		if(standard_id!=null){
			
			FeesCollectionDAO feesCollectionDAO = new FeesCollectionImpl();
			
			List studentList = feesCollectionDAO.getStudentInfo(standard_id);

			Iterator iterator = studentList.iterator();
			
			while (iterator.hasNext()) {
				out.print(iterator.next()+",");
			}
			
		}
		
	}

}
