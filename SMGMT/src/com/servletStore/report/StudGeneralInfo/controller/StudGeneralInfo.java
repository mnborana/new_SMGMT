package com.servletStore.report.StudGeneralInfo.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbconnect.DBConnection;
import com.servletStore.report.StudGeneralInfo.model.StudGeneralInfoDAO;
import com.servletStore.report.StudGeneralInfo.model.StudGeneralInfoIMPL;
import com.servletStore.report.StudGeneralInfo.model.StudGeneralInfoPOJO;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;


public class StudGeneralInfo extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		StudGeneralInfoDAO dao=new StudGeneralInfoIMPL();
		
		String submit=request.getParameter("submitBTN");
		if(submit!=null)
		{
			String standardId=request.getParameter("selectstdDiv");
			
			String schoolId=request.getParameter("schoolId");
			System.out.println("school idis:"+schoolId);
			System.out.println("school id in servlet:"+schoolId);
			String trustyName="",schoolName="",schoolAddress="";
			List<StudGeneralInfoPOJO> list11 =dao.selectSchoolDetails(schoolId);
			Iterator<StudGeneralInfoPOJO> itr11=list11.iterator();
			while(itr11.hasNext())
			{
				StudGeneralInfoPOJO pojo=(StudGeneralInfoPOJO)itr11.next();
				 trustyName=((StudGeneralInfoPOJO)pojo).getTrustyName();
				 schoolName=((StudGeneralInfoPOJO)pojo).getSchoolName();
				 schoolAddress=((StudGeneralInfoPOJO)pojo).getSchoolAddress();
			}
			
			try{
				DBConnection conn=new DBConnection();
				Connection connection=conn.getConnection();
				net.sf.jasperreports.engine.JasperReport jasperReport = null;
				JasperDesign jasperDesign = null;
				Map parameters = new HashMap();
				parameters.put("standard", standardId);
				parameters.put("trustyName", trustyName);
				parameters.put("schoolName", schoolName);
				parameters.put("schoolAddress", schoolAddress);
				
				String path = getServletContext().getRealPath("/WEB-INF/");
				jasperDesign = JRXmlLoader.load(path + "/jasperReport/StudentGeneralInfo.jrxml");
				jasperReport = JasperCompileManager.compileReport(jasperDesign);
				JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, connection);
		        JasperViewer.viewReport(jasperPrint, false);
				
			} catch (JRException e) {
				e.printStackTrace();
			}
		}
		response.sendRedirect("View/report/StudentGeneralInfo.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
