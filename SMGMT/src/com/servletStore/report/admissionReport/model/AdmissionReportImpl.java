package com.servletStore.report.admissionReport.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;
import com.servletStore.fees.feescollection.model.FeesCollectionPOJO;

public class AdmissionReportImpl implements AdmissionReportDAO {
	DBConnection dbconnect=new DBConnection();
	Connection connection=dbconnect.getConnection();
	
	PreparedStatement pstmt=null;
	@Override
	public List getStadardDivisionDetails(String schoolId) throws SQLException {
		
			List<FeesCollectionPOJO> list = new ArrayList<>();
			
			try {
				
				String query="SELECT classroom_master.id,std_master.name,classroom_master.division,classroom_master.shift FROM std_master,classroom_master,fk_class_master,fk_school_section_details WHERE\n" + 
						"fk_school_section_details.school_id="+schoolId+" AND\n" + 
						"fk_class_master.fk_school_sec_id=fk_school_section_details.id AND\n" + 
						"std_master.id=fk_class_master.std_id AND\n" + 
						"classroom_master.fk_class_master_id=fk_class_master.id";
				
				
				pstmt = connection.prepareStatement(query);
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()){
					FeesCollectionPOJO feesCollectionPOJO = new FeesCollectionPOJO();
					
					feesCollectionPOJO.setClassRoomMasterId(rs.getInt("id"));
					feesCollectionPOJO.setStdName(rs.getString("name"));
					feesCollectionPOJO.setDivName(rs.getString("division"));
					feesCollectionPOJO.setShift(rs.getString("shift"));
					list.add(feesCollectionPOJO);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
					
			return list;
		}
	
}
