<%@page import="com.servletStore.register.model.OutwardRegisterPojo"%>
<%@page import="com.servletStore.register.model.OutwardRegisterImpl"%>
<%@page import="com.servletStore.register.model.OutwardRegisterDAO"%>
<%@page import="com.servletStore.settings.document.model.AddDocumentPojo"%>
<%@page import="com.servletStore.settings.document.model.AddDocumentImpl"%>
<%@page import="com.servletStore.settings.document.model.AddDocumentDAO"%>
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
    <title>Form Validations | Admire</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="/SMGMT/config/img/xlogo1.ico.pagespeed.ic.ONh6qx31g4.html"/>
    <!-- global styles-->
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_jquery-validation-engine,_css,_validationEngine.jquery.css+vendors,_datepicker,_css,_bootstrap-datepicker.min.css+vendors,_datepicker,_css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_select2,_css,_select2.min.css+css,_pages,_dataTables.bootstrap.css+css,_pages,_tables.css.pagespeed.cc._6lRWz19bZ.css"/>
	
	
	<link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/inputlimiter/css/jquery.inputlimiter.css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/chosen/css/chosen.css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/jquery-tagsinput/css/jquery.tagsinput.css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/daterangepicker/css/daterangepicker.css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/datepicker/css/bootstrap-datepicker.min.css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/bootstrap-timepicker/css/bootstrap-timepicker.min.css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/bootstrap-switch/css/bootstrap-switch.min.css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/jasny-bootstrap/css/jasny-bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/vendors/multiselect/css/multi-select.css"/>
    <!-- end of global styles-->
    
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css/pages/form_elements.css"/>
    <link type="text/css" rel="stylesheet" href="#" id="skin_change"/>
   
</head>
<body onload="setFocusToTextBox()"">
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
								<i class="fa fa-pencil"></i> Add Document
							</h4>
						</div>
						<div class="col-sm-7 col-lg-6">
							<ol class="breadcrumb float-right nav_breadcrumb_top_align">
								<li class="breadcrumb-item"><a href="index1.html"> <i
										class="fa fa-home" data-pack="default" data-tags=""></i>
										Dashboard
								</a></li>
								<li class="breadcrumb-item"><a href="#">Forms</a></li>
								<li class="active breadcrumb-item">Add New Document</li>
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
										<i class="fa fa-file-text-o"></i>Report
									</div>
									<form action="/SMGMT/" method="post" class="form-horizontal  login_validator"	id="form_block_validator">
										<div class="card-block m-t-35">
											<div class="form-group row">

												<div class="col-lg-1 text-lg-right"
													style="margin-left: 199px;">
													<label class="col-form-label"><strong>From :</strong></label>
												</div>
												<%
													SysDate requireddate = new SysDate();
												%>
												<div class="col-lg-3">
													<input type="text" class="form-control form_val_popup_dp3"
														name="fromDate" id="fromDate"
														value="<%=requireddate.todayDate()%>" />
												</div>

												<div class="col-lg-1 text-lg-right"
													style="margin-left: -55px">
													<label class="col-form-label"> <strong>To:</strong></label>
												</div>

												<div class="col-lg-3">
													<input type="text" class="form-control form_val_popup_dp3"
														name="toDate" id="toDate"
														value="<%=requireddate.todayDate()%>" />
												</div>
											</div>


											<div class="form-group row">
												<div class="col-lg-3 text-lg-right">
													<label for="required2" class="col-form-label"><strong>Report
															Type:</strong></label>
												</div>
												<div class="col-lg-3">

													<select class="form-control chzn-select" tabindex="2" name="reportType" id="reportType"  onchange="generateName(this.value)" required>

														<option value="InwardRegister">Inward Register</option>
														<option value="OutwardRegister">Outward Register</option>
														<option value="StockRegister">Stock Register</option>
													</select>
												</div>
											</div>
											
											<div class="row" style="margin-left: 300px;">

												<div class="col-xl-4 col-lg-6 col-md-4 col-sm-6 col-6 m-t-15">
													<button  type="button" class="btn btn-primary" style="margin-left: -13px;" name="createBtn" onclick="getReportData()">Create</button>
												</div>
												<div class="col-xl-4 col-lg-6 col-md-4 col-sm-6 col-6 m-t-15">
													<button type="button" class="btn btn-success" style="margin-left: -220px;" onClick="doExport('#wholeDataList', {type: 'excel', numbers: {output: false}, onMsoNumberFormat: DoOnMsoNumberFormat, worksheetName: 'MSO-FORMATS', excelstyles: ['background-color', 'color']});">Excel</button>
												</div>

												<div class="col-xl-4 col-lg-6 col-md-4 col-sm-6 col-6 m-t-15" style="">
													<button  type="button" class="btn btn-warning" style="margin-left: -435px;" onclick="printData()">Print</button>
												</div>

										  </div>
										  
										</div>                          

									</form>
								</div>
							</div>
						</div>
						
						<div class="col-lg-12">
                                <div class="card m-t-35">
                                    <div class="card-header bg-white">
                                        Report
                                    </div>
                                    <div class="card-block">
                                        <div class="table-responsive m-t-35">
                                            <table class="table table-bordered" id="wholeDataList">
                                                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
						
					</div>
				</div>
				
			</div>
			<!-- /.row -->
		</div>
		<!-- /.inner -->
	</div>
	<!-- /.outer -->
                                 




	<script type="text/javascript" src="/SMGMT/config/js/components.js"></script>
	<script type="text/javascript" src="/SMGMT/config/js/custom.js"></script>

    <script type="text/javascript" src="/SMGMT/config/vendors/jquery-validation-engine/js/jquery.validationEngine.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/jquery-validation-engine/js/jquery.validationEngine-en.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/jquery-validation/js/jquery.validate.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/datepicker/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/datetimepicker/js/DateTimePicker.min.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/moment/js/moment.min.js"></script>
	<script type="text/javascript" src="/SMGMT/config/js/form.js"></script>
    <script type="text/javascript" src="/SMGMT/config/js/pages/form_validation.js"></script>
	<script type="text/javascript" src="js/components.js.pagespeed.jm.vxV3GQYFro.js"></script>
	<script type="text/javascript" src="js/custom.js.pagespeed.jm.CN8Ow3CJOG.js"></script>

    <script>eval(mod_pagespeed_g_o5ieHdNa);</script>
    <script>eval(mod_pagespeed_UzcyJ5ysoL);</script>
    <script>eval(mod_pagespeed_sB4kJD0xfI);</script>
    <script>eval(mod_pagespeed_aYQJk4iDci);</script>
    <script>eval(mod_pagespeed_wVkzf2s7YZ);</script>
    <script>eval(mod_pagespeed_Ij0pRaH8BP);</script>
    <script>eval(mod_pagespeed_wfmKXYO4Nj);</script>
    <script>eval(mod_pagespeed_EYzby3B1$L);</script>

    <script type="text/javascript" src="/SMGMT/config/js/pages/users.js"></script>
    
    
    
    
<!-- plugin level scripts -->
<script type="text/javascript" src="/SMGMT/config/vendors/jquery.uniform/js/jquery.uniform.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/inputlimiter/js/jquery.inputlimiter.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/chosen/js/chosen.jquery.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/jquery-tagsinput/js/jquery.tagsinput.js"></script>
<script type="text/javascript" src="/SMGMT/config/js/pluginjs/jquery.validVal.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/moment/js/moment.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/daterangepicker/js/daterangepicker.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/datepicker/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/bootstrap-switch/js/bootstrap-switch.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/autosize/js/jquery.autosize.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/inputmask/js/inputmask.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/inputmask/js/jquery.inputmask.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/inputmask/js/inputmask.date.extensions.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/inputmask/js/inputmask.extensions.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/multiselect/js/jquery.multi-select.js"></script>

<script type="text/javascript" src="/SMGMT/config/js/form.js"></script>
<script type="text/javascript" src="/SMGMT/config/js/pages/form_elements.js"></script>


</body>

</html>