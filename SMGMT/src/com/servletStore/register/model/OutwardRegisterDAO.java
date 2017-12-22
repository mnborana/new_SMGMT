package com.servletStore.register.model;

import java.util.List;

public interface OutwardRegisterDAO  {
	
	public void insertOutwardRegister(OutwardRegisterPojo pojo);
	public OutwardRegisterPojo outwardNo();
	
	public List<OutwardRegisterPojo> selectReceiverName();
	public List<OutwardRegisterPojo> selectSubjctName();

	public List<OutwardRegisterPojo> selectOutwardRegister();
	public List<OutwardRegisterPojo> selectDocument();
	public List<OutwardRegisterPojo> updateDocument();
	public void addReciverName(OutwardRegisterPojo pojo);	
	
	public List<OutwardRegisterPojo> upReceiver();
	public List<OutwardRegisterPojo> upSubject();
	
	public List<OutwardRegisterPojo> setOutwardDetails(int id);
	public void updateOutwardReg(OutwardRegisterPojo pojo,int id);
	public void deleteOutwardReg(int id);
	
	public OutwardRegisterPojo selectDocumentName(int id);
	public OutwardRegisterPojo setDocumentInServlet(int id);
	
	

}
