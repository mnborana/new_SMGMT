package com.servletStore.library.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servletStore.library.model.AddBookDAO;
import com.servletStore.library.model.AddBookImpl;
import com.servletStore.library.model.AddBookPOJO;
import com.servletStore.library.model.BookCatImpl;
import com.servletStore.library.model.FineMasterPOJO;
import com.servletStore.library.model.IssueBookPOJO;
import com.servletStore.library.model.SetFinePOJO;

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
		PrintWriter out=response.getWriter();
		/*<<<<<<<<<<<<<<<< >>>>>>>>>>>>>>>>>>>> */
		if(request.getParameter("savecat")!=null)
		{
			String catName=request.getParameter("catName");
			BookCatImpl impl=new BookCatImpl();
			try {
				int st=impl.insertCategory(catName);
				
				if(st>0)
				{
					System.out.println("category added ");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("View/library/AddBook.jsp").forward(request, response);
		}
		
		else if(request.getParameter("addbook")!=null)
		{
			System.out.println("In function");
			//int bookNo=Integer.parseInt(request.getParameter("bookno"));
			
			//int catId = adb.getCat_id();
			int catId=Integer.parseInt(request.getParameter("category"));
			
			System.out.println("**************************"+catId);
			//out.print(catId);
			String date=request.getParameter("addbookdate");
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
			//request.getRequestDispatcher("View/library/AddBook.jsp").forward(request, response);
			response.sendRedirect("View/library/AddBook.jsp");
		}
		
		else if(request.getParameter("bookNo")!=null){
			System.out.println("In Delete");
			
			int bookNo=Integer.parseInt(request.getParameter("bookNo"));
	
			dao.deleteCategory(bookNo);
			System.out.println("Deleted");
			response.sendRedirect("View/library/AddBook.jsp");
		}
		
		else if(request.getParameter("updateId")!=null)
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
		
		else if(request.getParameter("updatebook")!=null)
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
	

		// Ajax code for Serach book Info(Book Id,Name,Author) which is not issued... 
		else if(request.getParameter("detailId")!=null)
				{
					String bookDetail = request.getParameter("detailId");
					List list=dao.searchBookDetails(bookDetail);
					Iterator itr=list.iterator();
					while(itr.hasNext()){
							out.print(itr.next()+ " - " +itr.next()+ " - " +itr.next() +",");
						}
				}
				
		else if(request.getParameter("returnBooks")!=null)
				{
					String returnBookDetail = request.getParameter("returnBooks");
					try {
						List list=dao.getReturnBookDetails(returnBookDetail);
						
						Iterator itr=list.iterator();
						
						while(itr.hasNext()){
								//id //name //author
								out.print(itr.next()+ " - " +itr.next()+ " - " +itr.next() +",");
							}
						
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				
				// Serach Student info here...
		else if(request.getParameter("studDetails")!=null)
				{
					String studDetail = request.getParameter("studDetails");
				//	System.out.println(studDetail);
					List list=dao.searchStudDetails(studDetail);
					Iterator itr=list.iterator();
					
					while(itr.hasNext()){
						
						Object studId=itr.next();
						Object grNo=itr.next();
						Object firstName=itr.next();
						Object lastName=itr.next();
						Object std=itr.next();
						Object div=itr.next();
						Object shift=itr.next();
						
						
						out.print(grNo+" - "+firstName+" "+lastName+ " - " +std+" - "+div+" - "+shift+",");				
						}
				}
		
		else if(request.getParameter("getstudId")!=null)
		{
			String studDetail=request.getParameter("getstudId");
			String theStudeDetails[]=studDetail.split(" - ");
			
			String grNo=theStudeDetails[0];
			String name[]=theStudeDetails[1].split(" ");
			String firstName=name[0];
			String lastName=name[1];
			String std=theStudeDetails[2];
			String div=theStudeDetails[3];
			String shift[]=theStudeDetails[4].split(",");
			
			try {
				
				int studid=dao.getStudId(grNo, firstName, std, div, shift[0], lastName);
				out.print(studid);
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		else if(request.getParameter("getstudentId")!=null)
		{
			String studentId=request.getParameter("getstudentId");
			String studId[]=studentId.split(" - ");
			int bookId=Integer.parseInt(studId[0].trim());
			try {
				List list=dao.getStudentId(bookId);
			    Object issueBookId=list.get(0);
			    Object issueStudId=list.get(1);
			    List list1=dao.getStudent((int) issueStudId);
			    String firstName=(String) list1.get(0);
			    String lastName=(String) list1.get(1);
			    Object std=list1.get(2);
			    Object div=list1.get(3);
			    System.out.println("Info@@@@  "+ firstName+" "+lastName+" "+std+" "+div);
			   // String fullName=firstName.concat(lastName);
			    String fullName=firstName+"-"+lastName;
			    System.out.println("Details  "+issueBookId+","+issueStudId);
				//out.print(issueBookId+","+issueStudId);
				out.print(issueBookId+","+issueStudId+" "+fullName+"-"+std+"-"+div);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
				
				//Add Issue Books//////
		else if(request.getParameter("issuebook")!=null)
				{
					//System.out.println("1");
					IssueBookPOJO pojo=new IssueBookPOJO();
					String searchBook=request.getParameter("searchBook");
					String searchStud=request.getParameter("searchStud");
					String user=request.getParameter("userType");
					String issueDate=request.getParameter("issueDate");
					String dueDate=request.getParameter("dueDate");
					String returnDate=request.getParameter("returnDate");
					String studId=request.getParameter("studId");
				//	System.out.println("####### "+studId);
				//	System.out.println("dfghjklkjnhgth "+searchBook+" "+searchStud+" "+issueDate+" "+dueDate+" "+returnDate);
					String str[] = searchBook.split("-");
					System.out.println("bId "+str[0]);
					System.out.println("bname "+str[1]);
					String str1[]=searchStud.split("-");
					pojo.setBookId(Integer.parseInt(str[0].trim()));
					
					//int id=dao.getId(Integer.parseInt(studId));
					if(user.equalsIgnoreCase("Student")){
						pojo.setStudId(Integer.parseInt(studId));
					//	pojo.setStudName(str1[0].trim());
					}
					else{
						pojo.setStaffId(Integer.parseInt(str1[0].trim()));
						//	pojo.setStaffName(str1[0].trim());
					}
					
					/*pojo.setBookName(str[1].trim());
					//pojo.setUserName(searchStud);
					pojo.setUserName(str1[1].trim());
					pojo.setUserType(user);*/
					
					pojo.setUserType(user);
					pojo.setIssueDate(issueDate);
					pojo.setDueDate(dueDate);
					pojo.setReturnDate(returnDate);
					
				//	pojo.setBookName(str[1].trim());
				//	pojo.setStudName(str1[1].trim());
					
					AddBookImpl impl=new AddBookImpl();
					try {
						int st=impl.insertIssueBook(pojo);
						
						if(st>0)
						{
							int status=dao.changeStatus(st);
							System.out.println("Issued Books");
							HttpSession session = request.getSession();
							session.setAttribute("flag", "Issue Book Successfully");
							response.sendRedirect("View/library/IssueBook.jsp");
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				
		else if(request.getParameter("getTableData")!=null)
				{
					String date=request.getParameter("getTableData");
					String s[]=date.split("-");
					//out.println(s[0]+s[1]);
					/*System.out.println(s[0]);
					System.out.println(s[1]);*/
					String s1[]=s[0].split("/");
					String s2[]=s[1].split("/");
					String date1=s1[2].trim()+"-"+s1[0]+"-"+s1[1];
					String date2=s2[2]+"-"+s2[0].trim()+"-"+s2[1];
					try {
						List list=dao.getDatewiseIssueList(date1, date2);
						Iterator itr = list.iterator();
						while(itr.hasNext())
						{
							Object name=itr.next();
							Object bookName=itr.next();
							Object issueDate=itr.next();
							Object dueDate=itr.next();
							//System.out.println("--->>>>>>---"+name+","+bookName+","+issueDate+","+dueDate+",");
							out.print(name+","+bookName+","+issueDate+","+dueDate+",");
						}
						} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}	
				}
		else if(request.getParameter("bookdetail")!=null)
				{
				try {
					System.out.println("In search function");
						String bookDetail = request.getParameter("bookdetail");
						String todayDate = request.getParameter("currentDate");
						String bName = request.getParameter("bookName");
						String aName = request.getParameter("authorName");
						
						System.out.println(bName+"----"+aName);
						
						List list=dao.searchBookInfo(bookDetail,bName,aName);
						Iterator itr=list.iterator();
						Object bookNo = null ;
						Object bookName= null;
						Object authorName= null;
						Object issueDate= null;
						Object dueDate= null;
						Object issueId= null;
						String studId= null;
						String staffId= null;
						
						while(itr.hasNext()){
							bookNo=itr.next();
							bookName=itr.next();
							authorName=itr.next();
							issueDate=itr.next();
							dueDate=itr.next();
							issueId=itr.next();
							studId=itr.next().toString();
							List list1=dao.searchStudDetails(studId);
							staffId=itr.next().toString();
							}
					//	System.out.println("aajchi date"+todayDate);
					//	System.out.println("due date"+dueDate);
					   int totalDays=dao.daysCount(todayDate, dueDate);
					
					
					//out.print(totalDays);
					
		          out.print(bookNo+ "," +bookName+ "," +authorName+  "," +issueDate+ "," +dueDate+ ",");
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
		else if(request.getParameter("countDetail")!=null)
		{
			System.out.println("AJax WORKING------------");
			String fine=request.getParameter("fineAmount");
			String studentId[]=request.getParameter("studId").split(",");
			
			try {
				
				int fineAmount=dao.getFine();
				int preAmount=dao.getPreviousFine(studentId[1]);
				System.out.println("Previous Amount in servlet *****"+preAmount);
				out.print(fineAmount+","+preAmount);//pass remain fine in out 
			 } catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		/*else if(request.getParameter("countDetail")!=null)
				{
					System.out.println("AJax WORKING------------");
					
					//out.println("AJax WORKING");
					String todayDate = request.getParameter("currentDate");
					String dueDate=request.getParameter("dueDate");
					String fine=request.getParameter("fineAmount");
					try {
						
						int totalDays=dao.daysCount(todayDate, dueDate);
						int fineAmount=dao.getFine();
						System.out.println("days diff-------- "+totalDays);
						if(totalDays>0)
						{
						out.print(totalDays+","+fineAmount);
						}else
						{
							out.print("0,0");
						}
					 } catch (SQLException e) {
						e.printStackTrace();
					}
				}
				*/
				
			else if(request.getParameter("fineAP")!=null)
				{
					SetFinePOJO fine_pojo=dao.getFineDetails();
                	out.print(fine_pojo.getId()+","+fine_pojo.getDate()+","+fine_pojo.getFine());
                	//out.print("AP");
				}
		
				else if(request.getParameter("fine")!=null&&request.getParameter("fine").equals("OK"))
				{
					System.out.println("Btn Name : "+request.getParameter("fine"));
					SetFinePOJO pojo=new SetFinePOJO();
					String date=request.getParameter("date");
					int fine=Integer.parseInt(request.getParameter("fine_value"));
					
					pojo.setDate(date);
					pojo.setFine(fine);
					
					
					try {
						int st=dao.insertFine(pojo);
						if(st>0)
							System.out.println("Fine set");
					} catch (SQLException e) {
						e.printStackTrace();
					}
					//request.getRequestDispatcher("View/library/SetFine.jsp").forward(request, response);
					response.sendRedirect("View/library/SetFine.jsp");
				}
				else if(request.getParameter("fine")!=null&&request.getParameter("fine").equals("Update"))
				{
					SetFinePOJO pojo=new SetFinePOJO();
					String date=request.getParameter("date");
					int fine=Integer.parseInt(request.getParameter("fine_value"));
					int id=Integer.parseInt(request.getParameter("id_name"));
					pojo.setDate(date);
					pojo.setFine(fine);
					pojo.setId(id);
					dao.updateFineDetails(pojo);
					response.sendRedirect("View/library/SetFine.jsp");
				}	
		
				else if(request.getParameter("returnBook")!=null)
				{
					if(request.getParameter("returnRadio").equals("RETURN"))
					{
						
					}else if(request.getParameter("returnRadio").equals("RENEW"))
					{
						String dueDate=request.getParameter("dueDate");
						
					}
				}
		
				else if(request.getParameter("submitBook")!=null)
				{
					System.out.println("Submit Bookkkkkkkkk");
					FineMasterPOJO pojo=new FineMasterPOJO();
					if(request.getParameter("returnRadio").equals("RETURN"))
					{
						System.out.println("Returnnnnnnnnnnn");
						String serachBook=request.getParameter("searchBookDetails");	
						String book[]=serachBook.split("-");
						System.out.println("IssueBookId is "+book[0]);
						System.out.println("IssueBookName is "+book[1]);
						String issueAndStudId[]=request.getParameter("studentId").split(",");
						int dueDays=Integer.parseInt(request.getParameter("dueDays"));
						int fineAmount=Integer.parseInt(request.getParameter("fineAmount"));
						int discount=Integer.parseInt(request.getParameter("discount"));
						int finePaid=Integer.parseInt(request.getParameter("finePaid"));
						int remainingFine=Integer.parseInt(request.getParameter("remainAmt"));
						
						//int stdId=Integer.parseInt(request.getParameter("studentId"));
						//System.out.println("Details "+dueDays+" "+fineAmount);
						//System.out.println("aaaaaaaaaa"+studId);
						pojo.setIssueId(Integer.parseInt(issueAndStudId[0]));
						pojo.setDueDays(dueDays);
						pojo.setFineAmount(fineAmount);
						pojo.setDiscount(discount);
						pojo.setFinePaidAmount(finePaid);
						pojo.setRemainingFine(remainingFine);
						pojo.setStudId(Integer.parseInt(issueAndStudId[1]));
						
						String date=request.getParameter("currentDate");
						pojo.setReturnDate(date);
						
						try {
							int st=dao.insertFineDetails(pojo);
							if(st>0)
							{
								//System.out.println("Id"+Integer.parseInt(studId[0]));
							int status=dao.changeStatusReturn(Integer.parseInt(issueAndStudId[0]));
							int sta=dao.getDate(pojo);
								if(status>0)
								{
									System.out.println("Return book");
									response.sendRedirect("View/library/IssueBook.jsp");
								}
							}
							} catch (SQLException e) {
							e.printStackTrace();
						}
					}else if(request.getParameter("returnRadio").equals("RENEW"))
					{
						System.out.println("Renewwwwwwwwww");
						String studId[]=request.getParameter("studentId").split(",");
						String dueDate=request.getParameter("newdueDate");
						pojo.setIssueId(Integer.parseInt(studId[0]));
						pojo.setDueDate(dueDate);
						long millis=System.currentTimeMillis();  
						java.sql.Date date=new java.sql.Date(millis);  
						
						try {
							int status=dao.updateRenewBook(pojo,date.toString());
							System.out.println("Execute updated");
							response.sendRedirect("View/library/IssueBook.jsp");
						} catch (SQLException e) {
							e.printStackTrace();
						}	
					}
			}
	}
}

