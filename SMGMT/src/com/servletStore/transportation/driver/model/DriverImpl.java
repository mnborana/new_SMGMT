package com.servletStore.transportation.driver.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;

public class DriverImpl implements DriverDAO
{
	DBConnection dbconnect=new DBConnection();
	Connection connection=dbconnect.getConnection();
	
	PreparedStatement pstmt=null;
	
	@Override
	public void addDriver(DriverPOJO vp) {
		try 
		{
			pstmt=connection.prepareStatement("INSERT INTO driver_master(vehicle_id,name,temp_addrs,perm_addrs,dob,phone_no,license_no) VALUES (?,?,?,?,?,?,?)");
			//pstmt.setString(1,vp.getVeh_no());
			pstmt.setInt(1, vp.getVeh_id());
			pstmt.setString(2,vp.getName());
			pstmt.setString(3,vp.getTemp_addrs());
			pstmt.setString(4,vp.getPerm_addrs());
			pstmt.setDate(5,java.sql.Date.valueOf(vp.getDob()));
			pstmt.setString(6, vp.getPhone_no());
			pstmt.setString(7, vp.getLicense_no());
			pstmt.executeUpdate();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}		
		
	}

	@Override
	public List<DriverPOJO> getDriverDetails() {
		// TODO Auto-generated method stub
		System.out.println("GETDETAILS");
		List<DriverPOJO> list=new ArrayList<>();
		try {
			pstmt=connection.prepareStatement("select driver_master.id,driver_master.vehicle_id, vehicle_master.vehicle_no , driver_master.name , driver_master.temp_addrs , driver_master.perm_addrs , driver_master.dob , driver_master.phone_no , driver_master.license_no from driver_master INNER JOIN vehicle_master ON driver_master.vehicle_id  = vehicle_master.id ;");
			ResultSet rs= pstmt.executeQuery();
			while(rs.next()){
				DriverPOJO driverPojo=new DriverPOJO();
				driverPojo.setId(rs.getInt("id"));
				driverPojo.setVeh_no(rs.getString("vehicle_no"));
				driverPojo.setVeh_id(rs.getInt("vehicle_id"));
				driverPojo.setName(rs.getString("name"));
				driverPojo.setTemp_addrs(rs.getString("temp_addrs"));
				driverPojo.setPerm_addrs(rs.getString("perm_addrs"));
				driverPojo.setDob(rs.getString("dob"));
				driverPojo.setPhone_no(rs.getString("phone_no"));
				driverPojo.setLicense_no(rs.getString("license_no"));
				list.add(driverPojo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void editDriver(DriverPOJO vp) {
		// TODO Auto-generated method stub
		try 
		{
			pstmt=connection.prepareStatement("UPDATE driver_master set vehicle_id=?,name=?,temp_addrs=?,perm_addrs=?,dob=?,phone_no=?,license_no=? where id=?");
			pstmt.setInt(1,vp.getVeh_id());
			pstmt.setString(2,vp.getName());
			pstmt.setString(3,vp.getTemp_addrs());
			pstmt.setString(4,vp.getPerm_addrs());
			pstmt.setString(5,vp.getDob());
			pstmt.setString(6,vp.getPhone_no());
			pstmt.setString(7,vp.getLicense_no());
			pstmt.setInt(8, vp.getId());
			pstmt.executeUpdate();
			System.out.println("Updated..."+vp.getId());
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}	
		
		
	}

	@Override
	public void deleteDriver(int id) {
		// TODO Auto-generated method stub
		try
		{
			pstmt=connection.prepareStatement("delete from driver_master where id=?");
			pstmt.setInt(1,id);
			pstmt.executeUpdate();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
	}
	
}
