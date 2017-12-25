package com.servletStore.setup.model;

public class SetupPOJO {

	String societyName, trusteeUsername, trusteePassword, schoolName, principalUserName, principalPassword;
	int noOfSchools;
	
	String dashboard,setting,management,admission,fee,attendance,exam,teacher,register,cashbook,transport,salary,library,other,emsg;
	
	
	//permission
	public String getDashboard() {
		return dashboard;
	}
	public void setDashboard(String dashboard) {
		this.dashboard = dashboard;
	}
	public String getSetting() {
		return setting;
	}
	public void setSetting(String setting) {
		this.setting = setting;
	}
	public String getManagement() {
		return management;
	}
	public void setManagement(String management) {
		this.management = management;
	}
	public String getAdmission() {
		return admission;
	}
	public void setAdmission(String admission) {
		this.admission = admission;
	}
	public String getFee() {
		return fee;
	}
	public void setFee(String fee) {
		this.fee = fee;
	}
	public String getAttendance() {
		return attendance;
	}
	public void setAttendance(String attendance) {
		this.attendance = attendance;
	}
	public String getExam() {
		return exam;
	}
	public void setExam(String exam) {
		this.exam = exam;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public String getRegister() {
		return register;
	}
	public void setRegister(String register) {
		this.register = register;
	}
	public String getCashbook() {
		return cashbook;
	}
	public void setCashbook(String cashbook) {
		this.cashbook = cashbook;
	}
	public String getTransport() {
		return transport;
	}
	public void setTransport(String transport) {
		this.transport = transport;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public String getLibrary() {
		return library;
	}
	public void setLibrary(String library) {
		this.library = library;
	}
	public String getOther() {
		return other;
	}
	public void setOther(String other) {
		this.other = other;
	}
	public String getEmsg() {
		return emsg;
	}
	public void setEmsg(String emsg) {
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
