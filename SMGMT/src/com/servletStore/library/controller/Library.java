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

import com.servletStore.library.model.AddBookDAO;
import com.servletStore.library.model.AddBookImpl;
import com.servletStore.library.model.AddBookPOJO;
import com.servletStore.library.model.BookCatImpl;
import com.servletStore.library.model.BookDAO;
import com.servletStore.library.model.IssueBookPOJO;

/**
 * Servlet implementation class MainServlet
 */

public class Library extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public Library() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doPost(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AddBookPOJO adb=new AddBookPOJO();
		AddBookDAO dao= new AddBookImpl();
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
					System.out.println("category added ");
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
			String edition=request.getParameter("edition");
			String lang=request.getParameter("language");
			int price=Integer.parseInt(request.getParameter("price"));
			String cupbNo=request.getParameter("cupbno");
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
				if(st==1)
				{
					int id=impl.getMaxBookInfoMaster();
				//	System.out.println("----------"+id);
					for(int i=0;i<adb.getQuantity();i++)
					{
						int status=impl.insertBookDetails(id);
						System.out.println("Books added in BookDetail");
					}
					
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
	
			dao.deleteCategory(bookNo);
			System.out.println("Deleted");
			response.sendRedirect("View/library/AddBook.jsp");
		}
		
		if(request.getParameter("updateId")!=null)
				{
				String id=request.getParameter("updateId");
				System.out.println("id is:"+id);
				int bookId=Integer.parseInt(id);
				List list=dao.selectBookInfo(adb,bookId);
				System.out.println("list :"+list);
				Iterator itr=list.iterator();
				while(itr.hasNext())
				{
					AddBookPOJO pojo=(AddBookPOJO) itr.next();
					int bid=((AddBookPOJO)pojo).getBookNo();
					String date=((AddBookPOJO)pojo).getDate();
					String bookName=((AddBookPOJO)pojo).getBookName();
					String pubname=((AddBookPOJO)pojo).getPublisherName();
					String authorname=((AddBookPOJO)pojo).getAuthorName();
				   String edition=((AddBookPOJO)pojo).getEdition();
				   String lang=((AddBookPOJO)pojo).getLanguage();
				   int qty=((AddBookPOJO)pojo).getQuantity();
				   int price=((AddBookPOJO)pojo).getPrice();
				   String cupbno=((AddBookPOJO)pojo).getCupboardNo();
				   
					
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
			String edition=request.getParameter("edition");
			String lang=request.getParameter("language");
			int price=Integer.parseInt(request.getParameter("price"));
			String cupbNo=request.getParameter("cupbno");
			int qty=Integer.parseInt(request.getParameter("quan"));
			
			System.out.println("bname:"+bookName+"pub"+pubName+"auth:"+authorName+"edit"+edition+"lang:"+lang+"price:"+price+"cu"+cupbNo+"qun"+qty);
			
			AddBookPOJO ad=new AddBookPOJO();
			

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
			
			status =dao.updateBook(ad);
	           
	        System.out.println("Successfully updated");
		  
			  response.sendRedirect("View/library/AddBook.jsp");
		}
	

		//ISSUE SEARCH BOOK//
				if(request.getParameter("detailId")!=null)
				{
					System.out.println("In search function");
					String bookDetail = request.getParameter("detailId");
					List list=dao.searchBookDetails(bookDetail);
					Iterator itr=list.iterator();
					
					while(itr.hasNext()){
							out.print(itr.next()+ " - " +itr.next()+ " - " +itr.next() +",");			
						}
				}
				
				if(request.getParameter("studDetails")!=null)
				{
					System.out.println("In search function.......");
					String studDetail = request.getParameter("studDetails");
					List list=dao.searchStudDetails(studDetail);
					Iterator itr=list.iterator();
					
					while(itr.hasNext()){
						out.print(itr.next()+ " - " +itr.next()+ " - " +itr.next()+ " - " +itr.next()+",");				
						}
				}
				
				//Issue Books//////
				if(request.getParameter("issuebook")!=null)
				{
					System.out.println("1");
					IssueBookPOJO pojo=new IssueBookPOJO();
					
					String searchBook=request.getParameter("searchBook");
					String searchStud=request.getParameter("searchStud");
				//	String user=request.getParameter("userType");
					String issueDate=request.getParameter("issueDate");
					String dueDate=request.getParameter("dueDate");
					String returnDate=request.getParameter("returnDate");
					
					System.out.println(searchBook+" "+searchStud+" "+issueDate+" "+dueDate+" "+returnDate);
					String str[] = searchBook.split("-");
					System.out.println("bno "+str[0]);
					System.out.println("bname"+str[1]);
					String str1[]=searchStud.split("-");
					System.out.println("id"+str1[0]);
					System.out.println("stdname"+str1[1]);
					
					pojo.setBookId(Integer.parseInt(str[0].trim()));
					/*pojo.setBookName(str[1].trim());
					//pojo.setUserName(searchStud);
					pojo.setUserName(str1[1].trim());
					pojo.setUserType(user);
					*/
					pojo.setIssueDate(issueDate);
					pojo.setDueDate(dueDate);
					pojo.setReturnDate(returnDate);
					System.out.println("2");
					AddBookImpl impl=new AddBookImpl();
					try {
						int st=impl.insertIssueBook(pojo);
						if(st>0)
						{
							System.out.println("Issued Books");
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
					request.getRequestDispatcher("View/library/IssueBook.jsp").forward(request, response);
				//	response.sendRedirect("View/Library/AddBook.jsp");
					
				}
				
				if(request.getParameter("getTableData")!=null)
				{
					System.out.println("in");
					String date=request.getParameter("getTableData");
					String s[]=date.split("-");
					//out.println(s[0]+s[1]);
					/*System.out.println(s[0]);
					System.out.println(s[1]);*/
					String s1[]=s[0].split("/");
					String s2[]=s[1].split("/");
					String query="SELECT * FROM issue_book WHERE issue_date between '"+ s1[2].trim()+"-"+s1[0]+"-"+s1[1]+"' AND '"+s2[2]+"-"+s2[0].trim()+"-"+s2[1]+"'";
					List list=dao.getIssueBookList(query);
					Iterator itr=list.iterator();
					IssueBookPOJO pojo=new IssueBookPOJO();
					
					while(itr.hasNext()){
						pojo=(IssueBookPOJO) itr.next();
						int bId=pojo.getBookId();
						//String bName=pojo.getBookName();
						//String userType=pojo.getUserType();
						//String userName=pojo.getUserName();
						String issueDate=pojo.getIssueDate();
						String dueDate=pojo.getDueDate();
						String returnDate=pojo.getReturnDate();
						//out.print(userType+","+ userName+","+bNo+","+bName+","+issueDate+","+dueDate+",");
						out.print(bId+" "+issueDate+" "+dueDate+" "+returnDate+",");
						//System.out.println(userType+","+ userName+","+bNo+","+bName+","+issueDate+","+dueDate+",");
					}
					
				}
				
				if(request.getParameter("bookdetail")!=null)
				{
					System.out.println("In search function");
					String bookDetail = request.getParameter("bookdetail");
					List list=dao.searchBookInfo(bookDetail);
					Iterator itr=list.iterator();
					
					while(itr.hasNext()){
							out.print(itr.next()+ " , " +itr.next()+ " , " +itr.next() +  " , " +itr.next()+ " , " +itr.next()+ " , " +itr.next()+ " , " +itr.next()+ " , " +itr.next()+",");			
						}
				}
					
				}
	}


