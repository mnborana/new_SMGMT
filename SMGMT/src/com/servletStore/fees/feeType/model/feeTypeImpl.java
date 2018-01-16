package com.servletStore.fees.feeType.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.dbconnect.DBConnection;
import com.servletStore.library.model.AddBookPOJO;

public class feeTypeImpl implements feeTypeDAO {
	DBConnection dbConnect = new DBConnection();
	static Connection connection;
	PreparedStatement pstmt=null;
	public feeTypeImpl()
	{
		connection=dbConnect.getConnection();
	}
	@Override
	public int insertFeeType(feeTypePOJO pojo) throws SQLException {
		System.out.println("insert");
		String query="insert into fee_type(fees_type, fees, term_1,term_2) values(?,?,?,?)";
		pstmt=connection.prepareStatement(query);
		pstmt.setString(1, pojo.getFeesType());
		pstmt.setInt(2, pojo.getFees());
		pstmt.setInt(3, pojo.getFirstTerm());
		pstmt.setInt(4, pojo.getSecondTerm());
		int status=pstmt.executeUpdate();
		return status;
	}
	@Override
	public List<feeTypePOJO> getFeeType() throws SQLException {
		
		return null;
	}
	
	
}
