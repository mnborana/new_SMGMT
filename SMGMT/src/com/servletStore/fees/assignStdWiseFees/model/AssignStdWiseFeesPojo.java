package com.servletStore.fees.assignStdWiseFees.model;

public class AssignStdWiseFeesPojo {

	int id, fkClassMasterId, feesTypeId, termOneFees, termTwoFees, priority, status;
	String feesType;
	
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

	public String getFeesType() {
		return feesType;
	}

	public void setFeesType(String feesType) {
		this.feesType = feesType;
	}

	public int getTermOneFees() {
		return termOneFees;
	}

	public void setTermOneFees(int termOneFees) {
		this.termOneFees = termOneFees;
	}

	public int getTermTwoFees() {
		return termTwoFees;
	}

	public void setTermTwoFees(int termTwoFees) {
		this.termTwoFees = termTwoFees;
	}

	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getFeesTypeId() {
		return feesTypeId;
	}

	public void setFeesTypeId(int feesTypeId) {
		this.feesTypeId = feesTypeId;
	}

	@Override
	public String toString() {
		return "AssignStdWiseFeesPojo [id=" + id + ", fkClassMasterId=" + fkClassMasterId + ", feesTypeId=" + feesTypeId
				+ ", termOneFees=" + termOneFees + ", ternTwoFees=" + termTwoFees + ", priority=" + priority
				+ ", status=" + status + "]";
	}
	
	
	
}
