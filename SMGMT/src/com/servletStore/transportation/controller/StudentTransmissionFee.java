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
import javax.servlet.http.HttpSession;

import com.dbconnect.DBConnection;
import com.servletStore.transportation.destination.model.DestinationDAO;
import com.servletStore.transportation.destination.model.DestinationImpl;
import com.servletStore.transportation.destination.model.DestinationPOJO;
import com.servletStore.transportation.studtransportationfee.model.StudTransportationFeeDAO;
import com.servletStore.transportation.studtransportationfee.model.StudTransportationFeeImpl;
import com.servletStore.transportation.studtransportationfee.model.StudTransportationFeePOJO;
import com.servletStore.transportation.vehicle.model.VehiclePOJO;

/**
 * Servlet implementation class StudentTransmissionFee
 */
//@WebServlet("/StudentTransmissionFee")
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
				pstmt=connection.prepareStatement("SELECT * FROM destination_master where destination_master.route_id=?");
				pstmt.setString(1,request.getParameter("route_name").toUpperCase());
				ResultSet rs= pstmt.executeQuery();
				
				while(rs.next())
				{					
					String ap=rs.getString("destination")+"="+rs.getInt("id");
					out.print(ap+",");
				}
			}
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
		}
		else if(request.getParameter("route_name1")!=null&&request.getParameter("dest_name")!=null)
		{
			try
			{
				pstmt=connection.prepareStatement("SELECT * FROM destination_master where destination_master.route_id=? and destination_master.destination=?");
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
				e.printStackTrace();
			}
		}
			else if(request.getParameter("assign_route_btn")!=null)
			{
				double fee=0,dis=0;
			int rid=0,dest_id=0;
				StudTransportationFeeDAO dao=new StudTransportationFeeImpl();
				StudTransportationFeePOJO pojo=new StudTransportationFeePOJO();
				if(request.getParameter("routename_name")!=null)
				{
				 rid=Integer.parseInt(request.getParameter("routename_name"));
				}
				//out.print("route_id "+rid);
				if(request.getParameter("destination_name")!=null)
				{
				dest_id=Integer.parseInt(request.getParameter("destination_name"));
				//String gr_no=request.getParameter("gr_no");
				}
				String mname=request.getParameter("months_name");
				int s_id=Integer.parseInt(request.getParameter("studid_name"));
				if(request.getParameter("fee_name")!=null && !(request.getParameter("fee_name").equals("")))
				{
				 fee=Double.parseDouble(request.getParameter("fee_name"));
				}
				if(request.getParameter("disco_name")!=null && !(request.getParameter("disco_name").equals("")))
				{
				dis=Double.parseDouble(request.getParameter("disco_name"));
				}
				pojo.setDest_id(dest_id);
				pojo.setDiscount(dis);
				pojo.setFee(fee);
				pojo.setMonths(mname);
				pojo.setRoute_id(rid);
				pojo.setStud_id(s_id);
				dao.addStudentTransportationFeeDetails(pojo);
				System.out.println("Inserted!!!!!!!!");
				//out.println(dest_id);
				//out.println("fee "+fee);
				response.sendRedirect("View/transportation/addStudentTransportationFee.jsp");

			}
			else
			{
		///DBConnection dbconnect=new DBConnection();
		//PreparedStatement pstmt=null;
		//Connection connection=dbconnect.getConnection();
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
		String de="SELECT DISTINCT destination from destination_master";
		
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
}