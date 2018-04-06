package com.servletStore.student.studentReports.controller;

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

import com.dbconnect.DBConnection;
import com.servletStore.student.studentReports.model.studentReportDAO;
import com.servletStore.student.studentReports.model.studentReportImpl;
import com.servletStore.student.studentReports.model.studentReportPOJO;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;

public class LCReportGeneration extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		/*if Lc Status is
		 * 0-default
		 * 1-orignal
		 * 2-duplicate*/
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		studentReportDAO dao=new studentReportImpl();
		DBConnection con=new DBConnection();
		Connection connection=con.getConnection();
		PreparedStatement pstmt=null;
		Object document_id=dao.InsertIntoOutwordRegister();
		String doc_name=dao.getDocumentNameFromRegister(document_id);
		

if(request.getParameter("report_generation")!=null && request.getParameter("lcFormat").equals("lcWithname"))
		{
	
			//outword_no
			String outward="";
			String outward_set=request.getParameter("hidden1");			
			//System.out.println("Outward Set : "+outward_set);
		
			//System.out.println("Outward No : "+outward);
			String school_id=request.getParameter("school_id");
			
			String year=request.getParameter("academicYearId");
			int std_id=Integer.parseInt(request.getParameter("stddiv"));
			String student_id=request.getParameter("sname");
			System.out.println("std id  "+std_id);
			Object school_name="",trusty="",address="";
			List<Object> list=dao.getstudDatailsByStudId(student_id);
			List<Object> school_list=dao.getSchoolDetails(school_id);
			Iterator<Object> itr1=school_list.iterator();
			while(itr1.hasNext())
			{
				trusty=itr1.next();
				school_name=itr1.next();
				address=itr1.next();
						
			}
			Iterator<Object> itr=list.iterator();
			Object student_details="";
			while(itr.hasNext())
			{
				student_details=itr.next();
			}
			String s=student_details.toString();
		String s1[]=s.split(",");
		String gr_no=" ",mother_name=" ",caste_name=" ",ad_date="",birth_place="",dob="",nationality="",previous_school_name="",mothertongue="";
		String student_name="";
		gr_no=s1[0];
		if(s1[1].equals(""))
		{
			mother_name="-";
		}
		else
		{
		mother_name=s1[1];
		}
		
		if(s1[2].equals(""))
		{
			caste_name="-";
		}
		else
		{
			caste_name=s1[2];
		}
		if(s1[3].equals(""))
		{
			ad_date="-";
		}
		else
		{
			ad_date=s1[3];
		}
		
		if(s1[4].equals(""))
		{
			birth_place="-";
		}
		else
		{
			birth_place=s1[4];
		}
		if(s1[5].equals(""))
		{
			dob="-";
		}
		else
		{
			dob=s1[5];
		}
		if(s1[6].equals(""))
		{
			nationality="-";
		}
		else
		{
			nationality=s1[6];
		}
		if(s1[7].equals(""))
		{
			previous_school_name="-";
		}
		else
		{
			previous_school_name=s1[7];
		}
		
		if(s1[8].equals(""))
		{
			mothertongue="-";
		}
		else
		{
			mothertongue=s1[8];
		}
		if(s1[9].equals(""))
		{
			student_name="-";
		}
		else
		{
			student_name=s1[9];
		}
		//student_name=s1[9];
	//	System.out.println("student name "+student_name);
		String lc_date=request.getParameter("admissionDate");
		String liveing_date=request.getParameter("lDate");
		String leveing_standard=request.getParameter("leaving_std");
		String leaving_reason=request.getParameter("l_reason");
		String study_status=request.getParameter("study_status");
		String start_from_month=request.getParameter("sdate");
		String start_from_year=request.getParameter("syear");
		String behaviour=request.getParameter("Behaviour");
		String remark=request.getParameter("remark");
		//System.out.println("student id "+student_id+"\n living date "+leveing_standard+"mother lang "+mothertongue);
		String father_name[]=student_name.split(" ");
		String fatherName=father_name[1];
		String lc_dateformat[]=lc_date.split("-");
		String dd=lc_dateformat[0];
		String mm=lc_dateformat[1];
		String yyyy=lc_dateformat[2];
		String lc_dateNew=yyyy+'/'+mm+'/'+dd;
		System.out.println("date in formated   "+lc_dateNew);
		//System.out.println("father name "+fatherName);
		//System.out.println("caste name "+caste_name);
		List<Object> list3=dao.getOtherSchoolDetails(school_id);
		Iterator<Object> itr3=list3.iterator();
		Object udise="",index_no="",medium="",board="",email_id="",licence_no="";
		while(itr3.hasNext())
		{
			udise=itr3.next();
			index_no=itr3.next();
			medium=itr3.next();
			board=itr3.next();
			email_id=itr3.next();
			licence_no=itr3.next();
			//email_id=itr3.next();
		}
		//int outword_id = 0;
		if(outward_set.equals("true"))
		{
			outward=request.getParameter("outword_no");
			int outword_id=dao.InsertIntoOutwordRegisterMaster(outward, document_id, doc_name, lc_dateNew, student_name,student_id);
			dao.insertIntoLCMaster(outword_id, gr_no, std_id, student_id, liveing_date, lc_dateNew, study_status, behaviour, leaving_reason,remark);

		}
		else
		{
			dao.insertIntoLCMaster1(gr_no, std_id, student_id, liveing_date, lc_dateNew, study_status, behaviour, leaving_reason,remark);

		}
		//System.out.println("aaaaaaaaa "+udise);
		//int outword_id=dao.InsertIntoOutwordRegisterMaster(outward, document_id, doc_name, lc_date, student_name,student_id);
		//System.out.println("outword_id "+outword_id);
		dao.UpdateLcStatus(student_id);
		String s11="select student_official_details.lc_status from student_official_details,student_details where student_details.id=student_official_details.student_id and student_details.id='"+student_id+"'";
		int lc_status=0;
		String lc_statusprint="";
		//JasperReport jr = (JasperReport)JRLoader.loadObject(new File(path));
		try {
			pstmt=connection.prepareStatement(s11);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				lc_status=rs.getInt(1);
			}
			if(lc_status==0 || lc_status==1)
			{
				lc_statusprint=" ";
			}
			else
			{
				lc_statusprint="Duplicate";
			}
			System.out.println("lc status "+lc_status);
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try
		{
			
			net.sf.jasperreports.engine.JasperReport jasperReport = null;
			JasperDesign jasperDesign = null;
			Map<String,Object> para1 = new HashMap();
			para1.put("lc_status",""+lc_statusprint+"");
			para1.put("udise",""+udise+"");
			para1.put("index_no",""+index_no+"");
			para1.put("medium",""+medium+"");
			para1.put("board",""+board+"");
			para1.put("email_id",""+email_id+"");
			para1.put("licence_no",""+licence_no+"");

			para1.put("trusty",""+trusty+"");
			para1.put("school_name",""+school_name+"");
			para1.put("address",""+address+"");
			para1.put("gr_no",""+gr_no+"");
			para1.put("studentName",""+student_name+"");
			para1.put("fatherName",""+fatherName+"");
			para1.put("mother_name",""+mother_name+"");
			para1.put("mothertongue",""+mothertongue+"");
			para1.put("nationality",""+nationality+"");
			para1.put("caste_name",""+caste_name+"");
			para1.put("birth_place",""+birth_place+"");
			para1.put("previous_school_name",""+previous_school_name+"");
			para1.put("ad_date",""+ad_date+"");
			para1.put("dob",""+dob+"");
			para1.put("leveing_standard",""+leveing_standard+"");
			para1.put("study_status",""+study_status+"");
			para1.put("behaviour",""+behaviour+"");
			para1.put("leaving_reason",""+leaving_reason+"");
			para1.put("liveing_date",""+liveing_date+"");
			para1.put("remark",""+remark+"");
			para1.put("lc_date",""+lc_date+"");


			String path = request.getServletContext().getRealPath("/reports/");
			//JasperReport jr = (JasperReport)JRLoader.loadObject(new File(path +"/allCategoryWise1.jasper"));
			jasperDesign = JRXmlLoader.load(path + "/LCFormat1.jrxml");
			jasperReport = JasperCompileManager.compileReport(jasperDesign);
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, para1, connection);
	        JasperViewer.viewReport(jasperPrint, false);
	        
	    	response.sendRedirect("/SMGMT/View/report/leavingCertificate.jsp");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
			
		}
		if(request.getParameter("std")!=null)
		{
			
			String academic_year=request.getParameter("academic_year");
			String stdid=request.getParameter("std");
			System.out.println("!!!!!! std "+stdid+"academic year "+academic_year);
			
			List<String>list=dao.getStudentName(stdid,academic_year);
			System.out.println(list.size());
			Iterator<String> itr=list.iterator();
					while(itr.hasNext())
					{
						out.println(itr.next()+"~");
					}
			
		}
		
		if(request.getParameter("student_id")!=null)
			{
			//System.out.println("in student");
				String student_id=request.getParameter("student_id");
				//System.out.println("stud id "+student_id);
				List<Object> stud_list=dao.getstudDatailsByStudId(student_id);
				Iterator<Object> itr=stud_list.iterator();
				while(itr.hasNext())
				{
					out.print(itr.next()+"~");
				}
				
			
			}
	
		
		
	}

}
