package com.servletStore.settings.caste.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;

public class CasteImpl implements CasteDAO {
	
	DBConnection dbconnect=new DBConnection();
	Connection connection=dbconnect.getConnection();
	
	PreparedStatement pstmt=null;
	
	@Override
	public void addCasteCategory(CastePOJO castePojo) {
		
		try 
		{
			pstmt=connection.prepareStatement("INSERT INTO caste_category (category_name) VALUES (?)");
			pstmt.setString(1, castePojo.getCasteCategoryName());
			pstmt.executeUpdate();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}		
	}

	@Override
	public List<CastePOJO> getCategoryDetails() {
		
		List<CastePOJO> list=new ArrayList<>();
		try {
			pstmt=connection.prepareStatement("SELECT id,category_name FROM caste_category");
			ResultSet rs= pstmt.executeQuery();
			while(rs.next()){
				CastePOJO castePojo=new CastePOJO();
				castePojo.setCategory_id(rs.getInt("id"));
				castePojo.setCasteCategoryName(rs.getString("category_name"));
				list.add(castePojo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void deleteCategory(int category_id) {
		
		try {
			pstmt=connection.prepareStatement("DELETE FROM caste_category WHERE id=?");
			pstmt.setInt(1, category_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void addReligion(CastePOJO castePojo) {
		
		try {
			pstmt=connection.prepareStatement("INSERT INTO religion(religion_name) VALUES (?)");
			pstmt.setString(1, castePojo.getReligionName());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<CastePOJO> getReligionDetails() {
		
		List<CastePOJO> list=new ArrayList<>();
		
		try {
			pstmt=connection.prepareStatement("SELECT id,religion_name FROM religion");
			ResultSet rs=pstmt.executeQuery();
			while (rs.next()) {
				CastePOJO castePojo=new CastePOJO();
				castePojo.setReligion_id(rs.getInt("id"));
				castePojo.setReligionName(rs.getString("religion_name"));
				list.add(castePojo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void deleteReligion(int religion_id) {
		
		try {
			pstmt=connection.prepareStatement("DELETE FROM religion WHERE id=?");
			pstmt.setInt(1, religion_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void addCaste(CastePOJO castepojo) {
		
		String query="INSERT INTO caste(`religion_id`,`category_id`,`caste_name`) VALUES(?,?,?)";
		try {
			PreparedStatement ps=connection.prepareStatement(query);
			ps.setInt(1, castepojo.getReligion_id());
			ps.setInt(2, castepojo.getCategory_id());
			ps.setString(3, castepojo.getCasteName());
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<CastePOJO> getCasteDetails() {
		
		List<CastePOJO> list=new ArrayList<CastePOJO>();
		
		String query3="SELECT caste.id, caste_category.category_name, religion.religion_name, caste.caste_name FROM caste_category, religion, caste WHERE caste_category.id=caste.category_id AND religion.id=caste.religion_id";
		try {
			PreparedStatement ps=connection.prepareStatement(query3);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{

				CastePOJO pojo=new CastePOJO();
				pojo.setCaste_id(rs.getInt("id"));
				pojo.setReligionName(rs.getString("religion_name"));
				pojo.setCasteCategoryName(rs.getString("category_name"));
				pojo.setCasteName(rs.getString("caste_name"));
				list.add(pojo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void deleteCaste(int caste_id) {
		
		try {
			pstmt=connection.prepareStatement("DELETE FROM caste WHERE id=?");
			pstmt.setInt(1, caste_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}				
	}
	
}