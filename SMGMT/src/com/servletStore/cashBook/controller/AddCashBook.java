package com.servletStore.cashBook.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servletStore.cashBook.addCashBook.model.AddCashBookDAO;
import com.servletStore.cashBook.addCashBook.model.AddCashBookIMPL;
import com.servletStore.cashBook.addCashBook.model.AddCashBookPOJO;


public class AddCashBook extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		AddCashBookDAO dao=new AddCashBookIMPL();
		AddCashBookPOJO pojo=new AddCashBookPOJO();
		HttpSession session=request.getSession();
		
		String submit=request.getParameter("AddCashBookBTN");
		if(submit!=null)
		{
			String cashbook_name=request.getParameter("getCashBookName");
			String schoolId=request.getParameter("schoolId");
			pojo.setCashBookName(cashbook_name);
			int i=dao.insertCashBookName(pojo,schoolId);
			if(i>0)
			{
				session.setAttribute("flag","CashBook Name Inserted Successfully");
			}
		}		
		response.sendRedirect("View/cashBook/addCashBook.jsp");		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
