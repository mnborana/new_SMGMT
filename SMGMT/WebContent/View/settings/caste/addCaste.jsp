<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.servletStore.settings.caste.model.CasteImpl"%>
<%@page import="com.servletStore.settings.caste.model.CasteDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Form Validations | Admire</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="/SMGMT/config/img/xlogo1.ico.pagespeed.ic.ONh6qx31g4.html"/>
    <!-- global styles-->
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css/components.css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css/custom.css"/>
    <!-- end of page level styles -->
    <!--Plugin styles-->
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
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_bootstrap-switch,_css,_bootstrap-switch.min.css+vendors,_switchery,_css,_switchery.min.css+vendors,_radio_css,_css,_radiobox.min.css+vendo"/>
    <!--End of plugin styles-->
    <!--Page level styles-->
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css/pages/form_elements.css"/>

    <!-- end of global styles-->
    <style type="text/css">
    .table thead tr th{
    	text-align: -webkit-center;
	}
	.table td{
		text-align: -webkit-center;
	}
    </style>
   
</head>
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
                                    <i class="fa fa-pencil"></i>
                                    Caste
                                </h4>
                            </div>
                            <div class="col-sm-7 col-lg-6">
                                <ol class="breadcrumb float-right nav_breadcrumb_top_align">
                                    <li class="breadcrumb-item">
                                        <a href="index1.html">
                                            <i class="fa fa-home" data-pack="default" data-tags=""></i>
                                            Dashboard
                                        </a>
                                    </li>
                                    <li class="breadcrumb-item">
                                        <a href="#">Settings</a>
                                    </li>
                                    <li class="active breadcrumb-item">Add Caste</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </header>
                
             <!-- start your code from here  -->  
              
                <div class="outer">
                    <div class="inner bg-container">
                        <div class="row">

                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-header bg-white">
                                        <i class="fa fa-file-text-o"></i>
                                        Caste
                                    </div>
                                    <div class="card-block m-t-35">
                                        <form action="/SMGMT/Caste" method="POST" class="form-horizontal  login_validator" id="form_block_validator">
                                           
                                          <div class="row">  
                                            <div class="col-lg-4 input_field_sections">
                                                <h5>Select Category</h5>
                                                <select class="form-control chzn-select" name="category" id="category" required="required">
                                                <%
					 								CasteDAO castedao=new CasteImpl();
					 								request.setAttribute("list",castedao.getCategoryDetails());
												%>
                                                	<c:forEach items="${list}" var="u">  
														<option value="${u.getCategory_id()}">${u.getCasteCategoryName()}</option>
													</c:forEach>  
                                                </select>
                                            </div>
                                           
                                            <div class="col-lg-4 input_field_sections">
                                                <h5>Select Religion</h5>
                                                <select class="form-control chzn-select" name="religion" id="religion" required="required">
                                                <%
	                                                request.setAttribute("list",castedao.getReligionDetails());
												%>
                                                	<c:forEach items="${list}" var="u">  
														<option value="${u.getReligion_id()}">${u.getReligionName()}</option>
													</c:forEach>  
                                                </select>
                                            </div>
                                            
                                            <div class="col-lg-4 input_field_sections">
                                            <h5>Caste Name <span style="color: red">*</span></h5>
                                            
                                                <input class="form-control" type="text" id="casteName" name="casteName" required/>
                                            
                                    		</div>
                                                                                            
                                          </div>
                                          
                                          
                                          <br> 
                                          <br> 
                                            
                                           
                                            <div class="form-actions form-group row">
                                                <div class="col-lg-4 push-lg-4">
                                                    <button type="submit" name="caste_btn" id="caste_btn" value="caste_btn" class="btn btn-primary">Add Caste</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>                            
                            
                            
                           

                        </div> <!-- /.row -->
                       
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card m-t-35">
                                    <div class="card-header bg-white">
                                         CASTE LIST
                                    </div>
                                    <div class="card-block">
                                        <div class="table-responsive m-t-35">
                                            <table class="table  table-striped table-bordered table-hover dataTable no-footer">
                                                <thead>
                                                <tr>
                                                    <th>No.</th>
                                            		<th>Category</th>
                                            		<th>Religion</th>
                                            		<th>Caste Name</th>
                                            		<th>Action</th>
                                                </tr>
                                                </thead>
                                                <%
													CasteDAO casteDAO=new CasteImpl();
													request.setAttribute("list", casteDAO.getCasteDetails());
										 			int i=0;
												%>
                                                <tbody>
	                                                <c:forEach items="${list}" var="u">
														<tr>
															<td><%=(++i) %></td>
															<td><c:out value="${u.getCasteCategoryName()}"></c:out></td>
															<td><c:out value="${u.getReligionName()}"></c:out></td>
															<td><c:out value="${u.getCasteName()}"></c:out></td>

		                                                    <td >
		                                                    	<a class="edit" data-toggle="tooltip" data-placement="top" title="Edit" href="#">
		                                            				<i class="fa fa-pencil text-warning"></i>
		                                            			</a>&nbsp; &nbsp; &nbsp;
		                                            			<a class="delete hidden-xs hidden-sm" data-toggle="tooltip" data-placement="top" title="Delete" href="/SMGMT/Caste?caste_id=${u.getCaste_id()}">
		                                            				<i class="fa fa-trash text-danger"></i>
		                                            			</a>
		                                                    </td>
														</tr>
													</c:forEach>
                                                
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                         
                        </div>                        
                        
                        
                        
                    </div> <!-- /.inner -->
                </div> <!-- /.outer -->
            
         
               
             
            </div>
            
            
            </div> <!-- /#content -->
        </div>
        
       <!--wrapper-->
       
        
        
</div>
<!-- /#wrap -->

	<script type="text/javascript" src="/SMGMT/config/js/components.js"></script>
<script type="text/javascript" src="/SMGMT/config/js/custom.js"></script>

<!-- end of global scripts-->
<!-- plugin level scripts -->
	<script type="text/javascript" src="/SMGMT/config/vendors/jquery-validation-engine/js/jquery.validationEngine.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/jquery-validation-engine/js/jquery.validationEngine-en.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/jquery-validation/js/jquery.validate.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/datepicker/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/datetimepicker/js/DateTimePicker.min.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/moment/js/moment.min.js"></script>
	<script type="text/javascript" src="/SMGMT/config/js/form.js"></script>
    <script type="text/javascript" src="/SMGMT/config/js/pages/form_validation.js"></script>
	<!-- <script type="text/javascript" src="js/components.js.pagespeed.jm.vxV3GQYFro.js"></script>
	<script type="text/javascript" src="js/custom.js.pagespeed.jm.CN8Ow3CJOG.js"></script> -->
	
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
	<script type="text/javascript" src="/SMGMT/config/cdnjs.cloudflare.com/ajax/libs/jquery.quicksearch/2.3.1/jquery.quicksearch.min.js"></script>
	<!--end of plugin scripts-->
	<script type="text/javascript" src="/SMGMT/config/js/form.js"></script>
	<script type="text/javascript" src="/SMGMT/config/js/pages/form_elements.js"></script>
	<script src="/SMGMT/config/vendors/bootstrap-switch,_js,_bootstrap-switch.min.js+switchery,_js,_switchery.min.js.pagespeed.jc.Z7BLPQIxUe.js""></script>
	<script>eval(mod_pagespeed_6q1EIQWfni);</script>
	<script>eval(mod_pagespeed_d3eUViXN4C);</script>

	<script type="text/javascript" src="/SMGMT/config/js/pages/radio_checkbox.js.pagespeed.jm.nna8wpyJlw.js"></script>

</body>

</html>