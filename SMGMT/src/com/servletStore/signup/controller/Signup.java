package com.servletStore.signup.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servletStore.login.model.UserLoginDAO;
import com.servletStore.login.model.UserLoginImpl;
import com.servletStore.signup.model.SignUpDAO;
import com.servletStore.signup.model.SignupImpl;

//@WebServlet("/Signup")
public class Signup extends HttpServlet
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		response.setContentType("text/html");
		// PrintWriter out=response.getWriter();
		HttpSession session = request.getSession();

		if (request.getParameter("addNew") != null)
		{
			String schoolId = request.getParameter("schoolId");
			String rollId = request.getParameter("userRoll");
			String userName = request.getParameter("userName");
			String password = request.getParameter("password");
			UserLoginDAO check = new UserLoginImpl();
			SignUpDAO dao = new SignupImpl();

			try
			{

				Boolean result = check.checkUserExist(userName);
				if (result)
				{
					session.setAttribute("flag", "Usename is already taken by someone");
					response.sendRedirect("/SMGMT/View/signup/adduser.jsp");
				} 
				else
				{
					int status = dao.insertUserMaster(schoolId, rollId, userName, password);

					if (status > 0)
					{
						session.setAttribute("flag", "User Added Successfully");
						response.sendRedirect("/SMGMT/View/signup/adduser.jsp");
					} else
					{
						session.setAttribute("flag", "Error");
						response.sendRedirect("/SMGMT/View/signup/adduser.jsp");
					}
				}

			} catch (SQLException e)
			{
				e.printStackTrace();
			}

		}

	}

}
