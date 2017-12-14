package com.servletStore.settings.caste.model;

import java.util.List;

public interface CasteDAO {
	
	//CasteCategory
	public void addCasteCategory(CastePOJO castePojo);
	
	public List<CastePOJO> getCategoryDetails();
	
	public void deleteCategory(int category_id);
	
	
	//Religion
	public void addReligion(CastePOJO castePojo);
	
	public List<CastePOJO> getReligionDetails();
	
	public void deleteReligion(int religion_id);
	
	//Caste
	public void addCaste(CastePOJO castepojo);
	
	public List<CastePOJO> getCasteDetails();

	public void deleteCaste(int caste_id);
}
