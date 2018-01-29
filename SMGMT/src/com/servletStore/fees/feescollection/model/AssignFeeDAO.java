/**
 * Author : Omkar Shivadekar
 * Date : 25-Jan-2018
 */
package com.servletStore.fees.feescollection.model;

public class AssignFeeDAO
{
	String studentId,classroomMasterId,date,fee;

	public String getStudentId()
	{
		return studentId;
	}

	public void setStudentId(String studentId)
	{
		this.studentId = studentId;
	}

	public String getClassroomMasterId()
	{
		return classroomMasterId;
	}

	public void setClassroomMasterId(String classroomMasterId)
	{
		this.classroomMasterId = classroomMasterId;
	}

	public String getDate()
	{
		return date;
	}

	public void setDate(String date)
	{
		this.date = date;
	}

	public String getFee()
	{
		return fee;
	}

	public void setFee(String fee)
	{
		this.fee = fee;
	}

	@Override
	public String toString()
	{
		return "AssignFeeDAO [studentId=" + studentId + ", classroomMasterId=" + classroomMasterId + ", date=" + date
				+ ", fee=" + fee + "]";
	}
	
	

}
