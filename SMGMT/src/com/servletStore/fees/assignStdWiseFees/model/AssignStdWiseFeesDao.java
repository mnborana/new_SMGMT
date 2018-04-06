package com.servletStore.fees.assignStdWiseFees.model;

import java.util.HashMap;
import java.util.List;


public interface AssignStdWiseFeesDao {

	public HashMap<Integer, String> getStandards(String schoolId);
	public List<AssignStdWiseFeesPojo> getFeestypeList();
	public int insert(List<AssignStdWiseFeesPojo> asList, String academicYear);
	public List<String> getCategoryList();
	public List<String> getCategoryWiseFeesList(String stdId);
	public List<String> getCategoryWiseFeesList2(String stdId);
	public List<String> getCategoryFeesTypes(String stdId);
	public List<String> getFeesAssignedStds(String schoolId);
	public List<String> getFeesStructure(String schoolId);
}
