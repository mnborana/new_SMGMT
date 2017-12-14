package com.servletStore.common;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DoLoginAction extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out = response.getWriter();
		response.setContentType("Text/HTML");
		if(request.getParameter("getUser")!=null)
		response.sendRedirect("View/Login/doLogin.jsp");
		

		if(request.getParameter("Login")!=null){
			if(request.getParameter("username")!=null && request.getParameter("userpass")!=null)
			{
				if(request.getParameter("username").trim().toString().equals("admin") && request.getParameter("userpass").trim().toString().equals("admin"))
				{
					RequestDispatcher rd= request.getRequestDispatcher("View/Login/userLogin.jsp");
			    	rd.forward(request, response);
				}
			}
			
		}
		
//		if(request.getParameter("Login")!=null)
//		{
//			String name=request.getParameter("username").trim();
//			String pass=request.getParameter("userpass").trim();
//			
//			 GenericDAO gd = new GenericDAO();
//			 
//			 if(name.equals("TMANAGER") && pass.equals("TMANAGER"))
//		  		{
//				 	RequireData rdata= new RequireData();
//				 	if(rdata.checkUser())
//				 	{
//				 		request.setAttribute("status", "Organization Already Added. Login As User");
//				 		RequestDispatcher rd= request.getRequestDispatcher("jsp/common/login.jsp");
//				    	rd.forward(request, response);
//				 		
//				 	}
//				 	else{
//				 	
//		  			HttpSession session= request.getSession();
//					session.setAttribute("sAdmin", "TMANAGER");
//					System.out.println("*****Login Here Supper Admin Model******");
//			    	RequestDispatcher rd= request.getRequestDispatcher("jsp/sadmin/Organization.jsp");
//			    	rd.forward(request, response);
//				 	}
//		  		}
//			 else{
//			  		 System.out.println("In LoginAction.java");
//				  	String checkPerson="Select `varusername`, `varuserpass`, `introll`,intstatus from `user_master` where introll=1";
//				  	List allList=gd.getData(checkPerson);
//				  	boolean status=false;
//				  	if(!allList.isEmpty())
//				  	{
//				  		Iterator itr=allList.iterator();
//				  		while(itr.hasNext())
//					  	{
//				  			System.out.println(name+","+pass+",");
//				  			String uname=itr.next().toString();
//				  			String upass=itr.next().toString();
//				  			int roll=Integer.parseInt(itr.next().toString());
//				  			int intStatus=Integer.parseInt(itr.next().toString());
//					  		if(name.equals(uname) && pass.equals(upass))
//					  		{
//					  			if(roll==1)
//					  			{
//					  				if(intStatus==1)
//					  				{
//					  					status=true;
//						  				HttpSession session= request.getSession();
//						  				System.out.println("*****Login Here Normal Admin Model******");
//						  				session.setAttribute("username", name);
//							    		RequestDispatcher rd= request.getRequestDispatcher("jsp/admin/homePage.jsp");
//								    	rd.forward(request, response);	
//								    	break;
//					  				}
//					  				else
//					  				{
//					  					status=true;
//					  					request.setAttribute("activateKey","keyNotPresent");
//					  					RequestDispatcher rd= request.getRequestDispatcher("jsp/common/login.jsp");
//								    	rd.forward(request, response);
//								    	break;
//					  				}
//					  				
//					  			}
//					  			
//					  		}
//					  	}
//				  		if(!status)
//				  		{
//				  			request.setAttribute("fail","1");
//				    		 RequestDispatcher rd= request.getRequestDispatcher("jsp/common/login.jsp");
//							 rd.forward(request, response);
//				  		}
//				  		
//				  	}
//				    else  
//				    {
//				    	request.setAttribute("fail","1");
//			    		 RequestDispatcher rd= request.getRequestDispatcher("jsp/common/login.jsp");
//						 rd.forward(request, response);
//				    }
//			 }
//		}
//		if(request.getParameter("Activate")!=null)
//		{
//			System.out.println("funny");
//			String key=request.getParameter("activationKey");
//			GenericDAO gd=new GenericDAO();
//			SecureCode sd=new SecureCode();
//			if(SecureCode.decrypt(key.trim(), 10))
//			{
//				String statusChange="UPDATE `user_master` SET `intstatus`=1 WHERE user_master.introll=1";
//				int status=gd.executeCommand(statusChange);
//				if(status==1)
//				{
//					out.print("1");
//				}
//			}
//			else
//			{
//				out.print("0");
//				
//			}
//		}
	}

	
	
}
