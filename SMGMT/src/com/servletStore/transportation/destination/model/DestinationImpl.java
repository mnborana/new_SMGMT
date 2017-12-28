package com.servletStore.transportation.destination.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;

public class DestinationImpl implements DestinationDAO {

	DBConnection dbconnect=new DBConnection();
	Connection connection=dbconnect.getConnection();
	PreparedStatement pstmt=null;
	@Override
	public void addDestination(DestinationPOJO dp) {
		// TODO Auto-generated method stub
		try 
		{
			pstmt=connection.prepareStatement("INSERT INTO destination_master(route_id,destination,fee) VALUES (?,?,?)");
			pstmt.setInt(1,dp.getRoute_id());
			pstmt.setString(2,dp.getDest());
			pstmt.setDouble(3,dp.getFee());
			pstmt.executeUpdate();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}	
		
	}

	@Override
	public List<DestinationPOJO> getDestinationDetails() {
		// TODO Auto-generated method stub
		List<DestinationPOJO> list=new ArrayList<>();
		try {
			pstmt=connection.prepareStatement("SELECT destination_master.id,destination_master.route_id,destination_master.destination,destination_master.fee,route_master.route_name FROM destination_master INNER JOIN route_master ON destination_master.route_id=route_master.id;");
			//pstmt=connection.prepareStatement("select driver_master.id,driver_master.vehicle_id, vehicle_master.vehicle_no , driver_master.name , driver_master.temp_addrs , driver_master.perm_addrs , driver_master.dob , driver_master.phone_no , driver_master.license_no from driver_master INNER JOIN vehicle_master ON driver_master.vehicle_id  = vehicle_master.id ;");
			ResultSet rs= pstmt.executeQuery();
			while(rs.next()){
				DestinationPOJO destinationPOJO=new DestinationPOJO();
				destinationPOJO.setId(rs.getInt("id"));
				destinationPOJO.setRoute_id(rs.getInt("route_id"));
				destinationPOJO.setRoute_name(rs.getString("route_name"));
				destinationPOJO.setDest(rs.getString("destination"));
				destinationPOJO.setFee(rs.getDouble("fee"));
				list.add(destinationPOJO);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void editDestination(DestinationPOJO cp) {
		// TODO Auto-generated method stub
		try 
		{
			pstmt=connection.prepareStatement("UPDATE destination_master set route_id=?,destination=?,fee=? WHERE id=?");
			//pstmt.setString(1,cp.getRoute_name());
			pstmt.setInt(1,cp.getRoute_id());
			pstmt.setString(2,cp.getDest());
			pstmt.setDouble(3,cp.getFee());
			pstmt.setInt(4,cp.getId());
			pstmt.executeUpdate();
			System.out.println("INSERTED..."+cp.getId());
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}	
		
	}

	@Override
	public void deleteDestination(int id) {
		// TODO Auto-generated method stub
		try
		{
			pstmt=connection.prepareStatement("delete from destination_master where id=?");
			pstmt.setInt(1,id);
			pstmt.executeUpdate();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
	}

}
