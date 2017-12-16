package com.servletStore.settings.document.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servletStore.settings.document.model.AddDocumentDAO;
import com.servletStore.settings.document.model.AddDocumentImpl;
import com.servletStore.settings.document.model.AddDocumentPojo;


public class AddDocument extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		response.setContentType("html/text");
		PrintWriter out=response.getWriter();
		AddDocumentDAO dao=new AddDocumentImpl();
		AddDocumentPojo pojo=new AddDocumentPojo();
		
		if(request.getParameter("documentNameBtn")!=null)
		{
			
			String registerName=request.getParameter("addDocument");
			System.out.println("doc:"+registerName);
			pojo.setRegisterName(registerName);
			dao.addDocument(pojo);
			response.sendRedirect("View/settings/documentName/addDocument.jsp");
		}
		
		
		if(request.getParameter("documentId")!=null)
		{
			String docId=request.getParameter("documentId");
			int documentId=Integer.parseInt(docId);
			List<AddDocumentPojo> list1=dao.setDocumentName(documentId);
			Iterator<AddDocumentPojo> itr=list1.iterator();
			while(itr.hasNext())
			{
				AddDocumentPojo pojo1=(AddDocumentPojo)itr.next();
				int id=((AddDocumentPojo)pojo1).getId();
				String documentName=((AddDocumentPojo)pojo1).getRegisterName();
				out.print(id+","+documentName);
			}
		}
		
		if(request.getParameter("updateDocument")!=null)
		{
			String updateId=request.getParameter("UpdateId");
			int id=Integer.parseInt(updateId);
			String registerName=request.getParameter("updateDocument");
			System.out.println("doc:"+registerName);
			pojo.setRegisterName(registerName);
			dao.updateDocument(pojo,id);
			response.sendRedirect("View/settings/documentName/addDocument.jsp");
		}
		
		if(request.getParameter("deleteId")!=null)
		{
			String deleteId=request.getParameter("deleteId");
			int id=Integer.parseInt(deleteId);
			 dao.deleteDocument(pojo, id);
			 System.out.println("Deleted Successfully");
			 response.sendRedirect("View/settings/documentName/addDocument.jsp");
			
		}
		
		
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
