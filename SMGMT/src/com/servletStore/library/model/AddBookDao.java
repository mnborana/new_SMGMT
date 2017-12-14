package com.servletStore.library.model;

import java.sql.SQLException;
import java.util.List;

public interface AddBookDao {
public int insertBook(AddBookPojo adbk) throws SQLException;

public List<AddBookPojo> getBookDetails() throws SQLException;

public void deleteCategory(int bookNo);

public int updateBook(AddBookPojo ad);

public List selectBookInfo(AddBookPojo pojo,int bookId);


}
