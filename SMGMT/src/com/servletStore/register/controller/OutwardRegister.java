package com.servletStore.register.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servletStore.register.model.OutwardRegisterDAO;
import com.servletStore.register.model.OutwardRegisterImpl;
import com.servletStore.register.model.OutwardRegisterPojo;


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
		 pojo.setSubject(subject);
		 pojo.setDescription(description);
		 pojo.setOutwardDoc(selectDocu);
		 
		 outwarddao.insertOutwardRegister(pojo);
		 response.sendRedirect("View/register/outwardRegister.jsp");
	 }
	 
	 if(request.getParameter("OutwardReceiverBtn")!=null)
	 {
		 String receiverName=request.getParameter("addReceiverName");
		 String receiverAddress=request.getParameter("outwardAddress");
		 session.setAttribute("outwardAddress",receiverAddress); 
		 
		 pojo.setReceiverName(receiverName);
		 pojo.setAddress(receiverAddress);
		 
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
			 String upsubject=((OutwardRegisterPojo)pojo8).getSubject();
			 String updescription=((OutwardRegisterPojo)pojo8).getDescription();
			 String updatedocument=((OutwardRegisterPojo)pojo8).getOutwardDoc();
			 
			 out.print(uid+","+update+","+upreceiver+","+upaddress+","+upsubject+","+updescription+","+updatedocument);
		 }
	 }
	 
	 if(request.getParameter("outwardDetailsBtn")!=null)
	 {
		 String updateId=request.getParameter("updatedId");
		 int id=Integer.parseInt(updateId);
		 
		 String upDate=request.getParameter("updatedDate");
		 String updateReceiverName=request.getParameter("updatedReceiverName");
		 String updateAddress=request.getParameter("updatedAddress");
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
	 
	 
	 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
