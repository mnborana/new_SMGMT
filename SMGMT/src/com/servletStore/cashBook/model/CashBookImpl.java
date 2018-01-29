/**
 *   Author : HIMANSHU PATEL
 * Document : CashBookImpl.java
 *     Date : 23-Jan-2018
 *     Time : 10:45:52 AM
 * 
 */
package com.servletStore.cashBook.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.dbconnect.DBConnection;

public class CashBookImpl implements CashBookDAO {
	DBConnection con=new DBConnection();
	Connection connection=con.getConnection();
	PreparedStatement pstmt=null;
	
	@Override
	public void cashBookEnrty(String date, String particular, String lf, String cd_status, String cb_status,
			String debit, String credit ) {
		
		try {
			pstmt = connection.prepareStatement("INSERT INTO `cash_book_master`(`date`, `particular`, `lf`, `cd_status`, `cb_status`, `debit`, `creadit`)"
					+ "(?,?,?,?,?,?,?)");

			String[] entryDate=date.split("-");
			String entryDateString=entryDate[2]+"-"+entryDate[1]+"-"+entryDate[0];
			pstmt.setString(1, entryDateString);
			pstmt.setString(2, particular);
			pstmt.setString(3, lf);
			pstmt.setString(4, cd_status);
			pstmt.setString(5, cb_status);
			
			pstmt.setString(6, debit);
			pstmt.setString(7, credit);
			
			int cashBookQuery = 0;
			if (cashBookQuery > 0) {
				System.out.println("Cash Book Entry Inserted Successfully!");
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
