package com.servletStore.fees.casteWiseEduFees.model;

import java.util.List;

public interface casteWiseEduFeesDAO {
	public int insertEducationalFees(List<casteWiseEduFeesPojo> list);
	public List<casteWiseEduFeesPojo> getFeesType();
	public List<casteWiseEduFeesPojo> getStandard(String schoolId);
	public List<casteWiseEduFeesPojo> getCasteCategory();
	public List<casteWiseEduFeesPojo> fetchDetails();
	public String getCategory(int id);

}
