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
import com.servletStore.register.model.InwardRegisterPojo;
import com.servletStore.register.model.OutwardRegisterDAO;
import com.servletStore.register.model.OutwardRegisterImpl;
import com.servletStore.register.model.OutwardRegisterPojo;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;


public class OutwardRegister extends HttpServlet {
	
	
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 response.setContentType("text/html");
	 PrintWriter out=response.getWriter();
	 
	 OutwardRegisterDAO outwarddao=new OutwardRegisterImpl();
	 HttpSession session=request.getSession(); 
	 OutwardRegisterPojo pojo=new OutwardRegisterPojo();
	 
	 if(request.getParameter("OutwardRegister")!=null)
	 {
		 String outwardNo=request.getParameter("outwardNo");
		 int outNo=Integer.parseInt(outwardNo);
		 String outwardDate=request.getParameter("reqdate");
		 String receiverName=request.getParameter("receiverName");		 
		 String address=request.getParameter("outwardAddress");	
		 String mobileNo=request.getParameter("mobileNumber");
		 String subject=request.getParameter("subjectName");
		 String description=request.getParameter("Description");
		 String selectRegister=request.getParameter("selRegister");
		 int id=Integer.parseInt(selectRegister);
		 
		 OutwardRegisterPojo pojo2=outwarddao.setDocumentInServlet(id);
		 String selectDocu=pojo2.getOutwardDoc();
		
		 pojo.setOutwardNo(outNo);
		 pojo.setRequireddate(outwardDate);
		 pojo.setReceiverName(receiverName);
		 pojo.setAddress(address);
		 pojo.setMobileNo(mobileNo);
		 pojo.setSubject(subject);
		 pojo.setDescription(description);
		 pojo.setOutwardDoc(selectDocu);
		 
		 outwarddao.insertOutwardRegister(pojo);
		 response.sendRedirect("View/register/outwardRegister.jsp");
	 }
	 
	 if(request.getParameter("receiverId")!=null)
	 {
		 String receiverName=request.getParameter("receiverId");
		 System.out.println("receiver Id is:"+receiverName);
		 List list=outwarddao.getReceiverDetails(receiverName);
		 Iterator itr=list.iterator();
		 while(itr.hasNext())
		 {
			 out.print(((String) itr.next())+",");
		 }
		 
	 }
	 
	 if(request.getParameter("searchName")!=null)
	 {
		 String input=request.getParameter("searchName");
		 System.out.println("search Name is:"+input);
		 List list=outwarddao.searchName(input);
		 Iterator itr=list.iterator();
		 while(itr.hasNext())
		 {
			 out.print(itr.next()+","+itr.next()+",");
		 }
		 
	 }
	 
	 if(request.getParameter("OutwardReceiverBtn")!=null)
	 {
		 String receiverName=request.getParameter("addReceiverName");
		 String receiverAddress=request.getParameter("outwardAddress");		
		 String mobileNo=request.getParameter("mobileNumber");
		 
		 HashMap<String, String> userDetails = new HashMap<String, String>();
		  userDetails.put("receiverName", receiverName);
		  userDetails.put("receiverAddress", receiverAddress);
		  userDetails.put("mobileNo", mobileNo);
		  
		  session.setAttribute("user", userDetails);
		 
		 pojo.setReceiverName(receiverName);
		 pojo.setAddress(receiverAddress);
		 pojo.setMobileNo(mobileNo);
		
		 outwarddao.addReciverName(pojo);
		 response.sendRedirect("View/register/outwardRegister.jsp");
	 }
	 
	 if(request.getParameter("outwardId")!=null)
	 {
		 String updateId=request.getParameter("outwardId");
		 int upid=Integer.parseInt(updateId);
		 List<OutwardRegisterPojo> list8=outwarddao.setOutwardDetails(upid);
		 Iterator<OutwardRegisterPojo> itr8=list8.iterator();
		 while(itr8.hasNext())
		 {
			 OutwardRegisterPojo pojo8=(OutwardRegisterPojo)itr8.next();
			 int uid=((OutwardRegisterPojo)pojo8).getId();
			 
			 String update=((OutwardRegisterPojo)pojo8).getRequireddate();
			 String upreceiver=((OutwardRegisterPojo)pojo8).getReceiverName();
			 String upaddress=((OutwardRegisterPojo)pojo8).getAddress();
			 String mobileNo=((OutwardRegisterPojo)pojo8).getMobileNo();
			 String upsubject=((OutwardRegisterPojo)pojo8).getSubject();			
			 String updescription=((OutwardRegisterPojo)pojo8).getDescription();
			 String updatedocument=((OutwardRegisterPojo)pojo8).getOutwardDoc();
			 
			 out.print(uid+","+update+","+upreceiver+","+upaddress+","+mobileNo+","+upsubject+","+updescription+","+updatedocument);
		 }
	 }
	 
	 if(request.getParameter("outwardDetailsBtn")!=null)
	 {
		 String updateId=request.getParameter("updatedId");
		 int id=Integer.parseInt(updateId);
		 
		 String upDate=request.getParameter("updatedDate");
		 String updateReceiverName=request.getParameter("updatedReceiverName");
		 String updateAddress=request.getParameter("updatedAddress");
		 String upMobileNo=request.getParameter("updateMobileNumber");
		 String updateSubject=request.getParameter("updatedSubject");
		 String updateDscription=request.getParameter("updatedDescription");
		 String updateDocumentId=request.getParameter("updateRegister");
		 int id1=Integer.parseInt(updateDocumentId);
		
		 OutwardRegisterDAO outwardDao=new OutwardRegisterImpl();
		 OutwardRegisterPojo pojo1=outwardDao.selectDocumentName(id1);
		 String updateDocument=pojo1.getOutwardDoc();
		
		 OutwardRegisterPojo pojo9= new OutwardRegisterPojo();
		 pojo9.setRequireddate(upDate);
		 pojo9.setReceiverName(updateReceiverName);
		 pojo9.setAddress(updateAddress);
		 pojo9.setMobileNo(upMobileNo);
		 pojo9.setSubject(updateSubject);
		 pojo9.setDescription(updateDscription);
		 pojo9.setOutwardDoc(updateDocument);
		 
		 outwarddao.updateOutwardReg(pojo9, id);
		 response.sendRedirect("View/register/outwardRegister.jsp");
		 
	 }
	 
	 
	 if(request.getParameter("deleteId")!=null)
	 {
		 String deleteId=request.getParameter("deleteId");
		 int id=Integer.parseInt(deleteId);
		 outwarddao.deleteOutwardReg(id);
		 response.sendRedirect("View/register/outwardRegister.jsp");		 
	 }
	 
	 String submitprint=request.getParameter("OutwardReport");
		
		if(submitprint!=null)
		{
			String schoolId=request.getParameter("schoolId");
			System.out.println("school idis:"+schoolId);
			System.out.println("school id in servlet:"+schoolId);
			String trustyName="",schoolName="",schoolAddress="";
			List<OutwardRegisterPojo> list11 =outwarddao.selectSchoolDetails(schoolId);
			Iterator<OutwardRegisterPojo> itr11=list11.iterator();
			while(itr11.hasNext())
			{
				 OutwardRegisterPojo pojo1=(OutwardRegisterPojo)itr11.next();
				 trustyName=((OutwardRegisterPojo)pojo1).getTrustyName();
				 schoolName=((OutwardRegisterPojo)pojo1).getSchoolName();
				 schoolAddress=((OutwardRegisterPojo)pojo1).getSchoolAddress();
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
			jasperDesign = JRXmlLoader.load(path + "/jasperReport/OutwardRegisterReport.jrxml");
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
