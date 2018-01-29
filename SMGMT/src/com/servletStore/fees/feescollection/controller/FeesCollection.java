package com.servletStore.fees.feescollection.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servletStore.fees.feescollection.model.FeesCollectionDAO;
import com.servletStore.fees.feescollection.model.FeesCollectionImpl;
import com.servletStore.fees.feescollection.model.FeesCollectionPOJO;


public class FeesCollection extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		String standard_id = request.getParameter("standard_id");
		String student_id = request.getParameter("student_id");
		String feesCollection_btn = request.getParameter("feesCollection_btn");
		
		
		FeesCollectionPOJO feesCollectionPOJO = new FeesCollectionPOJO();
		FeesCollectionDAO feesCollectionDAO = new FeesCollectionImpl();
		
		
		//ajax for searching standard wise student
		if(standard_id!=null){
			
			List studentList = feesCollectionDAO.getStudentInfo(standard_id);

			Iterator iterator = studentList.iterator();
			
			while (iterator.hasNext()) {
				out.print(iterator.next()+",");
			}
			
		}
		
		//ajax for student fees info
		if(student_id!=null){
			
			List studentFeesInfo = feesCollectionDAO.getStudentFeesInfo(student_id);
			
			Iterator iterator = studentFeesInfo.iterator();
			
			//System.out.println(studentFeesInfo);
			
			while (iterator.hasNext()) {
				out.print(iterator.next()+",");
				//System.out.print(iterator.next()+",");
			}
			
		}
		
		if(feesCollection_btn!=null){
			
			System.out.println("HIIIIIIIIIIIIIIIIII");
			String stdId = request.getParameter("standard_id");
			String studId = request.getParameter("student_id");
			String remainingFees = request.getParameter("remaining_fees");
			String paidFees = request.getParameter("paid_fees");
			String currentDate = request.getParameter("currentDate");
			String checkboxCashbook = request.getParameter("checkbox_cashbook");
			String paymentMode = request.getParameter("payment_mode");
			
/*			System.out.println("std_id "+std_id);
			System.out.println("stud_id "+stud_id);
			System.out.println("remaining_fees "+remaining_fees);
			System.out.println("paid_fees "+paid_fees);
			System.out.println("currentDate "+currentDate);
			System.out.println("checkbox_cashbook "+checkbox_cashbook);
			System.out.println("payment_mode "+payment_mode);*/
			
			feesCollectionPOJO.setStdId(stdId);
			feesCollectionPOJO.setStudId(studId);
			feesCollectionPOJO.setRemainingFees(remainingFees);
			feesCollectionPOJO.setPaidFees(paidFees);
			feesCollectionPOJO.setCurrentDate(currentDate);
			feesCollectionPOJO.setCheckboxCashbook(checkboxCashbook);
			feesCollectionPOJO.setPaymentMode(paymentMode);
			
			feesCollectionDAO.insertFees(feesCollectionPOJO);
			
			
			
			    
			
			
			
			response.sendRedirect("View/fees/feesCollection.jsp");
			
		}
		
	}

}
