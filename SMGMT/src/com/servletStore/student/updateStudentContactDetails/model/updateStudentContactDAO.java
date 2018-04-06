package com.servletStore.student.updateStudentContactDetails.model;

import java.util.List;

public interface updateStudentContactDAO 
{
	public List<updateStudentContactPOJO> getStdAndDivision();
	public List<Object> getContactDetails(String std);
	public List<Object> getAdharDetails(String std);
	public List<Object> getBankDetails(String std);
	public void updateMobileNo(updateStudentContactPOJO up);
	//public void updateAdharNo(updateStudentContactPOJO up);

}
