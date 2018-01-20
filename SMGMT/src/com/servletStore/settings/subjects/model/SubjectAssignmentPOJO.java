package com.servletStore.settings.subjects.model;

public class SubjectAssignmentPOJO {
	
	private int id;
	private int fkClassMasterId;
	private int subjectId;
	private String subjectCode, stdName, subjectName;
	private int optinalStatus;
	
	
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
	
	public int getOptinalStatus() {
		return optinalStatus;
	}
	
	public void setOptinalStatus(int optinalStatus) {
		this.optinalStatus = optinalStatus;
	}

	public String getStdName() {
		return stdName;
	}

	public void setStdName(String stdName) {
		this.stdName = stdName;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	
	
}
