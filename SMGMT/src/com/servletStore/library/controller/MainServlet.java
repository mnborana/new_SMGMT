package com.servletStore.library.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servletStore.library.model.AddBookDao;
import com.servletStore.library.model.AddBookImpl;
import com.servletStore.library.model.AddBookPojo;
import com.servletStore.library.model.BookCatImpl;
import com.servletStore.library.model.BookDAO;

/**
 * Servlet implementation class MainServlet
 */

public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public MainServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doPost(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AddBookPojo adb=new AddBookPojo();
		AddBookDao aadao= new AddBookImpl();
			//System.out.println("Inserted succesfully");
			
			PrintWriter out=response.getWriter();
		if(request.getParameter("savecat")!=null)
		{
			System.out.println("*********");
			String catName=request.getParameter("catName");
			BookCatImpl impl=new BookCatImpl();
			try {
				int st=impl.insertCategory(catName);
				
				if(st>0)
				{
					System.out.println("category added successfully");
					/*response.sendRedirect("/SMGMT/AddBook.jsp");*/
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getRequestDispatcher("View/library/AddBook.jsp").forward(request, response);

		}
		
		if(request.getParameter("addbook")!=null)
		{
			System.out.println("In function");
			//int bookNo=Integer.parseInt(request.getParameter("bookno"));
			
			//int catId = adb.getCat_id();
			int catId=Integer.parseInt(request.getParameter("category"));
			
			
			System.out.println("**************************"+catId);
			
			
			//out.print(catId);
			String date=request.getParameter("date");
			String bookName=request.getParameter("bookName");
			String pubName=request.getParameter("pubName");
			String authorName=request.getParameter("authorName");
			int edition=Integer.parseInt(request.getParameter("edition"));
			String lang=request.getParameter("language");
			int price=Integer.parseInt(request.getParameter("price"));
			int cupbNo=Integer.parseInt(request.getParameter("cupbno"));
			int qty=Integer.parseInt(request.getParameter("quan"));
	
			out.println("category ID"+catId);
			out.println("date"+date);
			out.println("bookname"+bookName);
			out.println("pname"+pubName);
			out.println("aname"+authorName);
			out.print("E"+edition);
		 	System.out.print("Language "+lang+" date"+date);
		//	System.out.println("Quantity"+qty);
		//	AddBookPojo adb=new AddBookPojo();
			
			//adb.setBookNo(bookNo);
		   adb.setCat_id(catId);
			
			adb.setDate(date);
			adb.setBookName(bookName);
			adb.setPublisherName(pubName);
			adb.setAuthorName(authorName);
			adb.setEdition(edition);
			adb.setLanguage(lang);
			adb.setPrice(price);
			adb.setCupboardNo(cupbNo);
			adb.setQuantity(qty);
			
			AddBookImpl impl=new AddBookImpl();
			try {
				int st=impl.insertBook(adb);
				if(st>0)
				{
					System.out.println("Books added");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("View/library/AddBook.jsp").forward(request, response);
		//	response.sendRedirect("View/Library/AddBook.jsp");
			
		}
		
		if(request.getParameter("bookNo")!=null){
			System.out.println("In Delete");
			
			int bookNo=Integer.parseInt(request.getParameter("bookNo"));
	
			aadao.deleteCategory(bookNo);
			System.out.println("Deleted");
			response.sendRedirect("View/Library/AddBook.jsp");
		}
		
		if(request.getParameter("updateId")!=null)
				{
				String id=request.getParameter("updateId");
				System.out.println("id is:"+id);
				int bookId=Integer.parseInt(id);
				List list=aadao.selectBookInfo(adb,bookId);
				System.out.println("list :"+list);
				Iterator itr=list.iterator();
				while(itr.hasNext())
				{
					AddBookPojo pojo=(AddBookPojo)itr.next();
					int bid=((AddBookPojo)pojo).getBookNo();
					String date=((AddBookPojo)pojo).getDate();
					String bookName=((AddBookPojo)pojo).getBookName();
					String pubname=((AddBookPojo)pojo).getPublisherName();
					String authorname=((AddBookPojo)pojo).getAuthorName();
				   int edition=((AddBookPojo)pojo).getEdition();
				   String lang=((AddBookPojo)pojo).getLanguage();
				   int qty=((AddBookPojo)pojo).getQuantity();
				   int price=((AddBookPojo)pojo).getPrice();
				   int cupbno=((AddBookPojo)pojo).getCupboardNo();
				   
					
				System.out.println("language:"+lang);
					out.println(bid+","+date+","+bookName+","+authorname+","+pubname+","+edition+","+price+","+cupbno+","+qty+","+lang);
				//System.out.print(bid+","+date+","+catid+","+bookName+","+pubname+","+authorname+","+edition+","+lang+","+qty+","+price+","+cupbno);
				}
					
				}
		
		if(request.getParameter("updatebook")!=null)
		{
			   int status=0;
			System.out.println("in update");
			int id=Integer.parseInt(request.getParameter("bno"));
			System.out.println("updated id:"+id);
			
			String bookName=request.getParameter("bookName");
			String pubName=request.getParameter("pubName");
			String authorName=request.getParameter("authorName");
			int edition=Integer.parseInt(request.getParameter("edition"));
			String lang=request.getParameter("language");
			int price=Integer.parseInt(request.getParameter("price"));
			int cupbNo=Integer.parseInt(request.getParameter("cupbno"));
			int qty=Integer.parseInt(request.getParameter("quan"));
			
			System.out.println("bname:"+bookName+"pub"+pubName+"auth:"+authorName+"edit"+edition+"lang:"+lang+"price:"+price+"cu"+cupbNo+"qun"+qty);
			
			AddBookPojo ad=new AddBookPojo();
			

			ad.setBookNo(id);
			//ad.setDate(date);
			ad.setBookName(bookName);
			ad.setPublisherName(pubName);
			ad.setAuthorName(authorName);
			ad.setEdition(edition);
			ad.setLanguage(lang);
			ad.setPrice(price);
			ad.setCupboardNo(cupbNo);
			ad.setQuantity(qty);
			
			status =aadao.updateBook(ad);
	           
	        System.out.println("Successfully updated");
		  
			  response.sendRedirect("View/library/AddBook.jsp");
		}
	
		
		//ISSUE SEARCH BOOK//
		if(request.getParameter("searchbook")!=null)
		{
			System.out.println("In function");
			//int bookNo=Integer.parseInt(request.getParameter("bookno"));
			
			//int catId = adb.getCat_id();
			//int catId=Integer.parseInt(request.getParameter("category"));
			
			
			//System.out.println("**************************"+catId);
			
			
			//out.print(catId);
			//String date=request.getParameter("date");
			String bookName=request.getParameter("bookName");
			String pubName=request.getParameter("pubName");
			String authorName=request.getParameter("authorName");
			int edition=Integer.parseInt(request.getParameter("edition"));
			//String lang=request.getParameter("language");
			//int price=Integer.parseInt(request.getParameter("price"));
			int cupbNo=Integer.parseInt(request.getParameter("cupbno"));
			//int qty=Integer.parseInt(request.getParameter("qty"));
	
			/*out.println("category ID"+catId);
			out.println("date"+date);*/
			out.println("bookname"+bookName);
			out.println("pname"+pubName);
			out.println("aname"+authorName);
			out.print("E"+edition);
		 //	System.out.print("Language "+lang+" date"+date);
		//	System.out.println("Quantity"+qty);
		//	AddBookPojo adb=new AddBookPojo();
			
			//adb.setBookNo(bookNo);
		  
			adb.setBookName(bookName);
			adb.setPublisherName(pubName);
			adb.setAuthorName(authorName);
			adb.setEdition(edition);
			
			adb.setCupboardNo(cupbNo);
			//adb.setQuantity(qty);
			
			AddBookImpl impl=new AddBookImpl();
			int st=impl.searchBook(adb);
			if(st>0)
			{
				System.out.println("Books added");
			}
			request.getRequestDispatcher("View/library/AddBook.jsp").forward(request, response);
			
			
		}
	}

}
