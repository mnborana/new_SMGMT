package com.servletStore.casteWiseEduFees.model;

import java.util.List;

public interface casteWiseEduFeesDAO {
	public int insertEducationalFees(casteWiseEduFeesPojo pojo);
	public List<casteWiseEduFeesPojo> getFeesType();
	public List<casteWiseEduFeesPojo> getStandard();
	public List<casteWiseEduFeesPojo> getCasteCategory();
	public List<casteWiseEduFeesPojo> fetchDetails();
	public void insertCategory(List list);
	public String getCategory(int id);

}
