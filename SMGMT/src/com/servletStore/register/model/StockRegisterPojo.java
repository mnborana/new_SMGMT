package com.servletStore.register.model;

public class StockRegisterPojo {
	int id,noOfItems,voucherNo;
	String requireddate,itemName,itemAmt,deductionAmt,percentage,totalAmt,description,trustyName,schoolName,schoolAddress;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getNoOfItems() {
		return noOfItems;
	}
	public void setNoOfItems(int noOfItems) {
		this.noOfItems = noOfItems;
	}
	public int getVoucherNo() {
		return voucherNo;
	}
	public void setVoucherNo(int voucherNo) {
		this.voucherNo = voucherNo;
	}
	public String getRequireddate() {
		return requireddate;
	}
	public void setRequireddate(String requireddate) {
		this.requireddate = requireddate;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getItemAmt() {
		return itemAmt;
	}
	public void setItemAmt(String itemAmt) {
		this.itemAmt = itemAmt;
	}
	public String getDeductionAmt() {
		return deductionAmt;
	}
	public void setDeductionAmt(String deductionAmt) {
		this.deductionAmt = deductionAmt;
	}
	public String getPercentage() {
		return percentage;
	}
	public void setPercentage(String percentage) {
		this.percentage = percentage;
	}
	public String getTotalAmt() {
		return totalAmt;
	}
	public void setTotalAmt(String totalAmt) {
		this.totalAmt = totalAmt;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
		
	}
	public String getTrustyName() {
		return trustyName;
	}
	public void setTrustyName(String trustyName) {
		this.trustyName = trustyName;
	}
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	public String getSchoolAddress() {
		return schoolAddress;
	}
	public void setSchoolAddress(String schoolAddress) {
		this.schoolAddress = schoolAddress;
	}

}
