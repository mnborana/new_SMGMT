package com.servletStore.staff.controller;

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

import com.servletStore.staff.model.StaffDAO;
import com.servletStore.staff.model.StaffImpl;
import com.servletStore.staff.model.StaffPojo;
import com.servletStore.student.model.StudentImpl;
import com.servletStore.student.model.StudentPojo;

/**
 * Servlet implementation class Staff
 */
public class Staff extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Staff() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		StaffPojo pojo=new StaffPojo();
		StaffDAO dao=new StaffImpl();
		HttpSession session = request.getSession();
		
		String casteList=request.getParameter("casteList");
		String religionList=request.getParameter("religionList");
		String bankList=request.getParameter("bankList");
		String department=request.getParameter("department");
		
		if(request.getParameter("saveStaff")!=null)
		{
			String joinDate=request.getParameter("joinDate");
			String date[]=joinDate.split("-");
			String dateJoin=date[2]+"-"+date[1]+"-"+date[0];
			String joinType=request.getParameter("joinType");
			String name=request.getParameter("name");
			String address=request.getParameter("add");
			String religion=request.getParameter("religion");
			String caste=request.getParameter("caste");
			String preSchool=request.getParameter("prevSchool");
			String expYr=request.getParameter("expYr");
			String expMnth=request.getParameter("expMnth");
			String dob=request.getParameter("dob");
			String date1[]=dob.split("-");
			String dateBirth=date1[2]+"-"+date1[1]+"-"+date1[0];
			String age=request.getParameter("age");
			String basicPay=request.getParameter("basicPay");
			String gradePay=request.getParameter("gradePay");
			String mob=request.getParameter("moNo");
			String grantType=request.getParameter("grantType");
			String gender=request.getParameter("gender");
			String bloodgp=request.getParameter("bloodGroop");
			String edu=request.getParameter("education");
			String dept=request.getParameter("dept");
			String designation=request.getParameter("designation");
			String bName=request.getParameter("bankName");
			String accNo=request.getParameter("accNo");
			String uid=request.getParameter("uid");
			String pf=request.getParameter("pf");
			String panCardNo=request.getParameter("panNo");
			
			pojo.setJoinDate(dateJoin);
			pojo.setJoinType(joinType);
			pojo.setName(name);
			pojo.setAdd(address);
			pojo.setReligion(religion);
			pojo.setCaste(caste);
			pojo.setPrevSchool(preSchool);
			pojo.setExpYr(Integer.parseInt(expYr));
			pojo.setExpMnth(Integer.parseInt(expMnth));
			pojo.setDob(dateBirth);
			pojo.setAge(Integer.parseInt(age));
			pojo.setBasicPay(Double.parseDouble(basicPay));
			pojo.setMoNo(mob);
			pojo.setGrantType(grantType);
			pojo.setGender(gender);
			pojo.setBloodGroop(bloodgp);
			pojo.setEducation(edu);
			pojo.setDept(dept);
			pojo.setDesign(designation);
			pojo.setBankName(bName);
			pojo.setAccNo(Integer.parseInt(accNo));
			pojo.setUid(Integer.parseInt(uid));
			pojo.setPf(Double.parseDouble(pf));
			pojo.setPanCardNo(panCardNo);
			
			int status=dao.insertStaffInfo(pojo);
			if(status>0)
			{
				System.out.println("Successfully added");
				session.setAttribute("flag", "Staff Info Added Successfully");
			}
			response.sendRedirect("View/staff/staff.jsp");
		}
		
		if(casteList!=null)
		{
			pojo.setCasteId(casteList);
			List theCasteList=dao.getCasteList(pojo);
			Iterator irt=theCasteList.iterator();
			while (irt.hasNext()) {
				out.print(irt.next()+"~");
			}
		}
		if(bankList!=null)
		{
			List list=dao.getBankName();
			Iterator irt=list.iterator();
			while (irt.hasNext()) {
				out.print(irt.next()+"~");
			}
		}
		//String dept_name = request.getParameter("dept_name").toUpperCase();
		/*if(department!=null)
		{
			//String dept_name = request.getParameter("dept_name").toUpperCase();
			System.out.println("dept_name "+department);
			List list=dao.getDepartmentList();
			Iterator itr=list.iterator();
			boolean status=false;
			while(itr.hasNext())
			{
				if(department.equals(itr.next().toString()))
				{
					status=true;
				}
			}
			if(status)
			{
				out.println("1,");
			}
			else
			{
				out.println("0,"+department);
			}
		}*/
		
		/*if(request.getParameter("addNewDept")!=null)
		{
			String addDept=request.getParameter("addNewDept");
			int status=dao.insertDept(addDept);
			if(status!=0)
			{
				session.setAttribute("status", "Insert department successfully");
				out.print("1,"+addDept+" Added Successfully");
			}
		}*/
	}
}