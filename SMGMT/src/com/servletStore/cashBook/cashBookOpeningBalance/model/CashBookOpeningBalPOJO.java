package com.servletStore.cashBook.cashBookOpeningBalance.model;

public class CashBookOpeningBalPOJO {

	int id;
	String cashBook,bank;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCashBook() {
		return cashBook;
	}
	public void setCashBook(String cashBook) {
		this.cashBook = cashBook;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
}
