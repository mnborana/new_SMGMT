package com.servletStore.settings.classRoom.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.omg.PortableInterceptor.INACTIVE;

import com.dbconnect.DBConnection;

public class AddClassImpl implements AddClassDAO
{
	DBConnection dbconnect=new DBConnection();
	Connection connection;
	PreparedStatement ps;
	
	public AddClassImpl() 
	{
		connection=dbconnect.getConnection();
	}

	
	@Override
	public List getStandards(String schoolId, String setionId) {
		
		List list = new ArrayList<>();
		
		String query = "SELECT std_master.id, std_master.name FROM std_master WHERE std_master.id IN (SELECT fk_class_master.std_id FROM fk_class_master WHERE fk_class_master.fk_school_sec_id=( SELECT fk_school_section_details.id FROM fk_school_section_details WHERE fk_school_section_details.school_id="+schoolId+" AND fk_school_section_details.section_id="+setionId+"))";
		try {
			ps = connection.prepareStatement(query);
			ResultSet rs = ps.executeQuery(query);
			
			while(rs.next()){
				int id = rs.getInt(1);
				String std = rs.getString(2);
				list.add(id);
				list.add(std);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	


	
}
