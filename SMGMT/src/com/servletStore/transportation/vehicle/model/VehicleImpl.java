package com.servletStore.transportation.vehicle.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;

public class VehicleImpl implements VehicleDAO
{
	DBConnection dbconnect=new DBConnection();
	Connection connection=dbconnect.getConnection();
	
	PreparedStatement pstmt=null;
	
	@Override
	public void addVehicle(VehiclePOJO vp) {
		try 
		{
			pstmt=connection.prepareStatement("INSERT INTO vehicle_master(vehicle_no,no_seats,max_seats,veh_type) VALUES (?,?,?,?)");
			pstmt.setString(1,vp.getVeh_no());
			pstmt.setInt(2,vp.getNo_seats());
			pstmt.setInt(3,vp.getMax_seats());
			pstmt.setString(4,vp.getVeh_type());
			System.out.println("Impl");
			//pstmt.setDate(5, java.sql.Date.valueOf(vp.getDate()));
			pstmt.executeUpdate();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}		
		
	}

	@Override
	public List<VehiclePOJO> getVehicleDetails() {
		// TODO Auto-generated method stub
		System.out.println("GETDETAILS");
		List<VehiclePOJO> list=new ArrayList<>();
		try {
			pstmt=connection.prepareStatement("SELECT * FROM vehicle_master");
			ResultSet rs= pstmt.executeQuery();
			while(rs.next()){
				VehiclePOJO vehiclePojo=new VehiclePOJO();
				vehiclePojo.setId(rs.getInt("id"));
				vehiclePojo.setVeh_no(rs.getString("vehicle_no"));
				vehiclePojo.setNo_seats(rs.getInt("no_seats"));
				vehiclePojo.setMax_seats(rs.getInt("max_seats"));
				vehiclePojo.setVeh_type(rs.getString("veh_type"));
				//vehiclePojo.setDate(rs.getString("date"));
				list.add(vehiclePojo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void editVehicle(VehiclePOJO vp) {
		// TODO Auto-generated method stub
		try 
		{
			pstmt=connection.prepareStatement("UPDATE vehicle_master set vehicle_no=?,no_seats=?,max_seats=?,veh_type=? WHERE id=?");
			pstmt.setString(1,vp.getVeh_no());
			pstmt.setInt(2,vp.getNo_seats());
			pstmt.setInt(3,vp.getMax_seats());
			pstmt.setString(4,vp.getVeh_type());
			//pstmt.setDate(5, java.sql.Date.valueOf(vp.getDate()));
			pstmt.setInt(5, vp.getId());
			pstmt.executeUpdate();
			System.out.println("INSERTED..."+vp.getId());
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}	
		
	}

	@Override
	public void deleteVehicle(int id) {
		// TODO Auto-generated method stub
		try
		{
			pstmt=connection.prepareStatement("delete from vehicle_master where id=?");
			pstmt.setInt(1,id);
			pstmt.executeUpdate();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	
}
