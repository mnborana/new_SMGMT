package com.servletStore.report.libraryReport.model;

public class LibraryReportPOJO {
private int catId;
private String catType;
public int getCatId() {
	return catId;
}
public void setCatId(int catId) {
	this.catId = catId;
}
public String getCatType() {
	return catType;
}
public void setCatType(String catType) {
	this.catType = catType;
}
public String toString()
{
	
	return "catType is" +catType;
	
}
}
