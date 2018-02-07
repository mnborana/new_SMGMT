package com.servletStore.register.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import javax.servlet.http.HttpSession;

import com.dbconnect.DBConnection;
import com.servletStore.register.model.InwardRegisterDAO;
import com.servletStore.register.model.InwardRegisterImpl;
import com.servletStore.register.model.InwardRegisterPojo;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;


public class InwardRegister extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		InwardRegisterDAO impl=new InwardRegisterImpl();
		
		HttpSession session=request.getSession();  
        
		
		if(request.getParameter("SenderName")!=null)
		{
			String senderName=request.getParameter("addSenderName");
			String address=request.getParameter("addAddress");
			String mobileNo=request.getParameter("mobileNumber");	
			
			 HashMap<String, String> userDetails = new HashMap<String, String>();
			  userDetails.put("senderName", senderName);
			  userDetails.put("address", address);
			  userDetails.put("mobileNo", mobileNo);
			  
			  //session.setAttribute("user", userDetails);
						
			InwardRegisterPojo pojo=new InwardRegisterPojo();
			pojo.setSenderName(senderName);
			pojo.setAddress(address);
			pojo.setMobileNo(mobileNo);
			
			impl.addNewSender(pojo);
		
			response.sendRedirect("View/register/inwardRegister.jsp");
		}
				
		if(request.getParameter("InwardRegister")!=null)
		{
			//System.out.println("hiiiii");
			String inwardNo=request.getParameter("inwardNo");
			int inwardno=Integer.parseInt(inwardNo);
			
			String addDate=request.getParameter("requireddate");
			String senderName=request.getParameter("senderName");
			String subject=request.getParameter("subject");
			String address=request.getParameter("address");
			String mobileNo=request.getParameter("mobileNum");
			String description=request.getParameter("description");
			String documentName=request.getParameter("selRegister");
			System.out.println("document id:"+documentName);
			int id=Integer.parseInt(documentName);
			
			/*InwardRegisterPojo pojo1=impl.setdocument(id);
			String document=pojo1.getDocmentName();*/
			
			//System.out.println("document:"+document);
			
			InwardRegisterPojo pojo2=new InwardRegisterPojo();
			pojo2.setInwardNo(inwardno);
			pojo2.setDate(addDate);
			pojo2.setSenderName(senderName);
			pojo2.setSubject(subject);
			pojo2.setAddress(address);
			pojo2.setMobileNo(mobileNo);
			pojo2.setDescription(description);
			pojo2.setDocumentId(id);
			
			int i=impl.inwardRegister(pojo2);
			if(i>0)
			{
				//session.setAttribute("status","Inserted response has recorded ");
			}			
			response.sendRedirect("View/register/inwardRegister.jsp");
		}
		
		if(request.getParameter("senderId")!=null)
		{
			String senderName=request.getParameter("senderId");
			List list=impl.selectSenderName(senderName);
			Iterator itr1=list.iterator();
			while(itr1.hasNext())
			{
				out.print((String) itr1.next()+",");
			}
		}
		
		
		if(request.getParameter("searchName")!=null)
		{
			String input=request.getParameter("searchName");
			List list=impl.searchName(input);
			Iterator itr2=list.iterator();
			while(itr2.hasNext())
			{
				out.print(itr2.next()+","+itr2.next());
			}
		}
		
		if(request.getParameter("inwardId")!=null)
		{
			String inwardId=request.getParameter("inwardId");
			int id=Integer.parseInt(inwardId);
			System.out.println("id is:"+id);
			List<InwardRegisterPojo> list=impl.setInwardDetails(id);
			Iterator< InwardRegisterPojo> itr=list.iterator();
			while(itr.hasNext())
			{
				InwardRegisterPojo pojo=(InwardRegisterPojo)itr.next();
				int id1=((InwardRegisterPojo)pojo).getId();
				String reqdate=((InwardRegisterPojo)pojo).getDate();
				String senderName=((InwardRegisterPojo)pojo).getSenderName();
				String address=((InwardRegisterPojo)pojo).getAddress();
				String mobileNo=((InwardRegisterPojo)pojo).getMobileNo();
				String subject=((InwardRegisterPojo)pojo).getSubject();
				String description=((InwardRegisterPojo)pojo).getDescription();
				int documentName=((InwardRegisterPojo)pojo).getDocumentId();
				out.print(id1+","+reqdate+","+senderName+","+address+","+mobileNo+","+subject+","+description+","+documentName);
			}
		}
		
		
		if(request.getParameter("InwardDetailsBtn")!=null)
		{
			InwardRegisterPojo pojo3=new InwardRegisterPojo();
			
			String updateId=request.getParameter("updateId");
			int inwardId=Integer.parseInt(updateId);
			
			String reqdate=request.getParameter("update");
			String updateSenderName=request.getParameter("upsenderName");
			String updateAddress=request.getParameter("upaddress");
			String updateMobileNum=request.getParameter("updateMobileNum");			
			String updateSubject=request.getParameter("upsubject");
			String updateDescription=request.getParameter("updateDescription");
			
			String updateDocumentId=request.getParameter("updateDocumentName");
			int id=Integer.parseInt(updateDocumentId);
			/*InwardRegisterPojo pojo=impl.setDocumentName(id);
			String documentName=pojo.getDocmentName();		
			*/
			System.out.println(reqdate+","+updateSenderName+","+updateAddress+","+updateMobileNum+","+updateSubject+","+updateDescription+","+id);
			
			pojo3.setDate(reqdate);
			pojo3.setSenderName(updateSenderName);
			pojo3.setAddress(updateAddress);
			pojo3.setMobileNo(updateMobileNum);
			pojo3.setSubject(updateSubject);
			pojo3.setDescription(updateDescription);
			pojo3.setDocumentId(id);
			
			impl.updateInwardRegister(pojo3, inwardId);
			response.sendRedirect("View/register/inwardRegister.jsp");
		}
		
		
		if(request.getParameter("deleteId")!=null)
		{
			String deleteId=request.getParameter("deleteId");
			int id=Integer.parseInt(deleteId);
			impl.deleteInwardRegister(id);
			response.sendRedirect("View/register/inwardRegister.jsp");
		}
		
		if(request.getParameter("createBtn")!=null)
		{
			String fromDate=request.getParameter("fromDate");
			String toDate=request.getParameter("toDate");
			
			List<InwardRegisterPojo> list= impl.selectInwardDetails(fromDate, toDate);
			Iterator<InwardRegisterPojo> itr=list.iterator();
			while(itr.hasNext())
			{
				InwardRegisterPojo pojo=(InwardRegisterPojo)itr.next();
				int inward=((InwardRegisterPojo)pojo).getInwardNo();
				String date=((InwardRegisterPojo)pojo).getDate();
				String sender=((InwardRegisterPojo)pojo).getSenderName();
				String address=((InwardRegisterPojo)pojo).getAddress();
				String subject=((InwardRegisterPojo)pojo).getSubject();
				String description=((InwardRegisterPojo)pojo).getDescription();
				
				out.print(inward+","+date+","+sender+","+address+","+subject+","+description+",");
			}
						
		}
		
		String submitprint=request.getParameter("InwardReport");
		
		if(submitprint!=null)
		{
			String schoolId=request.getParameter("schoolId");
			System.out.println("school idis:"+schoolId);
			System.out.println("school id in servlet:"+schoolId);
			String trustyName="",schoolName="",schoolAddress="";
			List<InwardRegisterPojo> list11 =impl.selectSchoolDetails(schoolId);
			Iterator<InwardRegisterPojo> itr11=list11.iterator();
			while(itr11.hasNext())
			{
				InwardRegisterPojo pojo=(InwardRegisterPojo)itr11.next();
				 trustyName=((InwardRegisterPojo)pojo).getTrustyName();
				 schoolName=((InwardRegisterPojo)pojo).getSchoolName();
				 schoolAddress=((InwardRegisterPojo)pojo).getSchoolAddress();
			}
			
			
			String getFromToDate[]=new String[100];
			String[] getDate=request.getParameter("getFromToDate").split("-");
			String[] fromDate=getDate[0].split("/");
			String fDate=fromDate[2].trim()+"-"+fromDate[0]+"-"+fromDate[1];
			String[] toDate=getDate[1].split("/");
			String tDate=toDate[2]+"-"+toDate[0].trim()+"-"+toDate[1];
			System.out.println("1:"+fDate+"\n2:"+tDate);
			
			try{
			DBConnection conn=new DBConnection();
			Connection connection=conn.getConnection();
			net.sf.jasperreports.engine.JasperReport jasperReport = null;
			JasperDesign jasperDesign = null;
			Map parameters = new HashMap();
			parameters.put("fDate", ""+fDate+"");
			parameters.put("tDate", ""+tDate+"");
			parameters.put("trustyName", trustyName);
			parameters.put("schoolName", schoolName);
			parameters.put("schoolAddress", schoolAddress);
			
			System.out.println(parameters.get("fDate")+" "+parameters.get("tDate")+" "+parameters.get("trustyName")+" "+parameters.get("schoolName")+" "+parameters.get("schoolAddress"));
			String path = getServletContext().getRealPath("/WEB-INF/");
			jasperDesign = JRXmlLoader.load(path + "/jasperReport/InwardRegisterReport.jrxml");
			jasperReport = JasperCompileManager.compileReport(jasperDesign);
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, connection);
	        JasperViewer.viewReport(jasperPrint, false);
			
		} catch (JRException e) {
			e.printStackTrace();
		}
			
			response.sendRedirect("View/register/Report/InwardRegister.jsp");
			
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
