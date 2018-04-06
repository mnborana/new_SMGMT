package com.servletStore.report.admissionReport.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;

import com.dbconnect.DBConnection;

/**
 * Servlet implementation class AdmissionReport
 */

public class AdmissionReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdmissionReport() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
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
		if((request.getParameter("report")!=null) && (request.getParameter("reportOption").equals("handicapStud")))
		{
			try
			{
				//JasperReport jr = (JasperReport)JRLoader.loadObject(new File(path));
				net.sf.jasperreports.engine.JasperReport jasperReport = null;
				JasperDesign jasperDesign = null;
				Map para = new HashMap();
				para.put("trustyName", ""+trustyName+"");
				para.put("schoolName", ""+schoolName+"");
				para.put("sAddress", ""+sAddress+"");
				String path = request.getServletContext().getRealPath("/reports/PhysicalHandicapStud.jrxml");
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
		
		if((request.getParameter("report")!=null) && (request.getParameter("reportOption").equals("minorityStud")))
		{
			try
			{
				String std=request.getParameter("standard");
				//JasperReport jr = (JasperReport)JRLoader.loadObject(new File(path));
				net.sf.jasperreports.engine.JasperReport jasperReport = null;
				JasperDesign jasperDesign = null;
				Map para = new HashMap();
				para.put("trustyName", ""+trustyName+"");
				para.put("schoolName", ""+schoolName+"");
				para.put("sAddress", ""+sAddress+"");
				para.put("standard", ""+std+"");
				para.put("schoolId", ""+schoolId+"");
				String path = request.getServletContext().getRealPath("/reports/MinorityStudentList.jrxml");
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
		response.sendRedirect("/SMGMT/View/report/admissionReport.jsp");
	}

}
