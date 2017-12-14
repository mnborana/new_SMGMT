package com.servletStore.library.model;

import java.sql.SQLException;
import java.util.List;

import com.servletStore.library.model.*;

public interface BookDAO
{
	public int insertCategory(String catName) throws SQLException;

	public List<BookCatPojo> getCategoryDetails() throws SQLException;

}
