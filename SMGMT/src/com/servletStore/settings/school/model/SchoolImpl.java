package com.servletStore.settings.school.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;

import com.dbconnect.DBConnection;




public class SchoolImpl implements SchoolDAO{

	DBConnection dbConnect = new DBConnection();
	Connection conn = dbConnect.getConnection();
	
	
	PreparedStatement pstmt = null;
	
	

	public List<SchoolPOJO> getSchoolDetails() 
	{
		List<SchoolPOJO> list=new ArrayList<SchoolPOJO>();
		String selectSchoolDetails="SELECT school_master.id,school_master.name,school_master.address,school_master.slogan,"
				+ "school_master.index_no,school_master.licence_no,school_master.udise,school_master.licence_no,"
				+ "school_master.udise,school_master.school_code,school_master.email_id,school_master.phone_no,school_master.board,"
				+ "school_master.punit_code,school_master.center,school_master.date,school_master.jubilee_year,"
				+ "school_master.establish_year,school_master.medium FROM school_master WHERE school_master.status=1";
		try {
			pstmt=conn.prepareStatement(selectSchoolDetails);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				SchoolPOJO pojo=new SchoolPOJO();
				//System.out.println("id:"+rs.getInt("id")+" name:"+rs.getString("name")+"address:"+rs.getString("address")+"slogan:"+rs.getString("slogan")+"index_no:"+rs.getString("index_no")+"licence_no:"+rs.getString("licence_no"));
				pojo.setId(rs.getInt("id"));
				pojo.setSchoolName(rs.getString("name"));
				pojo.setAddress(rs.getString("address"));
				pojo.setPhoneno(rs.getString("phone_no"));
				pojo.setMedium(rs.getString("medium"));
				
				list.add(pojo);
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}



	@Override
	public void updateSchoolDetails(SchoolPOJO schoolPojo) {
		List<SchoolPOJO> list=new ArrayList<SchoolPOJO>();
		try {
			
			
			String update_query="UPDATE school_master SET school_master.name=?,school_master.address=?,school_master.slogan=?,school_master.index_no=?,school_master.licence_no=?,school_master.udise=?,school_master.school_code=?,school_master.email_id=?,school_master.phone_no=?,school_master.board=?,school_master.punit_code=?,school_master.center=?,school_master.date=?,school_master.jubilee_year=?,school_master.establish_year=?,school_master.medium=?  WHERE school_master.id=?";
			//System.out.println("update idis:"+update_query);
			
			pstmt=conn.prepareStatement(update_query);		
		
			
			pstmt.setString(1, schoolPojo.getSchoolName());
			pstmt.setString(2, schoolPojo.getAddress());
			pstmt.setString(3, schoolPojo.getSlogan());
			pstmt.setString(4, schoolPojo.getIndexno());
			pstmt.setString(5, schoolPojo.getLicenceno());
			pstmt.setString(6, schoolPojo.getUdise());
			pstmt.setString(7, schoolPojo.getShoolcode());
			pstmt.setString(8, schoolPojo.getEmailid());
			pstmt.setString(9, schoolPojo.getPhoneno());
			pstmt.setString(10, schoolPojo.getBoard());
			pstmt.setString(11, schoolPojo.getPunitcode());
			pstmt.setString(12, schoolPojo.getCenter());
			pstmt.setString(13, schoolPojo.getDate());	
			pstmt.setString(14, schoolPojo.getJubileeYear());
			pstmt.setString(15, schoolPojo.getEstablishYear());
			pstmt.setString(16, schoolPojo.getMedium());
			pstmt.setInt(17, schoolPojo.getId());
			
			int i=pstmt.executeUpdate();	
			
			System.out.println("Updated Successfully");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public List<SchoolPOJO> getSection() {
		List<SchoolPOJO> list=new ArrayList<SchoolPOJO>();
			
			String select="SELECT `id`,`name` FROM `sections_master`";
			try {
				pstmt=conn.prepareStatement(select);
				ResultSet rs = pstmt.executeQuery();
				
				while (rs.next()) {
					SchoolPOJO pojo=new SchoolPOJO();
				
					pojo.setSection_id(rs.getInt("id"));
					pojo.setSectionName(rs.getString("name"));
					list.add(pojo);
				
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
			
	}



	@Override
	public List<SchoolPOJO> selectSchoolDetails(SchoolPOJO schoolPojo,int id) {
		List<SchoolPOJO> list=new ArrayList<SchoolPOJO>();
				
		try {

			String selectModalDetails="SELECT school_master.id,school_master.name,school_master.address,school_master.slogan,school_master.index_no,school_master.licence_no,school_master.udise,school_master.school_code,school_master.email_id,school_master.email_id,school_master.phone_no,school_master.board,school_master.punit_code,school_master.center,school_master.date,school_master.jubilee_year,school_master.establish_year,school_master.medium FROM school_master WHERE school_master.id=?";
			pstmt=conn.prepareStatement(selectModalDetails);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				SchoolPOJO pojo=new SchoolPOJO();
								
				pojo.setId(rs.getInt("id"));
				pojo.setSchoolName(rs.getString("name"));
				pojo.setAddress(rs.getString("address"));
				pojo.setSlogan(rs.getString("slogan"));
				pojo.setIndexno(rs.getString("index_no"));
				pojo.setLicenceno(rs.getString("licence_no"));
				pojo.setUdise(rs.getString("udise"));
				pojo.setShoolcode(rs.getString("school_code"));
				pojo.setEmailid(rs.getString("email_id"));
				pojo.setPhoneno(rs.getString("phone_no"));
				pojo.setBoard(rs.getString("board"));
				pojo.setPunitcode(rs.getString("punit_code"));
				pojo.setCenter(rs.getString("center"));
				pojo.setDate(rs.getString("date"));
				pojo.setJubileeYear(rs.getString("jubilee_year"));
				pojo.setEstablishYear(rs.getString("establish_year"));
				pojo.setMedium(rs.getString("medium"));
				list.add(pojo);
			
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return list;
	}
	
		@Override
		public int deleteSchool(int id) 
		{
			  int status=0;  
			        try{  
			            
			            pstmt=conn.prepareStatement("delete from school_master where id=?");  
			            pstmt.setInt(1,id);  
			            status=pstmt.executeUpdate();  
			            System.out.println("Deleted Successfully");
			         
			        }catch(Exception e){e.printStackTrace();}  
			          
			        return status;    
		
		}

		@Override
		public void insertSection(List list) {
				int scid=0;
				
				String query="SELECT MAX(id) as id FROM school_master";
				try {
					pstmt=conn.prepareStatement(query);
					ResultSet rs=pstmt.executeQuery();
				   while(rs.next())
				   {
					   
					   scid = rs.getInt("id");
					   System.out.println("scool:"+scid);
				   }
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				Iterator itr=list.iterator();
				while(itr.hasNext())
				{
					SchoolPOJO schoolPojo=(SchoolPOJO)itr.next();
				
					String school_section="INSERT INTO fk_school_section_details(school_id,section_id) VALUES(?,?)";
					try {
						pstmt=conn.prepareStatement(school_section);
						pstmt.setInt(1, scid);
						pstmt.setInt(2, schoolPojo.getSection_id());
						int j=pstmt.executeUpdate();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					//System.out.println("Section id:"+schoolPojo.getSection_id());
					System.out.println("Section Id Inserted Successfully");
				}
				
			
		}



		@Override
		public String selectSection(int id) {
			String section="";
			String query="SELECT sections_master.name FROM sections_master WHERE sections_master.id IN(SELECT fk_school_section_details.section_id FROM fk_school_section_details WHERE fk_school_section_details.school_id=?)";
			try {
				
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, id);
				ResultSet rs=pstmt.executeQuery();
				while(rs.next())
				{
						
					section+=rs.getString(1)+",";
					
					
					
				}
				
				
					} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			return section;
			
		}



		@Override
		public List getSectionDetails() {
			
			List list=new ArrayList();
			
			String select="SELECT `id`,`name` FROM `sections_master`";
			try {
				pstmt=conn.prepareStatement(select);
				ResultSet rs = pstmt.executeQuery();
				
				while (rs.next()) {
					
					list.add(rs.getInt("id"));
					list.add(rs.getString("name"));
				
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		
		}



		@Override
		public int insertSchoolSection(int schoolId, int sectionId) {
			
			int status=0;
			
			String query="INSERT INTO `fk_school_section_details`(`school_id`, `section_id`) VALUES (?,?)";
			try{
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, schoolId);
				pstmt.setInt(2, sectionId);
				status=pstmt.executeUpdate();
			}
			catch(Exception e)
			{
				
			}
			
			
			return status;
		}

		@Override
		public List getSchoolForActivation() throws SQLException
		{
			DBConnection dbConnect = new DBConnection();
			Connection conn = dbConnect.getConnection();
			List list=new ArrayList();
			
			String query="SELECT school_master.id,school_master.name FROM school_master WHERE school_master.status=0";
			pstmt=conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				list.add(rs.getInt("id"));
				list.add(rs.getString("name"));
			
			}
			conn.close();
			return list;
		}

		@Override
		public int activateSchool(int schoolId) throws SQLException
		{
			DBConnection dbConnect = new DBConnection();
			Connection conn = dbConnect.getConnection();
			int status=0;
			
			String query="UPDATE `school_master` SET `status`=1 WHERE school_master.id=?";
			pstmt=conn.prepareStatement(query);		
			pstmt.setInt(1, schoolId);
			status=pstmt.executeUpdate();	
			
			conn.close();
			return status;
		}


		@Override
		public int getTotalSchools() throws SQLException
		{
			DBConnection dbConnect = new DBConnection();
			Connection conn = dbConnect.getConnection();
			
			int totalSchools=0;
			String query="SELECT trustee_info.no_of_schools FROM `trustee_info`";
			pstmt=conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next())
			{
				totalSchools=rs.getInt(1);
			}
			
			conn.close();
			return totalSchools;
		}


		@Override
		public int updateTotalSchools(int available, int updated) throws SQLException
		{
			DBConnection dbConnect = new DBConnection();
			Connection conn = dbConnect.getConnection();
			int status=0;
			
			String query="UPDATE `trustee_info` SET `no_of_schools`=? WHERE `no_of_schools`=?";
			pstmt=conn.prepareStatement(query);		
			pstmt.setInt(1, updated);
			pstmt.setInt(2, available);
			status=pstmt.executeUpdate();	
			
			conn.close();
			return status;
		}


		
}
