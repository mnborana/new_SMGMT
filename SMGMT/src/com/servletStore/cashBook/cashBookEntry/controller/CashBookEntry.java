package com.servletStore.cashBook.cashBookEntry.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servletStore.cashBook.cashBookEntry.model.CashBookEntryDAO;
import com.servletStore.cashBook.cashBookEntry.model.CashBookEntryIMPL;
import com.servletStore.cashBook.cashBookEntry.model.CashBookEntryPOJO;

public class CashBookEntry extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		CashBookEntryPOJO pojo=new CashBookEntryPOJO();
		CashBookEntryDAO dao=new CashBookEntryIMPL();
		
		String accountType=request.getParameter("ledgerId");
		if(accountType!=null)
		{		
			CashBookEntryPOJO pojo1=dao.selectAccountType(accountType);
			int type=pojo1.getCbStatus();
			out.print(type);
		}
		
		
		String cashBookBTN=request.getParameter("cashBookBTN");
		if(cashBookBTN!=null)
		{
			
		int account_type,bankId;
		int cashBook=Integer.parseInt(request.getParameter("selectCashBook").trim());
		int ledger=Integer.parseInt(request.getParameter("selectLedger").trim());
		int subAccount=Integer.parseInt(request.getParameter("selectSubAccount").trim());
		
		String cashBookStatus0=request.getParameter("setBothType").trim();
		String cashBookStatus1=request.getParameter("getCreditValue").trim();
		String cashBookStatus2=request.getParameter("getDebitValue").trim();
		if(cashBookStatus0.equals("0"))
		{
			account_type=Integer.parseInt(cashBookStatus0);
			
		}else if(cashBookStatus1.equals("1"))
		{
			account_type=Integer.parseInt(cashBookStatus1);
		}else {
			 account_type=Integer.parseInt(cashBookStatus2);
		}
		
		int transctionType;
		String transctiontype0=request.getParameter("setCash").trim();
		String transctiontype1=request.getParameter("setBankT").trim();
		if(transctiontype0.equals("0"))
		{
			transctionType=Integer.parseInt(transctiontype0);
		}
		else
		{
			transctionType=Integer.parseInt(transctiontype1);
		}
		
		String requiredDate=request.getParameter("requiredDate");
	
		if(transctiontype0.equals("0"))
		{
			bankId=0;
		}else
			
		{
			String bankName=request.getParameter("selectBankName").trim();
			bankId=Integer.parseInt(bankName);		
		}
		
		String amount=request.getParameter("getAccountName");
		String description=request.getParameter("description");
		
		//System.out.println("1:"+cashBook+"\n2:"+ledger+"\n3:"+subAccount+"\n4:"+account_type+"\n5:"+transctionType+"\n6:"+requiredDate+"\n7:"+bankId+"\n8:"+amount+"\n9:"+description);
	
		pojo.setCashBookId(cashBook);
		pojo.setLedgerId(ledger);
		pojo.setSubAccountId(subAccount);
		pojo.setCbStatus(account_type);
		pojo.setTransctionType(transctionType);
		pojo.setReqDate(requiredDate);
		pojo.setBankId(bankId);
		pojo.setDebitAmount(amount);
		pojo.setCreditAmount(amount);
		pojo.setDescription(description);
		
		dao.insertCashbookDetails(pojo);
		
		response.sendRedirect("View/cashBook/cashBookEntry.jsp");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
