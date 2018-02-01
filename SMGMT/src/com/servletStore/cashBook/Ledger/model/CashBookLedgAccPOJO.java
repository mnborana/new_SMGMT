package com.servletStore.cashBook.Ledger.model;

public class CashBookLedgAccPOJO {
	int id,cashBookId;
	String accountName,cashBookName,accountType;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCashBookId() {
		return cashBookId;
	}
	public void setCashBookId(int cashBookId) {
		this.cashBookId = cashBookId;
	}
	public String getAccountType() {
		return accountType;
	}
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public String getCashBookName() {
		return cashBookName;
	}
	public void setCashBookName(String cashBookName) {
		this.cashBookName = cashBookName;
	}
	
	

}
