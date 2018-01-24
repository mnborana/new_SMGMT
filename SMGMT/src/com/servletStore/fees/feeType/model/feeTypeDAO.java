package com.servletStore.fees.feeType.model;

import java.sql.SQLException;
import java.util.List;

public interface feeTypeDAO {
 public int insertFeeType(feeTypePOJO pojo) throws SQLException;
  
 public List<feeTypePOJO> getFeeType() throws SQLException; 
 
 public int updateFeesType(feeTypePOJO pojo) throws SQLException;
 
 public List selectFeesById(int id) throws SQLException;
 
 public void deleteFeeType(int id) throws SQLException;
 
 
}
