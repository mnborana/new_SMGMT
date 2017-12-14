package demoStuff;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dbconnect.DBConnection;

public class demoUpd {
	static DBConnection dbConnection=new DBConnection();
	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		
		
		DBConnection dbConnection =new DBConnection();
		String query="SELECT `username`, `password`, `roll`, `status`,`activation_key` FROM `user_master` WHERE roll=1";
		PreparedStatement ps=dbConnection.getConnection().prepareStatement(query);
		ResultSet rs=ps.executeQuery();
			while(rs.next()){
				System.out.println(rs.getString(1));
			}
	}

}
