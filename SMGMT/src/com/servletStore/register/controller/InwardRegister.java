package com.servletStore.register.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servletStore.register.model.InwardRegisterDAO;
import com.servletStore.register.model.InwardRegisterImpl;
import com.servletStore.register.model.InwardRegisterPojo;

@WebServlet("/InwardRegister")
public class InwardRegister extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		InwardRegisterDAO impl=new InwardRegisterImpl();
		
		if(request.getParameter("senderName")!=null)
		{
			String senderName=request.getParameter("addSenderName");
			String address=request.getParameter("address");
			
			InwardRegisterPojo pojo=new InwardRegisterPojo();
			pojo.setSenderName(senderName);
			pojo.setAddress(address);
			impl.addNewSender(pojo);
			response.sendRedirect("view/GeneralRegister/inwardRegister.jsp");
		}
		
		if(request.getParameter("subject")!=null)
		{
			String newSubject=request.getParameter("addSubject");
			InwardRegisterPojo pojo1=new InwardRegisterPojo();
			pojo1.setSubject(newSubject);
			impl.addNewSubject(pojo1);
			response.sendRedirect("view/GeneralRegister/inwardRegister.jsp");
		}
		
		if(request.getParameter("InwardRegister")!=null)
		{
			String inwardNo=request.getParameter("inwardNo");
			int inwardno=Integer.parseInt(inwardNo);
			String addDate=request.getParameter("requireddate");
			String senderName=request.getParameter("senderName");
			String subject=request.getParameter("selectSubject");
			String address=request.getParameter("address");
			String description=request.getParameter("description");
			
			InwardRegisterPojo pojo2=new InwardRegisterPojo();
			pojo2.setInwardNo(inwardno);
			pojo2.setDate(addDate);
			pojo2.setSenderName(senderName);
			pojo2.setSubject(subject);
			pojo2.setAddress(address);
			pojo2.setDescription(description);
			
			impl.inwardRegister(pojo2);
			response.sendRedirect("view/GeneralRegister/inwardRegister.jsp");
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
