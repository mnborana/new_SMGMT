package com.servletStore.settings.school.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servletStore.login.model.UserLoginDAO;
import com.servletStore.login.model.UserLoginImpl;
import com.servletStore.settings.school.model.SchoolDAO;
import com.servletStore.settings.school.model.SchoolImpl;
import com.servletStore.settings.school.model.SchoolPOJO;
import com.servletStore.setup.model.SetupDAO;
import com.servletStore.setup.model.SetupImpl;
import com.servletStore.setup.model.SetupPOJO;

public class School extends HttpServlet
{

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		SchoolPOJO schoolPojo = new SchoolPOJO();
		SchoolDAO schoolDAO = new SchoolImpl();

		List<SchoolPOJO> list = new ArrayList<>();

		if (request.getParameter("activate") != null)
		{
			// for activate school

			int schoolId = Integer.parseInt(request.getParameter("schools"));
			String pUname = request.getParameter("pName");
			String password = request.getParameter("password");

			SchoolDAO school = new SchoolImpl();
			SetupDAO setup = new SetupImpl();
			SetupPOJO setupPojo = new SetupPOJO();

			UserLoginDAO check = new UserLoginImpl();

			try
			{
				Boolean result = check.checkUserExist(pUname);
				if (result)
				{
					session.setAttribute("flag", "Usename is already taken by someone");
					response.sendRedirect("/SMGMT/View/settings/school/addSchool.jsp");
				} else
				{
					int status = school.activateSchool(schoolId);
					if (status > 0)
					{
						//System.out.println("status updated");
						setupPojo.setPrincipalUserName(pUname);
						setupPojo.setPrincipalPassword(password);

						int success = setup.insertPrincipalDetails(setupPojo, schoolId);
						if (success > 0)
						{
							//System.out.println("principal added");
							session.setAttribute("flag", "School Activated");
							response.sendRedirect("/SMGMT/View/settings/school/addSchool.jsp");
						} else
						{
							session.setAttribute("flag", "Error");
							response.sendRedirect("/SMGMT/View/settings/school/addSchool.jsp");
						}

					} else
					{
						session.setAttribute("flag", "Error");
						response.sendRedirect("/SMGMT/View/settings/school/addSchool.jsp");
					}
				}

			} catch (NumberFormatException | SQLException e)
			{
				e.printStackTrace();
			}

		}

		if (request.getParameter("schoolid") != null)
		{
			String schoolId = request.getParameter("schoolid");
			int id = Integer.parseInt(schoolId);

			List list1 = schoolDAO.selectSchoolDetails(schoolPojo, id);

			List getSectionDetails = schoolDAO.getSection();

			Iterator itr = list1.iterator();
			while (itr.hasNext())
			{
				SchoolPOJO schoolPojo1 = (SchoolPOJO) itr.next();

				int id1 = ((SchoolPOJO) schoolPojo1).getId();

				String schoolName = ((SchoolPOJO) schoolPojo1).getSchoolName();

				String address = ((SchoolPOJO) schoolPojo1).getAddress();

				String slogan = ((SchoolPOJO) schoolPojo1).getSlogan();

				String indexNo = ((SchoolPOJO) schoolPojo1).getIndexno();

				String licenceNo = ((SchoolPOJO) schoolPojo1).getLicenceno();

				String udise = ((SchoolPOJO) schoolPojo1).getUdise();

				String schoolCode = ((SchoolPOJO) schoolPojo1).getShoolcode();

				String email = ((SchoolPOJO) schoolPojo1).getEmailid();

				String phoneNo = ((SchoolPOJO) schoolPojo1).getPhoneno();

				String board = ((SchoolPOJO) schoolPojo1).getBoard();

				String punitCode = ((SchoolPOJO) schoolPojo1).getPunitcode();

				String center = ((SchoolPOJO) schoolPojo1).getCenter();

				String date = ((SchoolPOJO) schoolPojo1).getDate();

				String jubileeYear = ((SchoolPOJO) schoolPojo1).getJubileeYear();

				String establishYear = ((SchoolPOJO) schoolPojo1).getEstablishYear();

				String medium = ((SchoolPOJO) schoolPojo1).getMedium();

				// int secId=schoolPojo1.getSection_id();

				// String section=schoolPojo1.getSectionName();

				out.print(id1 + "," + schoolName + "," + address + "," + slogan + "," + indexNo + "," + licenceNo + ","
						+ udise + "," + schoolCode + "," + email + "," + phoneNo + "," + board + "," + punitCode + ","
						+ center + "," + date + "," + jubileeYear + "," + establishYear + "," + medium + ",");
			}

			List getSecDetails = schoolDAO.getSectionDetails();
			Iterator itr1 = getSecDetails.iterator();
			while (itr1.hasNext())
			{
				out.print(itr1.next() + "@");
			}
		}

		if (request.getParameter("updateSchool") != null)
		{
			int id = Integer.parseInt(request.getParameter("UpdateId"));

			String schoolNameInEnglish = request.getParameter("schoolName");
			String schoolAddress = request.getParameter("school_address");
			String slogan = request.getParameter("slogan");
			String indexNo = request.getParameter("index_no");
			String licenceNo = request.getParameter("licence_no");
			String udise = request.getParameter("udise").trim();
			String schoolCode = request.getParameter("school_code");
			String emailId = request.getParameter("email_id");
			String phoneNo = request.getParameter("phone_no");
			String board = request.getParameter("board");
			String pUnitCode = request.getParameter("punit_code");
			String center = request.getParameter("center");
			String datetime = request.getParameter("date_time");
			String jubileeYear = request.getParameter("jubileeYear");
			String establishYear = request.getParameter("establishYear");
			String medium = request.getParameter("medium");
			String[] section = request.getParameterValues("sectionList");

			schoolPojo.setId(id);
			schoolPojo.setSchoolName(schoolNameInEnglish);
			schoolPojo.setAddress(schoolAddress);
			schoolPojo.setSlogan(slogan);
			schoolPojo.setIndexno(indexNo);
			schoolPojo.setLicenceno(licenceNo);
			schoolPojo.setUdise(udise);
			schoolPojo.setShoolcode(schoolCode);
			schoolPojo.setEmailid(emailId);
			schoolPojo.setPhoneno(phoneNo);
			schoolPojo.setBoard(board);
			schoolPojo.setPunitcode(pUnitCode);
			schoolPojo.setCenter(center);
			schoolPojo.setDate(datetime);
			schoolPojo.setJubileeYear(jubileeYear);
			schoolPojo.setEstablishYear(establishYear);
			schoolPojo.setMedium(medium);

			if (section != null)
			{
				for (int i = 0; i < section.length; i++)
				{
					// out.println();
					schoolDAO.insertSchoolSection(id, Integer.parseInt(section[i]));
					// schoolPojo.setSection_id(Integer.parseInt(section[i]));
				}
			}

			schoolDAO.updateSchoolDetails(schoolPojo);
			response.sendRedirect("View/settings/school/addSchool.jsp");
		}

		if (request.getParameter("deleteId") != null)
		{
			String did = request.getParameter("deleteId");

			int id = Integer.parseInt(did);
			schoolDAO.deleteSchool(id);
			response.sendRedirect("View/settings/school/addSchool.jsp");
		}

	}

}
