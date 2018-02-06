package com.servletStore.report.studAddressInfo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbconnect.DBConnection;
import com.servletStore.report.studAddressInfo.model.StudAddressInfoDAO;
import com.servletStore.report.studAddressInfo.model.StudAddressInfoIMPL;
import com.servletStore.report.studAddressInfo.model.StudAddressInfoPOJO;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;


public class StudAddressInfo extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String submit=request.getParameter("submitBtn");
		if(submit!=null)
		{
			String standardDiv=request.getParameter("selectstdDiv");
			String schoolId=request.getParameter("schoolId");
			StudAddressInfoDAO dao=new StudAddressInfoIMPL();
			StudAddressInfoPOJO pojo=dao.selectSTDDiv(standardDiv,schoolId);
			String standard=pojo.getStdDiv();
			String division=pojo.getDivision();
			String academicYear=request.getParameter("academicYear");
			
			StudAddressInfoPOJO pojo1=dao.selectSchoolDetails(schoolId);
			String trustyName=pojo1.getTrustyInfo();
			String schoolName=pojo1.getSchoolName();
			String address=pojo1.getAddress();
			System.out.println("1:"+standard+"\n2:"+division+"\n3:"+academicYear+"\n:4"+trustyName+"\n4:"+schoolName+"\n5:"+address);
			try {
				DBConnection conn=new DBConnection();
				Connection connection=conn.getConnection();
				net.sf.jasperreports.engine.JasperReport jasperReport = null;
				JasperDesign jasperDesign = null;
				Map parameter = new HashMap();
				parameter.put("stdDiv", standardDiv);
				parameter.put("standard", standard);
				parameter.put("division", division);
				parameter.put("academicYear", academicYear);
				parameter.put("trustyName", trustyName);
				parameter.put("schoolName", schoolName);
				parameter.put("address", address);
				
				String path = getServletContext().getRealPath("/WEB-INF/");
				jasperDesign = JRXmlLoader.load(path + "/jasperReport/StudAddressInformation.jrxml");
				jasperReport = JasperCompileManager.compileReport(jasperDesign);
				JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameter, connection);
		        JasperViewer.viewReport(jasperPrint, false);
				
			} catch (JRException e) {
				e.printStackTrace();
			}
			
			
		}
		response.sendRedirect("View/report/studAddressInfo.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
