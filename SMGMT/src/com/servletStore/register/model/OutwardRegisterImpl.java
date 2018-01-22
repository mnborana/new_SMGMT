package com.servletStore.register.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;

public class OutwardRegisterImpl implements OutwardRegisterDAO {
	
	DBConnection conn=new DBConnection();
	Connection connection=conn.getConnection();
	PreparedStatement pstmt=null;
	List<OutwardRegisterPojo> list=new ArrayList<>();

	@Override
	public void insertOutwardRegister(OutwardRegisterPojo pojo) {
		String insertQuery="INSERT INTO `outward_register_master`(`outward_no`, `date`, `receiver_name`, `address`,`mobileNo`,`subject`, `description`,`document_Name`) VALUES (?,?,?,?,?,?,?,?)";
		try {
			pstmt=connection.prepareStatement(insertQuery);
			pstmt.setInt(1, pojo.getOutwardNo());
			pstmt.setString(2, pojo.getRequireddate());
			pstmt.setString(3, pojo.getReceiverName());
			pstmt.setString(4, pojo.getAddress());
			pstmt.setString(5, pojo.getMobileNo());
			pstmt.setString(6, pojo.getSubject());
			pstmt.setString(7, pojo.getDescription());
			pstmt.setString(8, pojo.getOutwardDoc());
			
			int i=pstmt.executeUpdate();
			
			System.out.println("inserted Outward Register Details");
		} catch (SQLException e) {e.printStackTrace();}
	}

	@Override
	public OutwardRegisterPojo outwardNo() {
		OutwardRegisterPojo pojo=new OutwardRegisterPojo();
		String outwardNoQuery="SELECT MAX(id) FROM outward_register_master";
		try {
			pstmt=connection.prepareStatement(outwardNoQuery);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				
				pojo.setOutwardNo(rs.getInt(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return pojo;
	}

	@Override
	public List<OutwardRegisterPojo> selectOutwardRegister() {
		
		String selectOutwardRegister="SELECT outward_register_master.id,outward_register_master.outward_no,outward_register_master.date,outward_register_master.receiver_name,outward_register_master.address,outward_register_master.subject,outward_register_master.mobileNo,outward_register_master.description,outward_register_master.document_Name FROM outward_register_master";
		try {
			pstmt=connection.prepareStatement(selectOutwardRegister);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				OutwardRegisterPojo pojo=new OutwardRegisterPojo();
				pojo.setId(rs.getInt(1));
				pojo.setOutwardNo(rs.getInt(2));
				pojo.setRequireddate(rs.getString(3));
				pojo.setReceiverName(rs.getString(4));
				pojo.setAddress(rs.getString(5));
				pojo.setSubject(rs.getString(6));
				pojo.setMobileNo(rs.getString(7));
				pojo.setDescription(rs.getString(8));
				pojo.setOutwardDoc(rs.getString(9));
				list.add(pojo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<OutwardRegisterPojo> selectDocument() {
		String selectDocument="SELECT inward_outward_document_master.id,inward_outward_document_master.document_name FROM inward_outward_document_master";
		try {
			pstmt = connection.prepareStatement(selectDocument);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				OutwardRegisterPojo pojo=new OutwardRegisterPojo();
				pojo.setId(rs.getInt(1));
				pojo.setOutwardDoc(rs.getString(2));
				list.add(pojo);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public void addReciverName(OutwardRegisterPojo pojo) {
		String addReceiver="INSERT INTO sender_receiver_master(sender_receiver_name,address,mobileNo) VALUES(?,?,?)";
		try {
			pstmt = connection.prepareStatement(addReceiver);
			pstmt.setString(1,pojo.getReceiverName());
			pstmt.setString(2, pojo.getAddress());
			pstmt.setString(3, pojo.getMobileNo());
			
			pstmt.executeUpdate();
			System.out.println("inserted Document Successfully");
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	@Override
	public List<OutwardRegisterPojo> upReceiver() {
		String upReceiver="SELECT outward_register_master.receiver_name FROM outward_register_master";
		try {
			pstmt =connection.prepareStatement(upReceiver);
			ResultSet rs= pstmt.executeQuery();
			while(rs.next())
			{
				OutwardRegisterPojo pojo=new OutwardRegisterPojo();
				pojo.setReceiverName(rs.getString(1));
				list.add(pojo);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public List<OutwardRegisterPojo> upSubject() {
	String upSubject="SELECT outward_register_master.subject FROM outward_register_master";
	try {
		pstmt = connection.prepareStatement(upSubject);
	    ResultSet rs=pstmt.executeQuery();
	    while(rs.next())
	    {
	    	OutwardRegisterPojo pojo=new OutwardRegisterPojo();
	    	pojo.setSubject(rs.getString(1));
	    	list.add(pojo);
	    }
	} catch (Exception e) {
		// TODO: handle exception
	}
		return list;
	}

	@Override
	public void updateOutwardReg(OutwardRegisterPojo pojo, int id) {
		String updateOutward="UPDATE outward_register_master SET outward_register_master.date=?,outward_register_master.receiver_name=?,outward_register_master.address=?,outward_register_master.mobileNo=?,outward_register_master.subject=?,outward_register_master.description=?,outward_register_master.document_Name=? WHERE outward_register_master.id=?";
		try {
			pstmt = connection.prepareStatement(updateOutward);
			pstmt.setString(1, pojo.getRequireddate());
			pstmt.setString(2, pojo.getReceiverName());
			pstmt.setString(3, pojo.getAddress());
			pstmt.setString(4, pojo.getMobileNo());
			pstmt.setString(5, pojo.getSubject());
			pstmt.setString(6, pojo.getDescription());
			pstmt.setString(7, pojo.getOutwardDoc());			
			pstmt.setInt(8, id);
			pstmt.executeUpdate();
			System.out.println("updated Successfully");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	@Override
	public void deleteOutwardReg(int id) {
		String deleteOutward="DELETE FROM outward_register_master WHERE outward_register_master.id=?";
		try {
			pstmt = connection.prepareStatement(deleteOutward);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			System.out.println("Deleted Successfully");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	@Override
	public List<OutwardRegisterPojo> setOutwardDetails(int id) {
		String setOutward="SELECT outward_register_master.id,outward_register_master.date,outward_register_master.receiver_name,outward_register_master.address,outward_register_master.mobileNo,outward_register_master.subject,outward_register_master.description,outward_register_master.document_Name FROM outward_register_master WHERE outward_register_master.id=?";
		try {
			pstmt = connection.prepareStatement(setOutward);
			pstmt.setInt(1, id);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				OutwardRegisterPojo pojo=new OutwardRegisterPojo();
				pojo.setId(rs.getInt(1));
				pojo.setRequireddate(rs.getString(2));
				pojo.setReceiverName(rs.getString(3));
				pojo.setAddress(rs.getString(4));
				pojo.setMobileNo(rs.getString(5));
				pojo.setSubject(rs.getString(6));
				pojo.setDescription(rs.getString(7));
				pojo.setOutwardDoc(rs.getString(8));
				list.add(pojo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public List<OutwardRegisterPojo> updateDocument() {
		String updateDocument="SELECT inward_outward_document_master.id,inward_outward_document_master.document_name FROM inward_outward_document_master";
		try {
			pstmt = connection.prepareStatement(updateDocument);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				OutwardRegisterPojo pojo=new OutwardRegisterPojo();
				pojo.setId(rs.getInt(1));
				pojo.setOutwardDoc(rs.getString(2));
				list.add(pojo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public OutwardRegisterPojo selectDocumentName(int id) {
		OutwardRegisterPojo pojod=new OutwardRegisterPojo();
		String getDocumentName="SELECT inward_outward_document_master.document_name FROM inward_outward_document_master WHERE inward_outward_document_master.id=?";
		try {
			pstmt = connection.prepareStatement(getDocumentName);
			pstmt.setInt(1, id);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{				
				pojod.setOutwardDoc(rs.getString(1));
				list.add(pojod);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return pojod;
	}

	@Override
	public OutwardRegisterPojo setDocumentInServlet(int id) {
		OutwardRegisterPojo pojo=new OutwardRegisterPojo();
		String setQuery="SELECT inward_outward_document_master.document_name FROM inward_outward_document_master WHERE inward_outward_document_master.id=?";
		try {
			pstmt = connection.prepareStatement(setQuery);
			pstmt.setInt(1, id);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{				
				pojo.setOutwardDoc(rs.getString(1));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return pojo;
	}
	
	@Override
	public List<OutwardRegisterPojo> selectSubjctName() {
		String subjectQuery="SELECT outward_register_master.subject FROM outward_register_master";
		try {
			pstmt = connection.prepareStatement(subjectQuery);
			ResultSet rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				OutwardRegisterPojo pojo1=new OutwardRegisterPojo();
				pojo1.setSubject(rs.getString(1));
				list.add(pojo1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public List getReceiverDetails(String input) {
		List list=new ArrayList<>();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			String checkName="SELECT outward_register_master.id,outward_register_master.receiver_name,outward_register_master.mobileNo FROM outward_register_master WHERE outward_register_master.receiver_name LIKE '%"+input+"%' UNION SELECT outward_register_master.id,outward_register_master.mobileNo,outward_register_master.receiver_name FROM outward_register_master WHERE outward_register_master.mobileNo LIKE '"+input+"%'";
			pstmt=connection.prepareStatement(checkName);
			rs=pstmt.executeQuery();			
			while(rs.next())
			{
				list.add(rs.getString(1));
				list.add(rs.getString(2));
				list.add(rs.getString(3));							
			}			
		} catch (Exception e) {	}
		return list;
	}
	
	@Override
	public List searchName(String input) {
		List list=new ArrayList<>();
			String setReciver="SELECT outward_register_master.address,outward_register_master.mobileNo FROM outward_register_master WHERE outward_register_master.id='"+input+"'";
			try {
				pstmt = connection.prepareStatement(setReciver);
				ResultSet rs=pstmt.executeQuery();
				while(rs.next())
				{
					list.add(rs.getString(1));
					list.add(rs.getString(2));
				}
			} catch (Exception e) {}
			return list;
	}
}
