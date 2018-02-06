package com.servletStore.settings.bank.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;

public class AddBankIMPL implements AddBankDAO {

	DBConnection conn=new DBConnection();
	Connection connection=conn.getConnection();
	PreparedStatement pstmt=null;
	
	@Override
	public int insertBankDetails(AddBankPOJO pojo) {
		String insertQuery="INSERT INTO bank_master(bank_master.bank_name,bank_master.branch,bank_master.account_no,bank_master.alias_name) VALUES(?,?,?,?)";
		try {
			pstmt = connection.prepareStatement(insertQuery);
			pstmt.setString(1, pojo.getBankName());
			pstmt.setString(2, pojo.getBranch());
			pstmt.setString(3, pojo.getAccountNo());
			pstmt.setString(4, pojo.getAliasName());
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
	}

	@Override
	public List<AddBankPOJO> fetchBankDetails() {
		
		List<AddBankPOJO> list=new ArrayList<>();
		
		String selctQuery="SELECT bank_master.id,bank_master.bank_name,bank_master.branch,bank_master.account_no,bank_master.alias_name FROM bank_master";
		try {
			pstmt = connection.prepareStatement(selctQuery);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				AddBankPOJO pojo=new AddBankPOJO();
				pojo.setId(rs.getInt(1));
				pojo.setBankName(rs.getString(2));
				pojo.setBranch(rs.getString(3));
				pojo.setAccountNo(rs.getString(4));
				pojo.setAliasName(rs.getString(5));
				list.add(pojo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

}
