package com.servletStore.report.generalRegister.controller;

import java.io.IOException;

import java.sql.Connection;
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
import com.servletStore.report.generalRegister.model.GeneralRegisterDAO;
import com.servletStore.report.generalRegister.model.GeneralRegisterIMPL;
import com.servletStore.report.generalRegister.model.GeneralRegisterPOJO;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.design.JasperDesign;

import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;

@WebServlet("/GeneralRegister")
public class GeneralRegister extends HttpServlet {
	DBConnection conn=new DBConnection();
	Connection connection=conn.getConnection();
	GeneralRegisterDAO dao=new GeneralRegisterIMPL();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String submit=request.getParameter("submitBTN");
		if(submit!=null)
		{
		String section=request.getParameter("selectSection");
		int sectionId=Integer.parseInt(section);		
		String sid=request.getParameter("schoolId");
		String academicYear=request.getParameter("academicYear");
		int schoolId=Integer.parseInt(sid);
		
		GeneralRegisterPOJO pojo=dao.selectSection(sid, section);
		String sectionName=pojo.getSection_name();
		
		String trustyName="";
		String schoolName="";
		String address="";
		List<GeneralRegisterPOJO> list=dao.getSchoolDetails(pojo, sid);
		Iterator<GeneralRegisterPOJO> itr=list.iterator();
		while(itr.hasNext())
		{
			GeneralRegisterPOJO pojo1=(GeneralRegisterPOJO)itr.next();
			trustyName=((GeneralRegisterPOJO)pojo1).getTrustyName();
			schoolName=((GeneralRegisterPOJO)pojo1).getSchoolName();
			address=((GeneralRegisterPOJO)pojo1).getAddress();
		}
			
		String check=request.getParameter("checkId");
		
		if(check.equals("1"))
		{
			try {
				net.sf.jasperreports.engine.JasperReport jasperReport = null;
				JasperDesign jasperDesign = null;
				Map parameters = new HashMap();
				parameters.put("schId", schoolId);
				parameters.put("section",sectionId);
				parameters.put("sectionName", ""+sectionName+"");
				parameters.put("trustyName",""+trustyName+"");
				parameters.put("schoolName",""+schoolName+"");
				parameters.put("address", ""+address+"");
				parameters.put("academicYear",""+academicYear+"");
				
				String path = getServletContext().getRealPath("/WEB-INF/");
				jasperDesign = JRXmlLoader.load(path + "/jasperReport/GeneralRegister.jrxml");
				jasperReport = JasperCompileManager.compileReport(jasperDesign);
				JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, connection);
		        JasperViewer.viewReport(jasperPrint, false);
				
			} catch (JRException e) {
				e.printStackTrace();
			}
		}	
		else
		{
			String grNoWise=request.getParameter("GRNO");
			int checkgrNum=Integer.parseInt(grNoWise);
					
			try {
				net.sf.jasperreports.engine.JasperReport jasperReport = null;
				JasperDesign jasperDesign = null;
				Map parameter = new HashMap();
				
				parameter.put("schId", schoolId);
				parameter.put("section",sectionId);
				parameter.put("grnoWise",checkgrNum);
				parameter.put("sectionName", ""+sectionName+"");
				parameter.put("trustyName",""+trustyName+"");
				parameter.put("schoolName",""+schoolName+"");
				parameter.put("address", ""+address+"");
				parameter.put("academicYear", ""+academicYear+"");
				
				String path = getServletContext().getRealPath("/WEB-INF/");
				jasperDesign = JRXmlLoader.load(path + "/jasperReport/GeneralRegisterGRWise.jrxml");
				jasperReport = JasperCompileManager.compileReport(jasperDesign);
				JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameter, connection);
		        JasperViewer.viewReport(jasperPrint, false);
				
			} catch (JRException e) {
				e.printStackTrace();
			}
		}
	}	
		response.sendRedirect("View/report/generalRegister.jsp");		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
