package com.servletStore.fees.assignStdWiseFees.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
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
		PrintWriter out = response.getWriter();
		
		AssignStdWiseFeesDao  aswImpl = new AssignStdWiseFeesImpl(); 
		if(request.getParameter("getFeesStructure")=="1" && request.getParameter("stdId")!=null){
			List l = aswImpl.getFeesStructure(request.getParameter("stdId"));
			Iterator itr = l.iterator();
			
			while(itr.hasNext()){
				
			}
			
			
		}
		else if(request.getParameter("stdId")!=null){
			
			String stdId = request.getParameter("stdId");
			String s = "";
			
			List l1 = aswImpl.getCategoryFeesTypes(stdId);
			//System.out.println("l1    "+l1);
			Iterator itr1 = l1.iterator();
			while(itr1.hasNext()){
				s += itr1.next()+",";
			}
			s += "@@@";
			//System.out.println("s  : "+s);
			List l = aswImpl.getCategoryWiseFeesList2(stdId);
			//System.out.println("l    "+l);
			Iterator itr = l.iterator();
			
			while(itr.hasNext()){
				s += itr.next()+",";
			}
			
			out.print(s);
		}
		else{

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
}
