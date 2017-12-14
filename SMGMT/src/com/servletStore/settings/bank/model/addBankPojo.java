package com.servletStore.settings.bank.model;

public class addBankPojo 
{
    private int id;
	private String bankName;
	private String shortForm;
	
	public addBankPojo()
	{
		
	}
	
	public addBankPojo(String bankName,String shortForm)
	{
		this.bankName=bankName;
		this.shortForm=shortForm;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBankname() {
		return bankName;
	}
	public void setBankname(String bankname) {
		this.bankName = bankname;
	}
	public String getShortform() {
		return shortForm;
	}
	public void setShortform(String shortform) {
		this.shortForm = shortform;
	}
	
		
	
	
}
