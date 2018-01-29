/**
 * 	  Author : SARANG KAMBLE,OMKAR SHIVADEKAR
 * 	Document : FeesCollectionDAO.java
 *		Date : 22-Jan-2018
 * 		Time : 4:17:00 PM
 */
package com.servletStore.fees.feescollection.model;

import java.sql.SQLException;
import java.util.List;

/**
 * @author sarang,omkar
 *
 */
public interface FeesCollectionDAO {

	public List<FeesCollectionPOJO> getStadardDivisionDetails(String schoolId);

	public List getStudentInfo(String standard_id);
	
	public String getStudentCast(String student_id) throws SQLException;
	
	public List getStandardWiseFee(String standard_id) throws SQLException;
	
	public List getStudentCastwiseFee(String student_id)throws SQLException;
	
	public int assignStudentFee(AssignFeeDAO pojo) throws SQLException;
	
	public String getDateForCheck(String studId,String particulars) throws SQLException;
	
	public String getLastAcademicYear() throws SQLException;
}
