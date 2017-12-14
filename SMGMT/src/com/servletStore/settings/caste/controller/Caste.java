package com.servletStore.settings.caste.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servletStore.settings.caste.model.CasteDAO;
import com.servletStore.settings.caste.model.CasteImpl;
import com.servletStore.settings.caste.model.CastePOJO;

public class Caste extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		CastePOJO castePojo=new CastePOJO();
		CasteDAO casteDAO=new CasteImpl();

		//add-CasteCategory
		if(request.getParameter("category_btn")!=null){
			
			String casteCategoryName=request.getParameter("casteCategoryName").toUpperCase().trim();
			
			castePojo.setCasteCategoryName(casteCategoryName);
			casteDAO.addCasteCategory(castePojo);

			response.sendRedirect("View/settings/caste/addCategory&Religion.jsp");
		}
		
		//delete-CasteCategory
		if(request.getParameter("category_id")!=null){
			
			int category_id=Integer.parseInt(request.getParameter("category_id"));
	
			casteDAO.deleteCategory(category_id);
	
			response.sendRedirect("View/settings/caste/addCategory&Religion.jsp");
		}
		
		//update-CasteCategory		
		
		
		//add-Religion
		if(request.getParameter("religion_btn")!=null){
			
			String religionName=request.getParameter("religionName").toUpperCase().trim();
			
			castePojo.setReligionName(religionName);
			casteDAO.addReligion(castePojo);

			response.sendRedirect("View/settings/caste/addCategory&Religion.jsp");
		}
		
		//add-Religion
		if(request.getParameter("religion_id")!=null){
			
			int religion_id=Integer.parseInt(request.getParameter("religion_id"));
	
			casteDAO.deleteReligion(religion_id);
	
			response.sendRedirect("View/settings/caste/addCategory&Religion.jsp");
		}
		
		//add Caste
		if(request.getParameter("caste_btn")!=null){
			
			int religion_id=Integer.parseInt(request.getParameter("religion"));
			int category_id=Integer.parseInt(request.getParameter("category"));
			String casteName=request.getParameter("casteName").toUpperCase().trim();
			
			castePojo=new CastePOJO(religion_id,category_id,casteName);
			
			castePojo.setReligion_id(religion_id);
			castePojo.setCategory_id(category_id);
			castePojo.setCasteName(casteName);
			casteDAO.addCaste(castePojo);		

			response.sendRedirect("View/settings/caste/addCaste.jsp");
		}
		
		if(request.getParameter("caste_id")!=null){
			
			int caste_id=Integer.parseInt(request.getParameter("caste_id"));
			
			casteDAO.deleteCaste(caste_id);
			
			response.sendRedirect("View/settings/caste/addCaste.jsp");
		}
		
	}
}