package com.servletStore.fees.feeType.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servletStore.fees.feeType.model.FeeTypeDAO;
import com.servletStore.fees.feeType.model.FeeTypeImpl;
import com.servletStore.fees.feeType.model.FeeTypePOJO;


public class FeeType extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FeeTypePOJO pojo=new FeeTypePOJO();
		FeeTypeDAO dao=new FeeTypeImpl();
		PrintWriter out=response.getWriter();
		if(request.getParameter("submitFee")!=null)
		{
			String feeType=request.getParameter("feeType");
			String fee=request.getParameter("fee");
			String term1=request.getParameter("term1");
			String term2=request.getParameter("term2");
			String caste=request.getParameter("caste");
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
			if(caste==null)
			{
				caste="0";
			}
			else
			{
				pojo.setCaste(Integer.parseInt(caste));
			}
			try {
				int status=dao.insertFeeType(pojo);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			response.sendRedirect("View/fees/feeType.jsp");
		}
		
		/*if(request.getParameter("id")!=null)
		{
			int id=Integer.parseInt(request.getParameter("id"));
			try {
				dao.deleteFeeType(id);
			}catch (SQLException e) {
				e.printStackTrace();
			}
			System.out.println("");
			response.sendRedirect("View/fees/feeType/feeType.jsp");
		}*/
		
		if(request.getParameter("updateId")!=null)
		{
			try{
			String id=request.getParameter("updateId");
			List list=dao.selectFeesById(Integer.parseInt(id));
			Iterator itr=list.iterator();
			while(itr.hasNext())
			{
				FeeTypePOJO pojo1=(FeeTypePOJO) itr.next();
				int idFees=pojo1.getId();
				String feesType=pojo1.getFeesType();
				int fees=pojo1.getFees();
				int frstTerm=pojo1.getFirstTerm();
				int secndTerm=pojo1.getSecondTerm();
				int caste=pojo1.getCaste();
				System.out.println(idFees+","+feesType+","+fees+","+frstTerm+","+secndTerm+","+caste);
				out.print(idFees+","+feesType+","+fees+","+frstTerm+","+secndTerm+","+caste+",");				
			}
			}catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		if(request.getParameter("updateFee")!=null)
		{
			String id=request.getParameter("id");
			String feeType=request.getParameter("feeTypeUp");
			String fee=request.getParameter("feeUp");
			String term1=request.getParameter("term1Up");
			String term2=request.getParameter("term2Up");
			String caste=request.getParameter("casteUp");
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
			pojo.setId(Integer.parseInt(id));
			pojo.setFeesType(feeType);
			pojo.setFees(Integer.parseInt(fee));
			if(caste==null)
			{
				caste="0";
			}
			else
			{
				pojo.setCaste(Integer.parseInt(caste));
			}
			try {
				int status=dao.updateFeesType(pojo);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			response.sendRedirect("View/fees/feeType.jsp");
		}
	}

}
