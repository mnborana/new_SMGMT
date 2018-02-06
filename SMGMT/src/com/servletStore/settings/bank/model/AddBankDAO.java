package com.servletStore.settings.bank.model;

import java.util.List;

public interface AddBankDAO {
	
	public int insertBankDetails(AddBankPOJO pojo);
	public List<AddBankPOJO> fetchBankDetails();

}
