package com.dbconnect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnection {


	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/";
	//String url = "jdbc:mysql://192.168.0.51:3306/";
	String dbName = "smgmt";
	String userName = "root";
	String password = "";
	Connection con;
	int rowsInserted=0;
	ResultSet rs;

//Creating connectin & loadig Driver
	public Connection getConnection()
	{
		try
		{
			Class.forName(driverName);
			con = DriverManager.getConnection(url+dbName,userName,password);
		}
		catch(ClassNotFoundException e)
		{
			System.out.println(e);
		}
		catch(SQLException se)
		{
			System.out.println(se);
		}
		return con;
	}	
	
	
	
}




