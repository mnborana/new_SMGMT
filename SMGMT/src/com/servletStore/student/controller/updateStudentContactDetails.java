package com.servletStore.student.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servletStore.student.updateStudentContactDetails.model.updateStudentContactDAO;
import com.servletStore.student.updateStudentContactDetails.model.updateStudentContactImpl;
import com.servletStore.student.updateStudentContactDetails.model.updateStudentContactPOJO;


//@WebServlet("/updateStudentContactDetails")
public class updateStudentContactDetails extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request, response);
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String std=request.getParameter("std");
		String ch=request.getParameter("ch");
		String div=request.getParameter("div");
		System.out.println(std+"!!!!!!!!! ch is "+ch);
		if(request.getParameter("ch")!=null&&request.getParameter("ch").equals("1") && request.getParameter("std")!=null && !request.getParameter("std").equals(""))
		{
			System.out.print(">>>>>>>>.HIII");
			updateStudentContactDAO dao=new updateStudentContactImpl();
			List l1=dao.getContactDetails(std);
			System.out.println("SIZE : "+l1.size());
			Iterator itr=l1.iterator();
			while(itr.hasNext())
			{
				out.print(itr.next()+"~");
			}
			
			
		}
		
		else if(request.getParameter("ch")!=null&&request.getParameter("ch").equals("2") && request.getParameter("std")!=null && !request.getParameter("std").equals(""))
		{
			
			updateStudentContactDAO dao=new updateStudentContactImpl();
			List l1=dao.getAdharDetails(std);
			//System.out.println("SIZE : "+l1.size());
			Iterator itr=l1.iterator();
			while(itr.hasNext())
			{
				out.print(itr.next()+"~");
			}
			
		}
		
		else if(request.getParameter("ch")!=null&&request.getParameter("ch").equals("3") && request.getParameter("std")!=null && !request.getParameter("std").equals(""))
		{
			
			updateStudentContactDAO dao=new updateStudentContactImpl();
			List l1=dao.getBankDetails(std);
			System.out.println("*************SIZE : "+l1.size());
			Iterator itr=l1.iterator();
			while(itr.hasNext())
			{
				out.print(itr.next()+"~");
			}
			
		}
		
		else if(request.getParameter("update")!=null)
		{
			//out.println("hi");
			int std_id=Integer.parseInt(request.getParameter("std_name"));
			out.println("std id is "+std_id);
			String data=request.getParameter("data");
			//out.println(data);
		String output[]=data.split("~");
		//String a;
		//System.out.println("SIZEEE : "+output[0]);
		for(String a:output)
		{
			out.println("*******   "+a);
			
		}
		
	}
		else if(request.getParameter("standard")!=null)
		{
			updateStudentContactDAO udao=new updateStudentContactImpl();
			updateStudentContactPOJO pojo=new updateStudentContactPOJO();
			String std1=request.getParameter("standard");
		System.out.println("STANDARD : "+std1);
			String s[]=std1.split(",");
			String student_id=s[0];
			String cell_value=s[1];
			String std_id=s[2];
			String column_id=s[3];
			//System.out.println("@@@ sid "+student_id);
		//	System.out.println(cell_value);
			//System.out.println(std_id);
			//System.out.println(column_id);
			pojo.setStudent_id(Integer.parseInt(student_id));
			pojo.setStd_id(Integer.parseInt(std_id));
			pojo.setStudMob_no(cell_value);
			pojo.setId(Integer.parseInt(column_id));//column no
			udao.updateMobileNo(pojo);
			
			//System.out.println("in servlet Updateted!!!!");
			/*for(int i=0;i<s.length;i++)
			{
				System.out.println(s[i]);
			}*/
			
		}
	}

}
