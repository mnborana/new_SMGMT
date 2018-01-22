<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import=" java.sql.SQLException"%>
<%@page import="net.sf.jasperreports.engine.JRException"%>
<%@page import="net.sf.jasperreports.engine.JasperCompileManager"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="net.sf.jasperreports.engine.design.JasperDesign"%>
<%@page import="net.sf.jasperreports.engine.xml.JRXmlLoader"%>

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
try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/smgmt","root","");
		net.sf.jasperreports.engine.JasperReport jasperReport = null;
		JasperDesign jasperDesign = null;
		Map parameters = new HashMap();

		String path = getServletContext().getRealPath("/WEB-INF/");
		jasperDesign = JRXmlLoader.load(path + "/Jasper.jrxml");
		jasperReport = JasperCompileManager.compileReport(jasperDesign);
		byte[] byteStream = JasperRunManager.runReportToPdf(jasperReport, parameters, conn);
		OutputStream outStream = response.getOutputStream();
		response.setContentType("application/pdf");
		response.setContentLength(byteStream.length);
		outStream.write(byteStream, 0, byteStream.length);
		outStream.flush();
		outStream.close();
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	} catch (JRException e) {
		e.printStackTrace();
	}
%>
</body>
</html>