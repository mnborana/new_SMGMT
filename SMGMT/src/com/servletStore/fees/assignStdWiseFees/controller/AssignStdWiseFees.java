package com.servletStore.fees.assignStdWiseFees.controller;

import java.io.IOException;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AssignStdWiseFees extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String stds[] = request.getParameterValues("standardIds");
		
		String tableData[] = request.getParameter("tableData").split(",");
		
		for(int i=0; i<stds.length; i++){
			System.out.println(stds[i]);
			for(int j=0; j<tableData.length; j=j+5){
				
				System.out.println(tableData[j]);
				
			}
		}
		
	}

}
