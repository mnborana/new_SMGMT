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
										<i class="fa fa-file-text-o"></i> Add New Document
									</div>
									<div class="card-block m-t-35">
										<form action="/SMGMT/AddDocument" method="post"	class="form-horizontal  login_validator" id="form_block_validator">


											<div class="form-group row">
												<div class="col-lg-3  text-lg-right">
													<label for="required2" class="col-form-label">Document Name<span style="color: red;">*</span></label>
												</div>
												<div class="col-lg-4">
													<input type="text" id="required2" name="addDocument" onkeyup="this.value = this.value.toUpperCase()" class="form-control" required>
												</div>
											</div>

											<div class="form-actions form-group row">
												<div class="col-lg-4 push-lg-4">
													<button type="submit" name="documentNameBtn" class="btn btn-success" >Submit</button>
													<button type="button" class="btn btn-danger" style="margin-left: 10px;">Exit</button>
												</div>
											</div>

										</form>
									</div>
								</div>
							</div>
							<!-- /.col-lg-12 -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.inner -->
				</div>
				<!-- /.outer -->


				<div class="outer">
					<div class="inner bg-container">
						<div class="card">
							<div class="card-header bg-white">Documents Information</div>
							<div class="card-block m-t-35" id="user_body">
								<div class="table-toolbar">

									<div class="btn-group float-right users_grid_tools">
										<div class="tools"></div>
									</div>
								</div>
								<div>
									<div>
										<table	class="table  table-striped table-bordered table-hover dataTable no-footer"	id="editable_table" role="grid">
											<thead>
												<tr role="row">
													<th class="sorting_asc wid-20" tabindex="0" rowspan="1"	colspan="1">Doc.No</th>
													<th class="sorting wid-25" tabindex="0" rowspan="1"	colspan="1">Document Name</th>
													<th class="sorting wid-10" tabindex="0" rowspan="1"	colspan="1">Action</th>
												</tr>
											</thead>
											
											<%
											int count=1;
											AddDocumentDAO dao=new AddDocumentImpl();
											List<AddDocumentPojo> list=dao.selectDocuments();
											Iterator<AddDocumentPojo> itr=list.iterator();
											%>

											<tbody>
											<%
											while(itr.hasNext())
											{
												AddDocumentPojo pojo=(AddDocumentPojo)itr.next();
											
											%>

												<tr class="gradeX">
													<td id="<%=((AddDocumentPojo)pojo).getId()%>"><%=count %></td>
													<td><%=((AddDocumentPojo)pojo).getRegisterName() %></td>
													<td><a class="edit" data-toggle="modal"	data-placement="top" title="Update" href="#update"	onclick="searchSchool(<%=((AddDocumentPojo)pojo).getId()%>)"><i	class="fa fa-pencil text-warning"></i></a>&nbsp; &nbsp; 
														<a	class="delete hidden-xs hidden-sm" data-toggle="tooltip" data-placement="top" title="Delete" href=""><i	class="fa fa-trash text-danger"></i></a>
													</td>
												</tr>
												<%
													count++;
												}
												%>
											</tbody>
										</table>
									</div>
								</div>
								<!-- END EXAMPLE TABLE PORTLET-->
							</div>
						</div>
					</div>
					<!-- /.inner -->
				</div>
				<!-- /.outer -->
				
			</div>
		</div>
		<!-- /#content -->
	</div>

	<!--wrapper-->
       
       <!-- <modal start -->
				<div class="modal fade pullDown" id="update" role="dialog" aria-labelledby="modalLabelnews">
					<div class="modal-dialog modal-mm" role="document">
						<div class="modal-content">
							<div class="modal-header bg-warning">
								<h4 class="modal-title text-white" id="modalLabelnews" style="margin-right: 275px;">Update School Details</h4>
							</div>
							<div class="modal-body">
								<form action="/SMGMT/AddDocument" method="post"	class="form-horizontal  login_validator" id="form_block_validator">


											<div class="form-group row">
												<div class="col-lg-4  text-lg-right">
													<label for="required2" class="col-form-label">Document Name<span style="color: red;">*</span></label>
												</div>
												<div class="col-lg-6">
												<input type="hidden" id="Updateid" name="UpdateId">
													<input type="text" id="updateDoc" name="updateDocument"  pattern="[A-Za-z]*" autofocus onkeyup="this.value = this.value.toUpperCase()" class="form-control" required>
												</div>
											</div>

											 <div class="modal-footer">
                         					   <button class="btn  btn-success" type="submit" name="updateDocument" >Update</button>
                         				       <button class="btn  btn-warning" data-dismiss="modal">Close</button>
				                           </div>

								</form>
			
							</div>
						</div>
					</div>
				</div>

	<!-- modal end -->
                
                
                
       
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

	function searchSchool(id) {
		
		alert(id);
		var xhttp;
		xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				
				var demoStr = this.responseText.split(",");
					
				document.getElementById("Updateid").value = demoStr[0];				 
				document.getElementById("updateDoc").value = demoStr[1];	
					alert(demoStr[1]);
			     
				}
			};
		xhttp.open("POST","/SMGMT/AddDocument?documentId="+id, true);
		xhttp.send();
	}

	
	
	function myFunction() {
	    var x = document.getElementById("snackbar")
	    x.className = "show";
	    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
	}
	
	
	function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah')
                    .attr('src', e.target.result);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
	
	

	function setFocusToTextBox() {
		
		document.getElementById("required2").focus();
		document.getElementById("schoolName").focus();
	
		myFunction();
	}
	

	

	</script>
</body>

</html>