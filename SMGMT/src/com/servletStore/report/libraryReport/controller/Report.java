package com.servletStore.report.libraryReport.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.dbconnect.DBConnection;
import com.servletStore.report.libraryReport.model.LibraryReportDAO;
import com.servletStore.report.libraryReport.model.LibraryReportImpl;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRResultSetDataSource;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.util.JRLoader;
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
		DBConnection connection= new DBConnection();
		Connection con=connection.getConnection();
		System.out.println("Generating");
		String schoolId=request.getParameter("schoolId");
		String academicYr=request.getParameter("academicYr");
		String trustyName="", schoolName="", sAddress="";
		PreparedStatement ps=null;
		boolean forward=true;
		String query="SELECT trustee_info.edu_society_name,school_master.name,school_master.address FROM school_master,trustee_info WHERE school_master.id='"+schoolId+"'";
		try {
			ps=con.prepareStatement(query);
			ResultSet rs= ps.executeQuery();
			while(rs.next())
			{
				trustyName=rs.getString(1);
				schoolName=rs.getString(2);
				sAddress=rs.getString(3);
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		LibraryReportDAO dao=new LibraryReportImpl();
		
		String availableBooks=request.getParameter("Avail");
		String reqdate=request.getParameter("requiredDate");
		
		
		//boolean redirect=true;
		
		if((request.getParameter("report")!=null) && (request.getParameter("reportOption").equals("Avail")))
		{
			try
			{
				System.out.println("date is:"+reqdate);
				String date1[]=reqdate.split("-");
				System.out.println(date1[0]+"-"+date1[1]);
				String d1[]=date1[0].split("/");
				System.out.println("1st date "+d1[1]+"-"+d1[0]+"-"+d1[2]);
				String d2[]=date1[1].split("/");
				String startDate=d1[2].trim()+"-"+d1[0].trim()+"-"+d1[1];
				String endDate=d2[2].trim()+"-"+d2[0].trim()+"-"+d2[1];
				//JasperReport jr = (JasperReport)JRLoader.loadObject(new File(path));
				net.sf.jasperreports.engine.JasperReport jasperReport = null;
				JasperDesign jasperDesign = null;
				Map para = new HashMap();
				
				para.put("startDate",""+startDate+"");
				para.put("endDate",""+endDate+"");
				para.put("trustyName", ""+trustyName+"");
				para.put("schoolName", ""+schoolName+"");
				para.put("sAddress", ""+sAddress+"");
				
				System.out.println("start"+para.get("startDate")+"\nend "+para.get("endDate")+"\n schoolName"+para.get("schoolName"));
				String path = request.getServletContext().getRealPath("/reports/AvailableBook.jrxml");
				//JasperReport jr = (JasperReport)JRLoader.loadObject(new File(path +"//reports/AvailableBook.jasper"));
				jasperDesign = JRXmlLoader.load(path);
				jasperReport = JasperCompileManager.compileReport(jasperDesign);
				JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, para, con);
		        JasperViewer.viewReport(jasperPrint, false);
			} 
			catch (JRException e)
			{
				e.printStackTrace();
			}
			
		}
		
	
		if((request.getParameter("report")!=null) && (request.getParameter("reportOption").equals("Cat")))
		{
		try
		{
			System.out.println("date is:"+reqdate);
			String date1[]=reqdate.split("-");
			System.out.println(date1[0]+"-"+date1[1]);
			String d1[]=date1[0].split("/");
			System.out.println("1st date "+d1[1]+"-"+d1[0]+"-"+d1[2]);
			String d2[]=date1[1].split("/");
			String startDate=d1[2].trim()+"-"+d1[0].trim()+"-"+d1[1];
			String endDate=d2[2].trim()+"-"+d2[0].trim()+"-"+d2[1];
			String catName=request.getParameter("cat");
			net.sf.jasperreports.engine.JasperReport jasperReport = null;
			JasperDesign jasperDesign = null;
			Map para = new HashMap();
			
			para.put("startDate",""+startDate+"");
			para.put("endDate",""+endDate+"");
			para.put("trustyName", ""+trustyName+"");
			para.put("schoolName", ""+schoolName+"");
			para.put("sAddress", ""+sAddress+"");
			para.put("catName", ""+catName+"");
			System.out.println("Category wise data");
			//System.out.println("start"+para.get("startDate")+"\nend "+para.get("endDate")+"\n schoolName"+para.get("schoolName"));
			String path = request.getServletContext().getRealPath("/reports/BookCategory.jrxml");
			jasperDesign = JRXmlLoader.load(path);
			jasperReport = JasperCompileManager.compileReport(jasperDesign);
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, para, con);
	        JasperViewer.viewReport(jasperPrint, false);
		} 
		catch (JRException e)
		{
			e.printStackTrace();
		}
	}
		
		if((request.getParameter("report")!=null) && (request.getParameter("reportOption").equals("Recover")))
		{
			try
			{
				System.out.println("date is:"+reqdate);
				String date1[]=reqdate.split("-");
				System.out.println(date1[0]+"-"+date1[1]);
				String d1[]=date1[0].split("/");
				System.out.println("1st date "+d1[1]+"-"+d1[0]+"-"+d1[2]);
				String d2[]=date1[1].split("/");
				String startDate=d1[2].trim()+"-"+d1[0].trim()+"-"+d1[1];
				String endDate=d2[2].trim()+"-"+d2[0].trim()+"-"+d2[1];
				net.sf.jasperreports.engine.JasperReport jasperReport = null;
				JasperDesign jasperDesign = null;
				Map para = new HashMap();
				
				para.put("startDate",""+startDate+"");
				para.put("endDate",""+endDate+"");
				para.put("trustyName", ""+trustyName+"");
				para.put("schoolName", ""+schoolName+"");
				para.put("sAddress", ""+sAddress+"");
				System.out.println("Recovery Books");
				//System.out.println("start"+para.get("startDate")+"\nend "+para.get("endDate")+"\n schoolName"+para.get("schoolName"));
				String path = request.getServletContext().getRealPath("/reports/RecoveryBook.jrxml");
				jasperDesign = JRXmlLoader.load(path);
				jasperReport = JasperCompileManager.compileReport(jasperDesign);
				JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, para, con);
		        JasperViewer.viewReport(jasperPrint, false);
			} 
			catch (JRException e)
			{
				e.printStackTrace();
			}
		}
		if((request.getParameter("report")!=null) && (request.getParameter("reportOption").equals("finePending")))
		{
			try
			{
				System.out.println("date is:"+reqdate);
				String date1[]=reqdate.split("-");
				System.out.println(date1[0]+"-"+date1[1]);
				String d1[]=date1[0].split("/");
				System.out.println("1st date "+d1[1]+"-"+d1[0]+"-"+d1[2]);
				String d2[]=date1[1].split("/");
				String startDate=d1[2].trim()+"-"+d1[0].trim()+"-"+d1[1];
				String endDate=d2[2].trim()+"-"+d2[0].trim()+"-"+d2[1];
				//String studId=request.getParameter("studId");
				net.sf.jasperreports.engine.JasperReport jasperReport = null;
				JasperDesign jasperDesign = null;
				Map para = new HashMap();
				para.put("startDate",""+startDate+"");
				para.put("endDate",""+endDate+"");
				para.put("trustyName", ""+trustyName+"");
				para.put("schoolName", ""+schoolName+"");
				para.put("sAddress", ""+sAddress+"");
				//para.put("studId", studId);
				System.out.println("Fine Pending");
				String path = request.getServletContext().getRealPath("/reports/FinePending.jrxml");
				jasperDesign = JRXmlLoader.load(path);
				jasperReport = JasperCompileManager.compileReport(jasperDesign);
				JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, para, con);
		        JasperViewer.viewReport(jasperPrint, false);
			} 
			catch (JRException e)
			{
				e.printStackTrace();
			}
		}
		
		
		if((request.getParameter("report")!=null) && (request.getParameter("reportOption").equals("bookNo")))
		{
			try
			{
				System.out.println("date is:"+reqdate);
				String date1[]=reqdate.split("-");
				System.out.println(date1[0]+"-"+date1[1]);
				String d1[]=date1[0].split("/");
				System.out.println("1st date "+d1[1]+"-"+d1[0]+"-"+d1[2]);
				String d2[]=date1[1].split("/");
				String startDate=d1[2].trim()+"-"+d1[0].trim()+"-"+d1[1];
				String endDate=d2[2].trim()+"-"+d2[0].trim()+"-"+d2[1];
				String catType=request.getParameter("bookCat"); 
				String bookName=request.getParameter("bName");
				System.out.println("Cat Type "+catType+ " "+bookName);
				net.sf.jasperreports.engine.JasperReport jasperReport = null;
				JasperDesign jasperDesign = null;
				Map<String,Object> para = new HashMap<>();
				para.put("startDate",""+startDate+"");
				para.put("endDate",""+endDate+"");
				para.put("trustyName", ""+trustyName+"");
				para.put("schoolName", ""+schoolName+"");
				para.put("sAddress", ""+sAddress+"");
				para.put("catType", ""+catType+"");
				para.put("bookName",""+bookName+"");
				System.out.println("Book no cupboardwise.."+para);
				String path = request.getServletContext().getRealPath("/reports/BookNoCupbWise.jrxml");
		
				jasperDesign = JRXmlLoader.load(path);
				jasperReport = JasperCompileManager.compileReport(jasperDesign);
				JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, para, con);
		        JasperViewer.viewReport(jasperPrint, false);
			} 
			catch (JRException e)
			{
				e.printStackTrace();
			}
		}
		
		if(request.getParameter("catId")!=null)
		{
			forward=false;
			String cat_id=request.getParameter("catId");
			System.out.println("in categoey...");
			int id=Integer.parseInt(cat_id);
			
			System.out.println("cat id:"+id);
			List<Object> list=dao.getBookName(id);
			Iterator itr=list.iterator();
			System.out.println("Size "+list);
			while(itr.hasNext())
			{
				out.print(itr.next()+"~");
				//out.print(itr.next()+","+itr.next()+",");
				//System.out.println("Book Name Dispalyed");
			}
			
		}
		if(forward)
		{
			response.sendRedirect("/SMGMT/View/report/libraryReport.jsp");
		}
	}
}
	
	

