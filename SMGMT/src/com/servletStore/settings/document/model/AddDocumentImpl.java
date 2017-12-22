package com.servletStore.settings.document.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;

public class AddDocumentImpl implements AddDocumentDAO{

	DBConnection conn=new DBConnection();
	Connection connection=conn.getConnection();
	PreparedStatement pstmt=null;
	
	
	@Override
	public void addDocument(AddDocumentPojo pojo) {
		String insertQuery="INSERT INTO inward_outward_document_master(document_name) VALUES(?)";
		try {
			
			pstmt=connection.prepareStatement(insertQuery);
			pstmt.setString(1, pojo.getRegisterName());
			pstmt.executeUpdate();
			System.out.println("inserted Document Successfully");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}


	@Override
	public List<AddDocumentPojo> selectDocuments() {
		String selectQuery="SELECT inward_outward_document_master.id,inward_outward_document_master.document_name FROM inward_outward_document_master";
		List<AddDocumentPojo> list=new ArrayList<>();
		try {
			pstmt=connection.prepareStatement(selectQuery);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				AddDocumentPojo pojo=new AddDocumentPojo();
				pojo.setId(rs.getInt(1));
				pojo.setRegisterName(rs.getString(2));
				list.add(pojo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public List<AddDocumentPojo> setDocumentName(int id) {
		List<AddDocumentPojo> list=new ArrayList<>();
		String setDocument="SELECT inward_outward_document_master.id,inward_outward_document_master.document_name FROM inward_outward_document_master WHERE inward_outward_document_master.id=?";
		try {
			
			pstmt=connection.prepareStatement(setDocument);
			pstmt.setInt(1, id);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				AddDocumentPojo pojo=new AddDocumentPojo();
				pojo.setId(rs.getInt(1));
				pojo.setRegisterName(rs.getString(2));
				list.add(pojo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public void updateDocument(AddDocumentPojo pojo,int id) {
		String updateQuery="UPDATE inward_outward_document_master SET inward_outward_document_master.document_name=? WHERE inward_outward_document_master.id=?";
		try {
			pstmt=connection.prepareStatement(updateQuery);
			pstmt.setString(1, pojo.getRegisterName());
			pstmt.setInt(2, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}


	@Override
	public void deleteDocument(AddDocumentPojo pojo, int id) {
		String deleteQuery="DELETE FROM inward_outward_document_master WHERE inward_outward_document_master.id=?";
		try {
			pstmt=connection.prepareStatement(deleteQuery);
			pstmt.setInt(1,id);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	

}
