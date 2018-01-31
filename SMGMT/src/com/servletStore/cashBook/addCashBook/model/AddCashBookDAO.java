package com.servletStore.cashBook.addCashBook.model;

import java.util.List;

public interface AddCashBookDAO  {
	public int insertCashBookName(AddCashBookPOJO pojo,String schoolId);
	public List fetchCashBookDetails();

}
