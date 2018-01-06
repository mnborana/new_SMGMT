package com.servletStore.attendance.catalogYearChange.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;
import com.servletStore.attendance.schoolTransfer.model.SchoolTransferPOJO;
import com.servletStore.student.model.StudentPojo;

public class CatalogYearChangeImpl implements CatalogYearChangeDAO
{

	DBConnection con=new DBConnection();
	Connection connection=con.getConnection();
	PreparedStatement pstmt=null;
	@Override
	public List<String> getStandardList(CatalogYearChangePOJO pojo) 
	{
		ResultSet rs = null;
		String query="SELECT classroom_master.id,std_master.name,classroom_master.division,classroom_master.shift FROM std_master,classroom_master,fk_class_master,fk_school_section_details WHERE\n" + 
								"fk_school_section_details.school_id="+pojo.getSchoolId()+" AND\n" + 
								"fk_class_master.fk_school_sec_id=fk_school_section_details.id AND\n" + 
								"std_master.id=fk_class_master.std_id AND\n" + 
								"classroom_master.fk_class_master_id=fk_class_master.id";
		List<String> standardList=new ArrayList<>();
		try 
		{
			pstmt=connection.prepareStatement(query);
			rs=pstmt.executeQuery();
			while (rs.next()) 
			{
				System.out.println(rs.getString("id"));
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
	public List<CatalogYearChangePOJO> getCatalogDetails() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void UpdateCatalog(String stddiv_id,String year,List<String> stud_ids) 
	{
		try
		{
			System.out.println("*************");
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
				System.out.println("INSERTED...");
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	@Override
	public List<CatalogYearChangePOJO> getStudentList(String id,String year) 
	{
		// TODO Auto-generated method stub
		ResultSet rs = null;
		String query="SELECT student_details.id, student_details.first_name, student_details.middle_name, student_details.last_name, student_official_details.gr_no FROM student_details,student_official_details,class_allocation WHERE student_official_details.classroom_master="+id+" AND student_official_details.student_id =student_details.id AND student_official_details.lc_status=0 AND class_allocation.catalog_status=0 AND class_allocation.academic_year=? AND class_allocation.student_id=student_details.id";		
		System.out.println(query);
		List<CatalogYearChangePOJO> studList=new ArrayList<>();
		try 
		{
			pstmt=connection.prepareStatement(query);
			pstmt.setString(1,year);
			rs=pstmt.executeQuery();
			System.out.println("List : "+id+" Yr:"+year);
			
			while (rs.next()) 
			{
				CatalogYearChangePOJO pojo=new CatalogYearChangePOJO();
				pojo.setId(rs.getInt("id"));
				pojo.setRoll_no(String.valueOf(rs.getInt("id")));
				pojo.setGr_no(rs.getString("gr_no"));
				pojo.setName(rs.getString("first_name")+" "+rs.getString("middle_name")+" "+rs.getString("last_name"));
				studList.add(pojo);
				System.out.println("IDDDDDD:"+rs.getInt("id"));				
//				System.out.println(rs.getString("first_name"));
//				System.out.println(rs.getString("middle_name"));
//				System.out.println(rs.getString("last_name"));
//				System.out.println(rs.getString("gr_no"));
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return studList;
	}
	@Override
	public List<CatalogYearChangePOJO> getAcademicYears() {
		ResultSet rs = null;
		String query="SELECT * FROM academy_year;";		
		List<CatalogYearChangePOJO> aca_year=new ArrayList<>();
		try 
		{
			pstmt=connection.prepareStatement(query);
			rs=pstmt.executeQuery();			
			while (rs.next()) 
			{
				CatalogYearChangePOJO pojo=new CatalogYearChangePOJO();
				pojo.setAca_year(rs.getString("year"));
				aca_year.add(pojo);
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return aca_year;
	}

}
