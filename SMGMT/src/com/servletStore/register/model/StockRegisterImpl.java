package com.servletStore.register.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;

public class StockRegisterImpl implements StockRegisterDAO{
	DBConnection conn=new DBConnection();
	Connection connection=conn.getConnection();
	PreparedStatement pstmt=null;
	List<StockRegisterPojo> list=new ArrayList<>();

	@Override
	public StockRegisterPojo getStockNo() {
		StockRegisterPojo pojo=new StockRegisterPojo();
		String stockNo="SELECT MAX(id) FROM stock_register_master";
		try {
			pstmt = connection.prepareStatement(stockNo);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
					pojo.setId(rs.getInt(1));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return pojo;
	}

	@Override
	public void insertStock(StockRegisterPojo pojo) {
		String insertQuery="INSERT INTO `stock_register_master`(`date`, `item_name`, `number_of_items`, `item_amount`, `deduction_amount`, `percentage`, `total_amount`,`description`,`voucher_no`) VALUES (?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = connection.prepareStatement(insertQuery);
			pstmt.setString(1, pojo.getRequireddate());
			pstmt.setString(2, pojo.getItemName());
			pstmt.setInt(3, pojo.getNoOfItems());
			pstmt.setString(4, pojo.getItemAmt());
			pstmt.setString(5, pojo.getDeductionAmt());
			pstmt.setString(6,pojo.getPercentage());
			pstmt.setString(7, pojo.getTotalAmt());			
			pstmt.setString(8, pojo.getDescription());
			pstmt.setInt(9, pojo.getVoucherNo());
			
			
			pstmt.executeUpdate();
			System.out.println("inserted Stock Successfully");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	@Override
	public List<StockRegisterPojo> showStockDetails() {
		String selectQuery="SELECT stock_register_master.id,stock_register_master.date,stock_register_master.item_name,stock_register_master.number_of_items,stock_register_master.item_amount,stock_register_master.deduction_amount,stock_register_master.percentage,stock_register_master.total_amount,stock_register_master.description FROM stock_register_master";
		
		
		try {
			pstmt = connection.prepareStatement(selectQuery);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				StockRegisterPojo pojo=new StockRegisterPojo();
				pojo.setId(rs.getInt(1));
				pojo.setRequireddate(rs.getString(2));
				pojo.setItemName(rs.getString(3));
				pojo.setNoOfItems(rs.getInt(4));
				pojo.setItemAmt(rs.getString(5));
				pojo.setDeductionAmt(rs.getString(6));	
				pojo.setPercentage(rs.getString(7));
				pojo.setTotalAmt(rs.getString(8));				
				pojo.setDescription(rs.getString(9));
				list.add(pojo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public List<StockRegisterPojo> getItemName() {
		String selectItem="SELECT stock_register_master.item_name FROM stock_register_master";
		try {
			pstmt = connection.prepareStatement(selectItem);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				StockRegisterPojo pojo=new StockRegisterPojo();
				pojo.setItemName(rs.getString(1));
				list.add(pojo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public void updateStockDetails(StockRegisterPojo pojo, int id) {
		String updateQuery="UPDATE stock_register_master SET stock_register_master.date=?,stock_register_master.item_name=?,stock_register_master.item_amount=?,stock_register_master.deduction_amount=?,stock_register_master.number_of_items=?,stock_register_master.total_amount=?,stock_register_master.percentage=?,stock_register_master.voucher_no=?,stock_register_master.description=? WHERE stock_register_master.id=?";
		
		
		try {
			pstmt = connection.prepareStatement(updateQuery);
			
			pstmt.setString(1, pojo.getRequireddate());	
			pstmt.setString(2, pojo.getItemName());
			pstmt.setString(3, pojo.getItemAmt());
			pstmt.setString(4, pojo.getDeductionAmt());
			pstmt.setInt(5, pojo.getNoOfItems());
			pstmt.setString(6, pojo.getTotalAmt());
			pstmt.setString(7, pojo.getPercentage());
			pstmt.setInt(8, pojo.getVoucherNo());
			pstmt.setString(9, pojo.getDescription());
			pstmt.setInt(10, id);
			pstmt.executeUpdate();
			System.out.println("updated Succesfully");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	@Override
	public List<StockRegisterPojo> selectStock(int stockId) {
		String setStockDetails="SELECT stock_register_master.id,stock_register_master.date,stock_register_master.item_name,stock_register_master.item_amount,stock_register_master.deduction_amount,stock_register_master.number_of_items,stock_register_master.total_amount,stock_register_master.percentage,stock_register_master.voucher_no,stock_register_master.description FROM stock_register_master WHERE stock_register_master.id=?";
		try {
			pstmt = connection.prepareStatement(setStockDetails);
			pstmt.setInt(1, stockId);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				StockRegisterPojo pojo=new StockRegisterPojo();
				
				
				pojo.setId(rs.getInt(1));
				pojo.setRequireddate(rs.getString(2));
				pojo.setItemName(rs.getString(3));
				pojo.setItemAmt(rs.getString(4));
				pojo.setDeductionAmt(rs.getString(5));
				pojo.setNoOfItems(rs.getInt(6));
				pojo.setTotalAmt(rs.getString(7));
				pojo.setPercentage(rs.getString(8));
				pojo.setVoucherNo(rs.getInt(9));
				pojo.setDescription(rs.getString(10));
				list.add(pojo);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public List<StockRegisterPojo> setItemInModel() {
		String setItem="SELECT stock_register_master.item_name FROM stock_register_master";
		try {
			pstmt = connection.prepareStatement(setItem);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				StockRegisterPojo pojo=new StockRegisterPojo();
				pojo.setItemName(rs.getString(1));
				list.add(pojo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public void deleteStock(int id) {
		String deleteQuery="DELETE FROM stock_register_master WHERE stock_register_master.id=?";
		try {
			pstmt = connection.prepareStatement(deleteQuery);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			System.out.println("Deleted Stock Successfully");
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	@Override
	public List<StockRegisterPojo> selectItemName() {
		List<StockRegisterPojo> list=new ArrayList<>();
		String selectItemName="SELECT stock_register_master.id,stock_register_master.item_name FROM stock_register_master";
		try {
			pstmt = connection.prepareStatement(selectItemName);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				StockRegisterPojo pojo=new StockRegisterPojo();
				pojo.setId(rs.getInt(1));
				pojo.setItemName(rs.getString(2));
				list.add(pojo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public StockRegisterPojo getItemName(String itemId) {
		StockRegisterPojo pojo=new StockRegisterPojo();
		String itemName="SELECT stock_register_master.item_name FROM stock_register_master WHERE stock_register_master.id="+itemId+"";
		try {
			pstmt = connection.prepareStatement(itemName);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				pojo.setItemName(rs.getString(1));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return pojo;
	}

	@Override
	public List<StockRegisterPojo> selectSchoolDetails(String schoolId) {
		List<StockRegisterPojo> schoolList=new ArrayList<>();
		String selectQuery="SELECT trustee_info.edu_society_name,school_master.name,school_master.address FROM trustee_info,school_master WHERE school_master.id="+schoolId+"";
		try {
			pstmt = connection.prepareStatement(selectQuery);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				StockRegisterPojo pojo1=new StockRegisterPojo();
				pojo1.setTrustyName(rs.getString(1));
				pojo1.setSchoolName(rs.getString(2));
				pojo1.setSchoolAddress(rs.getString(3));
				schoolList.add(pojo1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return schoolList;
	}		
	
	
}
