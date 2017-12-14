package com.servletStore.library.model;

public class BookCatPojo 
{
	private int id;
	private String cat_type;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCatName() {
		return cat_type;
	}
	public void setCatName(String catName) {
		this.cat_type = catName;
	}

}
