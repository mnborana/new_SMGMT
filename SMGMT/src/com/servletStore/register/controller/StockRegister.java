package com.servletStore.register.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbconnect.DBConnection;
import com.servletStore.register.model.InwardRegisterPojo;
import com.servletStore.register.model.StockRegisterDAO;
import com.servletStore.register.model.StockRegisterImpl;
import com.servletStore.register.model.StockRegisterPojo;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;



public class StockRegister extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		StockRegisterPojo pojo=new StockRegisterPojo();
		StockRegisterDAO stockdao=new StockRegisterImpl();
		
		
		if(request.getParameter("SubmitStock")!=null)
		{
			String requireddate=request.getParameter("requireddate");
			String itemName=request.getParameter("itemName");
			String itemAmount=request.getParameter("itemAmount");
			String deductionAmount=request.getParameter("deductionAmount");			
			String noOfItems=request.getParameter("numberOfItems");			
			String totalAmount=request.getParameter("totalAmount");
			String percentage=request.getParameter("percentage");
			String description=request.getParameter("description");
			System.out.println("descri:"+description);
			String voucherNo=request.getParameter("voucherNo");
			int voucher_No=Integer.parseInt(voucherNo);
			
			
			pojo.setRequireddate(requireddate);
			pojo.setItemName(itemName);
			pojo.setItemAmt(itemAmount);
			pojo.setDeductionAmt(deductionAmount);
			pojo.setNoOfItems(Integer.parseInt(noOfItems));
			pojo.setTotalAmt(totalAmount);
			pojo.setPercentage(percentage);
			pojo.setDescription(description);
			pojo.setVoucherNo(voucher_No);
			
			
			stockdao.insertStock(pojo);
			request.setAttribute("status", "Inserted Successfully");
			response.sendRedirect("View/register/stockRegister.jsp");	
			
		}
		
		if(request.getParameter("updateStockId")!=null)
		{
			String updateStockId=request.getParameter("updateStockId");
			int stockId=Integer.parseInt(updateStockId);
			List<StockRegisterPojo> list=stockdao.selectStock(stockId);
			Iterator<StockRegisterPojo> itr=list.iterator();
			while(itr.hasNext())
			{
				StockRegisterPojo pojo1=(StockRegisterPojo)itr.next();
				int id=((StockRegisterPojo)pojo1).getId();
				System.out.println(" select id :"+id);				
				String reqdate=((StockRegisterPojo)pojo1).getRequireddate();
				String ItemName=((StockRegisterPojo)pojo1).getItemName();
				String itemAmt=((StockRegisterPojo)pojo1).getItemAmt();								
				String deductionAmt=((StockRegisterPojo)pojo1).getDeductionAmt();
				int numberOfItems=((StockRegisterPojo)pojo1).getNoOfItems();	
				String totalAmt=((StockRegisterPojo)pojo1).getTotalAmt();
				String percentage=((StockRegisterPojo)pojo1).getPercentage();
				int voucherNo=((StockRegisterPojo)pojo1).getVoucherNo();
				String description=((StockRegisterPojo)pojo1).getDescription();
				
				out.print(id+","+reqdate+","+ItemName+","+itemAmt+","+deductionAmt+","+numberOfItems+","+totalAmt+","+percentage+","+voucherNo+","+description);
				
			}
		}
		
		
		if(request.getParameter("updateStockDetailsBtn")!=null)
		{
			String updateId=request.getParameter("UpdateId");
			int update_Id=Integer.parseInt(updateId);
			System.out.println("updated is:"+update_Id);
			String reqDate=request.getParameter("updateDate");	
			String itemName=request.getParameter("updateItem");					
			String itemAmt=request.getParameter("updateItemAmount");
			String deductionAmt=request.getParameter("updateDudeductionAmt");
			String numberOfItem=request.getParameter("updateNumberOfItems");	
			int numOfItem=Integer.parseInt(numberOfItem);
			System.out.println("number of items :"+numOfItem);
			String totalAmt=request.getParameter("updateAmount");
			String per=request.getParameter("updatePercentage");
			String voucherNo=request.getParameter("updateVoucherNo");
			System.out.println("voucher no:"+voucherNo);
			int voucherno=Integer.parseInt(voucherNo);
			
			String description=request.getParameter("updateDescription");
			
			
			pojo.setItemName(itemName);
			pojo.setRequireddate(reqDate);
			pojo.setItemAmt(itemAmt);
			pojo.setDeductionAmt(deductionAmt);
			pojo.setNoOfItems(numOfItem);
			pojo.setTotalAmt(totalAmt);
			pojo.setPercentage(per);
			pojo.setVoucherNo(voucherno);
			pojo.setDescription(description);
			pojo.setId(update_Id);
			
			stockdao.updateStockDetails(pojo, update_Id);
			response.sendRedirect("View/register/stockRegister.jsp");	
			
		}
		
		if(request.getParameter("deleteStockId")!=null)
		{
			String id=request.getParameter("deleteStockId");
			int stockId=Integer.parseInt(id);
			stockdao.deleteStock(stockId);
			response.sendRedirect("View/register/stockRegister.jsp");	
		}
		
		String submitBTN=request.getParameter("submitStockBTN");
		if(submitBTN!=null)
		{
			String selectCheck=request.getParameter("checkALL");
			String itemId=request.getParameter("selectItemName");
			System.out.println("item id:"+itemId);
			String schoolId=request.getParameter("schoolId");
			String trustyName="",schoolName="",schoolAddress="";
			List<StockRegisterPojo> list11 =stockdao.selectSchoolDetails(schoolId);
			Iterator<StockRegisterPojo> itr11=list11.iterator();
			while(itr11.hasNext())
			{
				 StockRegisterPojo pojo11=(StockRegisterPojo)itr11.next();
				 trustyName=((StockRegisterPojo)pojo11).getTrustyName();
				 schoolName=((StockRegisterPojo)pojo11).getSchoolName();
				 schoolAddress=((StockRegisterPojo)pojo11).getSchoolAddress();
			}
			
			if(itemId!=null){
				System.out.println("hii");
				StockRegisterPojo pojo1=stockdao.getItemName(itemId);
				String itemName=pojo1.getItemName();
				System.out.println("item name is:"+itemName);			
				
				try{
				DBConnection conn=new DBConnection();
				Connection connection=conn.getConnection();
				net.sf.jasperreports.engine.JasperReport jasperReport = null;
				JasperDesign jasperDesign = null;
				Map parameters = new HashMap();
				parameters.put("itemName", itemName);
				parameters.put("trustyName", trustyName);
				parameters.put("schoolName", schoolName);
				parameters.put("schoolAddress", schoolAddress);
			
				System.out.println(parameters.get("fDate")+" "+parameters.get("tDate")+" "+parameters.get("trustyName")+" "+parameters.get("schoolName")+" "+parameters.get("schoolAddress"));
				String path = getServletContext().getRealPath("/WEB-INF/");
				jasperDesign = JRXmlLoader.load(path + "/jasperReport/StockRegisterReport.jrxml");
				jasperReport = JasperCompileManager.compileReport(jasperDesign);
				JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, connection);
		        JasperViewer.viewReport(jasperPrint, false);
				
			} catch (JRException e) {
				e.printStackTrace();
			}
				
			} 
			else if(selectCheck.equals("1"))
			{
				try{
				DBConnection conn=new DBConnection();
				Connection connection=conn.getConnection();
				net.sf.jasperreports.engine.JasperReport jasperReport = null;
				JasperDesign jasperDesign = null;
				Map parameters = new HashMap();
				parameters.put("trustyName", trustyName);
				parameters.put("schoolName", schoolName);
				parameters.put("schoolAddress", schoolAddress);
				
				System.out.println(parameters.get("fDate")+" "+parameters.get("tDate")+" "+parameters.get("trustyName")+" "+parameters.get("schoolName")+" "+parameters.get("schoolAddress"));
				String path = getServletContext().getRealPath("/WEB-INF/");
				jasperDesign = JRXmlLoader.load(path + "/jasperReport/StockRegRepoAllItem.jrxml");
				jasperReport = JasperCompileManager.compileReport(jasperDesign);
				JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, connection);
		        JasperViewer.viewReport(jasperPrint, false);
				
			} catch (JRException e) {
				e.printStackTrace();
			}
				
				
			}
			
			
			response.sendRedirect("View/register/Report/StockRegister.jsp");
			
		}
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
