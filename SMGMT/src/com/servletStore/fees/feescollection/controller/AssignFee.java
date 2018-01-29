package com.servletStore.fees.feescollection.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servletStore.fees.feescollection.model.AssignFeeDAO;
import com.servletStore.fees.feescollection.model.FeesCollectionDAO;
import com.servletStore.fees.feescollection.model.FeesCollectionImpl;

//@WebServlet("/AssignFee")
public class AssignFee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	  PrintWriter out = response.getWriter();
	  String standard_id = request.getParameter("standard_id");
	  String student_id = request.getParameter("student_id");
	  FeesCollectionDAO feesCollectionDAO = new FeesCollectionImpl();
	  HttpSession session = request.getSession();
	
	  //ajax for searching standard wise student and fee
		if(standard_id!=null){
			
			List studentList = feesCollectionDAO.getStudentInfo(standard_id);
			
			try
			{
				List feeList = feesCollectionDAO.getStandardWiseFee(standard_id);
			
				Iterator itr = feeList.iterator();
				
				while(itr.hasNext())
				{
					out.print(itr.next()+"#");
				}
			
			} catch (SQLException e)
			{
				e.printStackTrace();
			}

			Iterator iterator = studentList.iterator();
			
			
			while (iterator.hasNext()) {
				out.print(iterator.next()+",");
			}
			
		}
		
		//for getting cast wise fee for particular student
		if(student_id!=null)
		{	
			try
			{
				String cast = feesCollectionDAO.getStudentCast(student_id);
			
				List castFee = feesCollectionDAO.getStudentCastwiseFee(student_id);
				
				Iterator iterator = castFee.iterator();
				
				while (iterator.hasNext()) {
					out.print(iterator.next()+",");
				}
					
				
				out.println(cast);
			
			
			} catch (SQLException e)
			{
				e.printStackTrace();
			}
			
		}
		
		//assigning fee
		  if(request.getParameter("assign")!=null){
			  
			  String classroom_master_id=request.getParameter("standard_Id");
			  String studentId=request.getParameter("student_Id");
			  String totalFee=request.getParameter("totalFee");
			  String academicYear = request.getParameter("year");
			  int insertStatus=0;
			  
			  String[] splitYear = academicYear.split("-");
			  String startDate = splitYear[0]+"-07-01";
			  String endDate = splitYear[1]+"-04-30";
					
			  SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
			  Date date = new Date();  
			  String currentDate=formatter.format(date);  
			  
			  AssignFeeDAO pojo = new AssignFeeDAO();
			  pojo.setStudentId(studentId);
			  pojo.setClassroomMasterId(classroom_master_id);
			  pojo.setDate(currentDate);
			  pojo.setFee(totalFee);
			  
			  
			  
			try
			{
				//Start: june - End: april
				
				//check if its already assiged in this year
				String dateForCheck = feesCollectionDAO.getDateForCheck(studentId,"FEE ASSIGNED");
				
				//System.out.println("Start Date:"+startDate+"\nEnd Date:"+endDate+"\nA Date:"+dateForCheck+"\nCurrent Date:"+currentDate);
				if(dateForCheck=="")
				{
					//insert
					System.out.println("insert for new");
					insertStatus = feesCollectionDAO.assignStudentFee(pojo);
					
				}
				else
				{
					Date start = formatter.parse(startDate);
					Date end = formatter.parse(endDate);
					Date availableDate = formatter.parse(dateForCheck);
					
					if(start.compareTo(availableDate)*availableDate.compareTo(end)>0)
					{
						System.out.println("not insert");
					}
					else
					{
						if(dateForCheck!="")
						{
							System.out.println("not insert because already assinged for this year");
						}
						else
						{
							System.out.println("insert for next year");
							insertStatus = feesCollectionDAO.assignStudentFee(pojo);
						}
					}
					
				}
				
				if(insertStatus>0)
				{
					//redirect with success 
					session.setAttribute("flag", "Fee Assigned");
					response.sendRedirect("/SMGMT/View/fees/studFeeAssign.jsp");
					
				}
				else
				{
					//redirect with error
					session.setAttribute("flag", "Already assinged for this year");
					response.sendRedirect("/SMGMT/View/fees/studFeeAssign.jsp");
				}
				
				
			} catch (SQLException | ParseException e)
			{
				e.printStackTrace();
			}
			  
		  }
	  
	  
	  
	}

}
