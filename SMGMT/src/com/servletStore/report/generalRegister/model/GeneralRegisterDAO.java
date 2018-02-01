package com.servletStore.report.generalRegister.model;

import java.util.List;

public interface GeneralRegisterDAO {
	public List selectSectionList(String id);
	public GeneralRegisterPOJO selectSection(String schoolId,String sectionId);
	public List<GeneralRegisterPOJO> getSchoolDetails(GeneralRegisterPOJO pojo,String schoolId);
	

}
