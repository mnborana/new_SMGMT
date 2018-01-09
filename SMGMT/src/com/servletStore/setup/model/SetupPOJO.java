package com.servletStore.setup.model;

public class SetupPOJO {

	String societyName, trusteeUsername, trusteePassword, schoolName, principalUserName, principalPassword;
	int noOfSchools;
	
	int dashboard,setting,management,admission,fee,attendance,exam,teacher,register,cashbook,transport,salary,library,other,emsg;
	
	
	
	//permission
	public int getDashboard() {
		return dashboard;
	}
	public void setDashboard(int dashboard) {
		this.dashboard = dashboard;
	}
	public int getSetting() {
		return setting;
	}
	public void setSetting(int setting) {
		this.setting = setting;
	}
	public int getManagement() {
		return management;
	}
	public void setManagement(int management) {
		this.management = management;
	}
	public int getAdmission() {
		return admission;
	}
	public void setAdmission(int admission) {
		this.admission = admission;
	}
	public int getFee() {
		return fee;
	}
	public void setFee(int fee) {
		this.fee = fee;
	}
	public int getAttendance() {
		return attendance;
	}
	public void setAttendance(int attendance) {
		this.attendance = attendance;
	}
	public int getExam() {
		return exam;
	}
	public void setExam(int exam) {
		this.exam = exam;
	}
	public int getTeacher() {
		return teacher;
	}
	public void setTeacher(int teacher) {
		this.teacher = teacher;
	}
	public int getRegister() {
		return register;
	}
	public void setRegister(int register) {
		this.register = register;
	}
	public int getCashbook() {
		return cashbook;
	}
	public void setCashbook(int cashbook) {
		this.cashbook = cashbook;
	}
	public int getTransport() {
		return transport;
	}
	public void setTransport(int transport) {
		this.transport = transport;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public int getLibrary() {
		return library;
	}
	public void setLibrary(int library) {
		this.library = library;
	}
	public int getOther() {
		return other;
	}
	public void setOther(int other) {
		this.other = other;
	}
	public int getEmsg() {
		return emsg;
	}
	public void setEmsg(int emsg) {
		this.emsg = emsg;
	}
	
	
	//trustee
	public String getSocietyName() {
		return societyName;
	}
	public void setSocietyName(String societyName) {
		this.societyName = societyName;
	}
	public String getTrusteeUsername() {
		return trusteeUsername;
	}
	public void setTrusteeUsername(String trusteeUsername) {
		this.trusteeUsername = trusteeUsername;
	}
	public String getTrusteePassword() {
		return trusteePassword;
	}
	public void setTrusteePassword(String trusteePassword) {
		this.trusteePassword = trusteePassword;
	}
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	public String getPrincipalUserName() {
		return principalUserName;
	}
	public void setPrincipalUserName(String principalUserName) {
		this.principalUserName = principalUserName;
	}
	public String getPrincipalPassword() {
		return principalPassword;
	}
	public void setPrincipalPassword(String principalPassword) {
		this.principalPassword = principalPassword;
	}
	public int getNoOfSchools() {
		return noOfSchools;
	}
	public void setNoOfSchools(int noOfSchools) {
		this.noOfSchools = noOfSchools;
	}
}
