package com.servletStore.cashBook.cashBookOpeningBalance.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;

public class CashBookOpeningBalIMPL implements CashBookOpeningBalDAO{

	DBConnection conn=new DBConnection();
	Connection connection=conn.getConnection();
	PreparedStatement pstmt=null;
	
	@Override
	public List<CashBookOpeningBalPOJO> getCashBookList() {
		List<CashBookOpeningBalPOJO> list=new ArrayList<>();
		
		String selectCashBookList="SELECT cashbook_list_master.id,cashbook_list_master.name FROM cashbook_list_master";
		try {
			pstmt = connection.prepareStatement(selectCashBookList);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				CashBookOpeningBalPOJO pojo=new CashBookOpeningBalPOJO();
				pojo.setId(rs.getInt(1));
				pojo.setCashBook(rs.getString(2));
				list.add(pojo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public List<CashBookOpeningBalPOJO> getBankList() {
		
		List<CashBookOpeningBalPOJO> list1=new ArrayList<>();
		
		String selectBankList="SELECT bank_master.id,bank_master.alias_name FROM bank_master";
		try {
			pstmt = connection.prepareStatement(selectBankList);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				CashBookOpeningBalPOJO pojo=new CashBookOpeningBalPOJO();
				pojo.setId(rs.getInt(1));
				pojo.setBank(rs.getString(2));
				list1.add(pojo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list1;
	}

}
