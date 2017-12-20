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

import com.servletStore.settings.classRoom.model.AddClassRoomDAO;
import com.servletStore.settings.classRoom.model.AddClassRoomImpl;
import com.servletStore.settings.classRoom.model.AddClassRoomPOJO;


public class AddClassRoom extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out = response.getWriter();
		String sectionId = request.getParameter("sectionId");
		String schoolId = request.getParameter("schoolId");
		
		AddClassRoomPOJO classPojo = new AddClassRoomPOJO();
		AddClassRoomDAO classImpl = new AddClassRoomImpl();
		
		if(request.getParameter("classRoomSubmit")!=null)
		{
			String div = request.getParameter("divisionName");
			String stdsId[] = request.getParameterValues("stds");
			String shift = request.getParameter("shift");
			int status=0;
			
			for(int i=0; i<stdsId.length; i++){
				
				classPojo.setShift(shift);
				classPojo.setDivision(div);
				classPojo.setSectionId(Integer.parseInt(sectionId));
				classPojo.setSchoolId(Integer.parseInt(schoolId));
				classImpl.addClassRoom(classPojo, stdsId[i]);
			}
			
			if(status>0){
				System.out.println("insertSuccess");
			}
			
			response.sendRedirect("View/settings/classRoom/classRoom.jsp");	
		}
		else
		{
			AddClassRoomDAO classDao = new AddClassRoomImpl();
			AddClassRoomPOJO classPOJO = new AddClassRoomPOJO();
			
			List list = classDao.getStandards(schoolId, sectionId);
			Iterator itr = list.iterator();
			String s="";
			
			while(itr.hasNext()){
				s += itr.next()+",";
			}
			out.print(s);
		}
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

}
