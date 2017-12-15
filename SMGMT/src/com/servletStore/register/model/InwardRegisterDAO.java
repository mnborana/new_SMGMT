package com.servletStore.register.model;

import java.util.List;

public interface InwardRegisterDAO {
	
	
	public void addNewSender(InwardRegisterPojo pojo);
	public void addNewSubject(InwardRegisterPojo pojo);
	public void inwardRegister(InwardRegisterPojo pojo);
	public InwardRegisterPojo setInwordNo();
	public List selectInwardRegister();
}
