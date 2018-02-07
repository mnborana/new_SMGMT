package com.servletStore.report.studAddressInfo.model;

import java.util.List;

public interface StudAddressInfoDAO {
	public List<StudAddressInfoPOJO> selectStdDiv(String schoolId);
	public StudAddressInfoPOJO selectSTDDiv(String stdDiv,String schoolId);
	public StudAddressInfoPOJO selectSchoolDetails(String schoolId);

}
