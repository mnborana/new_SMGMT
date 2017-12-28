package com.servletStore.register.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import com.dbconnect.DBConnection;
import com.mysql.jdbc.Connection;

public class ReportImpl implements ReportDAO{
	
	DBConnection conn=new DBConnection();
	Connection connection=(Connection) conn.getConnection();
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	ReportDAO dao=new ReportImpl();
	ReportPojo pojo=new ReportPojo();

	@Override
	public List selectInwardDetails(String input1, String input2) {
		String selectInward="SELECT inward_register_master.inward_no,inward_register_master.date,"
				+ "inward_register_master.sender_name,inward_register_master.address,"
				+ "inward_register_master.mobileNo,inward_register_master.subject,inward_register_master."
				+ "description,inward_register_master.document_Name FROM inward_register_master WHERE "
				+ "inward_register_master.date BETWEEN '"+input1+"' AND '"+input2+"'";
		try {
			pstmt = connection.prepareStatement(selectInward);
			pstmt.executeQuery();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

}
