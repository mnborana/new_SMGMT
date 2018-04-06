package com.servletStore.library.model;

public class IssueBookPOJO {
private int bookId,studId,staffId;
private String issueDate,dueDate,returnDate, bookName, studName, staffName,userType,authorName,edition,std,divi,remark;
public String getRemark() {
	return remark;
}
public void setRemark(String remark) {
	this.remark = remark;
}
public String getAuthorName() {
	return authorName;
}
public void setAuthorName(String authorName) {
	this.authorName = authorName;
}
public String getEdition() {
	return edition;
}
public void setEdition(String edition) {
	this.edition = edition;
}
public String getStd() {
	return std;
}
public void setStd(String std) {
	this.std = std;
}
public String getDivi() {
	return divi;
}
public void setDivi(String divi) {
	this.divi = divi;
}
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
@Override
public String toString() {
	return "IssueBookPOJO [bookId=" + bookId + ", studId=" + studId
			+ ", staffId=" + staffId + ", issueDate=" + issueDate
			+ ", dueDate=" + dueDate + ", returnDate=" + returnDate
			+ ", bookName=" + bookName + ", studName=" + studName
			+ ", staffName=" + staffName + "]";
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
public String getUserType() {
	return userType;
}
public void setUserType(String userType) {
	this.userType = userType;
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
public String getBookName() {
	return bookName;
}
public void setBookName(String bookName) {
	this.bookName = bookName;
}
public String getStudName() {
	return studName;
}
public void setStudName(String studName) {
	this.studName = studName;
}
public String getStaffName() {
	return staffName;
}
public void setStaffName(String staffName) {
	this.staffName = staffName;
}


}