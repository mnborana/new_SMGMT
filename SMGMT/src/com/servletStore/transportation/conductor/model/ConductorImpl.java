package com.servletStore.transportation.conductor.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;

public class ConductorImpl implements ConductorDAO
{
	DBConnection dbconnect=new DBConnection();
	Connection connection=dbconnect.getConnection();
	
	PreparedStatement pstmt=null;
	
	@Override
	public void addConductor(ConductorPOJO vp) {
		try 
		{
			pstmt=connection.prepareStatement("INSERT INTO conductor_master(vehicle_id,name,temp_addrs,perm_addrs,dob,phone_no) VALUES (?,?,?,?,?,?)");
			//pstmt.setString(1,vp.getVeh_no());
			pstmt.setInt(1, vp.getVeh_id());
			pstmt.setString(2,vp.getName());
			pstmt.setString(3,vp.getTemp_addrs());
			pstmt.setString(4,vp.getPerm_addrs());
			pstmt.setDate(5,java.sql.Date.valueOf(vp.getDob()));
			pstmt.setString(6, vp.getPhone_no());
			pstmt.executeUpdate();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}		
		
	}

	@Override
	public List<ConductorPOJO> getConductorDetails() {
		// TODO Auto-generated method stub
		System.out.println("GETDETAILS");
		List<ConductorPOJO> list=new ArrayList<>();
		try {
			pstmt=connection.prepareStatement("select conductor_master.id,conductor_master.vehicle_id, vehicle_master.vehicle_no , conductor_master.name , conductor_master.temp_addrs ,conductor_master.perm_addrs , conductor_master.dob , conductor_master.phone_no from conductor_master INNER JOIN vehicle_master ON conductor_master.vehicle_id  = vehicle_master.id ;");
			ResultSet rs= pstmt.executeQuery();
			while(rs.next()){
				ConductorPOJO conductorPojo=new ConductorPOJO();				
				conductorPojo.setId(rs.getInt("id"));
				conductorPojo.setVeh_no(rs.getString("vehicle_no"));
				conductorPojo.setVeh_id(rs.getInt("vehicle_id"));
				conductorPojo.setName(rs.getString("name"));
				conductorPojo.setTemp_addrs(rs.getString("temp_addrs"));
				conductorPojo.setPerm_addrs(rs.getString("perm_addrs"));
				conductorPojo.setDob(rs.getString("dob"));
				conductorPojo.setPhone_no(rs.getString("phone_no"));				
				list.add(conductorPojo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void editConductor(ConductorPOJO cp) {
		// TODO Auto-generated method stub
		try 
		{
			pstmt=connection.prepareStatement("UPDATE conductor_master set vehicle_id=?,name=?,temp_addrs=?,perm_addrs=?,dob=?,phone_no=? WHERE id=?");
			pstmt.setInt(1,cp.getVeh_id());
			pstmt.setString(2,cp.getName());
			pstmt.setString(3,cp.getTemp_addrs());
			pstmt.setString(4,cp.getPerm_addrs());
			pstmt.setString(5,cp.getDob());
			pstmt.setString(6,cp.getPhone_no());
			pstmt.setInt(7, cp.getId());
			pstmt.executeUpdate();
			System.out.println("INSERTED..."+cp.getId());
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}	
		
		
	}

	@Override
	public void deleteConductor(int id) {
		// TODO Auto-generated method stub
		try
		{
			pstmt=connection.prepareStatement("delete from conductor_master where id=?");
			pstmt.setInt(1,id);
			pstmt.executeUpdate();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	
}
