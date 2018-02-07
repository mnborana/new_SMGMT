package com.servletStore.cashBook.cashBookOpeningBalance.model;

import java.util.List;

public interface CashBookOpeningBalDAO {
	public List<CashBookOpeningBalPOJO> getCashBookList();
	public List<CashBookOpeningBalPOJO> getBankList();

}
