package com.servletStore.attendance.schoolTransfer.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;

public class SchoolTransferImpl implements SchoolTransferDAO
{

	DBConnection con=new DBConnection();
	Connection connection=con.getConnection();
	PreparedStatement pstmt=null;
	@Override
	public List<String> getStandardList(SchoolTransferPOJO pojo,String orderBy) 
	{
		ResultSet rs = null;
		String query="SELECT classroom_master.id,std_master.name,classroom_master.division,classroom_master.shift FROM std_master,classroom_master,fk_class_master,fk_school_section_details WHERE\n" + 
								"fk_school_section_details.school_id="+pojo.getSchoolId()+" AND\n" + 
								"fk_class_master.fk_school_sec_id=fk_school_section_details.id AND\n" + 
								"std_master.id=fk_class_master.std_id AND\n" + 
								"classroom_master.fk_class_master_id=fk_class_master.id ORDER BY std_master.name "+orderBy+" LIMIT 1";
		List<String> standardList=new ArrayList<>();
		try 
		{
			pstmt=connection.prepareStatement(query);
			rs=pstmt.executeQuery();
			while (rs.next()) 
			{				
				System.out.println("------"+rs.getString("id"));
				standardList.add(rs.getString("id"));
				standardList.add(rs.getString("name"));
				standardList.add(rs.getString("division"));
				standardList.add(rs.getString("shift"));
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return standardList;
	}


	@Override
	public void UpdateCatalog(String stddiv_id,String year,List<String> stud_ids) 
	{
		try
		{
			//System.out.println("*************");
			for(int i=0;i<stud_ids.size();i++)
			{
				System.out.println(stddiv_id);
				System.out.println(year);
				System.out.println(stud_ids.get(i));
				pstmt=connection.prepareStatement("UPDATE class_allocation SET classroom_master=?,academic_year=? WHERE student_id=?");
				pstmt.setInt(1, Integer.parseInt(stddiv_id));
				pstmt.setString(2,year);
				pstmt.setInt(3, Integer.parseInt(stud_ids.get(i)));
				pstmt.executeUpdate();
				//System.out.println("INSERTED...");
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	@Override
	public List<SchoolTransferPOJO> getStudentList(String id,String year) 
	{
		// TODO Auto-generated method stub
		ResultSet rs = null;
		String query="SELECT student_details.id, student_details.first_name, student_details.middle_name, student_details.last_name, student_official_details.gr_no FROM student_details,student_official_details,class_allocation WHERE student_official_details.classroom_master="+id+" AND student_official_details.student_id =student_details.id AND student_official_details.lc_status=0 AND class_allocation.catalog_status=0 AND class_allocation.academic_year=? AND class_allocation.student_id=student_details.id";		
		//System.out.println(query);
		List<SchoolTransferPOJO> studList=new ArrayList<>();
		try 
		{
			pstmt=connection.prepareStatement(query);
			pstmt.setString(1,year);
			rs=pstmt.executeQuery();
			System.out.println("List : "+id+" Yr:"+year);
			
			while (rs.next()) 
			{
				SchoolTransferPOJO pojo=new SchoolTransferPOJO();
				pojo.setId(rs.getInt("id"));
				pojo.setRoll_no(String.valueOf(rs.getInt("id")));
				pojo.setGr_no(rs.getString("gr_no"));
				pojo.setName(rs.getString("first_name")+" "+rs.getString("middle_name")+" "+rs.getString("last_name"));
				studList.add(pojo);
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return studList;
	}
	@Override
	public List<SchoolTransferPOJO> getSectionList(String std_id) {
		
		ResultSet rs = null;
		String maxid="SELECT sections_master.name,sections_master.id FROM sections_master,fk_school_section_details,fk_class_master WHERE\n" + 
				"fk_class_master.id="+std_id+" AND\n" + 
				"fk_school_section_details.id=fk_class_master.fk_school_sec_id AND\n" + 
				"sections_master.id=fk_school_section_details.section_id";
		List<SchoolTransferPOJO> sectionList=new ArrayList<>();
		try 
		{
			pstmt=connection.prepareStatement(maxid);
			rs=pstmt.executeQuery();
			while (rs.next()) 
			{
				SchoolTransferPOJO pojo=new SchoolTransferPOJO();
				pojo.setId(rs.getInt("id"));
				System.out.println("ID : "+pojo.getId());
				System.out.println("Name : "+rs.getString("name"));
				sectionList.add(pojo);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return sectionList;
	}
	
	@Override
	public List<SchoolTransferPOJO> getSchoolList() 
	{
		ResultSet rs = null;
		String query="SELECT * FROM school_master";		
		//System.out.println(query);
		List<SchoolTransferPOJO> schoolList=new ArrayList<>();
		try 
		{
			pstmt=connection.prepareStatement(query);
			rs=pstmt.executeQuery();			
			while (rs.next()) 
			{
				SchoolTransferPOJO pojo=new SchoolTransferPOJO();
				pojo.setSchoolId(String.valueOf(rs.getInt("id")));
				pojo.setSchool_name(rs.getString("name"));
				schoolList.add(pojo);
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return schoolList;
	}


	@Override
	public List<SchoolTransferPOJO> getAcademicYears() {
		ResultSet rs = null;
		String query="SELECT * FROM academy_year;";		
		List<SchoolTransferPOJO> aca_year=new ArrayList<>();
		try 
		{
			pstmt=connection.prepareStatement(query);
			rs=pstmt.executeQuery();			
			while (rs.next()) 
			{
				SchoolTransferPOJO pojo=new SchoolTransferPOJO();
				pojo.setAca_year(rs.getString("year"));
				aca_year.add(pojo);
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return aca_year;
	}


	@Override
	public List<SchoolTransferPOJO> getHigherSchoolList(String sec_id) {
		ResultSet rs = null;
		sec_id="1";
		System.out.println("High Name : ");
		String maxid="SELECT school_master.id,school_master.name FROM school_master,fk_school_section_details,sections_master WHERE sections_master.id >"+sec_id+" AND fk_school_section_details.section_id=sections_master.id AND school_master.id=fk_school_section_details.school_id";
		List<SchoolTransferPOJO> sectionList=new ArrayList<>();
		try 
		{
			pstmt=connection.prepareStatement(maxid);
			rs=pstmt.executeQuery();
			while (rs.next()) 
			{
				SchoolTransferPOJO pojo=new SchoolTransferPOJO();
				pojo.setSchoolId(String.valueOf(rs.getInt("id")));
				pojo.setSchool_name(rs.getString("name"));
				System.out.println("High ID : "+pojo.getSchoolId());
				System.out.println("High Name : "+pojo.getSchool_name());
				sectionList.add(pojo);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return sectionList;
	}


	@Override
	public List<SchoolTransferPOJO> getHigherStdList(String sec_id, String school_id) {
		ResultSet rs = null;
		sec_id="1";
		//System.out.println("High Name : ");
		String maxid="SELECT classroom_master.id,std_master.name,classroom_master.division,classroom_master.shift FROM classroom_master,std_master,fk_school_section_details,fk_class_master WHERE fk_school_section_details.school_id="+school_id+" AND fk_school_section_details.section_id>"+sec_id+" AND fk_class_master.fk_school_sec_id=fk_school_section_details.id AND std_master.id=fk_class_master.std_id AND classroom_master.fk_class_master_id=fk_class_master.id  ORDER BY std_master.name ASC LIMIT 1";
		List<SchoolTransferPOJO> stdList=new ArrayList<>();
		try 
		{
			pstmt=connection.prepareStatement(maxid);
			rs=pstmt.executeQuery();
			while (rs.next()) 
			{
				SchoolTransferPOJO pojo=new SchoolTransferPOJO();
				pojo.setId(rs.getInt("id"));
				pojo.setStd(rs.getString("name"));
				pojo.setDiv(rs.getString("division"));
				pojo.setShift(rs.getString("shift"));
				stdList.add(pojo);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return stdList;
	}

}
