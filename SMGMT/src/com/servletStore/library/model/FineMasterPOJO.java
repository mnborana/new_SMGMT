package com.servletStore.library.model;

public class FineMasterPOJO {
private int id,dueDays,fineAmount,discount,finePaidAmount,remainingFine,studId,issueId;

public int getStudId() {
	return studId;
}

public void setStudId(int studId) {
	this.studId = studId;
}

public int getIssueId() {
	return issueId;
}

public void setIssueId(int issueId) {
	this.issueId = issueId;
}

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public int getDueDays() {
	return dueDays;
}

public void setDueDays(int dueDays) {
	this.dueDays = dueDays;
}

public int getFineAmount() {
	return fineAmount;
}

public void setFineAmount(int fineAmount) {
	this.fineAmount = fineAmount;
}

public int getDiscount() {
	return discount;
}

public void setDiscount(int discount) {
	this.discount = discount;
}

public int getFinePaidAmount() {
	return finePaidAmount;
}

public void setFinePaidAmount(int finePaidAmount) {
	this.finePaidAmount = finePaidAmount;
}

public int getRemainingFine() {
	return remainingFine;
}

public void setRemainingFine(int remainingFine) {
	this.remainingFine = remainingFine;
}
}
