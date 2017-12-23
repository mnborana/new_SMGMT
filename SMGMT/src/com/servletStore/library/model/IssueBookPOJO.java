package com.servletStore.library.model;

public class IssueBookPOJO {
private int bookId,studId,staffId;
private String issueDate,dueDate,returnDate;
public int getBookId() {
	return bookId;
}
public void setBookId(int bookId) {
	this.bookId = bookId;
}
public int getStudId() {
	return studId;
}
public void setStudId(int studId) {
	this.studId = studId;
}
public int getStaffId() {
	return staffId;
}
public void setStaffId(int staffId) {
	this.staffId = staffId;
}
public String getIssueDate() {
	return issueDate;
}
public void setIssueDate(String issueDate) {
	this.issueDate = issueDate;
}
public String getDueDate() {
	return dueDate;
}
public void setDueDate(String dueDate) {
	this.dueDate = dueDate;
}
public String getReturnDate() {
	return returnDate;
}
public void setReturnDate(String returnDate) {
	this.returnDate = returnDate;
}
}