/**
 *   Author : HIMANSHU PATEL
 * Document : Activator.java
 *     Date : 25-Jan-2018
 *     Time : 2:35:40 PM
 * 
 */
package com.activator;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;

public class Activator {
	DBConnection con = new DBConnection();
	Connection connection = con.getConnection();
	PreparedStatement pstmt = null;

	public String activeSoft(String encString) {
		String flag="";
		try {
			String dncString = KeyGenerator.decrypt(encString);

			if (dncString.length()==9) {
				ResultSet rs = null;
				String query = "SELECT `year` FROM `academy_year` WHERE `year`='"+dncString+"'";
				List<Object> yearList = new ArrayList<>();
				pstmt = connection.prepareStatement(query);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					yearList.add(rs.getString("year"));
				}
				
				if (!yearList.isEmpty()) {
					System.out.println("This Serial Key Is Expired!");
					flag="1";
				}else {
					String[] newYear = dncString.split("-");
					int firstYear = Integer.parseInt(newYear[0]);
					int secondYear = Integer.parseInt(newYear[1]);
					
					String enterYear=firstYear+"-"+secondYear;
					
					pstmt = connection.prepareStatement("INSERT INTO `academy_year`(`year`) VALUES (?)");
					pstmt.setString(1, enterYear);
					
					int yearQuery=pstmt.executeUpdate();
					if (yearQuery > 0) {
						System.out.println("Activation Successfully!");
						flag="2";
					}else {
						System.out.println("Something Wrong with Activator, Please Call Service Provider!");
						flag="3";
					}
					
				}
			}else {
				throw new Exception();
			}
		} catch (Exception e) {
			System.out.println("You Entered The Wrong Key");
			flag="0";
		}
		return flag;
	}

	public static void main(String[] args) {
		Activator ac = new Activator();
		ac.activeSoft("oP6tGY+D+ttTItiTz97t9Q==");
	}
}
