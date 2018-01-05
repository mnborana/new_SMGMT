/**
 *   Author : HIMANSHU PATEL
 * Document : CommonStudent.java
 *     Date : 05-Jan-2018
 *     Time : 11:26:04 AM
 * 
 */
package utility;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;

public class CommonStudent {
	DBConnection con=new DBConnection();
	Connection connection=con.getConnection();
	PreparedStatement pstmt=null;

	public List<Object> getStandardList(String schoolId) {
		ResultSet rs = null;
		String query="SELECT classroom_master.id,std_master.name,classroom_master.division,classroom_master.shift FROM std_master,classroom_master,fk_class_master,fk_school_section_details WHERE\n" + 
				"fk_school_section_details.school_id="+schoolId+" AND\n" + 
				"fk_class_master.fk_school_sec_id=fk_school_section_details.id AND\n" + 
				"std_master.id=fk_class_master.std_id AND\n" + 
				"classroom_master.fk_class_master_id=fk_class_master.id";
		List<Object> standardList=new ArrayList<>();
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
}
