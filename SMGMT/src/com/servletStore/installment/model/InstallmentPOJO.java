package com.servletStore.installment.model;

public class InstallmentPOJO {
	private int id,installment;
    private String modeName,date;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getModeName() {
		return modeName;
	}
	public void setModeName(String modeName) {
		this.modeName = modeName;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getInstallment() {
		return installment;
	}
	public void setInstallment(int installment) {
		this.installment = installment;
	}
	
}
