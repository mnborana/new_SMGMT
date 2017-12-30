package com.servletStore.ptamember.model;

import java.util.List;

public interface PTAMemberDAO {
	
	public List getStandardList(PTAMemberPojo pojo);
	public List getStudentNameList(PTAMemberPojo pojo);

}
