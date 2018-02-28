package com.servletStore.report.icardReport.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbconnect.DBConnection;
import com.servletStore.fees.feescollection.model.FeesCollectionDAO;
import com.servletStore.fees.feescollection.model.FeesCollectionImpl;
import com.servletStore.report.icardReport.model.IcardGenerateDAO;
import com.servletStore.report.icardReport.model.IcardGenerateImpl;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;

/**
 * Servlet implementation class Icard
 */
//@WebServlet("/Icard")
public class Icard extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			PrintWriter out = response.getWriter();
			DBConnection connection= new DBConnection();
			Connection con=connection.getConnection();
			String standard_id = request.getParameter("standard_id");
			String student_id = request.getParameter("student_id");
			IcardGenerateDAO icardDAO=new IcardGenerateImpl();
			HttpSession session = request.getSession();
			String schoolId=request.getParameter("schoolId");
			String academicYr=request.getParameter("academicYr");
			String trustyName="", schoolName="", sAddress="";
			String query="SELECT trustee_info.edu_society_name,school_master.name,school_master.address FROM school_master,trustee_info WHERE school_master.id='"+schoolId+"'";
			try {
				PreparedStatement ps=con.prepareStatement(query);
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
		
		  //ajax for searching standard wise student 
			if(standard_id!=null){
				
				List studentList = icardDAO.getStudentInfo(standard_id);
				Iterator iterator = studentList.iterator();
				while (iterator.hasNext()) {
					out.print(iterator.next()+",");
				}
				
			}
			if(request.getParameter("icard")!=null) 
			{
				try
				{
					String standard=request.getParameter("standard_Id");
					String stdId=request.getParameter("student_Id");
					String rd=request.getParameter("userType");
					String checkStudent=request.getParameter("allStudentCheck");
					System.out.println("Check*****"+checkStudent);
					if(rd.equals("Type1") || ((rd.equals("Type1")) && (checkStudent.equals("on"))))
					{
						
						net.sf.jasperreports.engine.JasperReport jasperReport = null;
						JasperDesign jasperDesign = null;
						Map para = new HashMap();
						
						
						para.put("trustyName", ""+trustyName+"");
						para.put("schoolName", ""+schoolName+"");
						para.put("sAddress", ""+sAddress+"");
						para.put("standard", ""+standard+"");
						para.put("stud", ""+stdId+"");
						para.put("academicYr",""+academicYr+"");
						
						String path = request.getServletContext().getRealPath("/reports/IcardAllStudent.jrxml");
						jasperDesign = JRXmlLoader.load(path);
						jasperReport = JasperCompileManager.compileReport(jasperDesign);
						JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, para, con);
				        JasperViewer.viewReport(jasperPrint, false);
					}
					if(rd.equals("Type2") || ((rd.equals("Type2")) && (checkStudent.equals("on"))))
					{
						net.sf.jasperreports.engine.JasperReport jasperReport = null;
						JasperDesign jasperDesign = null;
						Map para = new HashMap();
						
						para.put("trustyName", ""+trustyName+"");
						para.put("schoolName", ""+schoolName+"");
						para.put("sAddress", ""+sAddress+"");
						para.put("standard", ""+standard+"");
						para.put("stud", ""+stdId+"");
						para.put("academicYr",""+academicYr+"");
						
						String path = request.getServletContext().getRealPath("/reports/IcardBothSide.jrxml");
						jasperDesign = JRXmlLoader.load(path);
						jasperReport = JasperCompileManager.compileReport(jasperDesign);
						JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, para, con);
				        JasperViewer.viewReport(jasperPrint, false);
					}
				}
				catch (JRException e)
				{
					e.printStackTrace();
				}
				response.sendRedirect("/SMGMT/View/report/icardGenerate.jsp");
			
			}
			
	}

}
