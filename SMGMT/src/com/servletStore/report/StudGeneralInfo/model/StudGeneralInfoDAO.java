package com.servletStore.report.StudGeneralInfo.model;

import java.util.List;

public interface StudGeneralInfoDAO {
	public List<StudGeneralInfoPOJO> selectSchoolDetails(String schoolId);
	public List<StudGeneralInfoPOJO> selectStandard(String schoolId);

}
