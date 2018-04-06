package com.servletStore.attendance.generateCatlog.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servletStore.attendance.removeCatlog.model.removeStudentImpl;
import com.servletStore.attendance.removeCatlog.model.removeStudentPOJO;
import com.servletStore.attendance.removeCatlog.model.removeStudetDAO;


//@WebServlet("/RemoveNameFromCatlog")
public class RemoveNameFromCatlog extends HttpServlet
{
	
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		removeStudentPOJO  pojo=new removeStudentPOJO();
		removeStudetDAO dao=new removeStudentImpl();
		if(request.getParameter("remove_button")!=null)
		{
			String stddiv=request.getParameter("stddiv");
			//out.print("standard div is  "+stddiv);
			String student_name=request.getParameter("stud_name");
			String rdate=request.getParameter("remove_date");
			String reason=request.getParameter("reason");
			pojo.setStd_id(Integer.parseInt(stddiv));
			pojo.setStud_id(Integer.parseInt(student_name));
			pojo.setRemove_date(rdate);
			pojo.setReason(reason);
			dao.insert(pojo);
			System.out.println("data inserted!!!");
			response.sendRedirect("/SMGMT/View/attendance/generateCatlog/catlogRemoveStudent.jsp");
			
		}
		
			if(request.getParameter("del_id")!=null && (!request.getParameter("del_id").equals("null")))
			{
				out.println("Delete"+request.getParameter("del_id"));
				int del_id=Integer.parseInt(request.getParameter("del_id"));
				dao.delete(del_id);
				System.out.println("deleted!!!!!!");
				response.sendRedirect("/SMGMT/View/attendance/generateCatlog/catlogRemoveStudent.jsp");
			}
		//response.sendRedirect("catlogRemoveStudent.jsp");
			if(request.getParameter("std")!=null)
			{
				try
				{
					int std=Integer.parseInt(request.getParameter("std"));
					System.out.println("std@@@@@ "+std);
					List<String> l1=dao.getStudentDetails(std);
					System.out.println("------LIST : "+l1);
					Iterator itr=l1.iterator();
					while(itr.hasNext())
					{
						out.print(itr.next()+"~");
					}
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			}
		
	}

}
