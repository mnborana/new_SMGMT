package com.servletStore.cashBook.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servletStore.cashBook.model.CashBookDAO;
import com.servletStore.cashBook.model.CashBookImpl;

/**
 * Servlet implementation class CashBook
 */
@WebServlet("/CashBook")
public class CashBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CashBookDAO cashbook=new CashBookImpl();
		
		String date = null;
		String particular = null;
		String lf = null;
		String cd_status = null;
		String cb_status = null;
		String debit = null;
		String credit  = null;
		
		//Date format (dd-mm-yyyy)
		//Appropriate particular with senior advice
		//ledger folio in cash book
		//cd_status IF creadit=0 ELSE debit=1
		//cb_status IF cash=0 ELSE bank=1
		//debit OR credit  Amount either of
		cashbook.cashBookEnrty(date, particular, lf, cd_status, cb_status, debit, credit );
	}

}
