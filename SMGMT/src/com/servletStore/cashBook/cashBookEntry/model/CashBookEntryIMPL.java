package com.servletStore.cashBook.cashBookEntry.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;

public class CashBookEntryIMPL implements CashBookEntryDAO{

	DBConnection conn=new DBConnection();
	Connection connection=conn.getConnection();
	PreparedStatement pstmt=null;
	@Override
	public List<CashBookEntryPOJO> selectCashBook() {
		List<CashBookEntryPOJO> list=new ArrayList<>();
		String selectCashbook="SELECT cashbook_list_master.id,cashbook_list_master.name FROM cashbook_list_master";
		try {
			pstmt = connection.prepareStatement(selectCashbook);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				CashBookEntryPOJO pojo=new CashBookEntryPOJO();
				pojo.setId(rs.getInt(1));
				pojo.setCashbook(rs.getString(2));
				list.add(pojo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	@Override
	public List<CashBookEntryPOJO> selectLedger() {
	List<CashBookEntryPOJO> list1=new ArrayList<>();
	String selectLedger="SELECT cashbook_ledger.id,cashbook_ledger.account_name FROM cashbook_ledger";
	try {
		pstmt = connection.prepareStatement(selectLedger);
		ResultSet rs=pstmt.executeQuery();
		while(rs.next())
		{
			CashBookEntryPOJO pojo=new CashBookEntryPOJO();
			pojo.setId(rs.getInt(1));
			pojo.setLedgerName(rs.getString(2));
			list1.add(pojo);
		}
	} catch (Exception e) {
		// TODO: handle exception
	}
		return list1;
	}
	@Override
	public List<CashBookEntryPOJO> selectSubAccount() {
		List<CashBookEntryPOJO> list2=new ArrayList<>();
		String selectSubAccount="SELECT cashbook_sub_account.id,cashbook_sub_account.name FROM cashbook_sub_account";
		try {
			pstmt = connection.prepareStatement(selectSubAccount);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				CashBookEntryPOJO pojo=new CashBookEntryPOJO();
				pojo.setId(rs.getInt(1));
				pojo.setSubAccountName(rs.getString(2));
				list2.add(pojo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list2;
	}
	@Override
	public CashBookEntryPOJO selectAccountType(String accountType) {
		
		CashBookEntryPOJO pojo=new CashBookEntryPOJO();
		String selectAccountType="SELECT cashbook_ledger.account_type FROM cashbook_ledger WHERE cashbook_ledger.id="+accountType+"";
		try {
			pstmt = connection.prepareStatement(selectAccountType);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				
				pojo.setCbStatus(rs.getInt(1));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return pojo;
	}
	@Override
	public int insertCashbookDetails(CashBookEntryPOJO pojo) {
		List<CashBookEntryPOJO> list=new ArrayList<>();
		int bankId=pojo.getBankId();
		System.out.println("bank id:"+bankId);
		//System.out.println("cashbook id:"+pojo.getCashBookId()+"\nledgerId:"+pojo.getLedgerId()+"\nsubAccountId:"+pojo.getSubAccountId()+"\naccount type:"+pojo.getCbStatus()+"\ntransction type:"+pojo.getTransctionType()+"\nreqDate :"+pojo.getReqDate()+"\ncreditAmount:"+pojo.getCreditAmount()+"\ndebitAmount:"+pojo.getDebitAmount()+"\ndescription:"+pojo.getDescription());
		if(bankId==0)
		{
			
		String insertCashbookDetails="INSERT INTO `cashbook_entry`(`cashbook_id`, `ledger_id`, `sub_account_id`, `cb_status`, `transcrion_type`, `date`,`debit_amount`, `credit_amount`, `description`) VALUES (?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = connection.prepareStatement(insertCashbookDetails);
			pstmt.setInt(1, pojo.getCashBookId());
			pstmt.setInt(2, pojo.getLedgerId());
			pstmt.setInt(3, pojo.getSubAccountId());
			pstmt.setInt(4, pojo.getCbStatus());
			pstmt.setInt(5, pojo.getTransctionType());
			pstmt.setString(6, pojo.getReqDate());
			pstmt.setString(7, pojo.getDebitAmount());
			pstmt.setString(8, pojo.getCreditAmount());
			pstmt.setString(9, pojo.getDescription());			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
		}
		else
		{
			String insertCashbookDetails="INSERT INTO `cashbook_entry`(`cashbook_id`, `ledger_id`, `sub_account_id`, `cb_status`, `transcrion_type`, `date`, `bank_id`, `debit_amount`, `credit_amount`, `description`) VALUES (?,?,?,?,?,?,?,?,?,?)";
			try {
				pstmt = connection.prepareStatement(insertCashbookDetails);
				pstmt.setInt(1, pojo.getCashBookId());
				pstmt.setInt(2, pojo.getLedgerId());
				pstmt.setInt(3, pojo.getSubAccountId());
				pstmt.setInt(4, pojo.getCbStatus());
				pstmt.setInt(5, pojo.getTransctionType());
				pstmt.setString(6, pojo.getReqDate());
				pstmt.setInt(7, pojo.getBankId());
				pstmt.setString(8, pojo.getDebitAmount());
				pstmt.setString(9, pojo.getCreditAmount());
				pstmt.setString(10, pojo.getDescription());			
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			return 0;
		}
	}

}
