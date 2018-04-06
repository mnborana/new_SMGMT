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
import com.servletStore.transportation.conductor.model.ConductorDAO;
import com.servletStore.transportation.conductor.model.ConductorImpl;
import com.servletStore.transportation.conductor.model.ConductorPOJO;

public class Conductor extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		//out.println("Conductor");
		ConductorPOJO conductorPojo=new ConductorPOJO();
		ConductorDAO conductorDAO=new ConductorImpl();
		DBConnection dbconnect=new DBConnection();
		Connection connection=dbconnect.getConnection();
		java.sql.PreparedStatement pstmt=null;
		boolean redirect=true;
		//add-CasteCategory
		if(request.getParameter("add_conductor_btn")!=null){
			
			String veh_no=request.getParameter("vehicle_no").toUpperCase().trim();
			String name=request.getParameter("driver_name");
			String temp_addrs=request.getParameter("temp_addrs").toUpperCase().trim();
			String perm_addrs=request.getParameter("perm_addrs").toUpperCase().trim();
			String dob=request.getParameter("dob").toUpperCase().trim();
			String contact=request.getParameter("digit1").toUpperCase().trim();			
			conductorPojo.setVeh_id(Integer.parseInt(veh_no));
			conductorPojo.setName(name);
			conductorPojo.setTemp_addrs(temp_addrs);
			conductorPojo.setPerm_addrs(perm_addrs);
			conductorPojo.setDob(dob);
			conductorPojo.setPhone_no(contact);	
			conductorDAO.addConductor(conductorPojo);
		}
		else if(request.getParameter("updateConductor")!=null)
		{
			conductorPojo.setId(Integer.parseInt(request.getParameter("UpdateId")));
			conductorPojo.setVeh_id(Integer.parseInt(request.getParameter("mod_vehicle_no")));
			conductorPojo.setName(request.getParameter("mod_driver_name"));
			conductorPojo.setTemp_addrs(request.getParameter("mod_temp_addrs"));
			conductorPojo.setPerm_addrs(request.getParameter("mod_perm_addrs"));
			conductorPojo.setDob(request.getParameter("mod_dob"));
			conductorPojo.setPhone_no(request.getParameter("mod_digits_only"));			
			conductorDAO.editConductor(conductorPojo);
		}
		else if(request.getParameter("del_id")!=null&&(!request.getParameter("del_id").equals("null")))
		{
			out.println("Delete Edit"+request.getParameter("del_id"));
			//vehiclePojo.setId(Integer.parseInt(request.getParameter("del_id")));
			conductorDAO.deleteConductor(Integer.parseInt(request.getParameter("del_id")));			
		}
		else if(request.getParameter("id")!=null)
		{
			try {
				int a1=0,a2=0;
				String a3="",a4="",a5="",a6="",a7="",a8="";
				redirect=false;
				//System.out.print("In");
				pstmt=connection.prepareStatement("SELECT * FROM conductor_master where id="+request.getParameter("id"));
				ResultSet rs= pstmt.executeQuery();
				while(rs.next()){
					a1=rs.getInt("id");
					a2=rs.getInt("vehicle_id");
					a3=rs.getString("name");
					a4=rs.getString("temp_addrs");
					a5=rs.getString("perm_addrs");
					a6=rs.getString("dob");
					a7=rs.getString("phone_no");
					//out.print(rs.getInt("id")+"`"+rs.getString("vehicle_no")+"`"+rs.getString("name")+"`"+rs.getString("temp_addrs")+"`"+rs.getString("perm_addrs")+"`"+rs.getString("dob")+"`"+rs.getString("phone_no"));
				}
				pstmt=connection.prepareStatement("SELECT vehicle_no FROM vehicle_master where id="+a2);
				rs=pstmt.executeQuery();
				while(rs.next())
				{
					a8=rs.getString("vehicle_no");
				}
				out.print(a1+"`"+a8+"`"+a3+"`"+a4+"`"+a5+"`"+a6+"`"+a7+"`"+a8+"`"+a2);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		if(redirect)
		{
			response.sendRedirect("View/transportation/AddConductor.jsp");
		}
	}
}