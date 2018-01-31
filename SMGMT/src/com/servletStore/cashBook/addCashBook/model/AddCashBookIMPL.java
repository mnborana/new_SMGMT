package com.servletStore.cashBook.addCashBook.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;

public class AddCashBookIMPL implements AddCashBookDAO{
	DBConnection conn=new DBConnection();
	Connection connection=conn.getConnection();
	PreparedStatement pstmt=null;
	@Override
	public int insertCashBookName(AddCashBookPOJO pojo,String schoolId) {
		String insertQuery="INSERT INTO cashbook_list_master(cashbook_list_master.name,cashbook_list_master.school_id) VALUES(?,?)";
		try {
			pstmt=connection.prepareStatement(insertQuery);
			pstmt.setString(1, pojo.getCashBookName());
			pstmt.setString(2, schoolId);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public List fetchCashBookDetails() {
		List list=new ArrayList<>();
		String fetchCashBookDetails="SELECT cashbook_list_master.id,cashbook_list_master.name FROM cashbook_list_master";
		try {
			pstmt=connection.prepareStatement(fetchCashBookDetails);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				AddCashBookPOJO pojo=new AddCashBookPOJO();
				pojo.setId(rs.getInt(1));
				pojo.setCashBookName(rs.getString(2));
				list.add(pojo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
