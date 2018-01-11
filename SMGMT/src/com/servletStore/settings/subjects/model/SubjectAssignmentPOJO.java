package com.servletStore.settings.subjects.model;

public class SubjectAssignmentPOJO {
	
	private int id;
	private int fkClassMasterId;
	private int subjectId;
	private String subjectCode;
	private String optinalStatus;
	
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getFkClassMasterId() {
		return fkClassMasterId;
	}
	
	public void setFkClassMasterId(int fkClassMasterId) {
		this.fkClassMasterId = fkClassMasterId;
	}
	
	public int getSubjectId() {
		return subjectId;
	}
	
	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}
	
	public String getSubjectCode() {
		return subjectCode;
	}
	
	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}
	
	public String getOptinalStatus() {
		return optinalStatus;
	}
	
	public void setOptinalStatus(String optinalStatus) {
		this.optinalStatus = optinalStatus;
	}
	
	
	
}
