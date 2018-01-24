package com.servletStore.fees.feeType.model;

import java.sql.SQLException;
import java.util.List;

public interface FeeTypeDAO {
 public int insertFeeType(FeeTypePOJO pojo) throws SQLException;
  
 public List<FeeTypePOJO> getFeeType() throws SQLException; 
 
 public int updateFeesType(FeeTypePOJO pojo) throws SQLException;
 
 public List selectFeesById(int id) throws SQLException;
 
 public void deleteFeeType(int id) throws SQLException;
 
 
 
}
