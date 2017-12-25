package com.servletStore.library.model;

import java.sql.SQLException;
import java.util.List;

public interface AddBookDAO {
public int insertBook(AddBookPOJO adbk) throws SQLException;

public List<AddBookPOJO> getBookDetails() throws SQLException;

public void deleteCategory(int bookNo);

public int updateBook(AddBookPOJO ad);

public List selectBookInfo(AddBookPOJO pojo,int bookId);

public List searchBookDetails(String bookDetail);

public List searchStudDetails(String studDetail);

public int insertIssueBook(IssueBookPOJO pojo) throws SQLException;

public List<IssueBookPOJO> getIssueBookDetails() throws SQLException;

public List<IssueBookPOJO> getIssueBookList(String query);

public List searchBookInfo(String bookDetail);

public int getMaxBookInfoMaster() throws SQLException;

int insertBookDetails(int bNo) throws SQLException;
}
