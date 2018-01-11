package com.servletStore.transportation.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbconnect.DBConnection;
import com.servletStore.transportation.destination.model.DestinationPOJO;
import com.servletStore.transportation.vehicle.model.VehiclePOJO;


//@WebServlet("/Search1")
public class Search1 extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		DBConnection dbconnect=new DBConnection();
		PreparedStatement pstmt=null;
		Connection connection=dbconnect.getConnection();
		String n=request.getParameter("ch2");
		System.out.println("radio value   "+n);
		
		
		if(n.equals("1"))
		{
		
		List<VehiclePOJO> li=new ArrayList<>();
		String v="select vehicle_no from vehicle_master";
		try 
		{
			pstmt=connection.prepareStatement(v);
			ResultSet rs= pstmt.executeQuery();
			
			 while(rs.next())
			 {
				 String s11=rs.getString("vehicle_no");
				 out.print(s11+"~");
			 }
				
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		else if(n.equals("2"))
		{
		String de="select destination from destination_master";
		
			try 
			{
				pstmt=connection.prepareStatement(de);
				ResultSet rs= pstmt.executeQuery();
				
				 while(rs.next())
				 {
					 String s1=rs.getString("destination");
					 out.print(s1+"~");
				
				 } 
			}
			catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
				
		}
		
	
	}

}
