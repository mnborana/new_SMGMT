package com.servletStore.student.studentReports.model;

import java.util.List;

import com.servletStore.transportation.studentdetails.model.StudentDetailsPOJO;

public interface studentReportDAO
{
	
	public List<studentReportPOJO> getCategory();
	public List<studentReportPOJO> getAllCategoryDetails(studentReportPOJO pojo);
	public String getCategory(String cid);
	public List<Object> getSchoolDetails(String sid);	
	public String getStdName(String stdid);
	public List<Object> getAllCategoryCount(String stdid,String ac_year,String school_id);
	public List<Object> getAcademic_year();
	public List<String> getStudentName(String stddiv_id,String Academic_year);
	public List<Object> getstudDatailsByStudId(String sid);
	public List<Integer> getLastOutWordNo();
	public String getDocumentNameFromRegister(Object doc_id);
	public Object InsertIntoOutwordRegister();
	public List<Object> getOtherSchoolDetails(String sid);
	public int InsertIntoOutwordRegisterMaster(String outword_no,Object inword_outwourd_document_id,String doc_name,String date1,String Studentname,String student_id);
	public void UpdateLcStatus(String student_id);
	public void insertIntoLCMaster(int outword_id,String gr_no,int standard_id,String student_id,String leaving_date,String lc_date,String study_status,String behaviour,String leaving_reason,String remark);
	public void insertIntoLCMaster1(String gr_no,int standard_id,String student_id,String leaving_date,String lc_date,String study_status,String behaviour,String leaving_reason,String remark);

}
