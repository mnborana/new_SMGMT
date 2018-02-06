package com.servletStore.report.libraryReport.model;

import java.util.List;

public interface LibraryReportDAO {
 public List<Object> getBookCategory();
 
 public List<Object> getBookName(int catId);
}