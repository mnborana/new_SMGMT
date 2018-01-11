package com.servletStore.feeType.model;

import java.sql.SQLException;
import java.util.List;

public interface feeTypeDAO {
 public int insertFeeType(feeTypePOJO pojo) throws SQLException;
  
 public List<feeTypePOJO> getFeeType() throws SQLException; 
 
}
