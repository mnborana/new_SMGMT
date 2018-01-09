package com.servletStore.transportation.studtransportationfee.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.dbconnect.DBConnection;

public class StudTransportationFeeImpl implements StudTransportationFeeDAO
{

	DBConnection dbconnect=new DBConnection();
	Connection connection=dbconnect.getConnection();
	PreparedStatement pstmt=null;
	@Override
	public void addStudentTransportationFeeDetails(StudTransportationFeePOJO st) {
		try 
		{
			pstmt=connection.prepareStatement("INSERT INTO stud_transpotation_fee(stud_id,destination_id,route_id,fee,month_id,discount) VALUES (?,?,?,?,?,?)");
			
			pstmt.setInt(1,st.getStud_id());
			pstmt.setInt(2,st.getDest_id());
			pstmt.setInt(3,st.getRoute_id());
			pstmt.setDouble(4,st.getFee());
			pstmt.setString(5,st.getMonths());
			pstmt.setDouble(6,st.getDiscount());
			//pstmt.setDate(5, java.sql.Date.valueOf(vp.getDate()));
			pstmt.executeUpdate();
			
			//System.out.println(st.getDest_id());
			//System.out.println(st.getDiscount());
			//System.out.println(st.getFee());
			//System.out.println(st.getMonths());
			//System.out.println(st.getStud_id());
			//System.out.println(st.getRoute_id());
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}	
	}

	@Override
	public List<StudTransportationFeePOJO> getStudentTransportationFeeDetails() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void editStudentTransportationFeeDetails(StudTransportationFeePOJO sp) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteStudentTransportationFeeDetails(int id) {
		// TODO Auto-generated method stub
		
	}

}
