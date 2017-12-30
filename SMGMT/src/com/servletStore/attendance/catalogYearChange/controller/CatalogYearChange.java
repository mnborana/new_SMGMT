package com.servletStore.attendance.catalogYearChange.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servletStore.attendance.catalogYearChange.model.CatalogYearChangeDAO;
import com.servletStore.attendance.catalogYearChange.model.CatalogYearChangeImpl;
import com.servletStore.attendance.catalogYearChange.model.CatalogYearChangePOJO;
import com.servletStore.student.model.StudentImpl;
import com.servletStore.student.model.StudentPojo;

/**
 * Servlet implementation class CatalogYearChange
 */
@WebServlet("/CatalogYearChange")
public class CatalogYearChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CatalogYearChange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		//doGet(request, response);
		PrintWriter out = response.getWriter();
		CatalogYearChangeDAO cd=new CatalogYearChangeImpl();
		String standardList=request.getParameter("standardList");//studentList
		String studentList=request.getParameter("studentList");
		String year=request.getParameter("year");
		
		if (standardList != null) 
		{
			CatalogYearChangePOJO pojo=new CatalogYearChangePOJO();
			pojo.setSchoolId(standardList);			
			List<String> theStandardList=cd.getStandardList(pojo);
			Iterator<String> irt=theStandardList.iterator();
			while (irt.hasNext()) 
			{
				out.print(irt.next()+"~");
			}
		}
		else if (studentList != null&&year!=null) 
		{
			
			System.out.println("List : "+studentList+" Yr:"+year);
			CatalogYearChangePOJO pojo=new CatalogYearChangePOJO();
			//pojo.setSchoolId(standardList);			
			List<CatalogYearChangePOJO> stud_list=cd.getStudentList(studentList,year);
			HttpSession session=request.getSession();
			session.setAttribute("stud_list",stud_list);
			Iterator<CatalogYearChangePOJO> irt=stud_list.iterator();
			while (irt.hasNext()) 
			{
				CatalogYearChangePOJO pojo1=irt.next();
				//System.out.print("*******"+pojo1.getRoll_no()+"/"+pojo1.getGr_no()+"/"+pojo1.getName()+"~");
				out.print(pojo1.getRoll_no()+"/"+pojo1.getGr_no()+"/"+pojo1.getName()+"~");
			}
		}
	}

}
