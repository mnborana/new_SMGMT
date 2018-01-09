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


//@WebServlet("/Search")
public class Search extends HttpServlet
{
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		AssignRouteDAO assignDAO=new AssignRouteImpl();
		
	
		String ch=request.getParameter("ch1");
		
		if(ch.equals("1"))
		{
			//System.out.println("in");
			String vehicleNo=request.getParameter("vehicleNo");
			String dest=request.getParameter("dest");
			List list=assignDAO.searchVehicleNo(vehicleNo);
			String s = "";
			
			//System.out.println("listtttttttt   "+list);
			Iterator itr=list.iterator();
			while (itr.hasNext()) {
				

				String id = itr.next().toString();
				String cnt = itr.next().toString();
				
				s += cnt+"~";
				int num = Integer.parseInt(cnt);
				
				int num1=1;
				while(num>0){
					if(num1==1){
						s+=itr.next()+"~"+itr.next()+"~"+itr.next()+"~";
					}
					else{
						itr.next();
						itr.next();
						itr.next();
						s+=itr.next()+"~"+itr.next()+"~";
					}
					num--;
					num1++;
				}
			}
		//	System.out.println("mmm "+s);
			out.print(s);
		}
		else
		if(ch.equals("2"))
		{
			String dest=request.getParameter("dest");
			System.out.println("dest is "+dest);
		List l1=assignDAO.searchDestination(dest);
		Iterator itr1=l1.iterator();
		while(itr1.hasNext())
		{
			out.print(itr1.next()+","+itr1.next()+",");
			//System.out.print(itr1.next()+","+itr1.next()+",");
		}
		}
		
	
	}
}


