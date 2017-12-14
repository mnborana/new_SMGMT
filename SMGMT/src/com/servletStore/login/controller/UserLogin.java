package com.servletStore.login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servletStore.login.model.UserLoginDAO;
import com.servletStore.login.model.UserLoginImpl;
import com.servletStore.login.model.UserLoginPojo;

/**
 * Servlet implementation class UserLogin
 */
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		//redirecting
		if(request.getParameter("login")!=null) 
		{
			response.sendRedirect("/SMGMT/dashboard.jsp");
		}
		
		//ajax checking status of user
		if(request.getParameter("getStatus")!=null) 
		{
			UserLoginDAO uldao=new UserLoginImpl();
			String username=request.getParameter("username").trim();
			String password=request.getParameter("password").trim();
			UserLoginPojo ul=new UserLoginPojo();
			ul.setUsername(username);
			ul.setPassword(password);
			
			String status=uldao.getLoginStatus(ul);
			
			if(status.equals("noData")) {
				out.print("0");
			}
			else if(status.equals("wrongUser")) {
				out.print("2");
			}
			else if(status.equals("success")) {
				out.print("1");
			}
			
		}
	}

}
