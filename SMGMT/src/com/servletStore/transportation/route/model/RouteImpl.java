package com.servletStore.transportation.route.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.dbconnect.DBConnection;

public class RouteImpl implements RouteDAO
{
	
	DBConnection dbconnect=new DBConnection();
	Connection connection=dbconnect.getConnection();
	
	PreparedStatement pstmt=null;

	@Override
	public void addRoute(RoutePOJO rp) 
	{
		try 
		{
			pstmt=connection.prepareStatement("INSERT INTO route_master(id,route_code,route_name) VALUES (?,?,?)");
			pstmt.setInt(1, rp.getId());
			pstmt.setString(2,rp.getRoute_code());
			pstmt.setString(3,rp.getRoute_name());
		
			pstmt.executeUpdate();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}		
		
		
	}

	@Override
	public List<RoutePOJO> getRouteDetails()
	{
		System.out.println("GETDETAILS");
		List<RoutePOJO> list=new ArrayList<>();
		try {
			pstmt=connection.prepareStatement("SELECT * FROM route_master");
			ResultSet rs= pstmt.executeQuery();
			while(rs.next()){
				RoutePOJO routePojo=new RoutePOJO();
				routePojo.setId(rs.getInt("id"));
				routePojo.setRoute_code(rs.getString("route_code"));
				routePojo.setRoute_name(rs.getString("route_name"));
				
				list.add(routePojo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void EditRoute(RoutePOJO rp)
	{
	try 
	{
		pstmt=connection.prepareStatement("update route_master set route_code=?,route_name=? where id=?");
		pstmt.setString(1, rp.getRoute_code());
		pstmt.setString(2, rp.getRoute_name());
		pstmt.setInt(3,rp.getId());
		pstmt.executeUpdate();
		System.out.println("INSERTED..."+rp.getId());
	} 
	catch (SQLException e)
	{
		// TODO Auto-generated catch block
		e.printStackTrace();
	} 
	}

	@Override
	public void deleteRoute(int id)
	{
		try {
			pstmt=connection.prepareStatement("delete from route_master where id=?");
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			System.out.println("deleted");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}


