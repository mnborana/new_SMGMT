package com.servletStore.settings.school.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.servletStore.settings.school.model.SchoolDAO;
import com.servletStore.settings.school.model.SchoolImpl;
import com.servletStore.settings.school.model.SchoolPOJO;




public class School extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		
		SchoolPOJO schoolPojo = new SchoolPOJO();
		SchoolDAO schoolDAO = new SchoolImpl();
		
		List<SchoolPOJO> list=new ArrayList<>();
		
		System.out.println("hiiiii");
		if(request.getParameter("SchoolSubmitBtn")!=null)
		{
		
			String schoolNameInEnglish = request.getParameter("school_name").trim();
			String schoolAddress = request.getParameter("school_address").trim();
			String slogan = request.getParameter("slogan").trim();
			String indexNo = request.getParameter("index_no").trim();
			String licenceNo = request.getParameter("licence_no").trim();
			String udise = request.getParameter("udise").trim();
			String schoolCode = request.getParameter("school_code").trim();
			String emailId = request.getParameter("email_id").trim();
			String phoneNo = request.getParameter("phone_no").trim();			
			String board = request.getParameter("board");
			String pUnitCode = request.getParameter("punit_code").trim();
			String center = request.getParameter("center").trim();
			String datetime = request.getParameter("date_time");
			String jubileeYear=request.getParameter("jubilee_year");
			String establishYear=request.getParameter("establish_year");
			String medium=request.getParameter("medium");
			
			String[] selectList=request.getParameterValues("sectionList");
			System.out.println("section list:"+selectList.length);
			String sectionList="";
			
			
			schoolPojo.setName(schoolNameInEnglish);
			schoolPojo.setAddress(schoolAddress);
			schoolPojo.setSlogan(slogan);
			schoolPojo.setIndexno(indexNo);
			schoolPojo.setLicenceno(licenceNo);
			schoolPojo.setUdise(udise);
			schoolPojo.setShoolcode(schoolCode);
			schoolPojo.setEmailid(emailId);
			schoolPojo.setPhoneno(phoneNo);
			schoolPojo.setBoard(board);
			schoolPojo.setPunitcode(pUnitCode);
			schoolPojo.setCenter(center);
			schoolPojo.setDate(datetime);
			schoolPojo.setJubileeYear(jubileeYear);
			schoolPojo.setEstablishYear(establishYear);
			schoolPojo.setMedium(medium);
			schoolPojo.setSectionName(sectionList);
			
			
			schoolDAO.addSchool(schoolPojo);	
			
			for(int i=0;i<selectList.length;i++)
			{
				SchoolPOJO pojo=new SchoolPOJO();
				pojo.setSection_id(Integer.parseInt(selectList[i]));		
				list.add(pojo);
				
			}
			schoolDAO.insertSection(list);
			response.sendRedirect("View/settings/school/addSchool.jsp");			
		}
		
		
		
		if(request.getParameter("schoolid")!=null)
		{			
			String schoolId=request.getParameter("schoolid");
			int id=Integer.parseInt(schoolId);
			
			List list1=schoolDAO.selectSchoolDetails(schoolPojo,id);
			Iterator itr=list1.iterator();
			while(itr.hasNext())
			{
				SchoolPOJO schoolPojo1=(SchoolPOJO)itr.next();	
				
				int id1=((SchoolPOJO)schoolPojo1).getId();
				
				String schoolName=((SchoolPOJO)schoolPojo1).getName();
				
				String address=((SchoolPOJO)schoolPojo1).getAddress();
				
				String slogan=((SchoolPOJO)schoolPojo1).getSlogan();
				
				String indexNo=((SchoolPOJO)schoolPojo1).getIndexno();
				
				String licenceNo=((SchoolPOJO)schoolPojo1).getLicenceno();
				
				String udise=((SchoolPOJO)schoolPojo1).getUdise();
				
				String schoolCode=((SchoolPOJO)schoolPojo1).getShoolcode();
				
				String email=((SchoolPOJO)schoolPojo1).getEmailid();
				
				String phoneNo=((SchoolPOJO)schoolPojo1).getPhoneno();
				
				String board=((SchoolPOJO)schoolPojo1).getBoard();
				
				String punitCode=((SchoolPOJO)schoolPojo1).getPunitcode();
				
				String center=((SchoolPOJO)schoolPojo1).getCenter();
				
				String date=((SchoolPOJO)schoolPojo1).getDate();
				
				String jubileeYear=((SchoolPOJO)schoolPojo1).getJubileeYear();
				
				String establishYear=((SchoolPOJO)schoolPojo1).getEstablishYear();
				
				String medium=((SchoolPOJO)schoolPojo1).getMedium();
				
				out.print(id1+","+schoolName+","+address+","+slogan+","+indexNo+","+licenceNo+","+udise+","+schoolCode+","+email+","+phoneNo+","+board+","+punitCode+","+center+","+date+","+jubileeYear+","+establishYear+","+medium);
			}
		}
		

		if(request.getParameter("updateSchool")!=null)
		{
			int id=Integer.parseInt(request.getParameter("UpdateId"));				
			
			String schoolNameInEnglish = request.getParameter("school_name");
			String schoolAddress = request.getParameter("school_address");
			String slogan = request.getParameter("slogan");
			String indexNo = request.getParameter("index_no");
			String licenceNo = request.getParameter("licence_no");
			String udise = request.getParameter("udise").trim();
			String schoolCode = request.getParameter("school_code");
			String emailId = request.getParameter("email_id");
			String phoneNo = request.getParameter("phone_no");			
			String board = request.getParameter("board");
			String pUnitCode = request.getParameter("punit_code");
			String center = request.getParameter("center");
			String datetime = request.getParameter("date_time");
			String jubileeYear=request.getParameter("jubileeYear");
			String establishYear=request.getParameter("establishYear");
			String medium=request.getParameter("medium");
			
						
			schoolPojo.setId(id);
			schoolPojo.setName(schoolNameInEnglish);
			schoolPojo.setAddress(schoolAddress);
			schoolPojo.setSlogan(slogan);
			schoolPojo.setIndexno(indexNo);
			schoolPojo.setLicenceno(licenceNo);
			schoolPojo.setUdise(udise);
			schoolPojo.setShoolcode(schoolCode);
			schoolPojo.setEmailid(emailId);
			schoolPojo.setPhoneno(phoneNo);
			schoolPojo.setBoard(board);
			schoolPojo.setPunitcode(pUnitCode);
			schoolPojo.setCenter(center);
			schoolPojo.setDate(datetime);
			schoolPojo.setJubileeYear(jubileeYear);
			schoolPojo.setEstablishYear(establishYear);
			schoolPojo.setMedium(medium);
			
			
			
			schoolDAO.updateSchoolDetails(schoolPojo);			
			response.sendRedirect("View/settings/school/addSchool.jsp");		
		}
		
		
		if(request.getParameter("deleteId")!=null)
		{
			String did=request.getParameter("deleteId");
			System.out.println("delete id:"+did);
			int id=Integer.parseInt(did);
			schoolDAO.deleteSchool(id);
			response.sendRedirect("View/settings/school/addSchool.jsp");
		}
		
		
		
					
	}

}
