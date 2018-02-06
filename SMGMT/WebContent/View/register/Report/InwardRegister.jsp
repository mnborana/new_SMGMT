
<%@page import="com.servletStore.report.generalRegister.model.GeneralRegisterPOJO"%>
<%@page import="com.servletStore.report.generalRegister.model.GeneralRegisterIMPL"%>
<%@page import="com.servletStore.report.generalRegister.model.GeneralRegisterDAO"%>
<%@page import="com.servletStore.setup.model.SetupPOJO"%>
<%@page import="com.servletStore.setup.model.SetupImpl"%>
<%@page import="com.servletStore.setup.model.SetupDAO"%>

<%@page import="utility.SysDate"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.servletStore.settings.school.model.SchoolImpl"%>
<%@page import="com.servletStore.settings.school.model.SchoolDAO"%>
<%@page import="com.servletStore.settings.school.model.SchoolPOJO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>Vertical Software</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="/SMGMT/config/img/xlogo1.ico.pagespeed.ic.ONh6qx31g4.html"/>
   
	 <!--global styles-->
     <link type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_inputlimiter,_css,_jquery.inputlimiter.css+vendors,_bootstrap-colorpicker,_css,_bootstrap-colorpicker.min.css+vendors,_jquery-tagsinput,_c"/>
     <!--end of global styles-->
	
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css/pages/form_elements.css"/>
    <link type="text/css" rel="stylesheet" href="#" id="skin_change"/>
    
    <style>
.modal-footer {
    margin-top: 10px;
    
}

}
</style>
   
</head>

<%
	String schoolId = "0";
	String academicYear = "0";
	int roll=0;
	
	if (session.getAttribute("userName") == null) {
		response.sendRedirect("/SMGMT");
	} 
	else {
		roll=(Integer)session.getAttribute("rollId");
		schoolId = session.getAttribute("schoolId").toString();
		academicYear = session.getAttribute("year").toString();
		
		SetupDAO dao = new SetupImpl();
		List list=dao.getAccessControlDetails(roll);
		Iterator<SetupPOJO> itr= list.iterator();
					
	}
%>
<body>
<div class="preloader" style=" position: fixed;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  z-index: 100000;
  backface-visibility: hidden;
  background: #ffffff;">
    <div class="preloader_img" style="width: 200px;
  height: 200px;
  position: absolute;
  left: 48%;
  top: 48%;
  background-position: center;
  z-index: 999999">
        <img src="/SMGMT/config/img/loader.gif.pagespeed.ce.pu_lpoGKrw.gif" style=" width: 40px;" alt="loading...">
    </div>
</div>
	<div id="wrap">
		<div id="top">
			<!-- .navbar -->
			<jsp:include page="/View/common/header.jsp"></jsp:include>
			<!-- /.navbar -->
		</div>
		<!-- /#top -->
		<div class="wrapper">
			<!-- /.left navbar -->
			<jsp:include page="/View/common/left-navbar.jsp"></jsp:include>
			<!-- /.left navbar -->


			<!-- /#left -->
			<div id="content" class="bg-container">
				<header class="head">
				<div class="main-bar">
					<div class="row no-gutters">
						<div class="col-sm-5 col-lg-6">
							<h4 class="nav_top_align">
								<i class="fa fa-pencil"></i> Inward Register Report
							</h4>
						</div>
						<div class="col-sm-7 col-lg-6">
							<ol class="breadcrumb float-right nav_breadcrumb_top_align">
								<li class="breadcrumb-item"><a href="index1.html"> <i
										class="fa fa-home" data-pack="default" data-tags=""></i>
										Dashboard
								</a></li>
								<li class="breadcrumb-item"><a href="#">Forms</a></li>
								<li class="active breadcrumb-item">Inward Register</li>
							</ol>
						</div>
					</div>
				</div>
				</header>

				<!-- start your code from here  -->

				<div class="outer">
					<div class="inner bg-container">
						<div class="row">
							<div class="col-xl-12">
								<div class="card">
									<div class="card-header bg-white">
										<i class="fa fa-file-text-o"></i> Inward Register
									</div>
									<div class="card-block m-t-35">
										<form action="/SMGMT/InwardRegister" method="post" class="form-horizontal login_validator" id="form_block_validator">
											 <div class="col-lg-4 input_field_sections" style="margin-left: 400px;">
	                                            <h5>Select From & To Date</h5>
	                                                <div class="input-group">
	                                                <span class="input-group-addon">
	                                                    <i class="fa fa-calendar"></i>
	                                                </span>
	                                                    <input type="text" class="form-control" name="getFromToDate" id="reportrange" placeholder="dd/mm/yyyy-dd/mm/yyyy" required>
	                                               </div>
	                                        </div>
	                                        
	                                        <div class="modal-footer" >
                                                <div class="col-lg-4 push-lg-4">
                                                <input type="hidden" name="schoolId" value="<%=schoolId%>"/>
                                                     <button type="submit" name="InwardReport" class="btn btn-primary" style="margin-left: -700px;">Print</button>
                                                    <button type="button" class="btn btn-danger" style="margin-left: 10px;">Exit</button>
                                                </div>
                                            </div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	
 <!-- global scripts-->
<script type="text/javascript" src="/SMGMT/config/js/components.js"></script>
<script type="text/javascript" src="/SMGMT/config/js/custom.js"></script>
<!-- end of global scripts-->


<!-- plugin scripts -->
<script type="text/javascript" src="/SMGMT/config/vendors/jquery.uniform/js/jquery.uniform.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/inputlimiter/js/jquery.inputlimiter.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/jquery-tagsinput/js/jquery.tagsinput.js"></script>
<script type="text/javascript" src="/SMGMT/config/js/pluginjs/jquery.validVal.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/inputmask/js/jquery.inputmask.bundle.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/moment/js/moment.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/daterangepicker/js/daterangepicker.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/datepicker/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/bootstrap-switch/js/bootstrap-switch.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/autosize/js/jquery.autosize.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/jasny-bootstrap/js/jasny-bootstrap.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/jasny-bootstrap/js/inputmask.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/datetimepicker/js/DateTimePicker.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/j_timepicker/js/jquery.timepicker.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/clockpicker/js/jquery-clockpicker.min.js"></script>
<!--end of plugin scripts-->
<script type="text/javascript" src="/SMGMT/config/js/form.js"></script>
<script type="text/javascript" src="/SMGMT/config/js/pages/datetime_piker.js"></script>
 
<script type="text/javascript">

</script>
</body>

</html>