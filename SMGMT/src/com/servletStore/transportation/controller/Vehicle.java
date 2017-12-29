package com.servletStore.transportation.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbconnect.DBConnection;
import com.itextpdf.text.log.SysoCounter;
import com.servletStore.transportation.vehicle.model.VehicleDAO;
import com.servletStore.transportation.vehicle.model.VehicleImpl;
import com.servletStore.transportation.vehicle.model.VehiclePOJO;

public class Vehicle extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DBConnection dbconnect=new DBConnection();
		Connection connection=dbconnect.getConnection();
		PreparedStatement pstmt=null;
		PrintWriter out = response.getWriter();
		int no_seats=0,max_seats=0;
		VehiclePOJO vehiclePojo=new VehiclePOJO();
		VehicleDAO vehicleDAO=new VehicleImpl();
		boolean redirect=true;
		System.out.println("Servlet");
		if(request.getParameter("add_vehicle_btn")!=null){
			System.out.println("add_vehicle_btn");
			String veh_no=request.getParameter("mh")+"-"+request.getParameter("tt")+"-"+request.getParameter("m")+"-"+request.getParameter("fofe");
			if(!request.getParameter("seats_no").trim().equals(""))
			{
				no_seats=Integer.parseInt(request.getParameter("seats_no").trim());
			}
			if(!request.getParameter("max_allowed").trim().equals(""))
			{
				max_seats=Integer.parseInt(request.getParameter("max_allowed").trim());
			}
			String veh_type=request.getParameter("vehicle_type").toUpperCase().trim();
			//String date=request.getParameter("date").toUpperCase().trim();
			vehiclePojo.setVeh_no(veh_no);
			vehiclePojo.setVeh_type(veh_type);
			//vehiclePojo.setDate(date);
			vehiclePojo.setMax_seats(max_seats);
			vehiclePojo.setNo_seats(no_seats);
			vehicleDAO.addVehicle(vehiclePojo);
		}	
		else if(request.getParameter("updateVehicle")!=null)
		{
			String veh_no=request.getParameter("mh")+"-"+request.getParameter("tt")+"-"+request.getParameter("m")+"-"+request.getParameter("fofe");
			if(!request.getParameter("mod_seats_no").trim().equals(""))
			{
				no_seats=Integer.parseInt(request.getParameter("mod_seats_no").trim());
			}
			if(!request.getParameter("mod_max_allowed").trim().equals(""))
			{
				max_seats=Integer.parseInt(request.getParameter("mod_max_allowed").trim());
			}
			String veh_type=request.getParameter("vehicle_type").toUpperCase().trim();			
			//String date=request.getParameter("mod_date_time").toUpperCase().trim();
			vehiclePojo.setVeh_no(veh_no);
			vehiclePojo.setVeh_type(veh_type);
			//vehiclePojo.setDate(date);
			vehiclePojo.setMax_seats(max_seats);
			vehiclePojo.setNo_seats(no_seats);	
			vehiclePojo.setId(Integer.parseInt(request.getParameter("UpdateId")));
			vehicleDAO.editVehicle(vehiclePojo);			
		}
		else if(request.getParameter("del_id")!=null&&(!request.getParameter("del_id").equals("null")))
		{
			out.println("Delete Edit"+request.getParameter("del_id"));
			vehicleDAO.deleteVehicle(Integer.parseInt(request.getParameter("del_id")));			
		}
		else if(request.getParameter("id")!=null)
		{
			redirect=false;
			try {
				pstmt=connection.prepareStatement("SELECT * FROM vehicle_master where id="+request.getParameter("id"));
				ResultSet rs= pstmt.executeQuery();
				while(rs.next()){
					String veh_no=rs.getString("vehicle_no");
					StringTokenizer st=new StringTokenizer(veh_no, "-");
					out.print(rs.getInt("id")+","+st.nextToken()+","+st.nextToken()+","+st.nextToken()+","+st.nextToken()+","+rs.getInt("no_seats")+","+rs.getInt("max_seats")+","+rs.getString("veh_type"));									
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(redirect)
		{
			response.sendRedirect("View/transportation/addVehicle.jsp");
		}
	}
}