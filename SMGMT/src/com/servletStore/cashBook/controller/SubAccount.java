package com.servletStore.cashBook.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servletStore.cashBook.subAccount.model.SubAccountDAO;
import com.servletStore.cashBook.subAccount.model.SubAccountIMPL;
import com.servletStore.cashBook.subAccount.model.SubAccountPOJO;

public class SubAccount extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		SubAccountDAO dao=new SubAccountIMPL();
		HttpSession session=request.getSession();
		
		String submit=request.getParameter("AccountSubAccBTN");
		if(submit!=null)
		{
			System.out.println("hiiii");
			String cashbook=request.getParameter("selectCashBook");
			String ledgerName=request.getParameter("selectLedger");
			String subAccountName=request.getParameter("getAccountSubAccName");
			
			System.out.println("1:"+cashbook+"\n2:"+ledgerName+"\n3:"+subAccountName);
			
			SubAccountPOJO pojo=new SubAccountPOJO();
			pojo.setCashBookId(Integer.parseInt(cashbook));
			pojo.setLedgerId(Integer.parseInt(ledgerName));
			pojo.setSubAccountName(subAccountName);
			
			int i=dao.insertSubAccountDetails(pojo);
			if(i>0)
			{
				session.setAttribute("flag", "Inserted Successfully");
			}
		}
		response.sendRedirect("View/cashBook/AccountSubAcc.jsp");
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
