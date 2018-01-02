package com.servletStore.ptamember.model;

import java.util.List;

public interface PTAMemberDAO {
	
	public List getStandardList(PTAMemberPojo pojo);
	public List getStudentNameList(PTAMemberPojo pojo);
	public List getParentDetails(PTAMemberPojo pojo);
	public List getMembers(String id);
	public List getStudentParentDetails(PTAMemberPojo pojo);
}
