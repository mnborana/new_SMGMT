package com.servletStore.library.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import utility.SysDate;

import com.dbconnect.DBConnection;

public class AddBookImpl implements AddBookDAO{
	DBConnection dbConnect = new DBConnection();
	static Connection connection;
	PreparedStatement pstmt=null;
	public AddBookImpl()
	{
		connection=dbConnect.getConnection();
		
	}
	@Override
	public int insertBook(AddBookPOJO adbk) throws SQLException {
		System.out.println("***************************");
		String query="insert into book_info_master(cat_id,date,book_name,author_name,publisher_name,edition,price,cupboard_no,quantity,language) values(?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps=connection.prepareStatement(query);
	//	ps.setInt(1, adbk.getBookNo());
		ps.setInt(1, adbk.getCat_id());
		ps.setString(2, adbk.getDate());
		ps.setString(3, adbk.getBookName());
		ps.setString(4, adbk.getAuthorName());
		ps.setString(5, adbk.getPublisherName());
		ps.setString(6, adbk.getEdition());
		ps.setInt(7, adbk.getPrice());
		ps.setString(8, adbk.getCupboardNo());
		ps.setInt(9, adbk.getQuantity());
		ps.setString(10, adbk.getLanguage());
		System.out.println("Language"+adbk.getLanguage());
		int st=ps.executeUpdate();
		//System.out.println("@@@@@@@@@@@"+st);
		return st;
	}
	@Override
	public List<AddBookPOJO> getBookDetails() throws SQLException {
		List<AddBookPOJO> list=new ArrayList<AddBookPOJO>();
		String query="select `cat_id`,`date`,`book_no`,`book_name`,`author_name`,`publisher_name`,`edition`,`price`,`cupboard_no`,`quantity`,`language` from book_info_master";
	
		PreparedStatement ps=(PreparedStatement) connection.prepareStatement(query);
		
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			AddBookPOJO addb=new AddBookPOJO();
			
			//bcp.setCatName(rs.getString("cat_type"));
			addb.setCat_id(rs.getInt("cat_id"));
			addb.setDate(rs.getString("date"));
			addb.setBookNo(rs.getInt("book_no"));
			addb.setBookName(rs.getString("book_name"));
			addb.setAuthorName(rs.getString("author_name"));
			addb.setPublisherName(rs.getString("publisher_name"));
			addb.setEdition(rs.getString("edition"));
			addb.setPrice(rs.getInt("price"));
			addb.setCupboardNo(rs.getString("cupboard_no"));
			addb.setQuantity(rs.getInt("quantity"));
			addb.setLanguage(rs.getString("language"));


			
			list.add(addb);
		}

		return list;
	}
	public int updateBook(AddBookPOJO ad) { 
		    int status=0;  
		   
		    String query="update book_info_master set date=?, book_name=?,author_name=?,publisher_name=?,edition=?,price=?,cupboard_no=?,quantity=?,language=? where book_no=?";
		   
		   
			try {
				System.out.println("hi");
				pstmt = connection.prepareStatement(query);
				
				pstmt.setString(1,ad.getDate());
				pstmt.setString(2,ad.getBookName());
				pstmt.setString(3, ad.getAuthorName());
				pstmt.setString(4, ad.getPublisherName());		         
				pstmt.setString(5, ad.getEdition());
				pstmt.setInt(6,	ad.getPrice());
				pstmt.setString(7, ad.getCupboardNo());
		        pstmt.setInt(8, ad.getQuantity());
		        pstmt.setString(9, ad.getLanguage());
		        pstmt.setInt(10, ad.getBookNo());
		            
		        System.out.println("bookaname:"+ad.getBookName());
		        status=pstmt.executeUpdate();  
		          System.out.println("Updated:"+status);
		       
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		        System.out.println("In try");
		          
		        
		      
		    return status;  
		
	}
	@Override
	public void deleteCategory(int bookNo) {
		try {
			pstmt=connection.prepareStatement("DELETE FROM book_info_master WHERE book_no=?");
			pstmt.setInt(1, bookNo);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public List selectBookInfo(AddBookPOJO pojo,int id) {
		List<AddBookPOJO> list=new ArrayList<AddBookPOJO>();
		String select_query="SELECT book_info_master.book_no,book_info_master.date,book_info_master.cat_id,book_info_master.book_name,book_info_master.author_name,book_info_master.publisher_name,book_info_master.edition,book_info_master.price,book_info_master.cupboard_no,book_info_master.quantity,book_info_master.language FROM book_info_master WHERE book_info_master.book_no=?";
		try {
			pstmt=connection.prepareStatement(select_query);
			pstmt.setInt(1, id);
		//	System.out.println("hi:"+id);
		ResultSet rs=pstmt.executeQuery();
		while(rs.next())
		{
			pojo.setBookNo(rs.getInt(1));
			pojo.setDate(rs.getString(2));
			pojo.setCat_id(rs.getInt(3));			
			pojo.setBookName(rs.getString(4));
			pojo.setAuthorName(rs.getString(5));
			pojo.setPublisherName(rs.getString(6));
			pojo.setEdition(rs.getString(7));
			pojo.setPrice(rs.getInt(8));
			pojo.setCupboardNo(rs.getString(9));
			pojo.setQuantity(rs.getInt(10));
			pojo.setLanguage(rs.getString(11));
			list.add(pojo);
			
		}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public int searchBook(AddBookPOJO adb) {
		// TODO Auto-generated method stub
		return 0;
	}
	public List searchBookDetails(String bookDetail){
		List list=new ArrayList();
		ResultSet rs=null;
		
		try {
			// by author name
			System.out.println("1");
			String query2="select `book_no`,`book_name`,`author_name` from book_info_master where author_name LIKE '%"+bookDetail+"%'";
			PreparedStatement ps2=(PreparedStatement) connection.prepareStatement(query2);
			rs=ps2.executeQuery();
			
			if(!rs.isBeforeFirst()){
				// by book name
				System.out.println("2");
				String query1="select `book_no`,`book_name`,`author_name` from book_info_master where book_name LIKE '%"+bookDetail+"%'";
				PreparedStatement ps1=(PreparedStatement) connection.prepareStatement(query1);
				rs=ps1.executeQuery();
				
				if(!rs.isBeforeFirst()){
					// by book no
					System.out.println("3");
					String query="select `book_no`,`book_name`,`author_name` from book_info_master where book_no LIKE '%"+bookDetail+"%'";
					PreparedStatement ps;
					ps = (PreparedStatement) connection.prepareStatement(query);
					rs=ps.executeQuery();
					System.out.println("@@@@@@@@@");
				}
			}

			
			while(rs.next())
			{
				list.add(rs.getInt(1));
			    list.add(rs.getString(2));
				list.add((rs.getString(3)));
				
			}
				
				System.out.println("list "+list);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	@Override
	public List searchStudDetails(String studDetail) {
		List list1=new ArrayList();
		ResultSet rs=null;
		
		try {
			// by author name
			System.out.println("Search by Name");
			String query2="SELECT student_details.id, student_details.name, std_master.name, div_master.division FROM student_details, std_master, div_master, class_allocation WHERE student_details.id=class_allocation.student_id AND class_allocation.standard_id=std_master.id AND class_allocation.division_id=div_master.id AND student_details.name LIKE '%"+studDetail+"%'";
			PreparedStatement ps2=(PreparedStatement) connection.prepareStatement(query2);
			//System.out.println("SearchStudent*********");
			rs=ps2.executeQuery();
			
			if(!rs.isBeforeFirst()){
				// by book name
				System.out.println("By Icard");
				//String query1="SELECT id_master.icard_no,student_details.name,std_master.name,div_master.division  FROM id_master,student_details,std_master,div_master,class_allocation WHERE student_details.id=class_allocation.student_id AND class_allocation.division_id=div_master.id AND  class_allocation.standard_id=std_master.id AND  id_master.icard_no  LIKE '%"+studDetail+"%'";
				String query1="SELECT id_master.icard_no,student_details.name,std_master.name,div_master.division FROM id_master, student_details, std_master, div_master WHERE id_master.student_id=student_details.id AND id_master.standard_id=std_master.id AND id_master.division_id=div_master.id AND id_master.icard_no LIKE '%"+studDetail+"%'";
				PreparedStatement ps1=(PreparedStatement) connection.prepareStatement(query1);
				rs=ps1.executeQuery();
			}

			
			while(rs.next())
			{
				list1.add(rs.getInt(1));
			    list1.add(rs.getString(2));
				list1.add((rs.getString(3)));
				list1.add((rs.getString(4)));
				
			}
				
				System.out.println("list "+list1);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return list1;

	}
	@Override
	// For insert issue books......................
	public int insertIssueBook(IssueBookPOJO pojo) throws SQLException {
		String query="insert into issue_book(book_no,book_name,user_type,user_name,issue_date,due_date) values(?,?,?,?,?,?)";
		PreparedStatement ps=connection.prepareStatement(query);
	    ps.setInt(1, pojo.getBookNo());
		ps.setString(2, pojo.getBookName());
		ps.setString(3, pojo.getUserType());
		ps.setString(4, pojo.getUserName());
		ps.setString(5, pojo.getIssueDate());
		ps.setString(6, pojo.getDueDate());
		
	///	System.out.println(pojo.getBookNo()+"@@@@@@@@@@@@@@@@@@@@*******");
		//System.out.println("*************");
		int st=ps.executeUpdate();
	//	System.out.println("@@@@@@@@@@@"+st);
		return st;
	}
	@Override
	public List<IssueBookPOJO> getIssueBookDetails() {
		List<IssueBookPOJO> list=new ArrayList<IssueBookPOJO>();
		 SysDate sd=new SysDate();
		//String query="select * from issue_book where issue_book.issue_date="+sd.todayDate().split("-")[2]+"-"+sd.todayDate().split("-")[1]+"-"+sd.todayDate().split("-")[0]+"'";
		String query="select * from issue_book where issue_date='"+sd.todayDate().split("-")[0]+"-"+sd.todayDate().split("-")[1]+"-"+sd.todayDate().split("-")[2]+"'ORDER BY issue_book.id DESC";
		PreparedStatement ps;
		try {
			ps = (PreparedStatement) connection.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				IssueBookPOJO pojo=new IssueBookPOJO();
				
				//bcp.setCatName(rs.getString("cat_type"));
				pojo.setBookNo(rs.getInt("book_no"));
				pojo.setBookName(rs.getString("book_name"));
				pojo.setUserType(rs.getString("user_type"));
				pojo.setUserName(rs.getString("user_name"));
				pojo.setIssueDate(rs.getString("issue_date"));
				pojo.setDueDate(rs.getString("due_date"));
				
				list.add(pojo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;

	}
	
	public List<IssueBookPOJO> getIssueBookList(String query) {
		List<IssueBookPOJO> list=new ArrayList<IssueBookPOJO>();
		 SysDate sd=new SysDate();
		 
		//String query="select * from issue_book where issue_book.issue_date="+sd.todayDate().split("-")[2]+"-"+sd.todayDate().split("-")[1]+"-"+sd.todayDate().split("-")[0]+"'";
		//String query="SELECT *FROM issue_book WHERE  issue_date >= '"+issueDate+"' AND  due_date <= '"+dueDate+"'";
		PreparedStatement ps;
		//System.out.println("************"+query);
		try {
			ps = (PreparedStatement) connection.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				IssueBookPOJO pojo=new IssueBookPOJO();
				
				//bcp.setCatName(rs.getString("cat_type"));
				pojo.setBookNo(rs.getInt("book_no"));
				pojo.setBookName(rs.getString("book_name"));
				pojo.setUserType(rs.getString("user_type"));
				pojo.setUserName(rs.getString("user_name"));
				pojo.setIssueDate(rs.getString("issue_date"));
				pojo.setDueDate(rs.getString("due_date"));
				
				list.add(pojo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}System.out.println("*******************"+list);
		return list;

	}
}

