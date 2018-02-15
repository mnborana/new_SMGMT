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
			request.getRequestDispatcher("View/library/addBook.jsp").forward(request, response);
		}
		
		 if(request.getParameter("addbook")!=null)
		{
			int catId=Integer.parseInt(request.getParameter("category"));
			String date=request.getParameter("addbookdate");
			String bookName=request.getParameter("bookName");
			String pubName=request.getParameter("pubName");
			String authorName=request.getParameter("authorName");
			String edition=request.getParameter("edition");
			String lang=request.getParameter("language");
			int price=Integer.parseInt(request.getParameter("price"));
			String cupbNo=request.getParameter("cupbno");
			int qty=Integer.parseInt(request.getParameter("quan"));
			String date1[]=date.split("-");
			//System.out.println("Date "+date1[2]+"-"+date1[1]+"-"+date1[0]);
			String date2=date1[2].trim()+"-"+date1[1]+"-"+date1[0];
			out.println("category ID"+catId);
			out.println("date"+date);
			out.println("bookname"+bookName);
			out.println("pname"+pubName);
			out.println("aname"+authorName);
			out.print("E"+edition);
			//adb.setBookNo(bookNo);
		   adb.setCat_id(catId);
			adb.setDate(date2);
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
					for(int i=0;i<adb.getQuantity();i++)
					{
						int status=impl.insertBookDetails(id);
						System.out.println("Books added in BookDetail");
					}
					HttpSession session = request.getSession();
					session.setAttribute("flag", "Books Added Successfully");
					System.out.println("Books added");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			response.sendRedirect("View/library/addBook.jsp");
		}
		
		 if(request.getParameter("bookNo")!=null){
			//System.out.println("In Delete");
			int bookNo=Integer.parseInt(request.getParameter("bookNo"));
			dao.deleteCategory(bookNo);
			//System.out.println("Deleted");
			response.sendRedirect("View/library/addBook.jsp");
		}
		
		 if(request.getParameter("updateId")!=null)
				{
				String id=request.getParameter("updateId");
				int bookId=Integer.parseInt(id);
				List list=dao.selectBookInfo(adb,bookId);
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
				   
					
				//System.out.println("language:"+lang);
					out.println(bid+","+date+","+bookName+","+authorname+","+pubname+","+edition+","+price+","+cupbno+","+qty+","+lang);
				//System.out.print(bid+","+date+","+catid+","+bookName+","+pubname+","+authorname+","+edition+","+lang+","+qty+","+price+","+cupbno);
				}
					
				}
		
		 if(request.getParameter("updatebook")!=null)
		{
		    int status=0;
			//System.out.println("in update");
			int id=Integer.parseInt(request.getParameter("bno"));
			//System.out.println("updated id:"+id);
			
			String bookName=request.getParameter("bookName");
			String pubName=request.getParameter("pubName");
			String authorName=request.getParameter("authorName");
			String edition=request.getParameter("edition");
			String lang=request.getParameter("language");
			int price=Integer.parseInt(request.getParameter("price"));
			String cupbNo=request.getParameter("cupbno");
			int qty=Integer.parseInt(request.getParameter("quan"));
			
			//System.out.println("bname:"+bookName+"pub"+pubName+"auth:"+authorName+"edit"+edition+"lang:"+lang+"price:"+price+"cu"+cupbNo+"qun"+qty);
			
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
	           
	        //System.out.println("Successfully updated");
		  
			  response.sendRedirect("View/library/addBook.jsp");
		}
	

		// Ajax code for Serach book Info(Book Id,Name,Author) which is not issued... 
	 if(request.getParameter("detailId")!=null)
				{
					String bookDetail = request.getParameter("detailId");
					List list=dao.searchBookDetails(bookDetail);
					Iterator itr=list.iterator();
					while(itr.hasNext()){
							out.print(itr.next()+ " - " +itr.next()+ " - " +itr.next() +",");
						}
				}
				
		 if(request.getParameter("returnBooks")!=null)
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
		 if(request.getParameter("studDetails")!=null)
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
		
	 if(request.getParameter("getstudId")!=null)
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
		
		 if(request.getParameter("getstudentId")!=null)
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
			    String fullName=firstName+"-"+lastName;
			    
				out.print(issueBookId+","+issueStudId+" "+fullName+"-"+std+"-"+div);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
		}
				
				//Add Issue Books//////
		 if(request.getParameter("issuebook")!=null)
				{
					IssueBookPOJO pojo=new IssueBookPOJO();
					String searchBook=request.getParameter("searchBook");
					String searchStud=request.getParameter("searchStud");
					String user=request.getParameter("userType");
					String[] issueDate=request.getParameter("issueDate").split("-");
					String issueDateStr=issueDate[2]+"-"+issueDate[1]+"-"+issueDate[0];
					String[] dueDate=request.getParameter("dueDate").split("-");
					String dueDateStr=dueDate[2]+"-"+dueDate[1]+"-"+dueDate[0];
					String returnDate=request.getParameter("returnDate");
					String studId=request.getParameter("studId");
					String str[] = searchBook.split("-");
					String str1[]=searchStud.split("-");
					
					//setPojo
					pojo.setBookId(Integer.parseInt(str[0].trim()));
					
					if(user.equalsIgnoreCase("Student")){
						pojo.setStudId(Integer.parseInt(studId));
					}
					else{
						pojo.setStaffId(Integer.parseInt(str1[0].trim()));
					}
					
					pojo.setUserType(user);
					pojo.setIssueDate(issueDateStr);
					pojo.setDueDate(dueDateStr);
					pojo.setReturnDate(returnDate);
					
					//insert
					AddBookImpl impl=new AddBookImpl();
					try {
						int st=impl.insertIssueBook(pojo);
						
						if(st>0)
						{
							int status=dao.changeStatus(st);
							System.out.println("Issued Books");
							HttpSession session = request.getSession();
							session.setAttribute("flag", "Issue Book Successfully");
							response.sendRedirect("View/library/issueBook.jsp");
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				
		 if(request.getParameter("getTableData")!=null)
				{
					HttpSession session=request.getSession();
					String year=(String) session.getAttribute("year");
					String[] date=request.getParameter("getTableData").split("-");
					String[] from=date[0].split("/");
					String[] to=date[1].split("/");
					String fromStr=from[2].trim()+"-"+from[0]+"-"+from[1];
					String toStr=to[2]+"-"+to[0].trim()+"-"+to[1];
					
					try {
						List list=dao.getDatewiseIssueList(fromStr, toStr);
						Iterator itr = list.iterator();
						while(itr.hasNext())
						{
							out.print(itr.next()+",");
						}
						} catch (SQLException e) {
						e.printStackTrace();
					}	
				}
		 if(request.getParameter("bookdetail")!=null)
				{
				try {
					
						String bookDetail = request.getParameter("bookdetail");
						String todayDate = request.getParameter("currentDate");
						String bName = request.getParameter("bookName");
						String aName = request.getParameter("authorName");
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
					   int totalDays=dao.daysCount(todayDate, dueDate);
					
		          out.print(bookNo+ "," +bookName+ "," +authorName+  "," +issueDate+ "," +dueDate+ ",");
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
		 if(request.getParameter("countDetail")!=null)
		{
			String fine=request.getParameter("fineAmount");
			String studentId[]=request.getParameter("studId").split(",");
			
			try {
				
				int fineAmount=dao.getFine();
				int preAmount=dao.getPreviousFine(studentId[1]);
				out.print(fineAmount+","+preAmount);//pass remain fine in out 
			 } catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
			 if(request.getParameter("fineAP")!=null)
				{
					SetFinePOJO fine_pojo=dao.getFineDetails();
                	out.print(fine_pojo.getId()+","+fine_pojo.getDate()+","+fine_pojo.getFine());
                	//out.print("AP");
				}
		
				else if(request.getParameter("fine")!=null&&request.getParameter("fine").equals("OK"))
				{
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
					
					response.sendRedirect("View/library/setFine.jsp");
				}
				 if(request.getParameter("fine")!=null&&request.getParameter("fine").equals("Update"))
				{
					SetFinePOJO pojo=new SetFinePOJO();
					String date=request.getParameter("date");
					int fine=Integer.parseInt(request.getParameter("fine_value"));
					int id=Integer.parseInt(request.getParameter("id_name"));
					pojo.setDate(date);
					pojo.setFine(fine);
					pojo.setId(id);
					dao.updateFineDetails(pojo);
					response.sendRedirect("View/library/setFine.jsp");
				}	
		
				 if(request.getParameter("returnBook")!=null)
				{
					if(request.getParameter("returnRadio").equals("RETURN"))
					{
						
					}else if(request.getParameter("returnRadio").equals("RENEW"))
					{
						String dueDate=request.getParameter("dueDate");
						
					}
				}
		
				 if(request.getParameter("submitBook")!=null)
				{
					
					FineMasterPOJO pojo=new FineMasterPOJO();
					if(request.getParameter("returnRadio").equals("RETURN"))
					{
						String serachBook=request.getParameter("searchBookDetails");	
						String book[]=serachBook.split("-");
						String issueAndStudId[]=request.getParameter("studentId").split(",");
						int dueDays=Integer.parseInt(request.getParameter("dueDays"));
						int fineAmount=Integer.parseInt(request.getParameter("fineAmount"));
						int discount=Integer.parseInt(request.getParameter("discount"));
						int finePaid=Integer.parseInt(request.getParameter("finePaid"));
						int remainingFine=Integer.parseInt(request.getParameter("remainAmt"));
						
						pojo.setIssueId(Integer.parseInt(issueAndStudId[0]));
						pojo.setDueDays(dueDays);
						pojo.setFineAmount(fineAmount);
						pojo.setDiscount(discount);
						pojo.setFinePaidAmount(finePaid);
						pojo.setRemainingFine(remainingFine);
						pojo.setStudId(Integer.parseInt(issueAndStudId[1]));
						
						String date[]=request.getParameter("currentDate").split("-");
						String fromStr=date[2].trim()+"-"+date[1]+"-"+date[0];
						pojo.setReturnDate(fromStr);
						try {
							int st=dao.insertFineDetails(pojo);
							if(st>0)
							{
							int status=dao.changeStatusReturn(Integer.parseInt(issueAndStudId[0]));
							int sta=dao.getDate(pojo);
								if(status>0)
								{
									response.sendRedirect("View/library/issueBook.jsp");
								}
							}
							} catch (SQLException e) {
							e.printStackTrace();
						}
					} 
					if(request.getParameter("returnRadio").equals("RENEW"))
					{
						FineMasterPOJO pojo1=new FineMasterPOJO();
						String searchBook=request.getParameter("searchBookDetails");
						String searchStud=request.getParameter("studentId");
						String[] issueDate=request.getParameter("issueDateFrom3tab").split("-");
						String issueDateStr=issueDate[2]+"-"+issueDate[1]+"-"+issueDate[0];
						String[] dueDate=request.getParameter("newdueDate").split("-");
						String dueDateStr=dueDate[0]+"-"+dueDate[1]+"-"+dueDate[2];
						String studIdd=request.getParameter("studentId");
						String str[] = searchBook.split("-");
						String str1[]=searchStud.split(",");
						String st=str1[1].trim();
						//setPojo
						pojo1.setIssueId(Integer.parseInt(str[0].trim()));
						
						//if(user.equalsIgnoreCase("Student")){
							pojo1.setStudId(Integer.parseInt(str1[1].trim()));
						/*}
						else{
							pojo1.setStaffId(Integer.parseInt(str1[0].trim()));
						}*/
						
						//pojo1.setUserType(user);
						pojo1.setIssueDate(issueDateStr);
						pojo1.setDueDate(dueDateStr);
						//pojo1.setReturnDate(returnDate);
						AddBookImpl impl=new AddBookImpl();
						try {
							int status=impl.updateRenewBook(pojo1);
							//System.out.println("Execute updated");
							response.sendRedirect("View/library/issueBook.jsp");
						} catch (SQLException e) {
							e.printStackTrace();
						}	
					}
					 if(request.getParameter("returnRadio").equals("RECOVER"))
					{
						//System.out.println("IN Recover******");
						String issueAndStudId[]=request.getParameter("studentId").split(",");
						String remark=request.getParameter("remark");
						//System.out.println("Issue id"+issueAndStudId[0]);
						//pojo.setIssueId(Integer.parseInt(issueAndStudId[0]));
						
					    IssueBookPOJO pojo1=new IssueBookPOJO();
					    pojo1.setRemark(remark);
						
						try {
							int st=dao.updateStatus(Integer.parseInt(issueAndStudId[0]), remark);
							response.sendRedirect("View/library/issueBook.jsp");
						}catch (SQLException e) {
						
							e.printStackTrace();
						}
					}
					
					
					
			}
				 if(request.getParameter("studFineDetail")!=null)
				{
					String studInfo=request.getParameter("studFineDetail");
					//System.out.println("sdssddss"+studInfo);
					
					try {
						List list=dao.getFineSubmission(Integer.parseInt(studInfo));
						Iterator itr=list.iterator();
						Object issueId = null ;
						Object firstName = null ;
						Object middleName= null;
						Object lastName= null;
						Object std= null;
						Object div= null;
						Object fine= null;
												
						while(itr.hasNext()){
							issueId=itr.next();
							firstName=itr.next();
							middleName=itr.next();
							lastName=itr.next();
							std=itr.next();
							div=itr.next();
							fine=itr.next();
							}

						
							
						//System.out.println("Information of student "+issueId+","+firstName+ "," +middleName+ "," +lastName+  "," +std+ "," +div+ ","+fine);
						out.print(issueId+ "," +firstName+ "," +middleName+ "," +lastName+  "," +std+ "," +div+ ","+fine+ ",");
					
					} catch (NumberFormatException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
		
			if(request.getParameter("submitfine")!=null)
			{
				//System.out.println("Submit fine*****");
				int fineAmount=Integer.parseInt(request.getParameter("totalFine"));
				//System.out.println("returnnnnnnnnnn"+fineAmount);
				int discount=Integer.parseInt(request.getParameter("discountamount"));
				int paidAmount=Integer.parseInt(request.getParameter("paidamount"));
				int  remainAmount=Integer.parseInt(request.getParameter("remainAmt"));
				String paidDate[]=request.getParameter("currentDate").split("-");
				String pDate=paidDate[2].trim()+"-"+paidDate[0]+"-"+paidDate[1];
				System.out.println("DATE**************"+pDate);
				FineMasterPOJO pojo= new FineMasterPOJO();
				String studId[]=request.getParameter("studId").split(",");
				
				pojo.setStudId(Integer.parseInt(studId[0]));
				pojo.setIssueId(Integer.parseInt(request.getParameter("issueId")));
				pojo.setFineAmount(fineAmount);
				pojo.setDiscount(discount);
				pojo.setFinePaidAmount(paidAmount);
				pojo.setRemainingFine(remainAmount);
				pojo.setPaid_date(pDate);
				
				try {
					int status=dao.insertFineSubmissionDetails(pojo);
					
					if(status>0)
					{
						//System.out.println("fine submit");
						response.sendRedirect("View/library/fineSubmission.jsp");
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
			}
		
		
		
	}
}

