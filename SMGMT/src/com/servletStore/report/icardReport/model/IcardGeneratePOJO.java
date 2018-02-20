package com.servletStore.report.icardReport.model;

public class IcardGeneratePOJO {
	
private int classRoomMasterId;
	
	private String stdName,divName,shift, stdId,studId;

	public int getClassRoomMasterId() {
		return classRoomMasterId;
	}

	public void setClassRoomMasterId(int classRoomMasterId) {
		this.classRoomMasterId = classRoomMasterId;
	}

	public String getStdName() {
		return stdName;
	}

	public void setStdName(String stdName) {
		this.stdName = stdName;
	}

	public String getDivName() {
		return divName;
	}

	public void setDivName(String divName) {
		this.divName = divName;
	}

	public String getShift() {
		return shift;
	}

	public void setShift(String shift) {
		this.shift = shift;
	}

	public String getStdId() {
		return stdId;
	}

	public void setStdId(String stdId) {
		this.stdId = stdId;
	}

	public String getStudId() {
		return studId;
	}

	public void setStudId(String studId) {
		this.studId = studId;
	}
	

}
