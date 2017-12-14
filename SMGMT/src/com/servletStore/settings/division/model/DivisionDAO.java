package com.servletStore.settings.division.model;

import java.sql.SQLException;
import java.util.List;

public interface DivisionDAO 
{

	public void insertDivisionDetails(DivisionPOJO division) throws SQLException;
}