package com.servletStore.student.updateStudentContactDetails.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;


public class updateStudentContactImpl implements updateStudentContactDAO
{

	DBConnection dbconnect=new DBConnection();
	Connection connection=dbconnect.getConnection();
	PreparedStatement pstmt=null;
	public List<updateStudentContactPOJO> getStdAndDivision()
	{
		List<updateStudentContactPOJO> list=new ArrayList();
		String s="SELECT std_master.id,std_master.name,classroom_master.division FROM std_master,classroom_master,fk_class_master,fk_school_section_details WHERE fk_school_section_details.school_id=1 AND fk_class_master.fk_school_sec_id=fk_school_section_details.id AND std_master.id=fk_class_master.std_id AND classroom_master.fk_class_master_id=fk_class_master.id";
		try 
		{
			
			pstmt=connection.prepareStatement(s);
		ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				updateStudentContactPOJO pojo=new updateStudentContactPOJO();
				pojo.setStd_id(rs.getInt(1));
				pojo.setStd_name(rs.getString(2));
				pojo.setDivision(rs.getString(3));
				list.add(pojo);
				
			}
			
			
			
		} 
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<Object> getContactDetails(String std)
	{
		List<Object> list=new ArrayList();
		String s="SELECT student_details.id,class_allocation.roll_no,concat(student_details.first_name,' ',student_details.middle_name,' ',student_details.last_name)AS fullName, student_details.mobileno,student_parent_details.father_mobileno,student_parent_details.mother_mobileno FROM student_details,student_parent_details,class_allocation,student_official_details WHERE class_allocation.classroom_master='"+std+"' AND student_details.id=class_allocation.student_id AND student_parent_details.student_id=student_details.id AND student_official_details.student_id=student_details.id AND class_allocation.academic_year='2017-2018' AND class_allocation.catalog_status=0 AND student_official_details.lc_status=0";	
		//System.out.println(s);
		try 
		{
			
			pstmt=connection.prepareStatement(s);
		ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
			updateStudentContactPOJO pojo=new updateStudentContactPOJO();
			list.add(rs.getInt(1));
			list.add(rs.getInt(2));
			list.add(rs.getString(3));
			list.add(rs.getString(4));
			list.add(rs.getString(5));
			list.add(rs.getString(6));
			
			
			
			//System.out.println(pojo.getStudent_id());

			//System.out.println(pojo.getStudFirstName());
			}
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		//System.out.println("size of list in impl "+list.size());
		return list;
	}
	@Override
	public List<Object> getAdharDetails(String std) 
	{
		List<Object> list=new ArrayList();
		String s="SELECT student_details.id,class_allocation.roll_no,concat(student_details.first_name,' ',student_details.middle_name,' ',student_details.last_name)AS fullName, student_details.aadhar_no,student_parent_details.father_aadharno,student_parent_details.mother_aadharno FROM student_details,student_parent_details,class_allocation,student_official_details WHERE class_allocation.classroom_master='"+std+"' AND student_details.id=class_allocation.student_id AND student_parent_details.student_id=student_details.id AND student_official_details.student_id=student_details.id AND class_allocation.academic_year='2017-2018' AND class_allocation.catalog_status=0 AND student_official_details.lc_status=0";	
		//System.out.println(s);
		try 
		{
			
			pstmt=connection.prepareStatement(s);
		ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
			updateStudentContactPOJO pojo=new updateStudentContactPOJO();
			list.add(rs.getInt(1));
			list.add(rs.getInt(2));
			list.add(rs.getString(3));
			list.add(rs.getString(4));
			list.add(rs.getString(5));
			list.add(rs.getString(6));
			
			
			
			//System.out.println(pojo.getStudent_id());

			//System.out.println(pojo.getStudFirstName());
			}
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		//System.out.println("size of list in impl "+list.size());
		return list;
	}
	@Override
	public List<Object> getBankDetails(String std) 
	{
		List<Object> list=new ArrayList();
		String s="SELECT student_details.id,class_allocation.roll_no,concat(student_details.first_name,' ',student_details.middle_name,' ',student_details.last_name)AS fullName, student_details.bank_name,student_details.account_no,student_details.ifsc_code FROM student_details,student_parent_details,class_allocation,student_official_details WHERE class_allocation.classroom_master='"+std+"' AND student_details.id=class_allocation.student_id AND student_parent_details.student_id=student_details.id AND student_official_details.student_id=student_details.id AND class_allocation.academic_year='2017-2018' AND class_allocation.catalog_status=0 AND student_official_details.lc_status=0";	
		//System.out.println(s);
		try 
		{
			
			pstmt=connection.prepareStatement(s);
		ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
			updateStudentContactPOJO pojo=new updateStudentContactPOJO();
			list.add(rs.getInt(1));
			list.add(rs.getInt(2));
			list.add(rs.getString(3));
			list.add(rs.getString(4));
			list.add(rs.getString(5));
			list.add(rs.getString(6));
			
			
			
			//System.out.println(pojo.getStudent_id());

			//System.out.println(pojo.getStudFirstName());
			}
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
	//	System.out.println("size of list in impl "+list.size());
		return list;
	}
	@Override
	public void updateMobileNo(updateStudentContactPOJO up)
	{
		
		if(up.getId()==1)
		{
			String s="update student_details set student_details.mobileno=? where student_details.id=?";
			try 
			{
				pstmt=connection.prepareStatement(s);
				pstmt.setString(1, up.getStudMob_no());
				pstmt.setInt(2, up.getStudent_id());
				
				pstmt.executeUpdate();
				System.out.println("updated!!!");
			} 
			catch (SQLException e) 
			{
				
				e.printStackTrace();
			}
		}
		if(up.getId()==2)
		{
			String s="update student_parent_details set student_parent_details.father_mobileno=? where student_parent_details.student_id=?";
			try 
			{
				pstmt=connection.prepareStatement(s);
				pstmt.setString(1, up.getStudMob_no());
				pstmt.setInt(2, up.getStudent_id());
				
				pstmt.executeUpdate();
				System.out.println("updated father mob no!!!");
			} 
			catch (SQLException e) 
			{
				
				e.printStackTrace();
			}
		}
		
		if(up.getId()==3)
		{
			String s="update student_parent_details set student_parent_details.mother_mobileno=? where student_parent_details.student_id=?";
			try{
				pstmt=connection.prepareStatement(s);
				pstmt.setString(1, up.getStudMob_no());
				pstmt.setInt(2, up.getStudent_id());
				
				pstmt.executeUpdate();
				System.out.println("updated mother mob no!!!");
			} 
			catch(SQLException e) 
			{
				
				e.printStackTrace();
			}
		}
		if(up.getId()==11)
		{
			String s="update student_details set student_details.aadhar_no=? where student_details.id=?";
			try 
			{
				pstmt=connection.prepareStatement(s);
				pstmt.setString(1, up.getStudMob_no());
				pstmt.setInt(2, up.getStudent_id());
				
				pstmt.executeUpdate();
				System.out.println(" Adhar updated!!!");
			} 
			catch (SQLException e) 
			{
				
				e.printStackTrace();
			}
		}
		if(up.getId()==22)
		{
			String s="UPDATE student_parent_details set student_parent_details.father_aadharno=? where student_parent_details.student_id=?";
			try 
			{
				pstmt=connection.prepareStatement(s);
				pstmt.setString(1, up.getStudMob_no());
				pstmt.setInt(2, up.getStudent_id());
				
				pstmt.executeUpdate();
				System.out.println("updated father Adhar details!!!");
			} 
			catch (SQLException e) 
			{
				
				e.printStackTrace();
			}
		}
		if(up.getId()==33)
		{
			String s="UPDATE student_parent_details set student_parent_details.mother_aadharno=? where student_parent_details.student_id=?";
			try{
				pstmt=connection.prepareStatement(s);
				pstmt.setString(1, up.getStudMob_no());
				pstmt.setInt(2, up.getStudent_id());
				
				pstmt.executeUpdate();
				System.out.println("updated mother adhar details!!!");
			} 
			catch(SQLException e)  
			{
				
				e.printStackTrace();
			}
		}
		if(up.getId()==111)
		{
			String s="update student_details set student_details.bank_name=? where student_details.id=?";
			try 
			{
				pstmt=connection.prepareStatement(s);
				pstmt.setString(1, up.getStudMob_no());
				pstmt.setInt(2, up.getStudent_id());
				
				pstmt.executeUpdate();
				System.out.println(" stud bank details updated!!!");
			} 
			catch (SQLException e) 
			{
				
				e.printStackTrace();
			}
		}
		if(up.getId()==222)
		{
			String s="update student_details set student_details.account_no=? where student_details.id=?";
			try 
			{
				pstmt=connection.prepareStatement(s);
				pstmt.setString(1, up.getStudMob_no());
				pstmt.setInt(2, up.getStudent_id());
				
				pstmt.executeUpdate();
				System.out.println("updated accont no details!!!");
			} 
			catch (SQLException e) 
			{
				
				e.printStackTrace();
			}
		}
		if(up.getId()==333)
		{
			String s="update student_details set student_details.ifsc_code=? where student_details.id=?";
			try 
			{
				pstmt=connection.prepareStatement(s);
				pstmt.setString(1, up.getStudMob_no());
				pstmt.setInt(2, up.getStudent_id());
				
				pstmt.executeUpdate();
				System.out.println("updated ifsc code details!!!");
			} 
			catch (SQLException e) 
			{
				
				e.printStackTrace();
			}
		}
	}
	//@Override
/*	public void updateAdharNo(updateStudentContactPOJO up)
	{
		if(up.getId()==11)
		{
			String s="update student_details set student_details.aadhar_no=? where student_details.id=?";
			try 
			{
				pstmt=connection.prepareStatement(s);
				pstmt.setString(1, up.getStudMob_no());
				pstmt.setInt(2, up.getStudent_id());
				
				pstmt.executeUpdate();
				System.out.println(" Adhar updated!!!");
			} 
			catch (SQLException e) 
			{
				
				e.printStackTrace();
			}
		}
	}*/

}
