package com.servletStore.transportation.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbconnect.DBConnection;
import com.servletStore.transportation.destination.model.DestinationDAO;
import com.servletStore.transportation.destination.model.DestinationImpl;
import com.servletStore.transportation.destination.model.DestinationPOJO;

/**
 * Servlet implementation class StudentTransmissionFee
 */
@WebServlet("/StudentTransmissionFee")
public class StudentTransmissionFee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		DBConnection dbconnect=new DBConnection();
		Connection connection=dbconnect.getConnection();
		PreparedStatement pstmt=null;
		PrintWriter out = response.getWriter();		
		boolean redirect=true;		
		//System.out.print(request.getParameter("route_name"));
		//System.out.print("IN");
		if(request.getParameter("route_name")!=null)
		{
			try
			{
				pstmt=connection.prepareStatement("SELECT * FROM destination_master where route_name=?");
				pstmt.setString(1,request.getParameter("route_name").toUpperCase());
				ResultSet rs= pstmt.executeQuery();
				//System.out.print(request.getParameter("route_name"));
				while(rs.next())
				{					
					out.print(rs.getString("destination")+",");
				}
			}
			catch (SQLException e) 
			{
				System.out.print(e.getMessage());
			}
		}
		else if(request.getParameter("route_name1")!=null&&request.getParameter("dest_name")!=null)
		{
			try
			{
				pstmt=connection.prepareStatement("SELECT * FROM destination_master where route_name=? && destination=?");
				pstmt.setString(1,request.getParameter("route_name1").toUpperCase());
				pstmt.setString(2,request.getParameter("dest_name").toUpperCase());
				ResultSet rs= pstmt.executeQuery();				
				while(rs.next())
				{					
					out.print(rs.getDouble("fee"));
				}
			}
			catch (SQLException e) 
			{
				System.out.print(e.getMessage());
			}
		}
			
			
	}

}
