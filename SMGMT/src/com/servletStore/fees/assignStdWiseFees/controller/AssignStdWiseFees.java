package com.servletStore.fees.assignStdWiseFees.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servletStore.fees.assignStdWiseFees.model.AssignStdWiseFeesDao;
import com.servletStore.fees.assignStdWiseFees.model.AssignStdWiseFeesImpl;
import com.servletStore.fees.assignStdWiseFees.model.AssignStdWiseFeesPojo;


public class AssignStdWiseFees extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AssignStdWiseFeesDao asdao = new AssignStdWiseFeesImpl();
		AssignStdWiseFeesPojo aspojo = null;
		int insertStatus = 0;
		HttpSession session = request.getSession();
		
		String stds[] = request.getParameterValues("standardIds");
		String academicYear = session.getAttribute("year").toString();
		String tableData[] = request.getParameter("tableData").split(",");
		List<AssignStdWiseFeesPojo> asList = new ArrayList<AssignStdWiseFeesPojo>();
		
		
		for(int i=0; i<stds.length; i++){
			int count=1;
			//System.out.println(stds[i]);
			for(int j=0; j<tableData.length; j++){
				aspojo = new AssignStdWiseFeesPojo();
				aspojo.setFkClassMasterId(Integer.parseInt(stds[i]));
				aspojo.setFeesTypeId(Integer.parseInt(tableData[j]));
				j++;
				aspojo.setTermOneFees(Integer.parseInt(tableData[++j]));
				aspojo.setTermTwoFees(Integer.parseInt(tableData[++j]));
				aspojo.setPriority(count);
				
				asList.add(aspojo);
				count++;
				//System.out.println(aspojo.toString());
			}
		}
		
		insertStatus = asdao.insert(asList, academicYear);
		session.setAttribute("insertStatus", insertStatus);
		response.sendRedirect("/SMGMT/View/fees/assignStdWiseFees.jsp");
	}

	
}
