package com.servletStore.casteWiseEduFees.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.dbconnect.DBConnection;


public class casteWiseEduFeesIMPL implements casteWiseEduFeesDAO {

	DBConnection connection=new DBConnection();
	Connection connection2=connection.getConnection();
	casteWiseEduFeesPojo pojo=new casteWiseEduFeesPojo();
	PreparedStatement pstmt=null;
	
	@Override
	public int insertEducationalFees(List<casteWiseEduFeesPojo> list) {
		
		Iterator<casteWiseEduFeesPojo> itr=list.iterator();
		casteWiseEduFeesPojo pojo=(casteWiseEduFeesPojo)itr.next();
		String insertQuery="INSERT INTO caste_wise_educational_fees(caste_wise_educational_fees.fees_type_id,caste_wise_educational_fees.fk_class_master_standard_id,caste_wise_educational_fees.caste_category_id,caste_wise_educational_fees.fees) VALUES(?,?,?,?) ";
		try {
			pstmt = connection2.prepareStatement(insertQuery);
			pstmt.setString(1,pojo.getFeesType());
			pstmt.setString(2,pojo.getStandard());
			pstmt.setInt(3,pojo.getCategoryId());
			pstmt.setString(4,pojo.getFees());
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
	}

	@Override
	public List<casteWiseEduFeesPojo> getFeesType() {
		List<casteWiseEduFeesPojo> list=new ArrayList<>();
		
		String selectTypes="SELECT fee_type.id,fee_type.fees_type FROM fee_type WHERE fee_type.caste=1";
		try {
			pstmt = connection2.prepareStatement(selectTypes);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				casteWiseEduFeesPojo pojo=new casteWiseEduFeesPojo();
				pojo.setId(rs.getInt(1));
				pojo.setFeesType(rs.getString(2));
				list.add(pojo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public List<casteWiseEduFeesPojo> getStandard(String schoolId) {
		List<casteWiseEduFeesPojo> list=new ArrayList<>();
		
		String getstandardList="SELECT fk_class_master.id,std_master.name FROM fk_class_master,std_master,fk_school_section_details WHERE fk_class_master.std_id=std_master.id AND fk_class_master.fk_school_sec_id=fk_school_section_details.id AND fk_school_section_details.school_id="+schoolId+" ORDER BY std_master.name ASC";
		try {
			pstmt = connection2.prepareStatement(getstandardList);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				casteWiseEduFeesPojo pojo=new casteWiseEduFeesPojo();
				pojo.setId(rs.getInt(1));
				pojo.setStandard(rs.getString(2));
				list.add(pojo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public List<casteWiseEduFeesPojo> getCasteCategory() {
		List<casteWiseEduFeesPojo> list=new ArrayList<>();
		String getCasteCategory="SELECT caste_category.id,caste_category.category_name FROM caste_category ORDER BY id ASC";
		try {
			pstmt = connection2.prepareStatement(getCasteCategory);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				casteWiseEduFeesPojo pojo=new casteWiseEduFeesPojo();
				pojo.setId(rs.getInt(1));
				pojo.setCategory(rs.getString(2));
				list.add(pojo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public List<casteWiseEduFeesPojo> fetchDetails() {
		List<casteWiseEduFeesPojo> list=new ArrayList<>();
		String fetchData="SELECT caste_wise_educational_fees.id,fee_type.fees_type,std_master.name,caste_category.category_name,caste_wise_educational_fees.fees FROM caste_wise_educational_fees,fee_type,std_master,caste_category WHERE caste_wise_educational_fees.fees_type_id=fee_type.id AND caste_wise_educational_fees.fk_class_master_standard_id=std_master.id AND caste_wise_educational_fees.caste_category_id=caste_category.id";
		try {
			pstmt = connection2.prepareStatement(fetchData);
		ResultSet rs=pstmt.executeQuery();
		while(rs.next())
		{
			casteWiseEduFeesPojo pojo=new casteWiseEduFeesPojo();
			pojo.setId(rs.getInt(1));
			pojo.setFeesType(rs.getString(2));
			pojo.setStandard(rs.getString(3));
			pojo.setCategory(rs.getString(4));
			pojo.setFees(rs.getString(5));
			list.add(pojo);
		}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	/*@Override
	public int insertCategory(List list) {
		//System.out.println("list is:"+list);
		int casteId=0;
		String selectQuery="SELECT MAX(id) as id FROM caste_wise_educational_fees";
		
		try {
			
			pstmt = connection2.prepareStatement(selectQuery);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
					casteId=rs.getInt("id");
			}
		} catch (Exception e) {}
		
		Iterator itr=list.iterator();
		
		while(itr.hasNext())
		{
			casteWiseEduFeesPojo pojo=(casteWiseEduFeesPojo)itr.next();
			String insertCategory="INSERT INTO fk_caste_category_educational_details(fk_caste_category_educational_details.caste_category_edu_fees_id,fk_caste_category_educational_details.caste_category_id) VALUES(?,?)";
			try {
				
				pstmt = connection2.prepareStatement(insertCategory);
				pstmt.setInt(1, casteId);
				pstmt.setInt(2, pojo.getCategoryId());
				pstmt.executeUpdate();
				
				
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		return casteId;
		
	}*/

	@Override
	public String getCategory(int id) {
		String categoryList="";
		String category="SELECT caste_category.category_name FROM caste_category WHERE caste_category.id IN(SELECT fk_caste_category_educational_details.caste_category_id FROM fk_caste_category_educational_details WHERE fk_caste_category_educational_details.caste_category_edu_fees_id=?)";
		try {
			pstmt = connection2.prepareStatement(category);
			pstmt.setInt(1, id);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				categoryList+=rs.getString(1)+",";
				System.out.println(categoryList);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return categoryList;
	}

	

}
