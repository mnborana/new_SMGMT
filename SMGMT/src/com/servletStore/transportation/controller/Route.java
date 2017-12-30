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

import com.dbconnect.DBConnection;
import com.servletStore.transportation.driver.model.DriverDAO;
import com.servletStore.transportation.driver.model.DriverImpl;
import com.servletStore.transportation.driver.model.DriverPOJO;
import com.servletStore.transportation.route.model.RouteDAO;
import com.servletStore.transportation.route.model.RouteImpl;
import com.servletStore.transportation.route.model.RoutePOJO;

public class Route extends HttpServlet
{
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		DBConnection dbconnect=new DBConnection();
		Connection connection=dbconnect.getConnection();
		PreparedStatement pstmt=null;
		PrintWriter out = response.getWriter();
		//out.println("route");
		RoutePOJO routePojo=new RoutePOJO();
		RouteDAO routeDAO=new RouteImpl();
		boolean redirect=true;
		//add-CasteCategory
		if(request.getParameter("add_route_btn")!=null){
			
			String route_code=request.getParameter("route_code");
			String route_name=request.getParameter("route_name").toUpperCase().trim();
			
			out.println(route_code);
			out.println(route_name);
			
			routePojo.setId(Integer.parseInt(request.getParameter("id")));
			routePojo.setRoute_code(route_code);
			routePojo.setRoute_name(route_name);
			
			routeDAO.addRoute(routePojo);
		
		}
		else if(request.getParameter("updateRoute")!=null){
				String route_code1=request.getParameter("route_code1").toUpperCase().trim();
				String route_name1=request.getParameter("route_name1").toUpperCase().trim();
				
				//out.println(route_code1);
				//out.println(route_name1);
				routePojo.setRoute_code(route_code1);
				routePojo.setRoute_name(route_name1);
				routePojo.setId(Integer.parseInt(request.getParameter("UpdateId")));
				routeDAO.EditRoute(routePojo);

			}
			else if(request.getParameter("del_id")!=null)
			{
				routeDAO.deleteRoute(Integer.parseInt(request.getParameter("del_id")));
			}
			else if(request.getParameter("route_name")!=null)
			{
				redirect=false;
				//System.out.println("In1");
				try 
				{				
					pstmt=connection.prepareStatement("SELECT * FROM route_master");			
					ResultSet rs= pstmt.executeQuery();
					while(rs.next())
					{	
						//System.out.println("Par : "+request.getParameter("route_name")+" Data : "+rs.getString("route_name"));
						//System.out.println("Condition : "+request.getParameter("route_name").toUpperCase().trim().startsWith(rs.getString("route_name").toUpperCase().trim()));
						if(rs.getString("route_name").toUpperCase().trim().equals(request.getParameter("route_name").toUpperCase().trim()))
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
			else if(request.getParameter("id")!=null)
			{
				redirect=false;
				try {				
						pstmt=connection.prepareStatement("SELECT * FROM add_route where id="+request.getParameter("id"));
						ResultSet rs= pstmt.executeQuery();
						while(rs.next())
						{						
							out.print(rs.getInt("id")+","+rs.getString("route_code")+","+rs.getString("route_name"));
						}
					} 
				catch (SQLException e) 
				{
					e.printStackTrace();
				}
			}
			if(redirect)
			{
				response.sendRedirect("View/transportation/AddRoute.jsp");
			}
	}
	
	}


