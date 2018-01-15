package com.servletStore.login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@WebServlet("/UserLogout")
public class UserLogout extends HttpServlet {
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
			PrintWriter out = response.getWriter();
			//out.print("working");
			HttpSession session= request.getSession();
				session.removeAttribute("userName");
				session.removeAttribute("schoolId");
				session.removeAttribute("year");
				session.removeAttribute("rollId");
				
				session.invalidate();
				
				RequestDispatcher rd= request.getRequestDispatcher("/");
			   	rd.forward(request, response);
				
	}

}
