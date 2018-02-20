package com.servletStore.cashBook.Ledger.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;

public class CashBookLedgAccIMPL implements CashBookLedgAccDAO {

	DBConnection conn=new DBConnection();
	Connection connection=conn.getConnection();
	PreparedStatement pstmt=null;
	
	@Override
	public List<CashBookLedgAccPOJO> selectCashBook() {
		List<CashBookLedgAccPOJO> list=new ArrayList<>();
		String selectCashBook="SELECT cashbook_list_master.id,cashbook_list_master.name FROM cashbook_list_master";
		try {
			pstmt = connection.prepareStatement(selectCashBook);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				CashBookLedgAccPOJO pojo=new CashBookLedgAccPOJO();
				pojo.setCashBookId(rs.getInt(1));
				pojo.setCashBookName(rs.getString(2));
				list.add(pojo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public void insertLedgerAccount(CashBookLedgAccPOJO pojo) {
		System.out.println("hiii");
		//System.out.println(pojo.getCashBookId()+"\n"+pojo.accountName+"\n"+pojo.getAccountType());
		try {
			String insertQuery="INSERT INTO cashbook_ledger(cashbook_ledger.cashbook_id,cashbook_ledger.account_name,cashbook_ledger.account_type) VALUES(?,?,?)";
			
			System.out.println(pojo.getCashBookId()+"\n"+pojo.accountName+"\n"+pojo.getAccountType());

			pstmt=connection.prepareStatement(insertQuery);
			pstmt.setInt(1, pojo.getCashBookId());
			pstmt.setString(2, pojo.getAccountName());
			pstmt.setString(3, pojo.getAccountType());
			pstmt.executeUpdate();
			System.out.println("hi");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

	@Override
	public List<CashBookLedgAccPOJO> selectLedgerAccount() {
		List<CashBookLedgAccPOJO> list3=new ArrayList<>();
		String selectLedgerAccount="SELECT cashbook_ledger.id,cashbook_list_master.name,cashbook_ledger.account_name,cashbook_ledger.account_type FROM cashbook_ledger,cashbook_list_master WHERE cashbook_ledger.cashbook_id=cashbook_list_master.id";
		try {
			pstmt = connection.prepareStatement(selectLedgerAccount);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				CashBookLedgAccPOJO pojo=new CashBookLedgAccPOJO();
				pojo.setId(rs.getInt(1));
				pojo.setCashBookName(rs.getString(2));
				pojo.setAccountName(rs.getString(3));
				pojo.setAccountType(rs.getString(4));
				list3.add(pojo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list3;
	}

}
