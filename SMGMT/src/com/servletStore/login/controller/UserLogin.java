package com.servletStore.login.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servletStore.login.model.Encryption;
import com.servletStore.login.model.UserLoginDAO;
import com.servletStore.login.model.UserLoginImpl;
import com.servletStore.login.model.UserLoginPojo;

/**
 * Servlet implementation class UserLogin
 */
public class UserLogin extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String loginYear=request.getParameter("loginYear");
		
		Encryption enc= new Encryption();
		UserLoginDAO impl = new UserLoginImpl();
		
		try {
			
			Boolean authenticate=enc.login(username, password);
			
			if(authenticate)
			{
				List sessionDetails = impl.getSessionDetails(username);
				
				Object userRollId=sessionDetails.get(0);
				Object instituteId= sessionDetails.get(1);
				
				HttpSession session= request.getSession();
  				session.setAttribute("userName", username);
  				session.setAttribute("schoolId", instituteId);
  				session.setAttribute("year", loginYear);
  				session.setAttribute("rollId", userRollId);
  				
				response.sendRedirect("/SMGMT/index.jsp");
				
				/*out.print("login successful "+loginYear);
				out.print("userRollId "+userRollId);
				out.print("instituteId "+instituteId);*/
			}
			else
			{
				//out.println("login failed");
				response.sendRedirect("/SMGMT");
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
