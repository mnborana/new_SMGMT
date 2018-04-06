package com.servletStore.student.studentReports.controller;

import java.awt.Window;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbconnect.DBConnection;
import com.servletStore.student.studentReports.model.studentReportDAO;
import com.servletStore.student.studentReports.model.studentReportImpl;
import com.servletStore.student.studentReports.model.studentReportPOJO;

import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;


public class categaryWiseReportGeneration extends HttpServlet
{
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Map<String,Object> para = new HashMap();
		DBConnection con=new DBConnection();
		Connection connection=con.getConnection();
		PreparedStatement pstmt=null;
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		studentReportDAO dao=new studentReportImpl();
		studentReportPOJO pojo=new studentReportPOJO();
		Object school_name=" ",address=" ",trusty=" ",ad1="";
		String Academic_year=request.getParameter("ac_year");
		String school_id=request.getParameter("school_id");
		System.out.println("year     "+Academic_year+"School_id "+school_id);
		String category=request.getParameter("category");
		String stddiv=request.getParameter("stddiv");
		String radio_value=request.getParameter("radio3");
		String c_name=dao.getCategory(category);
		List<Object> l1=dao.getSchoolDetails(school_id);
		String stdName=dao.getStdName(stddiv);
		Iterator<Object> itr=l1.iterator();
		while(itr.hasNext())
		{
			System.out.println("hiii");
			trusty=itr.next();
			address=itr.next();
			school_name=itr.next();
			
			System.out.println("trusty "+trusty+"\n address "+address+"\n school name "+school_name);

		}
		List<Object> Category_count_list=dao.getAllCategoryCount(stddiv, Academic_year, school_id);
		Iterator<Object> itr1=Category_count_list.iterator();
		String count="0",category_name1="";
		int i=0;
		while(itr1.hasNext())
		{
			i++;
			count=itr1.next().toString();
			if(count.equals("null"))
			{
				System.out.println("NULL");
				count="0";
			}
			category_name1=itr1.next().toString();
			if(category_name1.trim().equalsIgnoreCase("OBC"))
			{
				System.out.println("IN OBC");
				para.put("OBC",count);
			}
			else if(category_name1.trim().equalsIgnoreCase("OPEN"))
			{
				System.out.println("IN OPEN");
				para.put("OPEN",count);
			}
			else if(category_name1.trim().equalsIgnoreCase("SBC"))
			{
				System.out.println("IN SBC");
				para.put("SBC",count);
			}
			else if(category_name1.trim().equalsIgnoreCase("SC"))
			{
				para.put("SC",count);
			}
			else if(category_name1.trim().equalsIgnoreCase("ST"))
			{
				para.put("ST",count);
			}
			else if(category_name1.trim().equalsIgnoreCase("NT(A)"))
			{
				para.put("NT(A)",count);
			}	
			else if(category_name1.trim().equalsIgnoreCase("NT(B)"))
			{
				para.put("NT(B)",count);
			}
			else if(category_name1.trim().equalsIgnoreCase("NT(C)"))
			{
				para.put("NT(C)",count);
			}
			else if(category_name1.trim().equalsIgnoreCase("NT(D)"))
			{
				para.put("NT(D)",count);
			}
			System.out.println("count "+count+"\ncategory Name "+category_name1);
		}
		//System.out.println("list of school "+l1);
		
		
if(request.getParameter("report_generation")!=null && request.getParameter("radio3").equals("1"))
	{	
			
			try
			{
				
				//JasperReport jr = (JasperReport)JRLoader.loadObject(new File(path));

				
				net.sf.jasperreports.engine.JasperReport jasperReport = null;
				JasperDesign jasperDesign = null;
				Map para1 = new HashMap();
				
				para1.put("academicYear",""+Academic_year+"");
				para1.put("categoryId",""+category+"");
				para1.put("schoolId", ""+school_id+"");
				para1.put("categoryname",""+c_name+"");
				para1.put("school_name",""+school_name+"");
				para1.put("schoolAddress",""+address+"");
				para1.put("trusty",""+trusty+"");
			//	System.out.println(para.get("academicYear")+"\ncat:"+para.get("categoryId")+"\nschoolI:"+para.get("schoolId"));
				String path = request.getServletContext().getRealPath("/reports/");
				//JasperReport jr = (JasperReport)JRLoader.loadObject(new File(path +"/allCategoryWise1.jasper"));
				jasperDesign = JRXmlLoader.load(path + "/allCategoryWise1.jrxml");
				jasperReport = JasperCompileManager.compileReport(jasperDesign);
				JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, para1, connection);
		        JasperViewer.viewReport(jasperPrint, false);
				
			} 
			catch (JRException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			
		}
		else
if(request.getParameter("report_generation")!=null && request.getParameter("radio3").equals("2"))
{	
	try
	{
		
		//JasperReport jr = (JasperReport)JRLoader.loadObject(new File(path));

		
		net.sf.jasperreports.engine.JasperReport jasperReport = null;
		JasperDesign jasperDesign = null;
		Map<String,Object> para2 = new HashMap();
		
		para2.put("academic_year",""+Academic_year+"");
		para2.put("category_id",""+category+"");
		para2.put("schoolId", ""+school_id+"");
		para2.put("category_name",""+c_name+"");
		para2.put("standard_Division",""+stddiv+"");
		para2.put("school_name",""+school_name+"");
		para2.put("schoolAddress",""+address+"");
		para2.put("trusty",""+trusty+"");
		para2.put("standardName",""+stdName+"");
		System.out.println(para2.get("academic_year")+"\ncat:"+para2.get("category_id")+"\nschoolI:"+para2.get("schoolId"));
		String path = request.getServletContext().getRealPath("/reports/");
		//JasperReport jr = (JasperReport)JRLoader.loadObject(new File(path +"/allCategoryWise1.jasper"));
		jasperDesign = JRXmlLoader.load(path + "/standardDivisionWiseReport.jrxml");
		jasperReport = JasperCompileManager.compileReport(jasperDesign);
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, para2, connection);
        JasperViewer.viewReport(jasperPrint, false);
		
	} 
	catch (JRException e)
	{
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
			


}else if(request.getParameter("report_generation")!=null && request.getParameter("radio3").equals("3"))
	{
	
	try
	{
		
		//JasperReport jr = (JasperReport)JRLoader.loadObject(new File(path));

		System.out.println("In");
		net.sf.jasperreports.engine.JasperReport jasperReport = null;
		JasperDesign jasperDesign = null;
		
		
		para.put("academic_year",""+Academic_year+"");
		para.put("category_id",""+category+"");
		para.put("schoolId", ""+school_id+"");
		para.put("category_name",""+c_name+"");
		para.put("standard_Division",""+stddiv+"");
		para.put("school_name",""+school_name+"");
		para.put("schoolAddress",""+address+"");
		para.put("trusty",""+trusty+"");
		para.put("standardName",""+stdName+"");
		System.out.println(para.get("academic_year")+"\ncat:"+para.get("category_id")+"\nschoolI:"+para.get("standard_Division"));
		String path = request.getServletContext().getRealPath("/reports/");
		//JasperReport jr = (JasperReport)JRLoader.loadObject(new File(path +"/allCategoryWise1.jasper"));
		jasperDesign = JRXmlLoader.load(path + "/standardDivisionWiseAllCategoryReport.jrxml");
		jasperReport = JasperCompileManager.compileReport(jasperDesign);
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, para, connection);
        JasperViewer.viewReport(jasperPrint, false);
		
	} 
	catch (JRException e)
	{
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
			

	
	}

	
	response.sendRedirect("/SMGMT/View/report/categaryWiseReport.jsp");
	}

}

