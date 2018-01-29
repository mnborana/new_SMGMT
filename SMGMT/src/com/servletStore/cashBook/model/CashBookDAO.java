/**
 *   Author : HIMANSHU PATEL
 * Document : CashBookDAO.java
 *     Date : 23-Jan-2018
 *     Time : 10:44:55 AM
 * 
 */
package com.servletStore.cashBook.model;

public interface CashBookDAO {
	public void cashBookEnrty(String date, String particular,String lf,String cd_status,String cb_status,String debit,String creadit);
}
