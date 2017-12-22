package com.servletStore.register.model;

import java.util.List;

public interface InwardRegisterDAO {
	
	
	public void addNewSender(InwardRegisterPojo pojo);
	public void inwardRegister(InwardRegisterPojo pojo);
	public InwardRegisterPojo setInwordNo();
	public List<InwardRegisterPojo> selectInwardRegister();
	
	public List<InwardRegisterPojo> selectSenderName();
	public List<InwardRegisterPojo> selsectSubject();
	
	public void updateInwardRegister(InwardRegisterPojo pojo,int id);
	public List<InwardRegisterPojo> setInwardDetails(int id);
	
	public List<InwardRegisterPojo> updatesender();
	public List<InwardRegisterPojo> updateSubject();
	

	public void deleteInwardRegister(int id);
	public List<InwardRegisterPojo> getDocument();
	public List<InwardRegisterPojo> updateDocument();
	
	public InwardRegisterPojo setDocumentName(int id);
	public InwardRegisterPojo setdocument(int id);
	
	
	
	
}
