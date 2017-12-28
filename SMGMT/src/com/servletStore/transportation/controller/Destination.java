package com.servletStore.transportation.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
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
import com.servletStore.transportation.vehicle.model.VehicleDAO;
import com.servletStore.transportation.vehicle.model.VehicleImpl;
import com.servletStore.transportation.vehicle.model.VehiclePOJO;

/**
 * Servlet implementation class Destination
 */
@WebServlet("/Destination")
public class Destination extends HttpServlet {
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DBConnection dbconnect=new DBConnection();
		Connection connection=dbconnect.getConnection();
		PreparedStatement pstmt=null;
		PrintWriter out = response.getWriter();		
		DestinationPOJO destPojo=new DestinationPOJO();
		DestinationDAO destDao=new DestinationImpl();
		boolean redirect=true;
			
			
			if(request.getParameter("add_dest_btn")!=null)
			{
				System.out.println("Inside DestBtn");
				double fees=0;
				String route_name=request.getParameter("route_name").trim().toUpperCase();
				String dest=request.getParameter("dest").trim().toUpperCase();
				String fee=request.getParameter("fee").trim().toUpperCase();
				if(request.getParameter("fee")!="")
				{
					fees=Double.parseDouble(fee);
				}
				//destPojo.setRoute_name(route_name);
				destPojo.setRoute_id(Integer.parseInt(request.getParameter("route_name")));
				destPojo.setDest(dest);
				destPojo.setFee(fees);	
				destDao.addDestination(destPojo);
			}
			else if(request.getParameter("updateDesig")!=null)
			{
				//String route_name1=request.getParameter("route_name1").toUpperCase().trim();
				String dest1=request.getParameter("dest1").trim().toUpperCase();
				String fee1=request.getParameter("fee1").trim().toUpperCase();
	
				destPojo.setId(Integer.parseInt(request.getParameter("UpdateId")));
				//destPojo.setRoute_name(route_name1);
				System.out.println("**********"+request.getParameter("route_name1"));
				destPojo.setRoute_id(Integer.parseInt(request.getParameter("route_name1")));
				destPojo.setDest(dest1);
				destPojo.setFee(Double.parseDouble(fee1));
				destDao.editDestination(destPojo);
			}
			else if(request.getParameter("del_id")!=null&&(!request.getParameter("del_id").equals("null")))
			{
				out.println("Delete Edit"+request.getParameter("del_id"));
				destDao.deleteDestination(Integer.parseInt(request.getParameter("del_id")));			
			}	
			else if(request.getParameter("id")!=null)
			{
				try 
				{
					int a1=0,a2=0;
					String a3="",a4="";
					double a5=0.0;
					redirect=false;
					pstmt=connection.prepareStatement("SELECT * FROM destination_master where id="+request.getParameter("id"));
					ResultSet rs= pstmt.executeQuery();
					while(rs.next())
					{				
						a1=rs.getInt("id");
						a2=rs.getInt("route_id");
						a3=rs.getString("destination");
						a5=rs.getDouble("fee");
						
	//				out.print(rs.getInt("id")+","+rs.getString("route_name")+","+rs.getString("destination")+","+rs.getDouble("fee"));
					}
					pstmt=connection.prepareStatement("SELECT route_name FROM route_master where id="+a2);
					rs=pstmt.executeQuery();
					while(rs.next())
					{
						a4=rs.getString("route_name");
					}
					out.print(a1+","+a4+","+a3+","+a5+","+a2);
				} 
				catch (SQLException e) 
				{
					e.printStackTrace();
				}
		}
		else if(request.getParameter("dest")!=null&&request.getParameter("route_name")!=null)
		{
			redirect=false;
			//System.out.println("In1");
			try 
			{				
				pstmt=connection.prepareStatement("SELECT * FROM destination_master");			
				ResultSet rs= pstmt.executeQuery();
				while(rs.next())
				{	
					if(rs.getString("destination").toUpperCase().trim().equals(request.getParameter("dest").toUpperCase().trim())&&(String.valueOf(rs.getInt("route_id")).trim().equals(request.getParameter("route_name").trim())))
					{
						out.print("true");
						break;
					}
					
				}				
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			
			
		}
		if(redirect)
		{
			String r_name=request.getParameter("route_name");
			System.out.println("aaaaaaaaaaaa"+r_name);
			HttpSession session=request.getSession();
			session.setAttribute("r_name",r_name);
			response.sendRedirect("View/transportation/AddDestination.jsp");
		}
	}
}