package com.servletStore.cashBook.Ledger.model;

import java.util.List;

public interface CashBookLedgAccDAO {

	public List<CashBookLedgAccPOJO> selectCashBook();
	public int insertLedgerAccount(CashBookLedgAccPOJO pojo);
	public List<CashBookLedgAccPOJO> selectLedgerAccount();
}
