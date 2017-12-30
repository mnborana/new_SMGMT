package com.servletStore.register.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servletStore.register.model.StockRegisterDAO;
import com.servletStore.register.model.StockRegisterImpl;
import com.servletStore.register.model.StockRegisterPojo;



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
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
