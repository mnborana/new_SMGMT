package com.servletStore.library.model;

import java.sql.Date;

public class AddBookPojo {
private String bookName,authorName,publisherName,language;
private int bookNo,edition,price,cupboardNo,quantity,cat_id;
private String date;
public int getCat_id() {
	return cat_id;
}
public void setCat_id(int cat_id) {
	//System.out.println(cat_id);
	this.cat_id = cat_id;
}

public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}


public String getLanguage() {
	return language;
}
public void setLanguage(String language) {
	this.language = language;
}
public int getBookNo() {
	return bookNo;
}
public void setBookNo(int bookNo) {
	this.bookNo = bookNo;
}
public int getEdition() {
	return edition;
}
public void setEdition(int edition) {
	this.edition = edition;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public int getCupboardNo() {
	return cupboardNo;
}
public void setCupboardNo(int cupboardNo) {
	this.cupboardNo = cupboardNo;
}
public String getBookName() {
	return bookName;
}
public void setBookName(String bookName) {
	this.bookName = bookName;
}
public String getAuthorName() {
	return authorName;
}
public void setAuthorName(String authorName) {
	this.authorName = authorName;
}
public String getPublisherName() {
	return publisherName;
}
public void setPublisherName(String publisherName) {
	this.publisherName = publisherName;
}
}
