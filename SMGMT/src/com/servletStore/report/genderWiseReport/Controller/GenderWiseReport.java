package com.servletStore.report.genderWiseReport.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbconnect.DBConnection;

import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;

public class GenderWiseReport extends HttpServlet {

	
	DBConnection connection = new DBConnection();
	
	Connection con = connection.getConnection();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		if((request.getParameter("submitBTN")!=null))
		{
			try {
			
				String gender = request.getParameter("gender");
				String standard_id = request.getParameter("standard_id");
				
				System.out.println(gender+" "+standard_id);
				net.sf.jasperreports.engine.JasperReport jasperReport = null;
				JasperDesign jasperDesign = null;
				Map para = new HashMap<>();
				//para.put("gender",""+gender+"");
				para.put("standard_id",""+standard_id+"");
				//para.put("schoolName", ""+schoolName+"");
				//para.put("sAddress", ""+sAddress+"");*/
				String path = getServletContext().getRealPath("/WEB-INF/");
				jasperDesign = JRXmlLoader.load(path + "/jasperReport/genderWiseReport.jrxml");
//				String path = request.getServletContext().getRealPath("/WEB-INF/jasperReport/genderWiseReport.jrxml");
				//jasperDesign = JRXmlLoader.load(path);
				
				System.out.println(gender+" is "+standard_id);
				
				jasperReport = JasperCompileManager.compileReport(jasperDesign);
				JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, para, con);
		        JasperViewer.viewReport(jasperPrint, false);
				
			} catch (Exception e) {
				
			}			
		}
		response.sendRedirect("/SMGMT/View/report/genderWiseReport.jsp");
	}

}
