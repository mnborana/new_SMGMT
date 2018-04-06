package com.servletStore.attendance.removeCatlog.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;

public class removeStudentImpl implements removeStudetDAO
{
	DBConnection dbconnect=new DBConnection();
	Connection connection=dbconnect.getConnection();
	PreparedStatement pstmt=null;
	@Override
	public void insert(removeStudentPOJO rp)
	{
	System.out.println("stud id "+rp.getStud_id()+"std_id "+rp.getStd_id());	
	try 
	{
		String remove_std="update class_allocation set catalog_status=1 where student_id="+rp.getStud_id();
		PreparedStatement pstmt1=connection.prepareStatement(remove_std);
		pstmt1.executeUpdate();
		System.out.println("updated!!!!");
		pstmt=connection.prepareStatement("insert into catlog_remove_student_master(stud_id,std_id,remove_date,reason) values(?,?,?,?)");
		pstmt.setInt(1, rp.getStud_id());
		pstmt.setInt(2, rp.getStd_id());
		pstmt.setString(3, rp.getRemove_date());
		pstmt.setString(4, rp.getReason());
		//pstmt.setString(5, rp.getAcademic_year());
		pstmt.executeUpdate();
		System.out.println("iiiiiiiiiiii");
		
	} 
	catch (SQLException e)
	{
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}

	@Override
	public List<String> getStudentDetails(int std)
	{
		//status for remove student is::::1
			List<String> list=new ArrayList<>();
			String sql="SELECT student_details.id,concat(student_details.first_name,' ',student_details.middle_name,' ',student_details.last_name)AS fullName FROM student_details,student_parent_details,class_allocation,student_official_details WHERE class_allocation.classroom_master='"+std+"' AND student_details.id=class_allocation.student_id AND student_parent_details.student_id=student_details.id AND student_official_details.student_id=student_details.id AND class_allocation.academic_year='2017-2018' AND class_allocation.catalog_status=0 AND student_official_details.lc_status=0";			
			try {
				pstmt = connection.prepareStatement(sql);
				ResultSet rs=pstmt.executeQuery();
				//removeStudentPOJO pojo=new removeStudentPOJO();
				
				while(rs.next())
				{
					
					list.add(rs.getInt(1)+","+rs.getString(2));
					//removeStudentPOJO pojo=new removeStudentPOJO();
					//StudentDetailsPOJO pojo=new StudentDetailsPOJO();
					//pojo.setStud_id(rs.getInt(1));
					//pojo.setStud_name(rs.getString(2));
					//pojo.setStd_id(rs.getInt(3));
					//pojo.setStd_name(rs.getString(4));
					//pojo.setDiv(rs.getString(5));
					//pojo.setAcademic_year(rs.getString(6));
					//pojo.setAcademic_year(rs.getString(7));
				//System.out.println("Id:"+rs.getInt(1));
					//System.out.println("Name:"+rs.getString(2));
					///System.out.println("GR No:"+rs.getString(3));
					///System.out.println("STD:"+rs.getString(4));
					//System.out.println("Div:"+rs.getString(5));
					//list.add(pojo);
					
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			return list;
			
		}

	@Override
	public List<removeStudentPOJO> getRemoveStudentDetails()
	{

		List<removeStudentPOJO> list=new ArrayList<>();
		String s="SELECT catlog_remove_student_master.id,student_details.first_name,std_master.name,classroom_master.division,catlog_remove_student_master.remove_date,catlog_remove_student_master.reason FROM catlog_remove_student_master, student_details,class_allocation,fk_class_master,classroom_master,std_master WHERE catlog_remove_student_master.stud_id=student_details.id AND class_allocation.student_id=student_details.id AND classroom_master.id=class_allocation.classroom_master AND fk_class_master.id=classroom_master.fk_class_master_id AND std_master.id=fk_class_master.std_id and class_allocation.catalog_status=1 and catlog_remove_student_master.status=0";
		try
		{
		pstmt=connection.prepareStatement(s);
		ResultSet rs=pstmt.executeQuery();
		while(rs.next())
		{
			removeStudentPOJO pojo1=new removeStudentPOJO();
			pojo1.setStud_id(rs.getInt(1));
			pojo1.setStud_name(rs.getString(2));
			pojo1.setStd_name(rs.getString(3));
			pojo1.setDiv(rs.getString(4));
			pojo1.setRemove_date(rs.getString(5));
			pojo1.setReason(rs.getString(6));
			list.add(pojo1);
		}
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void delete(int id)
	{
		try
		{
			pstmt=connection.prepareStatement("update class_allocation,catlog_remove_student_master set catalog_status=0,catlog_remove_student_master.status=1 where catlog_remove_student_master.id=? AND class_allocation.student_id=catlog_remove_student_master.stud_id");
			pstmt.setInt(1,id);
			pstmt.executeUpdate();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	


	

}
