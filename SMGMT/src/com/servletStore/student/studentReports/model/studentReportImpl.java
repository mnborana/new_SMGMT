package com.servletStore.student.studentReports.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.cglib.core.GeneratorStrategy;

import com.dbconnect.DBConnection;
import com.servletStore.transportation.studentdetails.model.StudentDetailsPOJO;

public class studentReportImpl implements studentReportDAO 
{
	DBConnection con=new DBConnection();
	Connection connection=con.getConnection();
	PreparedStatement pstmt=null;
	public List<studentReportPOJO> getCategory()
	{
		List<studentReportPOJO> list=new ArrayList<>();
		String s="select caste_category.id,caste_category.category_name from caste_category";
		try 
		{
			pstmt=connection.prepareStatement(s);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				studentReportPOJO pojo=new  studentReportPOJO();
				pojo.setId(rs.getInt(1));
				pojo.setCategory_name(rs.getString(2));
				//System.out.println("category "+rs.getString(2));
				list.add(pojo);
			
			}
		} 
		catch (SQLException e)
		{
			
			e.printStackTrace();
		}
		//System.out.println("@@@ "+list);
		return list;
	}
	
	
	public String getCategory(String cid)
	{
		List<studentReportPOJO> list=new ArrayList<>();
		String s="select caste_category.category_name from caste_category where caste_category.id='"+cid+"'";
		String c1="";
		//System.out.println("????? "+s);
		try 
		{
			
			pstmt=connection.prepareStatement(s);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				
			c1=rs.getString(1);
			}
		} 
		catch (SQLException e)
		{
			
			e.printStackTrace();
		}
		//System.out.println("@@@ "+list);
		return c1;
	}
	
	public List<Object> getSchoolDetails(String sid)
	{
		List<Object> list=new ArrayList<>();
		String s="SELECT trustee_info.edu_society_name,school_master.name,school_master.address FROM school_master,trustee_info WHERE school_master.id='"+sid+"'";
		//String c1="";
		//System.out.println("????? "+s);
		try 
		{
			
			pstmt=connection.prepareStatement(s);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				list.add(rs.getString(1));
				list.add(rs.getString(2));
				list.add(rs.getString(3));
			
			}
		} 
		catch (SQLException e)
		{
			
			e.printStackTrace();
		}
		//System.out.println("@@@ "+list);
		return list;
	}
	
	
	
	
	
	@Override
	public List<studentReportPOJO> getAllCategoryDetails(studentReportPOJO pojo)
	{	
		List<studentReportPOJO> list=new ArrayList<>();
		String s="SELECT concat(student_details.first_name,'  ' ,student_details.middle_name, '  ',student_details.last_name) as fullname,student_official_details.gr_no,std_master.name,classroom_master.division,student_details.gender,caste.caste_name,religion.religion_name FROM student_details,student_official_details,class_allocation,fk_class_master,fk_school_section_details,classroom_master,std_master,caste,caste_category,religion WHERE caste.category_id=caste_category.id and  student_details.caste_id=caste.id AND religion.id=caste.religion_id AND student_details.category_id=caste_category.id AND student_official_details.student_id=student_details.id AND  student_official_details.lc_status=0 AND class_allocation.student_id=student_details.id AND class_allocation.catalog_status=0 AND classroom_master.id=class_allocation.classroom_master AND fk_class_master.id=classroom_master.fk_class_master_id AND  std_master.id=fk_class_master.std_id AND fk_school_section_details.id=fk_class_master.fk_school_sec_id AND fk_school_section_details.school_id=1 and caste_category.id='"+pojo.getCategory_name()+"'  and  student_official_details.academic_year='"+pojo.getAcademic_year()+"'";
		try{
			
			System.out.println("SELECT concat(student_details.first_name,'  ' ,student_details.middle_name, '  ',student_details.last_name) as fullname,student_official_details.gr_no,std_master.name,classroom_master.division,student_details.gender,caste.caste_name,religion.religion_name FROM student_details,student_official_details,class_allocation,fk_class_master,fk_school_section_details,classroom_master,std_master,caste,caste_category,religion WHERE caste.category_id=caste_category.id and  student_details.caste_id=caste.id AND religion.id=caste.religion_id AND student_details.category_id=caste_category.id AND student_official_details.student_id=student_details.id AND  student_official_details.lc_status=0 AND class_allocation.student_id=student_details.id AND class_allocation.catalog_status=0 AND classroom_master.id=class_allocation.classroom_master AND fk_class_master.id=classroom_master.fk_class_master_id AND  std_master.id=fk_class_master.std_id AND fk_school_section_details.id=fk_class_master.fk_school_sec_id AND fk_school_section_details.school_id=1 and  student_official_details.academic_year='"+pojo.getAcademic_year()+"'");

			pstmt=connection.prepareStatement(s);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
			studentReportPOJO pojo1=new studentReportPOJO();
			pojo1.setFullname(rs.getString(1));
			pojo1.setGr_no(rs.getString(2));
			pojo1.setStandard(rs.getString(3));
			pojo1.setDivision(rs.getString(4));
			pojo1.setGender(rs.getString(5));
			pojo1.setCaste_name(rs.getString(6));
			pojo1.setReligon_name(rs.getString(7));
			list.add(pojo1);
			
			
			//System.out.println("name "+pojo1.getFullname());
			//System.out.println("gr "+pojo1.getGr_no());
		//	System.out.println("year "+pojo1.getAcademic_year());
			//System.out.println("caste "+pojo1.getCaste_name());
		
			}
		} 
	catch(Exception e)
		{
			
			e.printStackTrace();
		}
		//System.out.println("length of list@@@@ "+list.size());
		return list;
	}


	@Override
	public String getStdName(String stdid)
	{
		String s="SELECT std_master.name,classroom_master.division,classroom_master.shift FROM std_master,classroom_master,fk_class_master,fk_school_section_details WHERE fk_school_section_details.school_id=1 and fk_class_master.fk_school_sec_id=fk_school_section_details.id AND std_master.id=fk_class_master.std_id AND classroom_master.fk_class_master_id=fk_class_master.id and classroom_master.id='"+stdid+"'";
		String stdName="";
		try {
			
			pstmt=connection.prepareStatement(s);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				stdName=rs.getString(1)+"("+rs.getString(2)+" - "+rs.getString(3)+")";
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return stdName;
	}


	@Override
	public List<Object> getAllCategoryCount(String stdid,String ac_year,String school_id)
	{
		String s="SELECT COUNT(caste_category.category_name)as open_cat,caste_category.category_name FROM student_details,student_official_details,class_allocation,fk_class_master,fk_school_section_details,classroom_master,std_master,caste,caste_category,religion WHERE student_official_details.student_id=student_details.id AND caste.religion_id=religion.id AND student_details.religion_id=religion.id and  caste_category.id=caste.id AND student_details.category_id=caste_category.id AND student_details.caste_id=caste.id and student_official_details.lc_status=0 AND class_allocation.student_id=student_details.id AND class_allocation.catalog_status=0 AND classroom_master.id=class_allocation.classroom_master AND fk_class_master.id=classroom_master.fk_class_master_id AND std_master.id=fk_class_master.std_id AND fk_school_section_details.id=fk_class_master.fk_school_sec_id AND fk_school_section_details.school_id='"+school_id+"'  and student_official_details.academic_year='"+ac_year+"' and class_allocation.classroom_master='"+stdid+"' GROUP BY caste_category.category_name";
		List<Object> list=new ArrayList<>();
		//System.out.println("SELECT COUNT(caste_category.category_name)as open_cat,caste_category.category_name FROM student_details,student_official_details,class_allocation,fk_class_master,fk_school_section_details,classroom_master,std_master,caste,caste_category,religion WHERE student_official_details.student_id=student_details.id AND caste.religion_id=religion.id AND student_details.religion_id=religion.id and  caste_category.id=caste.id AND student_details.category_id=caste_category.id AND student_details.caste_id=caste.id and student_official_details.lc_status=0 AND class_allocation.student_id=student_details.id AND class_allocation.catalog_status=0 AND ;;classroom_master.id=class_allocation.classroom_master AND fk_class_master.id=classroom_master.fk_class_master_id AND std_master.id=fk_class_master.std_id AND fk_school_section_details.id=fk_class_master.fk_school_sec_id AND fk_school_section_details.school_id='"+school_id+"'  and student_official_details.academic_year='"+ac_year+"' and class_allocation.classroom_master='"+stdid+"' GROUP BY caste_category.category_name");

		try 
		{
			pstmt=connection.prepareStatement(s);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				list.add(rs.getInt(1));
				list.add(rs.getString(2));
				System.out.println("******"+rs.getInt(1)+"  "+rs.getString(2));
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public List<Object> getAcademic_year()
	{
		String s="select academy_year.id,academy_year.year from academy_year";
		List<Object> list=new ArrayList<>();
		try {
			pstmt=connection.prepareStatement(s);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				list.add(rs.getInt(1));
				list.add(rs.getString(2));
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
	public List<String> getStudentName(String stddiv_id,String Academic_year) 
	{
		List<String> list=new ArrayList<>();
		String sql="SELECT student_details.id,concat(student_details.first_name,' ',student_details.middle_name,' ',student_details.last_name)AS fullName,student_official_details.lc_status FROM student_details,student_parent_details,class_allocation,student_official_details WHERE class_allocation.classroom_master='"+stddiv_id+"' AND student_details.id=class_allocation.student_id AND student_parent_details.student_id=student_details.id AND student_official_details.student_id=student_details.id AND class_allocation.academic_year='"+Academic_year+"'";			
		try {
			pstmt = connection.prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery();
			//removeStudentPOJO pojo=new removeStudentPOJO();
			
			while(rs.next())
			{
				
				list.add(rs.getInt(1)+","+rs.getString(2)+","+rs.getInt(3));
				
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return list;
		
		
	}


	@Override
	public List<Object> getstudDatailsByStudId(String sid) 
	{

		String s="select  student_official_details.gr_no,student_parent_details.mother_name,concat(religion.religion_name,'-',caste.caste_name) as religion_caste,student_official_details.admission_date,student_details.birth_place,student_details.dob,student_details.nationality,student_official_details.previous_school_name,student_details.mother_tongue,concat(student_details.first_name,' ' ,student_details.middle_name, ' ',student_details.last_name) as fullname FROM religion,student_details,caste,student_official_details,student_parent_details where student_official_details.student_id=student_details.id AND student_parent_details.student_id=student_details.id AND student_details.caste_id=caste.id  AND religion.id=student_details.religion_id and student_details.id='"+sid+"'";
		List<Object> list=new ArrayList<>();
		try
		{
			pstmt=connection.prepareStatement(s);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				list.add(rs.getString(1)+","+rs.getString(2)+","+rs.getString(3)+","+rs.getString(4)+","+rs.getString(5)+","+rs.getString(6)+","+rs.getString(7)+","+rs.getString(8)+","+rs.getString(9)+","+rs.getString(10));
				
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
	public List<Integer> getLastOutWordNo()
	{
		List<Integer> list=new ArrayList<>();
		String s="SELECT max(outward_register_master.outward_no),outward_register_master.id FROM outward_register_master";
		//int outword_no=0;
		try
		{
			pstmt=connection.prepareStatement(s);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next())
			{
				list.add(rs.getInt(1));
				list.add(rs.getInt(2));
			}
		} 
		catch (SQLException e) 
		{


			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public Object InsertIntoOutwordRegister()
	{	Object outword_id = "";
		String s="SELECT IFNULL( (SELECT inward_outward_document_master.document_name from inward_outward_document_master WHERE inward_outward_document_master.document_name='LC register') ,'empty') as result";
		String s1="INSERT INTO inward_outward_document_master (`id`, `document_name`) VALUES ('', 'LC Register')";
		
		String s2="SELECT inward_outward_document_master.id FROM `inward_outward_document_master`where inward_outward_document_master.document_name='LC register'";
	
		try
		{
			
			pstmt=connection.prepareStatement(s);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
			if(rs.getString(1).equals("empty"))
			{
				System.out.println("In if");
				pstmt=connection.prepareStatement(s1);
				pstmt.executeUpdate();
				pstmt=connection.prepareStatement(s2);
				ResultSet rs1=pstmt.executeQuery();
				while(rs1.next())
				{
					outword_id=rs1.getInt(1);
				}
				
			}
			else
			{
				System.out.println("in");
				pstmt=connection.prepareStatement(s2);
				ResultSet rs1=pstmt.executeQuery();
				while(rs1.next())
				{
					outword_id=rs1.getInt(1);
				}
				
			}
			
			}
		
			
		} 
		
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println(outword_id);
return outword_id;
		
	}


	@Override
	public List<Object> getOtherSchoolDetails(String sid)
	{
		List<Object> list=new ArrayList<>();
		String s="select school_master.udise,school_master.index_no,school_master.medium,school_master.board,school_master.email_id,school_master.licence_no from school_master where school_master.id='"+sid+"'";
		try
		{
			pstmt=connection.prepareStatement(s);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				list.add(rs.getString(1));
				list.add(rs.getString(2));
				list.add(rs.getString(3));
				list.add(rs.getString(4));
				list.add(rs.getString(5));
				list.add(rs.getString(6));
				
			}
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public String getDocumentNameFromRegister(Object doc_id)
	{
		String s="SELECT inward_outward_document_master.document_name FROM inward_outward_document_master WHERE inward_outward_document_master.id='"+doc_id+"'";
		//System.out.println("SELECT inward_outward_document_master.document_name FROM inward_outward_document_master WHERE inward_outward_document_master.id='"+doc_id+"'");

		String doc_name="";
		try
		{
			pstmt=connection.prepareStatement(s);
			ResultSet rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				doc_name=rs.getString(1);
				
			}
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return doc_name;
	}


	public int InsertIntoOutwordRegisterMaster(String outword_no, Object inword_outwourd_document_id,String doc_name,String date1,String Studentname,String student_id) 
	{
		String s1="select student_details.address,student_details.mobileno FROM student_details where student_details.id='"+student_id+"'";
		String mob_no="",address="";
		try {
			pstmt=connection.prepareStatement(s1);
		ResultSet rs=pstmt.executeQuery();
		while(rs.next())
		{
			address=rs.getString(1);
			mob_no=rs.getString(2);
		}
		} 
		catch (SQLException e1)
		{
			
			e1.printStackTrace();
		}
		
		
		String s="INSERT INTO `outward_register_master` (`id`, `document_id`, `outward_no`, `date`, `mobileNo`, `receiver_name`, `address`, `subject`, `description`, `document_Name`)"
				+ " VALUES ('', '"+inword_outwourd_document_id+"','"+outword_no+"','"+date1+"','"+mob_no+"','"+Studentname+"', '"+address+"', 'LC document', 'School document for lc', '"+doc_name+"')";
String s11=	"SELECT max(outward_register_master.id) FROM `outward_register_master`";
int outword_id=0;
	try 
	{
		
		pstmt=connection.prepareStatement(s);
		pstmt.executeUpdate();
		System.out.println("inserted!!!");
		pstmt=connection.prepareStatement(s11);
		ResultSet rs=pstmt.executeQuery();
		while(rs.next())
		{
			outword_id=rs.getInt(1);
		}
		
	} 
	catch (SQLException e)
	{
		
		e.printStackTrace();
	}
	return outword_id;
		
	}


	@Override
	public void UpdateLcStatus(String student_id)
	{
		String s1="select student_official_details.lc_status from student_official_details,student_details where student_details.id=student_official_details.student_id and student_details.id='"+student_id+"'";
		String s="UPDATE student_official_details set student_official_details.lc_status=1 WHERE student_official_details.student_id='"+student_id+"'";
		String s2="UPDATE student_official_details set student_official_details.lc_status=2 WHERE student_official_details.student_id='"+student_id+"'";

		int lc_status=0;
		try 
		{
			pstmt=connection.prepareStatement(s1);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				lc_status=rs.getInt(1);
				
			}
			if(lc_status==0)
			{
				pstmt=connection.prepareStatement(s);
				pstmt.executeUpdate();
				System.out.println("updated!!!!");
			}
			if(lc_status==1)
			{
				pstmt=connection.prepareStatement(s2);
				pstmt.executeUpdate();
				System.out.println("updated!!!!");
			}
		} 
		catch (SQLException e)
		{
			
			e.printStackTrace();
		}
		
		
	
	}

	public void insertIntoLCMaster(int outword_id,String gr_no,int standard_id,String student_id,String leaving_date,String lc_date,String study_status,String behaviour,String leaving_reason,String remark)
	{
		String s="INSERT INTO lc_master (outword_no,gr_no,standard_id,student_id,leaving_date,lc_date,study_status,behaviour,leaving_reason,remark)VALUES (?,?,?,?,?,?,?,?,?,?)";
		//System.out.println("INSERT INTO lc_master (outword_no,gr_no,standard_id,student_id,leaving_date,lc_date,study_status,behaviour,leaving_reason)VALUES (?,?,?,?,?,?,?,?,?)");

		try
		{
			pstmt=connection.prepareStatement(s);
			pstmt.setInt(1, outword_id);
			pstmt.setString(2,gr_no);
			pstmt.setInt(3, standard_id);
			pstmt.setString(4, student_id);
			pstmt.setString(5, leaving_date);
			pstmt.setString(6,lc_date);
			pstmt.setString(7, study_status);
			pstmt.setString(8, behaviour);
			pstmt.setString(9, leaving_reason);
			pstmt.setString(10, remark);
			//System.out.println("INSERT INTO lc_master (outword_no,gr_no,standard_id,student_id,leaving_date,lc_date,study_status,behaviour,leaving_reason,remark)VALUES (?,?,?,?,?,?,?,?,?,?)");

			pstmt.executeUpdate();
			System.out.println("LC master inserted!!!!!!!!!!!!");
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void insertIntoLCMaster1(String gr_no,int standard_id,String student_id,String leaving_date,String lc_date,String study_status,String behaviour,String leaving_reason,String remark)
	{
		String s="INSERT INTO lc_master (gr_no,standard_id,student_id,leaving_date,lc_date,study_status,behaviour,leaving_reason,remark)VALUES (?,?,?,?,?,?,?,?,?)";
		//System.out.println("INSERT INTO lc_master (outword_no,gr_no,standard_id,student_id,leaving_date,lc_date,study_status,behaviour,leaving_reason,remark)VALUES (?,?,?,?,?,?,?,?,?,?)");

		try
		{
			pstmt=connection.prepareStatement(s);
			//pstmt.setInt(1, outword_id);
			pstmt.setString(1,gr_no);
			pstmt.setInt(2, standard_id);
			pstmt.setString(3,student_id);
			pstmt.setString(4,leaving_date);
			pstmt.setString(5,lc_date);
			pstmt.setString(6, study_status);
			pstmt.setString(7, behaviour);
			pstmt.setString(8, leaving_reason);
			pstmt.setString(9, remark);
			//System.out.println("INSERT INTO lc_master (outword_no,gr_no,standard_id,student_id,leaving_date,lc_date,study_status,behaviour,leaving_reason)VALUES (?,?,?,?,?,?,?,?,?)");

			pstmt.executeUpdate();
			System.out.println("LC master inserted!!!!!!!!!!!!");
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}
