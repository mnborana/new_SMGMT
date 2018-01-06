package com.servletStore.transportation.assignroute.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;

public class AssignRouteImpl implements AssignRouteDAO
{

	DBConnection dbconnect=new DBConnection();
	Connection connection=dbconnect.getConnection();
	
	PreparedStatement pstmt=null;
	
	@Override
	public void assignRoute(AssignRoutePOJO dp) {
		// TODO Auto-generated method stub
		try 
		{
			System.out.println("aaa"+dp.getRoute_id()+"ccc"+dp.getVeh_id());
			pstmt=connection.prepareStatement("INSERT INTO assignroute_master(vehicle_id,route_id) VALUES (?,?)");
			pstmt.setInt(1,dp.getVeh_id());
			pstmt.setInt(2,dp.getRoute_id());
			pstmt.executeUpdate();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}	
		
	}

	@Override
	public List<AssignRoutePOJO> getAssignRouteDetails() {
		// TODO Auto-generated method stub
		//System.out.println("GETDETAILS");
		List<AssignRoutePOJO> list=new ArrayList<>();
		try {
			pstmt=connection.prepareStatement("SELECT assignroute_master.id , assignroute_master.vehicle_id , assignroute_master.route_id , vehicle_master.vehicle_no , route_master.route_name FROM ((assignroute_master INNER JOIN vehicle_master ON assignroute_master.vehicle_id = vehicle_master.id ) INNER JOIN route_master ON assignroute_master.route_id = route_master.id );");			
			//pstmt=connection.prepareStatement("select driver_master.id,driver_master.vehicle_id, vehicle_master.vehicle_no , driver_master.name , driver_master.temp_addrs , driver_master.perm_addrs , driver_master.dob , driver_master.phone_no , driver_master.license_no from driver_master INNER JOIN vehicle_master ON driver_master.vehicle_id  = vehicle_master.id ;");
			ResultSet rs= pstmt.executeQuery();
			while(rs.next()){
				AssignRoutePOJO assignPOJO=new AssignRoutePOJO();
				assignPOJO.setId(rs.getInt("id"));
				assignPOJO.setVeh_id(rs.getInt("vehicle_id"));
				assignPOJO.setRoute_id(rs.getInt("route_id"));
				assignPOJO.setVeh_no(rs.getString("vehicle_no"));
				assignPOJO.setRoute_name(rs.getString("route_name"));
				list.add(assignPOJO);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void editAssignRoute(AssignRoutePOJO dp) {
		// TODO Auto-generated method stub
		try 
		{
			pstmt=connection.prepareStatement("UPDATE assignroute_master set vehicle_id=?,route_id=? where id=?");
			pstmt.setInt(1,dp.getVeh_id());
			pstmt.setInt(2,dp.getRoute_id());
			pstmt.setInt(3, dp.getId());
			pstmt.executeUpdate();
			//System.out.println("Updated..."+vp.getId());
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}	
		
	}

	@Override
	public void deleteAssignRoute(int id) {
		// TODO Auto-generated method stub
		try
		{
			pstmt=connection.prepareStatement("delete from assignroute_master where id=?");
			pstmt.setInt(1,id);
			pstmt.executeUpdate();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
	}
	
	public List<AssignRoutePOJO> getVehicleN() {
		List<AssignRoutePOJO> list=new ArrayList<>();
	String vehicle="SELECT vehicle_master.id,vehicle_master.vehicle_no FROM vehicle_master";
	try {
		pstmt = connection.prepareStatement(vehicle);
		 ResultSet rs= pstmt.executeQuery();
		 while(rs.next())
		 {
			 AssignRoutePOJO pojo=new AssignRoutePOJO();
			 pojo.setId(rs.getInt(1));
			 pojo.setVeh_no(rs.getString(2));
			 list.add(pojo);
			 
		 }
		 
	} catch (Exception e) {
		// TODO: handle exception
	}
		return list;
	}
	
	public List searchVehicleNo(String vehicleNo) {
		List list=new ArrayList<>();
		String searchVehicle="SELECT route_master.id, route_master.route_name, destination_master.destination, destination_master.fee FROM route_master, assignroute_master, destination_master WHERE  assignroute_master.route_id=route_master.id AND assignroute_master.vehicle_id=(SELECT vehicle_master.id FROM vehicle_master WHERE vehicle_master.vehicle_no='"+vehicleNo+"') AND destination_master.route_id=assignroute_master.route_id";
	//String searchVehicle="SELECT route_master.route_name,destination_master.destination,destination_master.fee from vehicle_master,destination_master,route_master,assignroute_master where assignroute_master.vehicle_id=vehicle_master.id AND route_master.id=destination_master.route_id and vehicle_master.vehicle_no='"+vehicleNo+"'";
		//String searchVehicle="select vehicle_master.vehicle_no,destination_master.destination,destination_master.fee,route_master.route_name FROM route_master,assignroute_master,destination_master,vehicle_master where route_master.id=assignroute_master.route_id and vehicle_master.id=assignroute_master.vehicle_id and vehicle_master.vehicle_no='"+vehicleNo+"'";
		//System.out.println(searchVehicle);
		try {
			pstmt = connection.prepareStatement(searchVehicle);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				list.add(rs.getInt(1));
				
				String s2="SELECT COUNT(destination_master.id) FROM destination_master WHERE destination_master.route_id="+rs.getString(1);
				pstmt = connection.prepareStatement(s2);
				ResultSet rs1=pstmt.executeQuery();
				
				while(rs1.next())
				{
					list.add(rs1.getInt(1));
				}
				
				list.add(rs.getString(2));
				list.add(rs.getString(3));
				list.add(rs.getDouble(4));
				
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		//System.out.println("dfghjk "+list);
		return list;
	}

	@Override
	public List searchDestination(String dest)
	{
		List list=new ArrayList<>();
		String s1="SELECT vehicle_master.vehicle_no,route_master.route_name from route_master,destination_master,vehicle_master,assignroute_master where route_master.id=destination_master.route_id and destination_master.route_id=assignroute_master.route_id and vehicle_master.id=assignroute_master.vehicle_id and destination_master.destination='"+dest+"'";
		//String s1="select destination_master.destination,destination_master.fee,route_master.route_name FROM route_master,assignroute_master,destination_master,vehicle_master where route_master.id=assignroute_master.route_id and vehicle_master.id=assignroute_master.vehicle_id and destination_master.destination='"+dest+"'";
		try	{
			pstmt = connection.prepareStatement(s1);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				list.add(rs.getString(1));
				list.add(rs.getString(2));
				//list.add(rs.getDouble(3));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println("vvvvvvvvvvv "+s1);
		return list;
	}

	@Override
	public List searchRoute(String routename)
	{
		List list=new ArrayList<>();
		String s1="SELECT route_master.route_name,destination_master.destination,destination_master.fee from destination_master,route_master,assignroute_master where route_master.id=destination_master.route_id and route_master.route_name='"+routename+"'";
		try	{
			pstmt = connection.prepareStatement(s1);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				list.add(rs.getString(1));
				list.add(rs.getString(2));
				list.add(rs.getDouble(3));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}



}
