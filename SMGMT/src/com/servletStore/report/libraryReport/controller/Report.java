package com.servletStore.report.libraryReport.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servletStore.report.libraryReport.model.LibraryReportDAO;
import com.servletStore.report.libraryReport.model.LibraryReportImpl;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;

/**
 * Servlet implementation class Report
 */
//@WebServlet(name = "LibraryReport", urlPatterns = { "/LibraryReport" })
public class Report extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out= response.getWriter();
		System.out.println("DFdgd");
		LibraryReportDAO dao=new LibraryReportImpl();
		String availableBooks=request.getParameter("Avail");		
		/*String std_id=request.getParameter("std_id");
		String date=request.getParameter("date_id");*/
		boolean redirect=true;
		
		if(request.getParameter("report")!=null)
		{
			try
			{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/smgmt", "root", "");
			net.sf.jasperreports.engine.JasperReport jasperReport = null;
			JasperDesign jasperDesign = null;
			Map parameters = new HashMap();
			String path = getServletContext().getRealPath("/reports/Library.jrxml");
			//String path="/SMGMT/reports/Library.jrxml";
			jasperDesign = JRXmlLoader.load(path);
			jasperReport = JasperCompileManager.compileReport(jasperDesign);
			JasperPrint jp=JasperFillManager.fillReport(jasperReport, parameters,connection);
			//JasperExportManager.exportReportToPdfFile(jp,"/media/ap/Songs/JasperReports/Name..pdf");
			JasperViewer jv=new JasperViewer(jp,false);
			jv.setVisible(true);
			
			}
			catch (ClassNotFoundException e) 
			{
			e.printStackTrace();
			} catch (SQLException e)
			{
			e.printStackTrace();
			} catch (JRException e)
			{
			e.printStackTrace();
			}

		}
		if(redirect)
		{	
			response.sendRedirect("/SMGMT/View/report/libraryReport.jsp");
		}
	}
		
		/*
			try
			{
			String path = getServletContext().getRealPath("/reports/jasperReport.jrxml");
			JasperReport jr=JasperCompileManager.compileReport("");
			JRDataSource jrd=new JREmptyDataSource();
			Map<String,Object> para=new HashMap<String,Object>();
			para.put("myname","Pravin Sanap");
			JasperPrint jp=JasperFillManager.fillReport(jr, para,jrd);
			//JasperExportManager.exportReportToPdfFile(jp,"/media/ap/Songs/JasperReports/Name..pdf");
			JasperViewer jv=new JasperViewer(jp,false);
			jv.setVisible(true);
			}
			catch(Exception e)
			{
				
			}
		*/
	}

