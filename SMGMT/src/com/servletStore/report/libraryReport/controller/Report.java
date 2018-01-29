package com.servletStore.report.libraryReport.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

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
		//String bookNo=request.getParameter("bookNo");
		//System.out.println("Book No "+bookNo);
		String date=request.getParameter("date");
		String date1[]=date.split("-");
		System.out.println(date1[0]+"-"+date1[1]);
		String d1[]=date1[0].split("/");
		//System.out.println("1st date "+d1[1]+"-"+d1[0]+"-"+d1[2]);
		String d2[]=date1[1].split("/");
		String startDate=d1[0]+"-"+d1[1]+"-"+d1[2];
		String endDate=d2[0].trim()+"-"+d2[1]+"-"+d2[2];
		//System.out.println("DDDDDDDDDDDD "+startDate+"-"+endDate);
		/*Map map=new HashMap();
		map.put("available", availableBooks);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("bookNo", bookNo);
		*/
		boolean redirect=true;
		
		if(request.getParameter("report")!=null)
		{
			try
			{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/smgmt", "root", "");
			ResultSet rs=null;
			
				String catType="",bookName="",authorName="",edition="",language="";
				int bookNo=0;
				String sql="SELECT book_info_master.book_no,book_category.cat_type,book_info_master.book_name,book_info_master.author_name,book_info_master.edition,book_info_master.language FROM book_info_master,book_category,book_details_master WHERE book_info_master.cat_id=book_category.cat_id AND book_info_master.book_no=book_details_master.book_no AND book_info_master.date BETWEEN " +startDate+ "AND " +endDate;
				PreparedStatement ps=connection.prepareStatement(sql);
				rs=ps.executeQuery();
				while(rs.next())
				{
					bookNo=rs.getInt(1);
					catType=rs.getString(2);
					bookName=rs.getString(3);
					authorName=rs.getString(4);
					edition=rs.getString(5);
					language=rs.getString(6);
					System.out.println("Details "+bookNo+" "+catType+" "+bookName+" "+authorName);
				}
				
				JRResultSetDataSource jrDataSource=null;
				Map parameter = new HashMap();
				parameter.put("available", availableBooks);
				parameter.put("bookNo", bookNo);
				parameter.put("catType", catType);
				parameter.put("bookName", bookName);
				parameter.put("edition", edition);
				parameter.put("edition", edition);
				parameter.put("language", language);
				parameter.put("endDate", endDate);
				//map.put("bookNo", bookNo);
				  net.sf.jasperreports.engine.JasperReport jasperReport = null;
					JasperDesign jasperDesign = null;
				String path = getServletContext().getRealPath("/reports/availableBooks.jrxml");
				//String path="/SMGMT/reports/Library.jrxml";
				jasperDesign = JRXmlLoader.load(path);
				jasperReport = JasperCompileManager.compileReport(jasperDesign);
				//jrDataSource=new JRResultSetDataSource(rs);
				JasperPrint jp=JasperFillManager.fillReport(jasperReport, parameter,connection);
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
}
	
	

