package com.servletStore.register.model;

import java.util.List;

public interface StockRegisterDAO {
	public StockRegisterPojo getStockNo();
	public void insertStock(StockRegisterPojo pojo);
	public List<StockRegisterPojo> showStockDetails();
	public List<StockRegisterPojo> getItemName();
	public void updateStockDetails(StockRegisterPojo pojo,int id);
	public List<StockRegisterPojo> selectStock(int stockId);
	public List<StockRegisterPojo> setItemInModel();
	public void deleteStock(int id);

}
