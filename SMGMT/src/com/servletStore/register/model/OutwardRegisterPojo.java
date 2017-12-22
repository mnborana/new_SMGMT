package com.servletStore.register.model;

public class OutwardRegisterPojo {
	int id,outwardNo;
	String requireddate,receiverName,subject,address,description,outwardDoc;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOutwardNo() {
		return outwardNo;
	}
	public void setOutwardNo(int outwardNo) {
		this.outwardNo = outwardNo;
	}
	
	public String getRequireddate() {
		return requireddate;
	}
	public void setRequireddate(String requireddate) {
		this.requireddate = requireddate;
	}
	
	
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getOutwardDoc() {
		return outwardDoc;
	}
	public void setOutwardDoc(String outwardDoc) {
		this.outwardDoc = outwardDoc;
	}
	

}
