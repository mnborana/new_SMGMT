package com.servletStore.fees.feeType.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servletStore.fees.feeType.model.feeTypeDAO;
import com.servletStore.fees.feeType.model.feeTypeImpl;
import com.servletStore.fees.feeType.model.feeTypePOJO;


public class feeType extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		feeTypePOJO pojo=new feeTypePOJO();
		feeTypeDAO dao=new feeTypeImpl();
		if(request.getParameter("submitFee")!=null)
		{
			System.out.println("123");
			String feeType=request.getParameter("feeType");
			String fee=request.getParameter("fee");
			String term1=request.getParameter("term1");
			String term2=request.getParameter("term2");
			if(term1==null)
			{
				term1="0";
			}
			else
			{
				pojo.setFirstTerm(Integer.parseInt(term1));
			}
			if(term2==null)
			{
				term2="0";
			}
			else
			{
				pojo.setSecondTerm(Integer.parseInt(term2));
			}
			pojo.setFeesType(feeType);
			pojo.setFees(Integer.parseInt(fee));
			
			try {
				int status=dao.insertFeeType(pojo);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			response.sendRedirect("View/feeType/feeType.jsp");
		}
		
	}

}
