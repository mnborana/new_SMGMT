package com.servletStore.settings.division.conroller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servletStore.settings.division.model.DivisionDAO;
import com.servletStore.settings.division.model.DivisionImpl;
import com.servletStore.settings.division.model.DivisionPOJO;

@WebServlet("/Division")
public class Division extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DivisionDAO divisiondao;
		
		String school=request.getParameter("school");
		String section=request.getParameter("section");
		String addclass=request.getParameter("getclass");
		String division=request.getParameter("division");
		
		DivisionPOJO division1=new DivisionPOJO(school, section, addclass,division);
	
		divisiondao=new DivisionImpl();
		try {
			divisiondao.insertDivisionDetails(division1);
			System.out.println("inserted successfully");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		response.sendRedirect("View/Settings/Division/Division.jsp");
	}

}
