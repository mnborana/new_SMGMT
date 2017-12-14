package com.servletStore.library.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;

public class AddBookImpl implements AddBookDao{
	DBConnection dbConnect = new DBConnection();
	static Connection connection;
	PreparedStatement pstmt=null;
	public AddBookImpl()
	{
		connection=dbConnect.getConnection();
		
	}
	@Override
	public int insertBook(AddBookPojo adbk) throws SQLException {
		System.out.println("***************************");
		String query="insert into book_info_master(cat_id,date,book_name,author_name,publisher_name,edition,price,cupboard_no,quantity,language) values(?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps=connection.prepareStatement(query);
	//	ps.setInt(1, adbk.getBookNo());
		ps.setInt(1, adbk.getCat_id());
		ps.setString(2, adbk.getDate());
		ps.setString(3, adbk.getBookName());
		ps.setString(4, adbk.getAuthorName());
		ps.setString(5, adbk.getPublisherName());
		ps.setInt(6, adbk.getEdition());
		ps.setInt(7, adbk.getPrice());
		ps.setInt(8, adbk.getCupboardNo());
		ps.setInt(9, adbk.getQuantity());
		ps.setString(10, adbk.getLanguage());
		System.out.println("Language"+adbk.getLanguage());
		int st=ps.executeUpdate();
		//System.out.println("@@@@@@@@@@@"+st);
		return st;
	}
	@Override
	public List<AddBookPojo> getBookDetails() throws SQLException {
		List<AddBookPojo> list=new ArrayList<AddBookPojo>();
		//String query="select * from campus;";
		String query="select `cat_id`,`date`,`book_no`,`book_name`,`author_name`,`publisher_name`,`edition`,`price`,`cupboard_no`,`quantity`,`language` from book_info_master";
	
		PreparedStatement ps=(PreparedStatement) connection.prepareStatement(query);
		
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			AddBookPojo addb=new AddBookPojo();
			
			//bcp.setCatName(rs.getString("cat_type"));
			addb.setCat_id(rs.getInt("cat_id"));
			addb.setDate(rs.getString("date"));
			addb.setBookNo(rs.getInt("book_no"));
			addb.setBookName(rs.getString("book_name"));
			addb.setAuthorName(rs.getString("author_name"));
			addb.setPublisherName(rs.getString("publisher_name"));
			addb.setEdition(rs.getInt("edition"));
			addb.setPrice(rs.getInt("price"));
			addb.setCupboardNo(rs.getInt("cupboard_no"));
			addb.setQuantity(rs.getInt("quantity"));
			addb.setLanguage(rs.getString("language"));


			
			list.add(addb);
		}

		return list;
	}
	public int updateBook(AddBookPojo ad) { 
		    int status=0;  
		   
		    String query="update book_info_master set date=?, book_name=?,author_name=?,publisher_name=?,edition=?,price=?,cupboard_no=?,quantity=?,language=? where book_no=?";
		   
		   
			try {
				System.out.println("hi");
				pstmt = connection.prepareStatement(query);
				
				pstmt.setString(1,ad.getDate());
				pstmt.setString(2,ad.getBookName());
				pstmt.setString(3, ad.getAuthorName());
				pstmt.setString(4, ad.getPublisherName());		         
				pstmt.setInt(5, ad.getEdition());
				pstmt.setInt(6,ad.getPrice());
		        pstmt.setInt(7, ad.getCupboardNo());
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
	public List selectBookInfo(AddBookPojo pojo,int id) {
		List<AddBookPojo> list=new ArrayList<AddBookPojo>();
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
			pojo.setEdition(rs.getInt(7));
			pojo.setPrice(rs.getInt(8));
			pojo.setCupboardNo(rs.getInt(9));
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
	public int searchBook(AddBookPojo adb) {
		// TODO Auto-generated method stub
		return 0;
	}

	}


