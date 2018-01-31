package com.servletStore.cashBook.subAccount.model;

public class SubAccountPOJO {

	int cashBookId,id,ledgerId;
	String subAccountName,cashBook,LedgerName;
	public int getCashBookId() {
		return cashBookId;
	}
	public void setCashBookId(int cashBookId) {
		this.cashBookId = cashBookId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getLedgerId() {
		return ledgerId;
	}
	public void setLedgerId(int ledgerId) {
		this.ledgerId = ledgerId;
	}
	public String getSubAccountName() {
		return subAccountName;
	}
	public void setSubAccountName(String subAccountName) {
		this.subAccountName = subAccountName;
	}
	public String getCashBook() {
		return cashBook;
	}
	public void setCashBook(String cashBook) {
		this.cashBook = cashBook;
	}
	public String getLedgerName() {
		return LedgerName;
	}
	public void setLedgerName(String ledgerName) {
		LedgerName = ledgerName;
	}
	
	
}
