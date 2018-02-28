package com.servletStore.cashBook.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servletStore.cashBook.Ledger.model.CashBookLedgAccDAO;
import com.servletStore.cashBook.Ledger.model.CashBookLedgAccIMPL;
import com.servletStore.cashBook.Ledger.model.CashBookLedgAccPOJO;


public class CashBookLedgerAccount extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/html");
	PrintWriter out=response.getWriter();
	CashBookLedgAccDAO dao=new CashBookLedgAccIMPL();
	HttpSession session=request.getSession();
	
	String submit=request.getParameter("CashBookLedgerBTN");
	if(submit!=null)
	{
		String cashBook=request.getParameter("selectCashBook");
		String nameOfAccount=request.getParameter("getAccountName");
		String selectAccType=request.getParameter("accountType");
		System.out.println("1:"+cashBook+"\n2:"+nameOfAccount+"\n3:"+selectAccType);
		
		CashBookLedgAccPOJO pojo=new CashBookLedgAccPOJO();
		pojo.setCashBookId(Integer.parseInt(cashBook));
		pojo.setAccountName(nameOfAccount);
		pojo.setAccountType(selectAccType);
		
		dao.insertLedgerAccount(pojo);
		
	}
		response.sendRedirect("View/cashBook/cashBookLedger.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
