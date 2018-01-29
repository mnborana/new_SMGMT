/**
 * 	  Author : SARANG KAMBLE
 * 	Document : FeesCollectionPOJO.java
 *		Date : 22-Jan-2018
 * 		Time : 4:17:57 PM
 */
package com.servletStore.fees.feescollection.model;

/**
 * @author sarang
 *
 */
public class FeesCollectionPOJO {
	
	private int classRoomMasterId;
	
	private String stdName;
	
	private String divName;
	
	private String shift;
	
	//***********  Fees Collection ******************
	
	private String stdId;
	private String studId;
	private String remainingFees;
	private String paidFees;
	private String currentDate;
	private String checkboxCashbook;
	private String paymentMode;
	
	
	
	public int getClassRoomMasterId() {
		return classRoomMasterId;
	}

	public void setClassRoomMasterId(int classRoomMasterId) {
		this.classRoomMasterId = classRoomMasterId;
	}

	public String getStdName() {
		return stdName;
	}

	public void setStdName(String stdName) {
		this.stdName = stdName;
	}

	public String getDivName() {
		return divName;
	}

	public void setDivName(String divName) {
		this.divName = divName;
	}

	public String getShift() {
		return shift;
	}

	public void setShift(String shift) {
		this.shift = shift;
	}

	public String getStdId() {
		return stdId;
	}

	public void setStdId(String stdId) {
		this.stdId = stdId;
	}

	public String getStudId() {
		return studId;
	}

	public void setStudId(String studId) {
		this.studId = studId;
	}

	public String getRemainingFees() {
		return remainingFees;
	}

	public void setRemainingFees(String remainingFees) {
		this.remainingFees = remainingFees;
	}

	public String getPaidFees() {
		return paidFees;
	}

	public void setPaidFees(String paidFees) {
		this.paidFees = paidFees;
	}

	public String getCurrentDate() {
		return currentDate;
	}

	public void setCurrentDate(String currentDate) {
		this.currentDate = currentDate;
	}

	public String getCheckboxCashbook() {
		return checkboxCashbook;
	}

	public void setCheckboxCashbook(String checkboxCashbook) {
		this.checkboxCashbook = checkboxCashbook;
	}

	public String getPaymentMode() {
		return paymentMode;
	}

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}

}
