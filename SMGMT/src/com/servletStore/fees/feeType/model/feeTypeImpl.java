package com.servletStore.fees.feeType.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;
import com.servletStore.library.model.AddBookPOJO;

public class feeTypeImpl implements feeTypeDAO {
	DBConnection dbConnect = new DBConnection();
	Connection connection=dbConnect.getConnection();
	PreparedStatement pstmt=null;
	
	@Override
	public int insertFeeType(feeTypePOJO pojo) throws SQLException {
		System.out.println("insert");
		String query="insert into fee_type(fees_type, fees, term_1,term_2,caste) values(?,?,?,?,?)";
		pstmt=connection.prepareStatement(query);
		pstmt.setString(1, pojo.getFeesType());
		pstmt.setInt(2, pojo.getFees());
		pstmt.setInt(3, pojo.getFirstTerm());
		pstmt.setInt(4, pojo.getSecondTerm());
		pstmt.setInt(5, pojo.getCaste());
		int status=pstmt.executeUpdate();
		return status;
	}
	@Override
	public List<feeTypePOJO> getFeeType() throws SQLException {
		List<feeTypePOJO> list=new ArrayList<feeTypePOJO>();
		String sql="select id,fees_type,fees,term_1,term_2,caste from fee_type";
		pstmt=connection.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
		while(rs.next())
		{
			feeTypePOJO pojo=new feeTypePOJO();
			pojo.setId(rs.getInt(1));
			pojo.setFeesType(rs.getString(2));
			pojo.setFees(rs.getInt(3));
			pojo.setFirstTerm(rs.getInt(4));
			pojo.setSecondTerm(rs.getInt(5));
			list.add(pojo);
		}
		return list;
	}
	@Override
	public void deleteFeeType(int id) throws SQLException {
		System.out.println("id is:"+id);
		String sql="DELETE FROM fee_type WHERE fee_type.id="+id+"";
		pstmt=connection.prepareStatement(sql);
	//	pstmt.setInt(1, id);
		pstmt.executeUpdate();
	}
	
	
}
