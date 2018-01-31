package com.servletStore.cashBook.subAccount.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;

public class SubAccountIMPL implements SubAccountDAO{
	DBConnection conn=new DBConnection();
	Connection connection=conn.getConnection();
	PreparedStatement pstmt=null;

	@Override
	public List<SubAccountPOJO> selectCashcBook() {
		List<SubAccountPOJO> list=new ArrayList<>();
		String selectCashBook="SELECT cashbook_list_master.id,cashbook_list_master.name FROM cashbook_list_master";
		try {
			pstmt = connection.prepareStatement(selectCashBook);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				SubAccountPOJO pojo=new SubAccountPOJO();
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
	public List<SubAccountPOJO> selectLedger() {
		List<SubAccountPOJO> list=new ArrayList<>();
		String selectLedger="SELECT cashbook_ledger.id,cashbook_ledger.account_name FROM cashbook_ledger";
		try {
			pstmt = connection.prepareStatement(selectLedger);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				SubAccountPOJO pojo=new SubAccountPOJO();
				pojo.setId(rs.getInt(1));
				pojo.setLedgerName(rs.getString(2));
				list.add(pojo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public int insertSubAccountDetails(SubAccountPOJO pojo) {
		int cash=pojo.getCashBookId();
		System.out.println("cash:"+cash);
		String insertSubAccount="INSERT INTO cashbook_sub_account(cashbook_sub_account.cashbook_id,cashbook_sub_account.ledger_id,cashbook_sub_account.name) VALUES(?,?,?)";
		try {
			pstmt = connection.prepareStatement(insertSubAccount);
			pstmt.setInt(1, pojo.getCashBookId());
			pstmt.setInt(2, pojo.getLedgerId());
			pstmt.setString(3, pojo.getSubAccountName());
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
	}

	@Override
	public List<SubAccountPOJO> fetchSubAccount() {
		List<SubAccountPOJO> list1=new ArrayList<>();
		String selectQuery="SELECT cashbook_sub_account.id,cashbook_list_master.name,cashbook_ledger.account_name,cashbook_sub_account.name FROM cashbook_sub_account,cashbook_list_master,cashbook_ledger WHERE cashbook_sub_account.cashbook_id=cashbook_list_master.id AND cashbook_sub_account.ledger_id=cashbook_ledger.id";
		try {
			pstmt = connection.prepareStatement(selectQuery);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				SubAccountPOJO pojo=new SubAccountPOJO();
				pojo.setId(rs.getInt(1));
				pojo.setCashBook(rs.getString(2));
				pojo.setLedgerName(rs.getString(3));
				pojo.setSubAccountName(rs.getString(4));
				list1.add(pojo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list1;
	}

}
