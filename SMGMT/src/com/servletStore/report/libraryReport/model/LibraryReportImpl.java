package com.servletStore.report.libraryReport.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;

public class LibraryReportImpl implements LibraryReportDAO {
		DBConnection connection=new DBConnection();
		Connection con=connection.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
	@Override
	public List<Object> getBookCategory() {
		List<Object> list=new ArrayList<Object>();
		LibraryReportPOJO pojo=new LibraryReportPOJO();
		try{
			String sql="SELECT book_category.cat_id,book_category.cat_type FROM book_category";
			ps=con.prepareStatement(sql);
			rs= ps.executeQuery();
			while(rs.next())
			{
				//pojo.setCatId(rs.getInt(1));
				/*pojo.setCatType(rs.getString(1));
				list.add(pojo);*/
				list.add((rs.getInt(1)));
				list.add(rs.getString(2));
			}
		}catch (SQLException e1) {
			e1.printStackTrace();
		}
		return list;
	}
	@Override
	public List<Object> getBookName(int catId) {
		List<Object> list = new ArrayList<Object>();
		try{
		String sql="SELECT book_info_master.book_no,book_info_master.book_name FROM book_info_master,book_category WHERE book_category.cat_id=book_info_master.cat_id AND book_info_master.cat_id="+catId;
		System.out.println("Query "+sql);
		
		ps=con.prepareStatement(sql);
		rs=ps.executeQuery();
		System.out.println("Executedd");
		while(rs.next())
		{
			list.add(rs.getInt(1)+","+rs.getString(2));
			//list.add(rs.getString(2));
		}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		System.out.println("List "+list);
		return list;
	}

}
