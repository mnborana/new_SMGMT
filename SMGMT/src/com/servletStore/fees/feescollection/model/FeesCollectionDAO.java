/**
 * 	  Author : SARANG KAMBLE
 * 	Document : FeesCollectionDAO.java
 *		Date : 22-Jan-2018
 * 		Time : 4:17:00 PM
 */
package com.servletStore.fees.feescollection.model;

import java.util.List;

/**
 * @author sarang
 *
 */
public interface FeesCollectionDAO {

	public List<FeesCollectionPOJO> getStadardDivisionDetails(String schoolId);

	public List getStudentInfo(String standard_id);
}
