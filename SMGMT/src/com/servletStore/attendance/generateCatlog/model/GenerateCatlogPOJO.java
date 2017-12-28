package com.servletStore.attendance.generateCatlog.model;

public class GenerateCatlogPOJO {
	
	//SELECT classroom_master.id,
	//std_master.name,
	//classroom_master.division,
	//classroom_master.shift 
	//FROM std_master,classroom_master,fk_class_master WHERE std_master.id=fk_class_master.std_id AND
	//classroom_master.fk_class_master_id=fk_class_master.id

	
	private int classRoomMasterId;
	
	private String stdName;
	
	private String divName;
	
	private String shift;

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

}
