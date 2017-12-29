package com.servletStore.transportation.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbconnect.DBConnection;
import com.servletStore.transportation.assignroute.model.AssignRouteDAO;
import com.servletStore.transportation.assignroute.model.AssignRouteImpl;
import com.servletStore.transportation.assignroute.model.AssignRoutePOJO;
import com.servletStore.transportation.driver.model.DriverDAO;
import com.servletStore.transportation.driver.model.DriverImpl;
import com.servletStore.transportation.driver.model.DriverPOJO;

/**
 * Servlet implementation class AssignRoute
 */
public class AssignRoute extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DBConnection dbconnect=new DBConnection();
		Connection connection=dbconnect.getConnection();
		java.sql.PreparedStatement pstmt=null;
		PrintWriter out = response.getWriter();
		//out.println("Driver");
		AssignRoutePOJO assignPOJO=new AssignRoutePOJO();
		AssignRouteDAO assignDAO=new AssignRouteImpl();
		boolean redirect=true;
		//add-CasteCategory
		if(request.getParameter("assign_route_btn")!=null){
			
			String veh_no=request.getParameter("vehicle_no");
			String route_name=request.getParameter("route_name");
			System.out.println(veh_no+"  "+route_name);
			assignPOJO.setVeh_id(Integer.parseInt(veh_no));
			assignPOJO.setRoute_id(Integer.parseInt(route_name));
			//assignPOJO.setVeh_no(veh_no);
			//assignPOJO.setRoute_name(route_name);
			assignDAO.assignRoute(assignPOJO);
			System.out.println("OOOOOOOOOOUUUUUUUUUUUUUUTTTTTT");
		}
		else if(request.getParameter("updateAssign")!=null)
		{
			assignPOJO.setId(Integer.parseInt(request.getParameter("UpdateId")));
			//assignPOJO.setVeh_no(request.getParameter("vehicle_no"));
			assignPOJO.setVeh_id(Integer.parseInt(request.getParameter("vehicle_no")));
			//assignPOJO.setRoute_name(request.getParameter("route_name"));
			assignPOJO.setRoute_id(Integer.parseInt(request.getParameter("route_name")));
			assignDAO.editAssignRoute(assignPOJO);
		}
		else if(request.getParameter("del_id")!=null&&(!request.getParameter("del_id").equals("null")))
		{
			//out.println("Delete Edit"+request.getParameter("del_id"));
			//vehiclePojo.setId(Integer.parseInt(request.getParameter("del_id")));
			assignDAO.deleteAssignRoute(Integer.parseInt(request.getParameter("del_id")));			
		}
		else if(request.getParameter("id")!=null)
		{
			try 
			{
					redirect=false;
					int a1=0,a2=0,a3=0;
					String a4="",a5="",a6="",a7="",a8="",a9="";					
					//System.out.print("In");
					pstmt=connection.prepareStatement("SELECT * FROM assignroute_master where id="+request.getParameter("id"));
					ResultSet rs= pstmt.executeQuery();
					while(rs.next())
					{
						a1=rs.getInt("id");
						a2=rs.getInt("vehicle_id");
						a3=rs.getInt("route_id");
						//out.print(rs.getInt("id")+","+rs.getString("veh_no")+","+rs.getString("route_name"));
					}
					pstmt=connection.prepareStatement("SELECT vehicle_no FROM vehicle_master where id="+a2);
					rs=pstmt.executeQuery();
					while(rs.next())
					{
						a4=rs.getString("vehicle_no");
					}
					pstmt=connection.prepareStatement("SELECT route_name FROM route_master where id="+a3);
					rs=pstmt.executeQuery();
					while(rs.next())
					{
						a5=rs.getString("route_name");
					}
					out.print(a1+","+a2+","+a3+","+a4+","+a5);
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
		}
		if(redirect)
			response.sendRedirect("View/transportation/AssignRoute.jsp");
	}

}
