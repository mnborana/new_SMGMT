package com.servletStore.fees.assignStdWiseFees.controller;

import java.io.IOException;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		String stds[] = request.getParameterValues("standardIds");
		String tableData[] = request.getParameter("tableData").split(",");
		
		for(int i=0; i<stds.length; i++){
			//System.out.println(stds[i]);
			for(int j=0; j<tableData.length; j++){
				aspojo = new AssignStdWiseFeesPojo();
				aspojo.setFkClassMasterId(Integer.parseInt(stds[i]));
				aspojo.setFeesTypeId(Integer.parseInt(tableData[j]));
				j++;
				aspojo.setTermOneFees(Integer.parseInt(tableData[++j]));
				aspojo.setTermTwoFees(Integer.parseInt(tableData[++j]));
				if(tableData[++j].trim().equals("true")){
					aspojo.setPriority(1);
				}else{
					aspojo.setPriority(0);
				}
				//System.out.println(aspojo.toString());
			}
		}
		
	}

}
