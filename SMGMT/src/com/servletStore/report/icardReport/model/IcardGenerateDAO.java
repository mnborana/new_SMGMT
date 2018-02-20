package com.servletStore.report.icardReport.model;

import java.util.List;


import com.servletStore.report.icardReport.model.IcardGeneratePOJO;;

public interface IcardGenerateDAO {
	
	public List<IcardGeneratePOJO> getStadardDivisionDetails(String schoolId);
	
	public List getStudentInfo(String standard_id);

}
