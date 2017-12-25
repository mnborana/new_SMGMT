package com.servletStore.setup.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servletStore.setup.model.SetupDAO;
import com.servletStore.setup.model.SetupImpl;
import com.servletStore.setup.model.SetupPOJO;

public class Setup extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		SetupPOJO pojo = new SetupPOJO();
		SetupDAO dao = new SetupImpl();

		// trustee env---------------------------------------------
		
		String eduName = request.getParameter("eduName");
		String trusteeName = request.getParameter("tUname");
		String trusteePassword = request.getParameter("tPass");
		int nSchools = Integer.parseInt(request.getParameter("nSchools"));
		out.print("No of Schools " + nSchools + "<br>");
		int count = 1;
		int counter = 1;
		for (int i = 0; i < nSchools; i++) {
			String schoolName = request.getParameter("sName" + i);

			out.print("School Name " + schoolName + "<br>");

			String principalUserName = request.getParameter("pUName" + count);
			String principalPassword = request.getParameter("pUPass" + count);
			if (principalUserName != null) {
				out.println(
						"Principal Name " + principalUserName + "<br> Principal Pass " + principalPassword + "<br>");
			}
			count++;
		}
		out.println("eduName " + eduName);
		out.println("trusteeName " + trusteeName);
		out.println("trusteePassword " + trusteePassword + "<br>");

		// trustee env ends--------------------------------------------------------------------

		// Trustee Environment-----------------------------------------------------------------
		pojo.setSocietyName(eduName);
		pojo.setNoOfSchools(nSchools);
		
		//int trusteeStatus=0;
		try {
			
			int trusteeStatus = dao.insertTrusteeInfo(pojo);
			
			if(trusteeStatus>0)
			{
				for (int i = 0; i < nSchools; i++) {
					String schoolName = request.getParameter("sName" + i);
					pojo.setSchoolName(schoolName);
					int instituteStatus=dao.insertInstituteDetails(pojo);
					if(instituteStatus>0)
					{
						int maxId=dao.getMaxSchoolId();
						
						String principalUserName = request.getParameter("pUName" + counter);
						String principalPassword = request.getParameter("pUPass" + counter);
						
						if (principalUserName != null) {
							
							pojo.setPrincipalUserName(principalUserName);
							pojo.setPrincipalPassword(principalPassword);
							
							dao.insertPrincipalDetails(pojo,maxId);
							
						}
							
						counter++;
						System.out.println("insterted in institute details for "+i);
					}
				}
				
				pojo.setTrusteeUsername(trusteeName);
				pojo.setTrusteePassword(trusteePassword);
				dao.insertTrusteeLoginDetails(pojo);
				
				System.out.println("inserted in trustee info");
			}
			
			//Trustee Environment Ends-----------------------------------------------------------------
			
			String radioNames[] = { "dash", "setting", "mgmt", "admission", "fee", "attendance", "exam", "teacher",
					"register", "cashbook", "transport", "salary", "library", "other", "emsg" };

			int navCount = 0;
			int radioCount = 31;
			ArrayList<String> principal = new ArrayList<>();
			ArrayList<String> clerk = new ArrayList<>();
			ArrayList<String> teacher = new ArrayList<>();
			ArrayList<String> librarian = new ArrayList<>();

			// Read = 1, Write=2 NotGranted=null

			for (int i = 0; i < radioNames.length; i++) {
				principal.add(request.getParameter("p_" + radioNames[i] + "" + radioCount));
				clerk.add(request.getParameter("c_" + radioNames[i] + "" + radioCount));
				teacher.add(request.getParameter("t_" + radioNames[i] + "" + radioCount));
				librarian.add(request.getParameter("l_" + radioNames[i] + "" + radioCount));

				radioCount++;
			}
			
			//Principal
			int principalAccessControlStatus=0;
			principalAccessControlStatus = dao.setAceessControl(principal, 3);
			if(principalAccessControlStatus>0)
			{
				System.out.println("Principal Access Control Granted");
			}
			
			//Clerk
			int clerkAccessControlStatus=0;
			clerkAccessControlStatus = dao.setAceessControl(clerk, 4);
			if(clerkAccessControlStatus>0)
			{
				System.out.println("Clerk Access Control Granted");
			}
			
			//Teacher
			int teacherAccessControlStatus=0;
			teacherAccessControlStatus = dao.setAceessControl(teacher, 5);
			if(teacherAccessControlStatus>0)
			{
				System.out.println("Teacher Access Control Granted");
			}
			
			//Librarian
			int librarianAccessControlStatus=0;
			librarianAccessControlStatus = dao.setAceessControl(librarian, 6);
			if(librarianAccessControlStatus>0)
			{
				System.out.println("Librarian Access Control Granted");
			}
			
			
			
			
			
			
			
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		
		
		/*// pricipal env------------------------------------------------------------------------

		out.println("<br>-------Principal Environment----------<br>");
		for (String thePrincipal : principal) {
			out.print(radioNames[navCount] + " " + thePrincipal + "<br>");
			navCount++;
		}
		navCount = 0;
		// principal env ends------------------------------------------------------------------------

		// clerk env-------------------------------------------------------------------------------

		out.println("<br>-------Clerk Environment----------<br>");
		for (String theClerk : clerk) {
			out.print(radioNames[navCount] + " " + theClerk + "<br>");
			navCount++;
		}
		navCount = 0;
		// clerk env ends------------------------------------------------------------------------

		// Teacher env-------------------------------------------------------------------------------
		out.println("<br>-------Teacher Environment----------<br>");
		for (String theTeacher : teacher) {
			out.print(radioNames[navCount] + " " + theTeacher + "<br>");
			navCount++;
		}
		navCount = 0;
		// Teacher env ends------------------------------------------------------------------------

		// Librarian env-------------------------------------------------------------------------------

		out.println("<br>-------Librarian Environment----------<br>");
		for (String theLibrarian : librarian) {
			out.print(radioNames[navCount] + " " + theLibrarian + "<br>");
			navCount++;
		}
		navCount = 0;
		// Librarian env ends------------------------------------------------------------------------
*/	}

}
