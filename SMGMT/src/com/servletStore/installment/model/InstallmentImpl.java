package com.servletStore.installment.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;

public class InstallmentImpl implements InstallmentDAO{
	DBConnection dbConnect = new DBConnection();
	static Connection connection;
	PreparedStatement pstmt=null;
	
	
	public InstallmentImpl()
	{
		connection=dbConnect.getConnection();
		
	}
	//Insert Into DB
	@Override
	public int insertInstallment(InstallmentPOJO pojo) throws SQLException {
		
		String query="INSERT INTO `installment_and_mode`( `mode_name`, `installment`, `date`) VALUES (?,?,?)";
		System.out.println("query"+query);
		pstmt=connection.prepareStatement(query);
		pstmt.setString(1,pojo.getModeName());
		pstmt.setInt(2,pojo.getInstallment());
		pstmt.setString(3, pojo.getDate());
		
		int st=pstmt.executeUpdate();
		return st;
	}
	//Insert Into Table
	@Override
	public List<InstallmentPOJO> getIntallmentDetails(int  id) throws SQLException {
		List<InstallmentPOJO>list=new ArrayList<InstallmentPOJO>();
		String query1="SELECT   `id`,`mode_name`, `installment`, `date` FROM `installment_and_mode` where id="+id;
		pstmt=connection.prepareStatement(query1);
		
		ResultSet rs=pstmt.executeQuery();
		while(rs.next())
		{
			InstallmentPOJO pojo1=new InstallmentPOJO();
			
			pojo1.setId(rs.getInt(1));
			pojo1.setModeName(rs.getString(2));
			pojo1.setInstallment(rs.getInt(3));
			pojo1.setDate(rs.getString(4));
			
			list.add(pojo1);
			
		}
		
		return list;
	}
	
	@Override
	public List<InstallmentPOJO> getIntallmentDetails() throws SQLException {
		List<InstallmentPOJO>list=new ArrayList<InstallmentPOJO>();
		String query1="SELECT   `id`,`mode_name`, `installment`, `date` FROM `installment_and_mode`";
		pstmt=connection.prepareStatement(query1);
		ResultSet rs=pstmt.executeQuery();
		while(rs.next())
		{
			InstallmentPOJO pojo1=new InstallmentPOJO();
			
			pojo1.setId(rs.getInt(1));
			pojo1.setModeName(rs.getString(2));
			pojo1.setInstallment(rs.getInt(3));
			pojo1.setDate(rs.getString(4));
			
			list.add(pojo1);
			
		}
		
		return list;
	}
	//Update Data
	@Override
	public int updatInstallment(InstallmentPOJO pojo) throws SQLException {
		String query2="UPDATE installment_and_mode SET mode_name=? ,installment=?, date=? WHERE id=?";
		System.out.println(query2);
		 pstmt=connection.prepareStatement(query2);
		 
		 pstmt.setString(1,pojo.getModeName());
		 pstmt.setInt(2, pojo.getInstallment());
		 pstmt.setString(3,pojo.getDate());
		 pstmt.setInt(4,pojo.getId());
		 
		 int status=pstmt.executeUpdate();
		 
		 
		
		return status;
	}
	

}
