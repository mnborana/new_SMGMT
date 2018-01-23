/**
 * 	  Author : SARANG KAMBLE
 * 	Document : FeesCollectionPOJO.java
 *		Date : 22-Jan-2018
 * 		Time : 4:17:57 PM
 */
package com.servletStore.fees.feescollection.model;

/**
 * @author sarang
 *
 */
public class FeesCollectionPOJO {
	
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
