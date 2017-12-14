package com.servletStore.settings.bank.conroller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servletStore.settings.bank.model.addBankDAO;
import com.servletStore.settings.bank.model.addBankImpl;
import com.servletStore.settings.bank.model.addBankPojo;

@WebServlet("/addBank")
public class addBank extends HttpServlet {
	private static final long serialVersionUID = 1L;
       addBankDAO addbank;
   
    public addBank() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String submit=request.getParameter("submit");
		addbank=new addBankImpl();
		if(submit!=null)
		{			
			String bankname=request.getParameter("bankname");
			String shortform=request.getParameter("shortform");
			
			
			addBankPojo pojo=new addBankPojo(bankname, shortform);
			
			try {
				addbank.insertBankDetails(pojo);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("inserted Successfully");
			
			RequestDispatcher rd=request.getRequestDispatcher("View/Settings/Bank/addBank.jsp");
			rd.forward(request, response);
			
		}
		
		if(request.getParameter("id")!=null)
		{
			String bank_id=request.getParameter("id");
			try 
			{
				addbank.deleteRecord(bank_id);
			} catch (SQLException e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("deleted Successfully");
			
			RequestDispatcher rd=request.getRequestDispatcher("View/Settings/Bank/addBank.jsp");
			rd.forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
