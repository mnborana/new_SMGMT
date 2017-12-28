package com.servletStore.transportation.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbconnect.DBConnection;
import com.servletStore.transportation.assignroute.model.AssignRouteDAO;
import com.servletStore.transportation.assignroute.model.AssignRouteImpl;
import com.servletStore.transportation.vehicle.model.VehicleDAO;
import com.servletStore.transportation.vehicle.model.VehicleImpl;
import com.servletStore.transportation.vehicle.model.VehiclePOJO;


@WebServlet("/Search")
public class Search extends HttpServlet
{
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		AssignRouteDAO assignDAO=new AssignRouteImpl();
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String ch=request.getParameter("ch1");
		System.out.println(ch);
		if(ch.equals("1"))
		{
			System.out.println("in");
		String vehicleNo=request.getParameter("vehicleNo");
		String dest=request.getParameter("dest");
		List list=assignDAO.searchVehicleNo(vehicleNo);
		Iterator itr=list.iterator();
			while (itr.hasNext()) {
				Object id=itr.next();
			Object rounteName=itr.next();
			Object destination=itr.next();
			Object fee=itr.next();
			System.out.println("\n"+rounteName);
			System.out.println("\n"+destination);
			System.out.println("\n"+fee);
			out.print(id+"~"+rounteName+"~"+destination+"~"+fee+"@");
		}
		}
		else
		if(ch.equals("2"))
		{
			String dest=request.getParameter("dest");
		List l1=assignDAO.searchDestination(dest);
		Iterator itr1=l1.iterator();
		while(itr1.hasNext())
		{
			out.print(itr1.next()+","+itr1.next()+",");
		}
		}
		
	
	}
}


