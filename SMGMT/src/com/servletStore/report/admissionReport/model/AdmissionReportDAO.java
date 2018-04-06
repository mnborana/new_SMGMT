package com.servletStore.report.admissionReport.model;

import java.sql.SQLException;
import java.util.List;

public interface AdmissionReportDAO {
public List getStadardDivisionDetails(String schoolId) throws SQLException;
}
