package com.servletStore.transportation.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbconnect.DBConnection;
import com.servletStore.transportation.driver.model.DriverDAO;
import com.servletStore.transportation.driver.model.DriverImpl;
import com.servletStore.transportation.driver.model.DriverPOJO;

public class Driver extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DBConnection dbconnect=new DBConnection();
		Connection connection=dbconnect.getConnection();
		java.sql.PreparedStatement pstmt=null,pstmt1=null;
		PrintWriter out = response.getWriter();
		//out.println("Driver");
		DriverPOJO driverPojo=new DriverPOJO();
		DriverDAO driverDAO=new DriverImpl();
		boolean redirect=true;
		//add-CasteCategory
		if(request.getParameter("add_driver_btn")!=null){
			
			String veh_no=request.getParameter("vehicle_no").toUpperCase().trim();
			String name=request.getParameter("driver_name").toUpperCase().trim();;
			String temp_addrs=request.getParameter("temp_addrs").toUpperCase().trim();
			String perm_addrs=request.getParameter("perm_addrs").toUpperCase().trim();
			String dob=request.getParameter("dob").toUpperCase().trim();
			String contact=request.getParameter("digits_only").toUpperCase().trim();
			String license=request.getParameter("license").toUpperCase().trim();
			//driverPojo.setVeh_no(veh_no);
			driverPojo.setVeh_id(Integer.parseInt(veh_no));
			driverPojo.setName(name);
			driverPojo.setTemp_addrs(temp_addrs);
			driverPojo.setPerm_addrs(perm_addrs);
			driverPojo.setDob(dob);
			driverPojo.setPhone_no(contact);
			driverPojo.setLicense_no(license);
			System.out.println("--------------"+veh_no);
			driverDAO.addDriver(driverPojo);			
		}
		else if(request.getParameter("updateDriver")!=null)
		{
			driverPojo.setId(Integer.parseInt(request.getParameter("UpdateId")));
			//driverPojo.setVeh_no(request.getParameter("mod_vehicle_no"));
			System.out.println(">>>>>>>>"+request.getParameter("mod_vehicle_no"));
			driverPojo.setVeh_id(Integer.parseInt(request.getParameter("mod_vehicle_no")));
			driverPojo.setName(request.getParameter("mod_driver_name"));
			driverPojo.setTemp_addrs(request.getParameter("mod_temp_addrs"));
			driverPojo.setPerm_addrs(request.getParameter("mod_perm_addrs"));
			driverPojo.setDob(request.getParameter("mod_dob"));
			driverPojo.setPhone_no(request.getParameter("mod_digits_only"));
			driverPojo.setLicense_no(request.getParameter("mod_license"));
			driverDAO.editDriver(driverPojo);
		}
		else if(request.getParameter("del_id")!=null&&(!request.getParameter("del_id").equals("null")))
		{
			//out.println("Delete Edit"+request.getParameter("del_id"));
			//vehiclePojo.setId(Integer.parseInt(request.getParameter("del_id")));
			driverDAO.deleteDriver(Integer.parseInt(request.getParameter("del_id")));			
		}
		else if(request.getParameter("id")!=null)
		{
			redirect=false;
			try 
			{
				//System.out.print("In");
				int a1=0,a2=0;
				String a3="",a4="",a5="",a6="",a7="",a8="",a9="";
				pstmt=connection.prepareStatement("SELECT * FROM driver_master where id="+request.getParameter("id"));				
				ResultSet rs= pstmt.executeQuery();
				while(rs.next()){
					a1=rs.getInt("id");
					a2=rs.getInt("vehicle_id");
					a3=rs.getString("name");
					a4=rs.getString("temp_addrs");
					a5=rs.getString("perm_addrs");
					a6=rs.getString("dob");
					a7=rs.getString("phone_no");
					a8=rs.getString("license_no");					
				}
				pstmt=connection.prepareStatement("SELECT vehicle_no FROM vehicle_master where id="+a2);
				rs=pstmt.executeQuery();
				while(rs.next())
				{
					a9=rs.getString("vehicle_no");
				}
				out.print(a1+"`"+a9+"`"+a3+"`"+a4+"`"+a5+"`"+a6+"`"+a7+"`"+a8+"`"+a2);				
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(redirect)
		{
			response.sendRedirect("View/transportation/AddDriver.jsp");
		}
	}
}