package com.servletStore.cashBook.subAccount.model;

import java.util.List;

public interface SubAccountDAO {

	public List<SubAccountPOJO> selectCashcBook();
	public List<SubAccountPOJO> selectLedger();
	public int insertSubAccountDetails(SubAccountPOJO pojo);
	public List<SubAccountPOJO> fetchSubAccount();
}
