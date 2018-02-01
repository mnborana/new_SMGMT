package com.servletStore.fees.casteWiseEduFees.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servletStore.fees.casteWiseEduFees.model.casteWiseEduFeesDAO;
import com.servletStore.fees.casteWiseEduFees.model.casteWiseEduFeesIMPL;
import com.servletStore.fees.casteWiseEduFees.model.casteWiseEduFeesPojo;



public class casteWiseEduFees extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		System.out.println("hiiiiiiiiii");
		casteWiseEduFeesPojo pojo=new casteWiseEduFeesPojo();
		casteWiseEduFeesDAO dao=new casteWiseEduFeesIMPL();
		List<casteWiseEduFeesPojo> list=new ArrayList();
		HttpSession session=request.getSession();
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String submit=request.getParameter("submitBTN");
		if(submit!=null)
		{
		
		String type=request.getParameter("selectType");
		String standard=request.getParameter("selectStandard");		
		String[] category=request.getParameterValues("selectCategory");	
		String fees=request.getParameter("educationFees");
		
		String categry="";
		
		
		int i=0;
		for(int j=0;j<category.length;j++)
		{
			pojo.setFeesType(type);
			pojo.setStandard(standard);
			pojo.setFees(fees);
			pojo.setCategoryId(Integer.parseInt(category[j]));
			list.add(pojo);		
			i=dao.insertEducationalFees(list);
		}
		if(i>0)
		{
			session.setAttribute("flag", "Inserted Record Has Been Submited");
		}
			response.sendRedirect("View/fees/castWiseEducationalFees.jsp");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
