package com.servletStore.library.model;

import java.sql.Date;
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

public int changeStatus(int bookdetails_id) throws SQLException;

public List<IssueBookPOJO> getIssueBookDetails() throws SQLException;

public List<IssueBookPOJO> getIssueBookList(String query);

public List searchBookInfo(String bookDetail, String bookName, String authorName);

public int getId(int studId)throws SQLException;

public int getMaxBookInfoMaster() throws SQLException;

int insertBookDetails(int bNo) throws SQLException;

public List getDatewiseIssueList(String date1,String date2) throws SQLException;

public int daysCount(Object todayDate, Object dueDate) throws SQLException;

public List getReturnBookDetails(String returnBookDetails) throws SQLException;

public int getStudId(String grNo, String firstName, String std, String div, String shift, String lastName)throws SQLException;

public List getStudentId(int bookId)throws SQLException;

public int changeStatusReturn(int id) throws SQLException;

public List getStudent(int id) throws SQLException;



//Library Fine
public int insertFine(SetFinePOJO pojo) throws SQLException;
public SetFinePOJO getFineDetails();
public void updateFineDetails(SetFinePOJO sp);
public int getFine() throws SQLException;
public int insertFineDetails(FineMasterPOJO pojo) throws SQLException;
public List<FineMasterPOJO> getFineMaster() throws SQLException; 

public int updateRenewBook(FineMasterPOJO pojo, String date) throws SQLException;

public int getDate(FineMasterPOJO pojo) throws SQLException;

public int getPreviousFine(String studentId) throws SQLException;

}
