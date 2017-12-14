package com.servletStore.library.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;
import com.servletStore.campus.model.CampusPojo;

public class BookCatImpl  implements BookDAO{

	
	DBConnection dbConnect = new DBConnection();
	Connection connection;
	public BookCatImpl()
	{
		connection=dbConnect.getConnection();
		
	}

	@Override

	public int insertCategory(String catName) throws SQLException {
	
		String query="insert into book_category(cat_type) values(?)";
		PreparedStatement ps=(PreparedStatement) connection.prepareStatement(query);
		ps.setString(1, catName);
		
		int st=ps.executeUpdate();
		
		return st;
	}

	@Override
	public List<BookCatPojo> getCategoryDetails() throws SQLException {
		
		
		List<BookCatPojo> list=new ArrayList<BookCatPojo>();
		//String query="select * from campus;";
		String query="SELECT cat_id,cat_type FROM `book_category` ";
	
		PreparedStatement ps=(PreparedStatement) connection.prepareStatement(query);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			BookCatPojo bcp=new BookCatPojo();
			bcp.setId(rs.getInt("cat_id"));
			bcp.setCatName(rs.getString("cat_type"));
			
			list.add(bcp);
			//System.out.println(list);
		}

		return list;
	}
		
	

}
