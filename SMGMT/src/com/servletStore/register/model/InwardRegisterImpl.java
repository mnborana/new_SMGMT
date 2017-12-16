package com.servletStore.register.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;

public class InwardRegisterImpl implements InwardRegisterDAO{
	
	DBConnection con=new DBConnection();
	Connection connection=con.getConnection();
	PreparedStatement pstmt=null;
	List<InwardRegisterPojo> list=new ArrayList<>();
		
	@Override
	public void addNewSender(InwardRegisterPojo pojo) {
		String insertQuery="INSERT INTO sender_receiver_master(sender_name,address) VALUES(?,?)";
		try {
			pstmt=connection.prepareStatement(insertQuery);
			pstmt.setString(1, pojo.getSenderName());
			pstmt.setString(2, pojo.getAddress());
			int i=pstmt.executeUpdate();
			System.out.println("Inserted Successfully");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	
	@Override
	public void inwardRegister(InwardRegisterPojo pojo) {
		String inwardRegister="INSERT INTO inward_register_master(inward_no,date,sender_name,subject,address,description) VALUES(?,?,?,?,?,?)";
		try {
			pstmt=connection.prepareStatement(inwardRegister);
			pstmt.setInt(1, pojo.getInwardNo());
			pstmt.setString(2, pojo.getDate());
			pstmt.setString(3, pojo.getSenderName());
			pstmt.setString(4, pojo.getSubject());
			pstmt.setString(5, pojo.getAddress());
			pstmt.setString(6, pojo.getDescription());
			int i=pstmt.executeUpdate();
			System.out.println("inserted inwardRegister Details successfully");
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}

	@Override
	public InwardRegisterPojo setInwordNo() {
		InwardRegisterPojo pojo=new InwardRegisterPojo();
		String maxid="SELECT MAX(inward_no) FROM inward_register_master";
		try {
			pstmt=connection.prepareStatement(maxid);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				pojo.setInwardNo(rs.getInt(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return pojo;
	}

	@Override
	public List<InwardRegisterPojo> selectInwardRegister() {
		List<InwardRegisterPojo> list=new ArrayList<>();
		String selectQuery="SELECT inward_register_master.id,inward_register_master.inward_no,inward_register_master.date,inward_register_master.sender_name,inward_register_master.address,inward_register_master.subject, inward_register_master.description FROM inward_register_master";
		try {
			pstmt=connection.prepareStatement(selectQuery);
			ResultSet rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				InwardRegisterPojo pojo=new InwardRegisterPojo();
				pojo.setId(rs.getInt(1));
				pojo.setInwardNo(rs.getInt(2));
				pojo.setDate(rs.getString(3));
				pojo.setSenderName(rs.getString(4));				
				pojo.setSubject(rs.getString(5));
				pojo.setAddress(rs.getString(6));
				pojo.setDescription(rs.getString(7));
				list.add(pojo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<InwardRegisterPojo> selectSenderName() {
	String selectQuery2="SELECT sender_receiver_master.sender_name FROM sender_receiver_master";
	try {
		pstmt=connection.prepareStatement(selectQuery2);
		ResultSet rs=pstmt.executeQuery();
		while(rs.next())
		{
			InwardRegisterPojo pojo=new InwardRegisterPojo();
			
			pojo.setSenderName(rs.getString(1));
			list.add(pojo);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return list;
	
	}

	@Override
	public List<InwardRegisterPojo> selsectSubject() {
		String selectSubject="SELECT subject_master.subject FROM subject_master";
		try {
			pstmt=connection.prepareStatement(selectSubject);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				InwardRegisterPojo pojo2=new InwardRegisterPojo();
				pojo2.setSubject(rs.getString(1));
				list.add(pojo2);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}


		

}
