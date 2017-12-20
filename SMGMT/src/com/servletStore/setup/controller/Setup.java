package com.servletStore.setup.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Setup extends HttpServlet {
	   
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request, response);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		
		//trustee env---------------------------------------------
		String eduName=request.getParameter("eduName");
		String trusteeName=request.getParameter("tUname");
		String trusteePassword=request.getParameter("tPass");
		int nSchools=Integer.parseInt(request.getParameter("nSchools"));
		out.print("No of Schools "+nSchools+"<br>");
		int count=1;
		for(int i=0;i<nSchools;i++)
		{
			String schoolName=request.getParameter("sName"+i);
			
			out.print("School Name "+schoolName+"<br>");
			
			String principalUserName=request.getParameter("pUName"+count);
			String principalPassword=request.getParameter("pUPass"+count);
			if(principalUserName!=null)
			{
				out.println("Principal Name "+principalUserName+"<br> Principal Pass "+principalPassword+"<br>");
			}
			count++;
		}
		out.println("eduName "+eduName);
		out.println("trusteeName "+trusteeName);
		out.println("trusteePassword "+trusteePassword);
		
		//trustee env ends--------------------------------------------------------------------
		
		//pricipal env------------------------------------------------------------------------
		String radioNames[]=
			{"dash","setting","mgmt","admission","fee","attendance",
			 "exam","teacher","register","cashbook","transport","salary",
			 "library","other","emsg"};
		
		
		
		
		
		//pricipal env ends------------------------------------------------------------------------
	}

}
