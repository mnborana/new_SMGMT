package com.servletStore.settings.document.model;

import java.util.List;

public interface AddDocumentDAO {
	public void addDocument(AddDocumentPojo pojo);
	public List<AddDocumentPojo> selectDocuments();
	public List<AddDocumentPojo> setDocumentName(int id);
	public void updateDocument(AddDocumentPojo pojo,int id);
	public void deleteDocument(AddDocumentPojo pojo,int id);

}
