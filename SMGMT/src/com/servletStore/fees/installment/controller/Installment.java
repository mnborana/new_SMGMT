package com.servletStore.fees.installment.controller;

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

import com.servletStore.fees.installment.model.InstallmentDAO;
import com.servletStore.fees.installment.model.InstallmentImpl;
import com.servletStore.fees.installment.model.InstallmentPOJO;


public class Installment extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		InstallmentDAO dao= new InstallmentImpl();
		InstallmentPOJO pojo=new InstallmentPOJO();
		PrintWriter out=response.getWriter();
		
		
		
		if(request.getParameter("installmentName")!=null)
		{
			String modeName=request.getParameter("mode_name");
			int installment=Integer.parseInt(request.getParameter("installment"));
			String date[]=request.getParameter("date").split("-");
			String installDate=date[2].trim()+"-"+date[1]+"-"+date[0];
			
			pojo.setModeName(modeName);
			pojo.setInstallment(installment);
			pojo.setDate(installDate);
			
			InstallmentImpl impl=new InstallmentImpl();
			try {
				int st=impl.insertInstallment(pojo);
				if(st>0)
				{
					
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			response.sendRedirect("View/fees/installment.jsp");
			
		}
		 if(request.getParameter("updateInstallment1")!=null)
		{
			
			int id=Integer.parseInt(request.getParameter("mod_name"));
			String mName=request.getParameter("m_name");
			int install=Integer.parseInt(request.getParameter("installmentMode"));
			String  date=request.getParameter("Modedate");
			
			InstallmentPOJO pojo3=new InstallmentPOJO();
			pojo3.setId(id);
			pojo3.setModeName(mName);
			pojo3.setInstallment(install);
			pojo3.setDate(date);
			
			try {
				int status=dao.updatInstallment(pojo3);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			response.sendRedirect("View/fees/installment.jsp");
			
		}

		 if(request.getParameter("uId")!=null)
		{
			int  id=Integer.parseInt(request.getParameter("uId"));
			
			try {
				
				
				List list=dao.getIntallmentDetails(id);
				Iterator itr=list.iterator();
				while(itr.hasNext())
				{ 
					InstallmentPOJO pojo2=(InstallmentPOJO)itr.next();
					int id1=((InstallmentPOJO)pojo2).getId();
					String modeName=((InstallmentPOJO)pojo2).getModeName();
					int  installment=((InstallmentPOJO)pojo2).getInstallment();
					String date=((InstallmentPOJO)pojo2).getDate();
					out.print(id1+","+modeName+","+installment+","+date);
					
					
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
	}

}
