<%@page import="com.servletStore.cashBook.controller.CashBook"%>
<%@page import="com.servletStore.cashBook.subAccount.model.SubAccountPOJO"%>
<%@page import="com.servletStore.cashBook.subAccount.model.SubAccountIMPL"%>
<%@page import="com.servletStore.cashBook.subAccount.model.SubAccountDAO"%>


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
<body onload="loadFunction()">
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
								<i class="fa fa-pencil"></i> CashBook Entry
							</h4>
						</div>
						<div class="col-sm-7 col-lg-6">
							<ol class="breadcrumb float-right nav_breadcrumb_top_align">
								<li class="breadcrumb-item"><a href="index1.html"> <i
										class="fa fa-home" data-pack="default" data-tags=""></i>
										Dashboard
								</a></li>
								<li class="breadcrumb-item"><a href="#">Forms</a></li>
								<li class="active breadcrumb-item">CashBook Entry </li>
							</ol>
						</div>
					</div>
				</div>
				</header>

				<!-- start your code from here  -->

				<div class="outer">
						<div class="inner bg-container forms">
							<div class="row">
								<div class="col-xl-12">
									<div class="card">
										<div class="card-header bg-white">
											<h3>CashBook Entry</h3>
										</div>
										<div class="card-block m-t-35">
										<form action="#" method="post"	class="form-horizontal  login_validator" id="form_block_validator">
									
										<div class="card-block">
											<div class="row">
												<div class="card-block seclect_form">
													<div class="row">
														<div class="form-group col-lg-4 input_field_sections">
															<label for="academicYearId" class="col-form-label">Select CashBook *</label> 
															<select	class="validate[required] form-control chzn-select"	name="selectCashBook"  required>
																<option disabled selected>Select CashBook</option>
															</select>
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="stdId" class="col-form-label">Select Ledger *</label> 
															<select class="form-control chzn-select" name="selectLedger"  required>
																<option disabled selected>Select Ledger</option>
															</select>
														</div>
														<div class="form-group col-lg-4 input_field_sections">
															<label for="stdId" class="col-form-label">Select Sub Account *</label> 
															<select class="form-control chzn-select" name="selectSubAccount"  required>
																<option disabled selected>Select SubAccount</option>
															</select>
														</div>
													</div>
													
													<div class="row">													
													<div class="form-group col-lg-4 input_field_sections">
														<label for="stdId" class="col-form-label">Select Account Type *</label> 
														
														<div class="col-lg-4">
														<label class="custom-control custom-radio">
	                                                        <input name="radio3" type="radio" class="custom-control-input" onclick="selectAccountType(this.value)" id="selectBoth" value="0">
	                                                        <span class="custom-control-indicator"></span>
	                                                        <span class="custom-control-description">Credit</span>
	                                               		 </label>
                                                
		                                                <label class="custom-control custom-radio">
		                                                        <input name="radio3" type="radio" class="custom-control-input" onclick="selectAccountType(this.value)" id="selectCredit" value="1">
		                                                        <span class="custom-control-indicator"></span>
		                                                        <span class="custom-control-description">Debit</span>
		                                                </label>                                      
														</div>	
													</div>	
														
														<div class="form-group col-lg-4 input_field_sections">
														<label for="stdId" class="col-form-label">Select Ttransaction Type *</label> 
														
														<div class="col-lg-4">
														<label class="custom-control custom-radio">
	                                                        <input name="radio3" type="radio" class="custom-control-input" onclick="selectAccountType(this.value)" id="selectBoth" value="0">
	                                                        <span class="custom-control-indicator"></span>
	                                                        <span class="custom-control-description">Cash</span>
	                                               		 </label>
                                                
		                                                <label class="custom-control custom-radio">
		                                                        <input name="radio3" type="radio" class="custom-control-input" onclick="selectAccountType(this.value)" id="selectCredit" value="1">
		                                                        <span class="custom-control-indicator"></span>
		                                                        <span class="custom-control-description">Bank</span>
		                                                </label>                                      
														</div>	
														</div>	
														
														<div class="form-group col-lg-4 input_field_sections">
															<label for="admission_date" class="col-form-label">Admission
																Date *</label>
															<div class="input-group input-append date" id="dp1"
																data-date-format="dd-mm-yyyy">
																<input type="text" class="form-control form_val_popup"
																	name="admissionDate" id="admissionDate"
																	placeholder="dd-mm-yyyy" required> <span
																	class="input-group-addon add-on"> <i
																	class="fa fa-calendar"></i>
																</span>
															</div>
														</div>					
													</div>
													
													<div class="row">													
														<div class="form-group col-lg-4 input_field_sections">
																<label for="academicYearId" class="col-form-label">Bank Name *</label> 
																<select	class="validate[required] form-control chzn-select"	name="selectCashBook"  required>
																	<option disabled selected>Select BankName</option>
																</select>
														</div>													
													</div>
													
													<div class="row">													
														<div class="form-group col-lg-4 input_field_sections">
																<label for="academicYearId" class="col-form-label">Amount *</label> 
																<input type="text" id="required2" name="getAccountName" pattern="[A-Za-z]" onkeyup="this.value = this.value.toUpperCase()" class="form-control" required>
														</div>
														
														<div class="form-group col-lg-4 input_field_sections">
																<label for="academicYearId" class="col-form-label">Description *</label> 
																<input type="text" id="required2" name="getAccountName" pattern="[A-Za-z]" onkeyup="this.value = this.value.toUpperCase()" class="form-control" required>
														</div>													
													</div>
													
													
											</div>
											</div>
											</div>
											<div class="form-actions form-group row">
												<div class="col-lg-4 push-lg-4">
													<button type="submit" name="CashBookEntryBTN" class="btn btn-success" >Submit</button>
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
					<!-- End of Official Details -->		
				
			</div>
		</div>
		<!-- /#content -->
	</div>

	<!--wrapper-->
     
       
<!-- /#wrap -->

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

    <script type="text/javascript" src="/SMGMT/config/vendors/select2/js/select2.js.pagespeed.jm.Eugd1Y0BmV.js"></script>
    <script src="/SMGMT/config/vendors/datatables/js/jquery.dataTables.min.js+dataTables.bootstrap.min.js.pagespeed.jc.HRNT0WoBU9.js"></script>
    <script src="/SMGMT/config/vendors/datatables/js/dataTables.responsive.min.js+dataTables.buttons.min.js+buttons.colVis.min.js+buttons.html5.min.js+buttons.bootstrap.min.js+buttons.print.min.js.pagespeed.jc.TdR_"></script>
    
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



<script type="text/javascript">

function loadFunction()
{
	<%
	if(session.getAttribute("flag")!=null){ %>
	$(window).load(function () {
	    iziToast.show({
	        title: 'Success',
	        message: '<%=session.getAttribute("flag").toString()%>',
	        color:'#cc7fe5',       //'#00cc99'
	        position: 'topCenter'
	    });
	    return false;
	});
	<%} session.removeAttribute("flag");%>
}
</script>
</body>

</html>