package com.servletStore.ptamember.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;
import com.mysql.jdbc.Connection;

public class PTAMemberImpl implements PTAMemberDAO {
		DBConnection conn=new DBConnection();
		Connection connection=(Connection) conn.getConnection();
		PreparedStatement pstmt=null;

		
		@Override
		public List getStandardList(PTAMemberPojo theStudent) {
			ResultSet rs = null;
			System.out.println("theStudent :"+theStudent.getSchoolId());
			String query="SELECT classroom_master.id,std_master.name,classroom_master.division,classroom_master.shift FROM std_master,classroom_master,fk_class_master,fk_school_section_details WHERE fk_school_section_details.school_id="+theStudent.getSchoolId()+" AND fk_class_master.fk_school_sec_id=fk_school_section_details.id AND std_master.id=fk_class_master.std_id AND classroom_master.fk_class_master_id=fk_class_master.id";
			List standardList=new ArrayList<>();
			try {
				pstmt=connection.prepareStatement(query);
				rs=pstmt.executeQuery();
				while (rs.next()) {
					standardList.add(rs.getString("id"));
					standardList.add(rs.getString("name"));
					standardList.add(rs.getString("division"));
					standardList.add(rs.getString("shift"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return standardList;
		}
		
	@Override
	public List getStudentNameList(PTAMemberPojo pojo) {
		String id=pojo.getStandardDivId(); 
		System.out.println("standardDiv:"+id);
		String studentList="SELECT student_details.id, student_details.first_name,student_details.middle_name,student_details.last_name FROM student_details,student_official_details,class_allocation WHERE class_allocation.classroom_master="+id+" AND class_allocation.student_id=student_details.id AND student_official_details.student_id =student_details.id AND student_official_details.lc_status=0 AND class_allocation.catalog_status=0 AND class_allocation.academic_year='2017-2018' AND student_details.id NOT IN (SELECT pta_member_details.stud_id FROM pta_member_details)";
		List list=new ArrayList<>();
		ResultSet rs=null;
		
		try {
			pstmt = connection.prepareStatement(studentList);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				list.add(rs.getInt(1));
				list.add(rs.getString(2));
				list.add(rs.getString(3));
				list.add(rs.getString(4));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public List getParentDetails(PTAMemberPojo pojo) {
		List list=new ArrayList<>();
		
		String parentId=((PTAMemberPojo)pojo).getParentId();
		
	String parentDetails="SELECT student_parent_details.id,student_parent_details.father_name,student_parent_details.father_mobileno,student_parent_details.father_aadharno,student_parent_details.mother_name,student_parent_details.mother_mobileno,student_parent_details.mother_aadharno FROM student_parent_details WHERE student_parent_details.student_id="+parentId+"";
	try {
		pstmt = connection.prepareStatement(parentDetails);
		ResultSet rs=pstmt.executeQuery();
		while(rs.next())
		{
			
			list.add(rs.getString(1));
			list.add(rs.getString(2));
			list.add(rs.getString(3));
			list.add(rs.getString(4));
			list.add(rs.getString(5));
			list.add(rs.getString(6));
			list.add(rs.getString(7));
			
			
			
		}
	} catch (Exception e) {
		// TODO: handle exception
	}
	return list;
	}

	/*@Override
	public List getMembers(String) {
		List list=new ArrayList<>();
		String membersQuery="SELECT student_details.first_name,student_details.middle_name,student_details.last_name,student_parent_details.father_name,student_parent_details.father_mobileno,std_master.name,classroom_master.division FROM student_details,student_parent_details,std_master,class_allocation,classroom_master,fk_class_master WHERE student_parent_details.student_id=student_details.id AND student_details.id='"+id+"' AND fk_class_master.std_id=std_master.id AND std_master.id='"+id+"' AND class_allocation.classroom_master=classroom_master.id AND classroom_master.id='"+id+"'";
		try {
			pstmt = connection.prepareStatement(membersQuery);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				list.add(rs.getString(1));
				list.add(rs.getString(2));
				list.add(rs.getString(3));
				list.add(rs.getString(4));
				list.add(rs.getString(5));
				list.add(rs.getString(6));
				list.add(rs.getString(7));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}*/

	@Override
	public List getStudentParentDetails(PTAMemberPojo pojo) {
	String insertParentDetails="INSERT INTO `pta_member_details`(`stud_id`, `acc_year`,`relation`) VALUES (?,?,?)";
	try {
		pstmt = connection.prepareStatement(insertParentDetails);
		pstmt.setString(1, pojo.getStudName());
		pstmt.setString(2, pojo.getAccYear());
		pstmt.setString(3, pojo.getRelation());
	
		pstmt.executeUpdate();
		System.out.println("inserted successfully");
	} catch (Exception e) {
		// TODO: handle exception
	}
		return null;
	}

	@Override
	public List fetchParentDetails() {
		List list=new ArrayList<>();
		ResultSet rs=null;
		String fetchFatherDetails="SELECT pta_member_details.id,concat(student_details.first_name,' ',student_details.middle_name,' ',student_details.last_name) AS fullName, IF(pta_member_details.relation = 'father', concat(student_parent_details.father_name,'~',student_parent_details.father_mobileno), concat(student_parent_details.mother_name,'~',student_parent_details.mother_mobileno)) AS parentName,pta_member_details.relation,concat(std_master.name,'-',classroom_master.division,'(',classroom_master.shift,')')AS classRoom FROM student_parent_details,`pta_member_details`,student_details,class_allocation,classroom_master,std_master,fk_class_master WHERE student_parent_details.student_id=pta_member_details.stud_id AND student_details.id=pta_member_details.stud_id AND class_allocation.student_id=pta_member_details.stud_id AND classroom_master.id=class_allocation.classroom_master AND fk_class_master.id=classroom_master.fk_class_master_id AND std_master.id=fk_class_master.std_id";
		try {
			pstmt = connection.prepareStatement(fetchFatherDetails);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				list.add(rs.getInt(1));
				list.add(rs.getString(2));
				list.add(rs.getString(3));
				list.add(rs.getString(4));
				list.add(rs.getString(5));
				
				
			}	
		} catch (Exception e) {
			// TODO: handle exception
		}
		
			
	
		return list;
	}

	@Override
	public List updatePTAMembers(String updateStudentId) {
	//	System.out.println("select id:"+updateStudentId);
		List list=new ArrayList<>();
		String selectPTAMembers="SELECT pta_member_details.id,concat(student_details.first_name,' ',student_details.middle_name,' ',student_details.last_name) AS fullName, IF(pta_member_details.relation = 'father', concat(student_parent_details.father_name,'~',student_parent_details.father_mobileno), concat(student_parent_details.mother_name,'~',student_parent_details.mother_mobileno)) AS parentName,pta_member_details.relation,concat(std_master.name,'-',classroom_master.division,'(',classroom_master.shift,')')AS classRoom FROM student_parent_details,`pta_member_details`,student_details,class_allocation,classroom_master,std_master,fk_class_master WHERE student_parent_details.student_id=pta_member_details.stud_id AND student_details.id=pta_member_details.stud_id AND class_allocation.student_id=pta_member_details.stud_id AND classroom_master.id=class_allocation.classroom_master AND fk_class_master.id=classroom_master.fk_class_master_id AND std_master.id=fk_class_master.std_id AND pta_member_details.id="+updateStudentId+"";
		try {
			pstmt = connection.prepareStatement(selectPTAMembers);			
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				list.add(rs.getInt(1));
				list.add(rs.getString(2));
				list.add(rs.getString(3));
				list.add(rs.getString(4));
				list.add(rs.getString(5));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public int deletePtaMember(String id) {
		String deletePtaMember="DELETE FROM pta_member_details WHERE pta_member_details.id="+id+"";
		try {
			pstmt = connection.prepareStatement(deletePtaMember);
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
		
	}

	/*@Override
	public int checkStudent(String id) {
		System.out.println("check student id:"+id);
		String checkStudent="SELECT pta_member_details.stud_id FROM pta_member_details WHERE pta_member_details.stud_id="+id+"";
		try {
			pstmt = connection.prepareStatement(checkStudent);
			pstmt.executeQuery();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
	}*/

	@Override
	public void updatePTA(PTAMemberPojo pojo,String id) {
		String updateRelation=pojo.getRelation();
		System.out.println("up relation is:"+updateRelation);
		System.out.println("id:"+id);
		String updatePta="UPDATE pta_member_details SET pta_member_details.relation=? WHERE pta_member_details.id=?";
		try {
			pstmt = connection.prepareStatement(updatePta);
			pstmt.setString(1, pojo.getRelation());
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			System.out.println("updated Successfully");
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	
	

}
