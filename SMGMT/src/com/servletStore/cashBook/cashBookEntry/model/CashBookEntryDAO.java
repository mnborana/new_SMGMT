package com.servletStore.cashBook.cashBookEntry.model;

import java.util.List;

public interface CashBookEntryDAO {

	public List<CashBookEntryPOJO> selectCashBook();
	public List<CashBookEntryPOJO> selectLedger();
	public List<CashBookEntryPOJO> selectSubAccount();
	public CashBookEntryPOJO selectAccountType(String accountType);
	public int insertCashbookDetails(CashBookEntryPOJO pojo);
}
