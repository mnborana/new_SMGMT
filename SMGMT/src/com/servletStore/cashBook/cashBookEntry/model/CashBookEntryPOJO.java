package com.servletStore.cashBook.cashBookEntry.model;

public class CashBookEntryPOJO {
	int id,cashBookId,ledgerId,SubAccountId,cbStatus,transctionType,bankId;
	String cashbook,ledgerName,subAccountName,reqDate,creditAmount,debitAmount,description;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCashbook() {
		return cashbook;
	}
	public void setCashbook(String cashbook) {
		this.cashbook = cashbook;
	}
	public String getLedgerName() {
		return ledgerName;
	}
	public void setLedgerName(String ledgerName) {
		this.ledgerName = ledgerName;
	}
	public String getSubAccountName() {
		return subAccountName;
	}
	public void setSubAccountName(String subAccountName) {
		this.subAccountName = subAccountName;
	}
	
	public String getReqDate() {
		return reqDate;
	}
	public void setReqDate(String reqDate) {
		this.reqDate = reqDate;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getCashBookId() {
		return cashBookId;
	}
	public void setCashBookId(int cashBookId) {
		this.cashBookId = cashBookId;
	}
	public int getLedgerId() {
		return ledgerId;
	}
	public void setLedgerId(int ledgerId) {
		this.ledgerId = ledgerId;
	}
	public int getSubAccountId() {
		return SubAccountId;
	}
	public void setSubAccountId(int subAccountId) {
		SubAccountId = subAccountId;
	}
	public int getCbStatus() {
		return cbStatus;
	}
	public void setCbStatus(int cbStatus) {
		this.cbStatus = cbStatus;
	}
	public int getTransctionType() {
		return transctionType;
	}
	public void setTransctionType(int transctionType) {
		this.transctionType = transctionType;
	}
	public int getBankId() {
		return bankId;
	}
	public void setBankId(int bankId) {
		this.bankId = bankId;
	}
	public String getCreditAmount() {
		return creditAmount;
	}
	public void setCreditAmount(String creditAmount) {
		this.creditAmount = creditAmount;
	}
	public String getDebitAmount() {
		return debitAmount;
	}
	public void setDebitAmount(String debitAmount) {
		this.debitAmount = debitAmount;
	}
	
	
	

}
