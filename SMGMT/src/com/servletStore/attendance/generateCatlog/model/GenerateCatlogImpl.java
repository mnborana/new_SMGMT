package com.servletStore.attendance.generateCatlog.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;

public class GenerateCatlogImpl implements GenerateCatlogDAO {

	DBConnection dbconnect=new DBConnection();
	Connection connection=dbconnect.getConnection();
	
	PreparedStatement pstmt=null;
	
	@Override
	public List<GenerateCatlogPOJO> getStadardDivisionDetails() {
		
		List<GenerateCatlogPOJO> list = new ArrayList<>();
		
		try {
			
			pstmt = connection.prepareStatement("SELECT classroom_master.id,std_master.name,classroom_master.division,classroom_master.shift FROM std_master,classroom_master,fk_class_master WHERE std_master.id=fk_class_master.std_id AND classroom_master.fk_class_master_id=fk_class_master.id");
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				GenerateCatlogPOJO generateCatlogPOJO = new GenerateCatlogPOJO();
				
				generateCatlogPOJO.setClassRoomMasterId(rs.getInt("id"));
				generateCatlogPOJO.setStdName(rs.getString("name"));
				generateCatlogPOJO.setDivName(rs.getString("division"));
				generateCatlogPOJO.setShift(rs.getString("shift"));
				list.add(generateCatlogPOJO);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
				
		return list;
	}

}
