package com.servletStore.transportation.studtransportationfee.model;

import java.util.List;

public interface StudTransportationFeeDAO {
	public void addStudentTransportationFeeDetails(StudTransportationFeePOJO st);
	public List<StudTransportationFeePOJO> getStudentTransportationFeeDetails();
	public void editStudentTransportationFeeDetails(StudTransportationFeePOJO sp);
	public void deleteStudentTransportationFeeDetails(int id);
}
