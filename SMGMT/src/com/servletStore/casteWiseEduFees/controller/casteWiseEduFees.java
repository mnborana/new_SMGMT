package com.servletStore.casteWiseEduFees.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servletStore.casteWiseEduFees.model.casteWiseEduFeesDAO;
import com.servletStore.casteWiseEduFees.model.casteWiseEduFeesIMPL;
import com.servletStore.casteWiseEduFees.model.casteWiseEduFeesPojo;
import com.servletStore.settings.school.model.SchoolPOJO;

@WebServlet("/casteWiseEduFees")
public class casteWiseEduFees extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
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
		pojo.setFeesType(type);
		pojo.setStandard(standard);
		pojo.setFees(fees);
		
		int i=dao.insertEducationalFees(pojo);
		
		for(int j=0;j<category.length;j++)
		{			
			casteWiseEduFeesPojo pojo1=new casteWiseEduFeesPojo();
			pojo1.setCategoryId(Integer.parseInt(category[j]));
			//System.out.println("categoryId:"+category[j]);
			list.add(pojo1);			
		}
		int j=dao.insertCategory(list);
		session.setAttribute("flag", "Inserted Record Has Been Submited");
		
		response.sendRedirect("View/fees/castWiseEducationalFees.jsp");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
