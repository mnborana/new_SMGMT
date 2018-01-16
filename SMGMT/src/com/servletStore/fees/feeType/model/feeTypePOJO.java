package com.servletStore.fees.feeType.model;

public class feeTypePOJO {
private String feesType;
private int id,fees,firstTerm,secondTerm,caste;
public int getCaste() {
	return caste;
}
public void setCaste(int caste) {
	this.caste = caste;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getFeesType() {
	return feesType;
}
public void setFeesType(String feesType) {
	this.feesType = feesType;
}
public int getFees() {
	return fees;
}
public void setFees(int fees) {
	this.fees = fees;
}
public int getFirstTerm() {
	return firstTerm;
}
public void setFirstTerm(int firstTerm) {
	this.firstTerm = firstTerm;
}
public int getSecondTerm() {
	return secondTerm;
}
public void setSecondTerm(int secondTerm) {
	this.secondTerm = secondTerm;
}
}
