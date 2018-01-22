package com.servletStore.fees.assignStdWiseFees.model;

import java.util.HashMap;
import java.util.List;


public interface AssignStdWiseFeesDao {

	public HashMap<Integer, String> getStandards(String schoolId);
	public List<AssignStdWiseFeesPojo> getFeestypeList();
	
}
