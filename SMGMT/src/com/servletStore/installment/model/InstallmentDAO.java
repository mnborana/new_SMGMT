package com.servletStore.installment.model;

import java.sql.SQLException;
import java.util.List;

import com.servletStore.library.model.AddBookPOJO;

public interface InstallmentDAO 
{
	public int insertInstallment(InstallmentPOJO pojo) throws SQLException;
	
	public List<InstallmentPOJO> getIntallmentDetails(int id) throws SQLException;
	public List<InstallmentPOJO> getIntallmentDetails() throws SQLException;
	
	public int updatInstallment(InstallmentPOJO pojo) throws SQLException;

}
