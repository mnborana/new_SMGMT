<%@page import="net.sf.jasperreports.view.JasperViewer"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="net.sf.jasperreports.engine.JRDataSource"%>
<%@page import="net.sf.jasperreports.engine.JasperReport"%>
<%@page import="net.sf.jasperreports.engine.JRException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.OutputStream"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="net.sf.jasperreports.engine.JasperCompileManager"%>
<%@page import="net.sf.jasperreports.engine.xml.JRXmlLoader"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="net.sf.jasperreports.engine.design.JasperDesign"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
					try
					{
					Class.forName("com.mysql.jdbc.Driver");
					Connection connection=DriverManager.getConnection("jdbc:mysql://localhost/smgmt", "root", "");
					net.sf.jasperreports.engine.JasperReport jasperReport = null;
					JasperDesign jasperDesign = null;
					Map parameters = new HashMap();
					
					String path = getServletContext().getRealPath("/reports/");
					jasperDesign = JRXmlLoader.load(path + "/transportationReport1.jrxml");
					jasperReport = JasperCompileManager.compileReport(jasperDesign);
					Map<String,Object> para=new HashMap<String,Object>();
					para.put("Parameter1","Bharat Vidyalaya");
					para.put("Parameter3","karjat");
					para.put("Parameter4","Ahemadnagar");
					para.put("Parameter5","414401");
					para.put("Parameter2","Mirajgaon");
					//JasperPrint jp=JasperFillManager.fillReport(jr, para,jrd);
					//byte[] byteStream = JasperRunManager.runReportToPdf(jasperReport, parameters, connection);
// 					OutputStream outStream = response.getOutputStream();
// 					response.setContentType("application/pdf");
// 					response.setContentLength(byteStream.length);
// 					outStream.write(byteStream, 0, byteStream.length);
// 					outStream.flush();
					
					//JasperReport jr=JasperCompileManager.compileReport("/media/ap/Songs/JasperReports/Name.jrxml");
					//JRDataSource jrd=new JREmptyDataSource();
					//Map<String,Object> para=new HashMap<String,Object>();
					//para.put("myname","Pravin Sanap");
					JasperPrint jp=JasperFillManager.fillReport(jasperReport, para,connection);
					//JasperExportManager.exportReportToPdfFile(jp,"/media/ap/Songs/JasperReports/Name..pdf");
					JasperViewer jv=new JasperViewer(jp,false);
					jv.setVisible(true);
					
					}
					catch (ClassNotFoundException e) 
					{
					e.printStackTrace();
					} catch (SQLException e)
					{
					e.printStackTrace();
					} catch (JRException e)
					{
					e.printStackTrace();
					}
response.sendRedirect("/SMGMT/View/transportation/addStudentTransportationFee.jsp");


%>
</body>
</html>