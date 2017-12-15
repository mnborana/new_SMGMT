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
	InwardRegisterDAO inwarddao=new InwardRegisterImpl();
	
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
	public void addNewSubject(InwardRegisterPojo pojo) {
		String insertSubject="INSERT INTO subject_master(subject) VALUES(?)";
		try {
			pstmt=connection.prepareStatement(insertSubject);
			pstmt.setString(1, pojo.getSubject());
			int j=pstmt.executeUpdate();
			System.out.println("inserted subject successfully");
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}

	@Override
	public void inwardRegister(InwardRegisterPojo pojo) {
		String inwardRegister="INSERT INTO inward_register_master(inward_no,sender_name,subject,address,description) VALUES(?,?,?,?,?)";
		try {
			pstmt=connection.prepareStatement(inwardRegister);
			pstmt.setInt(1, pojo.getInwardNo());
			pstmt.setString(2, pojo.getSenderName());
			pstmt.setString(3, pojo.getSubject());
			pstmt.setString(4, pojo.getAddress());
			pstmt.setString(5, pojo.getDescription());
			int i=pstmt.executeUpdate();
			System.out.println("inserted inwardRegister Details successfully");
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}

	@Override
	public InwardRegisterPojo setInwordNo() {
		InwardRegisterPojo pojo=new InwardRegisterPojo();
		String maxid="SELECT MAX(id) FROM inward_register_master";
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
	public List selectInwardRegister() {
		String selectQuery="";
		return null;
	}
	
	
	
	
	
	
	

}
