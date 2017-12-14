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
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_jquery-validation-engine,_css,_validationEngine.jquery.css+vendors,_datepicker,_css,_bootstrap-datepicker.min.css+vendors,_datepicker,_css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_select2,_css,_select2.min.css+css,_pages,_dataTables.bootstrap.css+css,_pages,_tables.css.pagespeed.cc._6lRWz19bZ.css"/>

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
                                    Category & Religion
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
                                    <li class="active breadcrumb-item">Add Category & Religion</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </header>
                
             <!-- start your code from here  -->  
              
                <div class="outer">
                    <div class="inner bg-container">
                        <div class="row">

                            <div class="col-lg-6">
                                <div class="card">
                                    <div class="card-header bg-white">
                                        <i class="fa fa-file-text-o"></i>
                                        Category
                                    </div>
                                    <div class="card-block m-t-35">
                                        <form action="/SMGMT/Caste" method="POST" class="form-horizontal  login_validator" id="form_block_validator">
                                            <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                    <label for="required2" class="col-form-label">Category Name <span style="color: red">*</span></label>
                                                </div>
                                                <div class="col-lg-6">
                                                    <input type="text" id="casteCategoryName" name="casteCategoryName" class="form-control" placeholder="Category Name" required>
                                                </div>
                                            </div>
                                           
                                            
                                           
                                            <div class="form-actions form-group row">
                                                <div class="col-lg-4 push-lg-4">
                                                    <button type="submit" name="category_btn" id="category_btn" value="category_btn" class="btn btn-primary">Add Category</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>                            
                            
                            
                            <div class="col-lg-6">
                                <div class="card">
                                    <div class="card-header bg-white">
                                        <i class="fa fa-file-text-o"></i>
                                        Religion
                                    </div>
                                    <div class="card-block m-t-35">
                                        <form action="/SMGMT/Caste" method="POST" class="form-horizontal  login_validator" id="form_block_validator1">
                                            <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                    <label for="required2" class="col-form-label">Religion Name <span style="color: red">*</span></label>
                                                </div>
                                                <div class="col-lg-6">
                                                    <input type="text" id="religionName" name="religionName" class="form-control" placeholder="Religion Name" required>
                                                </div>
                                            </div>
                                           
                                            
                                           
                                            <div class="form-actions form-group row">
                                                <div class="col-lg-4 push-lg-4">
                                                    <button type="submit" name="religion_btn" id="religion_btn" VALUE="religion_btn" class="btn btn-primary">Add Religion</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                        </div> <!-- /.row -->
                       
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card m-t-35">
                                    <div class="card-header bg-white">
                                         CATEGORY LIST
                                    </div>
                                    <div class="card-block">
                                        <div class="table-responsive m-t-35">
                                            <table class="table  table-striped">
                                                <thead>
                                                <tr>
                                                    <th>No.</th>
                                            		<th>Category</th>
                                            		<th>Action</th>
                                                </tr>
                                                </thead>
                                                <%
													CasteDAO casteDAO=new CasteImpl();
													request.setAttribute("display_CasteCategory", casteDAO.getCategoryDetails());
										 			int i=0;
												%>
                                                <tbody>
	                                                <c:forEach items="${display_CasteCategory}" var="d">
														<tr>
															                                                   <td><%=(++i) %></td>
		                                                    <td><c:out value="${d.casteCategoryName}"></c:out></td>
		                                                    <td >
		                                                    	<a class="edit" data-toggle="tooltip" data-placement="top" title="Edit" >
		                                            				<i class="fa fa-pencil text-warning"></i>
		                                            			</a>&nbsp; &nbsp; &nbsp;
		                                            			<a class="delete hidden-xs hidden-sm" data-toggle="tooltip" data-placement="top" title="Delete" href="/SMGMT/Caste?category_id=${d.getCategory_id()}">
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
                            <div class="col-lg-6">
                                <div class="card m-t-35">
                                    <div class="card-header bg-white">
                                    	 RELIGION LIST
                                    </div>
                                    <div class="card-block">
                                        <div class="table-responsive m-t-35">
                                            <table class="table table-striped">
                                                <thead>
                                                <tr>
                                                    <th>No.</th>
                                                    <th>Religion Name</th>
                                                    <th>Action</th>                                                
                                                 </tr>
                                                </thead>
                                                <%
													request.setAttribute("display_Religion", casteDAO.getReligionDetails());
												 	i=0;
												%>
                                                <tbody>
	                                                <c:forEach items="${display_Religion}" var="d">
														<tr>
															<td><%=(++i) %></td>
															<td><c:out value="${d.religionName}"></c:out></td>
															<td>
						                                    	<a class="edit" data-toggle="tooltip" data-placement="top" title="Edit" >
		                                            				<i class="fa fa-pencil text-warning"></i>
		                                            			</a>&nbsp; &nbsp; &nbsp;
		                                            			<a class="delete hidden-xs hidden-sm" data-toggle="tooltip" data-placement="top" title="Delete" href="/SMGMT/Caste?religion_id=${d.getReligion_id()}">
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

</body>

</html>