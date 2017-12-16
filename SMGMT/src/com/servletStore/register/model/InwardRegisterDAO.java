package com.servletStore.register.model;

import java.util.List;

public interface InwardRegisterDAO {
	
	
	public void addNewSender(InwardRegisterPojo pojo);
	public void inwardRegister(InwardRegisterPojo pojo);
	public InwardRegisterPojo setInwordNo();
	public List<InwardRegisterPojo> selectInwardRegister();
	
	public List<InwardRegisterPojo> selectSenderName();
	public List<InwardRegisterPojo> selsectSubject();
	
}
