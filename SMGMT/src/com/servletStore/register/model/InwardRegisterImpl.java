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
		String insertQuery="INSERT INTO sender_receiver_master(sender_receiver_name,address) VALUES(?,?)";
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
		String inwardRegister="INSERT INTO inward_register_master(inward_no,date,sender_name,subject,address,description,document_Name) VALUES(?,?,?,?,?,?,?)";
		try {
			pstmt=connection.prepareStatement(inwardRegister);
			pstmt.setInt(1, pojo.getInwardNo());
			pstmt.setString(2, pojo.getDate());
			pstmt.setString(3, pojo.getSenderName());
			pstmt.setString(4, pojo.getSubject());
			pstmt.setString(5, pojo.getAddress());
			pstmt.setString(6, pojo.getDescription());
			pstmt.setString(7, pojo.getDocmentName());
			pstmt.executeUpdate();
			
			System.out.println("inserted  successfully");
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
		String selectQuery="SELECT inward_register_master.id,inward_register_master.inward_no,inward_register_master.date,inward_register_master.sender_name,inward_register_master.address,inward_register_master.subject, inward_register_master.description,inward_register_master.document_Name FROM inward_register_master";
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
				pojo.setDocmentName(rs.getString(8));
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
	String selectQuery2="SELECT sender_receiver_master.sender_receiver_name FROM sender_receiver_master";
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
		String selectSubject="SELECT inward_register_master.subject FROM inward_register_master";
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


	@Override
	public void updateInwardRegister(InwardRegisterPojo pojo, int id) {
		String updateQuery="UPDATE inward_register_master SET inward_register_master.date=?,inward_register_master.sender_name=?,inward_register_master.address=?,inward_register_master.subject=?,inward_register_master.description=?,inward_register_master.document_Name=? WHERE inward_register_master.id=?";
		try {
			pstmt = connection.prepareStatement(updateQuery);
			pstmt.setString(1, pojo.getDate());
			pstmt.setString(2, pojo.getSenderName());
			pstmt.setString(3, pojo.getAddress());
			pstmt.setString(4, pojo.getSubject());
			pstmt.setString(5, pojo.getDescription());
			pstmt.setString(6, pojo.getDocmentName());
			pstmt.setInt(7, id);
			pstmt.executeUpdate();
			System.out.println("updated Successfully");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	

	@Override
	public void deleteInwardRegister(int id) {
		String deleteId="DELETE FROM inward_register_master WHERE inward_register_master.id=?";
		try {
			pstmt = connection.prepareStatement(deleteId);
			pstmt.setInt(1,id);
			pstmt.executeUpdate();
			System.out.println("Deleted Successfully");
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}




	@Override
	public List<InwardRegisterPojo> setInwardDetails(int id) {
		
		String setQuery="SELECT inward_register_master.id,inward_register_master.date,inward_register_master.sender_name,inward_register_master.address,inward_register_master.subject,inward_register_master.description,inward_register_master.document_Name FROM inward_register_master WHERE inward_register_master.id=?";
		try {
			pstmt = connection.prepareStatement(setQuery);
			pstmt.setInt(1, id);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				InwardRegisterPojo pojo=new InwardRegisterPojo();
				pojo.setId(rs.getInt(1));
				pojo.setDate(rs.getString(2));
				pojo.setSenderName(rs.getString(3));
				pojo.setAddress(rs.getString(4));
				pojo.setSubject(rs.getString(5));
				pojo.setDescription(rs.getString(6));
				pojo.setDocmentName(rs.getString(7));
				list.add(pojo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}


	@Override
	public List<InwardRegisterPojo> updatesender() {
		 String upQuery="SELECT inward_register_master.sender_name FROM inward_register_master";
		 try {
			pstmt = connection.prepareStatement(upQuery);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				InwardRegisterPojo pojo=new InwardRegisterPojo();
				pojo.setSenderName(rs.getString(1));
				list.add(pojo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}


	@Override
	public List<InwardRegisterPojo> updateSubject() {
		 String upQuery="SELECT inward_register_master.subject FROM inward_register_master";
		 try {
			pstmt = connection.prepareStatement(upQuery);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				InwardRegisterPojo pojo=new InwardRegisterPojo();
				pojo.setSubject(rs.getString(1));
				list.add(pojo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}


	@Override
	public List<InwardRegisterPojo> getDocument() {
		String getDocument="SELECT inward_outward_document_master.id,inward_outward_document_master.document_name FROM inward_outward_document_master";
		
		try {
			pstmt = connection.prepareStatement(getDocument);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				InwardRegisterPojo pojo=new InwardRegisterPojo();
				pojo.setId(rs.getInt(1));
				pojo.setDocmentName(rs.getString(2));
				list.add(pojo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}


	@Override
	public List<InwardRegisterPojo> updateDocument() {
		String updateDocument="SELECT inward_outward_document_master.id,inward_outward_document_master.document_name FROM inward_outward_document_master";
		try {
			pstmt = connection.prepareStatement(updateDocument);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				InwardRegisterPojo pojo=new InwardRegisterPojo();
				pojo.setId(rs.getInt(1));
				pojo.setDocmentName(rs.getString(2));
				list.add(pojo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}


	@Override
	public InwardRegisterPojo setDocumentName(int id) {
		InwardRegisterPojo pojo=new InwardRegisterPojo();
		String setDocument="SELECT inward_outward_document_master.document_name FROM inward_outward_document_master WHERE inward_outward_document_master.id=?";
		try {
			pstmt = connection.prepareStatement(setDocument);
			pstmt.setInt(1,id);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				pojo.setDocmentName(rs.getString(1));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return pojo;
	}


	@Override
	public InwardRegisterPojo setdocument(int id) {
		InwardRegisterPojo pojo=new InwardRegisterPojo();
		String setDocument="SELECT inward_outward_document_master.document_name FROM inward_outward_document_master WHERE inward_outward_document_master.id=?";
		try {
			pstmt = connection.prepareStatement(setDocument);
			pstmt.setInt(1,id);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				pojo.setDocmentName(rs.getString(1));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return pojo;
	}		
	
	
	

}
