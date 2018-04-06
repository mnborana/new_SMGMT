package com.servletStore.staff.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;
import com.servletStore.student.model.StudentPojo;

public class StaffImpl implements StaffDAO {
	DBConnection connection=new DBConnection();
	Connection con=connection.getConnection();
	PreparedStatement ps;
	ResultSet rs;
	
	/*@Override
	public List getReligionList() {
		List list=new ArrayList();
		String query="SELECT religion.id,religion.religion_name FROM religion";
		System.out.println("Query "+query);
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next())
			{
				list.add(rs.getInt("id"));
				list.add(rs.getString("religion_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("List "+list);
		return list;
	}*/
	
	@Override
	public List getCasteList(StaffPojo pojo) {
		String query="SELECT `id`,`caste_name` FROM `caste` WHERE `religion_id`="+pojo.getCasteId();
		List casteList=new ArrayList<>();
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while (rs.next()) {
				casteList.add(rs.getString("id"));
				casteList.add(rs.getString("caste_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return casteList;
	}

	@Override
	public List<StaffPojo> getBankName() {
		List list=new ArrayList<>();
		String query="SELECT id,bank_name FROM `bank_master`";
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next())
			{
				list.add(rs.getInt("id"));
				list.add(rs.getString("bank_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List getDepartmentList() {
		List list=new ArrayList<>();
		String query="SELECT DISTINCT department FROM staff_master";
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next())
			{
				list.add(rs.getString("department"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List getDesignationList() {
		List list=new ArrayList<>();
		String query="SELECT distinct designation FROM staff_master";
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			System.out.println("Execute");
			while(rs.next())
			{
				list.add(rs.getString("designation"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/*@Override
	public int insertDept(String deptName) {
		int status=0;
		String query="INSERT INTO department_master (department_name) VALUES(?)";
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, deptName);
			status=ps.executeUpdate();
			System.out.println("Execute");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}*/

	@Override
	public int insertStaffInfo(StaffPojo pojo) {
		int status=0;
		String query="INSERT INTO `staff_master`(`joining_date`, `joining_type`, `full_name`, `address`, `religion`, `caste`, `previous_school`, `exp_year`, `exp_month`, `dob`, `age`, `basicPay`, `gradePay`, `mobile_no`, `grant_type`, `gender`, `blood_grp`, `education`, `department`, `designation`, `bank_name`, `acc_no`, `uid_no`, `pf_no`, `pan_card_no`) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			ps=con.prepareStatement(query);
			System.out.println("ssdcfds "+query);
			ps.setString(1, pojo.getJoinDate());
			ps.setString(2, pojo.getJoinType());
			ps.setString(3, pojo.getName());
			ps.setString(4, pojo.getAdd());
			ps.setString(5, pojo.getReligion());
			ps.setString(6, pojo.getCaste());
			ps.setString(7, pojo.getPrevSchool());
			ps.setInt(8, pojo.getExpYr());
			ps.setInt(9, pojo.getExpMnth());
			ps.setString(10, pojo.getDob());
			ps.setInt(11, pojo.getAge());
			ps.setDouble(12, pojo.getBasicPay());
			ps.setDouble(13, pojo.getGradePay());
			ps.setString(14, pojo.getMoNo());
			ps.setString(15, pojo.getGrantType());
			ps.setString(16, pojo.getGender());
			ps.setString(17, pojo.getBloodGroop());
			ps.setString(18, pojo.getEducation());
			ps.setString(19, pojo.getDept());
			ps.setString(20, pojo.getDesign());
			ps.setString(21, pojo.getBankName());
			ps.setInt(22, pojo.getAccNo());
			ps.setInt(23, pojo.getUid());
			ps.setDouble(24, pojo.getPf());
			ps.setString(25, pojo.getPanCardNo());
			status=ps.executeUpdate();
			System.out.println("Inserted");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}

	

	
}
