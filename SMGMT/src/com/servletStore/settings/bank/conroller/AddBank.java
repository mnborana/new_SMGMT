package com.servletStore.settings.bank.conroller;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servletStore.settings.bank.model.AddBankDAO;
import com.servletStore.settings.bank.model.AddBankIMPL;
import com.servletStore.settings.bank.model.AddBankPOJO;

public class AddBank extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AddBankDAO dao=new AddBankIMPL();
		HttpSession session=request.getSession();
		
		String submit=request.getParameter("bankSubmitBTN");
		if(submit!=null)
		{
			String bankName=request.getParameter("bankName");
			String branch=request.getParameter("branchName");
			String accountNo=request.getParameter("accountNo");
			
			
			 Pattern p = Pattern.compile("((^| )[A-Za-z])");
			 Matcher m=p.matcher(bankName);
			 String shotBankName = "";
			    while (m.find()) {
			        shotBankName += m.group().trim();
			    }
			   
			
			String aliasName=shotBankName+"_"+branch+"_"+accountNo;
			
			AddBankPOJO pojo=new AddBankPOJO();
			pojo.setBankName(bankName);
			pojo.setBranch(branch);
			pojo.setAccountNo(accountNo);
			pojo.setAliasName(aliasName);
			int i=dao.insertBankDetails(pojo);
			if(i>0)
			{
				session.setAttribute("flag", "Inserted Successfully");
			}
			response.sendRedirect("View/settings/addBank/addBank.jsp");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
