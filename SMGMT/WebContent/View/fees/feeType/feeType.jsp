<%@page import="com.servletStore.fees.feeType.model.feeTypeImpl"%>
<%@page import="com.servletStore.fees.feeType.model.feeTypeDAO"%>
<%@page import="com.servletStore.settings.standard.model.StandardPOJO"%>
<%@page import="java.util.List"%>
<%@page import="com.servletStore.settings.school.model.SchoolPOJO"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.servletStore.settings.standard.model.StandardImpl"%>
<%@page import="com.servletStore.settings.standard.model.StandardDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>Form Elements | Admire</title>
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
    <!--End of plugin styles-->
    <!--Page level styles-->
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css/pages/form_elements.css"/>
    <link type="text/css" rel="stylesheet" href="#" id="skin_change"/>
    
    <!-- end of page level styles -->
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
        <img src="" style=" width: 40px;" alt="loading...">
    </div>
</div>
<div id="wrap">
    <div id="top">
        <!-- .navb	ar -->
        	<jsp:include page="/View/common/header.jsp"></jsp:include>
        <!-- /.navbar -->
        <!-- /.head -->
    </div>
    <!-- /#top -->
    <div class="wrapper">
       <jsp:include page="/View/common/left-navbar.jsp"></jsp:include>
        <!-- /#left -->
        <div id="content" class="bg-container">
            <header class="head">
                <div class="main-bar">
                   <div class="row no-gutters">
                       <div class="col-sm-5 col-lg-6 skin_txt">
                           <h4 class="nav_top_align">
                               <i class="fa fa-pencil"></i>
                               Form Elements
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
                                   <a href="#">Forms</a>
                               </li>
                               <li class="active breadcrumb-item">Form Elements</li>
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
                                        <i class="fa fa-file-text-o"></i>
                                        Basic Validation
                                    </div>
                                    <div class="card-block m-t-35">
                                        <form action="/SMGMT/FeeType" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                                            <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                    <label for="required2" class="col-form-label">Fees Type *</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input type="text" id="feeTypeId" name="feeType" class="form-control" onblur="this.value=$.trim(this.value)" required >
                                                </div>
                                           </div>
                                           <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label for="required2" class="col-form-label">Fees *</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input type="text" id="feeId" name="fee" class="form-control" onblur="this.value=$.trim(this.value)" required>
                                                </div>
                                            </div>
                                             <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label for="required2" class="col-form-label">Term *</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <label class="custom-control custom-checkbox">&nbsp;&nbsp;
                                                        <input type="checkbox" name="term1" value="1" class="custom-control-input" checked>
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description">I Term</span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox">
                                                        <input type="checkbox" name="term2" value="1" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description">II Term</span>
                                                    </label>
                                                </div>
                                            </div>
                                              <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label for="required2" class="col-form-label">Caste *</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <label class="custom-control custom-checkbox">&nbsp;&nbsp;
                                                        <input type="checkbox" name="caste" value="1" class="custom-control-input" checked>
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description"></span>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <!-- <div class="form-group row">
                                                <div class="col-lg-3 push-lg-2"> 
                                                    <label for="required2" class="col-form-label">Fees Type *</label>
                                                    <input type="text" id="feeTypeId" name="feeType" class="form-control" required>
                                                </div>
	                                             <div class="col-lg-3 push-lg-2">
	                                                    <label for="required2" class="col-form-label">Fees *</label>
	                                                	 <input type="text" id="feeId" name="fee" class="form-control" required>
	                                                </div>
	                                                </div> -->
	                                                <!-- <div class="form-group row">
	                                                 <div class="col-lg-4 push-lg-2">
	                                                    <label for="required2" class="col-form-label" name="term" >Term *</label>&nbsp;&nbsp;&nbsp;&nbsp;
	                                                	 <label class="custom-control custom-checkbox">&nbsp;&nbsp;
                                                        <input type="checkbox" name="term1" value="1" class="custom-control-input" checked>
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description">I Term</span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox">
                                                        <input type="checkbox" name="term2" value="1" class="custom-control-input">
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description">II Term</span>
                                                    </label>
	                                                </div>
	                                            </div> -->
                                             <div class="form-actions form-group row">
                                                <div class="col-lg-4 push-lg-4">
                                                    <input type="submit" value="OK" name="submitFee" class="btn btn-primary">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div> <!-- /.col-lg-12 -->
                        </div> <!-- /.row -->
                    </div> <!-- /.inner -->
                </div> <!-- /.outer -->
                
                
                <!-- Book Table -->  
            <div class="outer">
                    <div class="inner bg-container">
                        <div class="card">
                            <div class="card-header bg-white">
                               Fees List
                            </div>
                            <div class="card-block m-t-35" id="user_body">
                                <div class="table-toolbar">
                                    
                                    <div class="btn-group float-right users_grid_tools">
                                        <div class="tools"></div>
                                    </div>
                                </div>
                                <div>
                                    <div>
                                        <table class="table  table-striped table-bordered table-hover dataTable no-footer" id="editable_table" role="grid">
                                            <thead>
                                            <tr role="row">
                                               <th class="sorting_asc wid-20" tabindex="0" rowspan="1" colspan="1">Sr.No.</th>
                                                <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">Fee Type</th>
                                               <!--  <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">Fees</th> -->
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Term(I)</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Term(II)</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Caste</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Action</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                       		 	<%
	                                       		 	feeTypeDAO dao=new feeTypeImpl();
	                                       		 	request.setAttribute("display_fees", dao.getFeeType());
	                                       		 	int feeCount=0; 
                                       		 	%>
													<c:forEach items="${display_fees}" var="d">
													  <tr role="row" class="even">
														<td><%=(++feeCount) %></td>
														<td><c:out value="${d.feesType}"></c:out></td>
														
														<c:if test="${d.firstTerm!=0 }">
																<td><c:out value="${d.fees}"></c:out></td>
																<%-- <td><c:out value="-"></c:out></td> --%>
														</c:if>
														<c:if test="${d.firstTerm==0 }">
																<%-- <td><c:out value="${d.fees}"></c:out></td> --%>
																 <td><c:out value="-"></c:out></td> 
														</c:if>
														
														<c:if test="${d.secondTerm!=0 }">
															<%-- <td><c:out value="-"></c:out></td> --%>
															<td><c:out value="${d.fees}"></c:out></td>
														</c:if>
														<c:if test="${d.secondTerm==0 }">
														<td><c:out value="-"></c:out></td>
														</c:if>
														
														<td>
                                            			<a class="edit" data-placement="top" title="Edit" href="#update" data-toggle="modal"><i class="fa fa-pencil text-warning"></i></a>&nbsp; &nbsp;
                                            			<a class="delete hidden-xs hidden-sm" data-toggle="tooltip" data-placement="top" title="Delete" href="/SMGMT/FeeType?id=1"><i class="fa fa-trash text-danger"></i></a>
                                            			</td>
                                            		</tr>
												  </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- END EXAMPLE TABLE PORTLET-->
                            </div>
                       	 </div>
                       </div><!-- /.inner -->
                    </div><!-- /outer -->
         		</div>
        <!-- /#content -->
    </div>
    <!--wrapper-->
    
    <!-- /#content -->
  

</div>
<!-- /#wrap -->
<!-- global scripts-->

<script type="text/javascript">



</script>


<script type="text/javascript" src="/SMGMT/config/js/components.js"></script>
<script type="text/javascript" src="/SMGMT/config/js/custom.js"></script>

<!-- end of global scripts-->
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
<!-- <script type="text/javascript" src="../../cdnjs.cloudflare.com/ajax/libs/jquery.quicksearch/2.3.1/jquery.quicksearch.min.js"></script> -->
<!--end of plugin scripts-->
<script type="text/javascript" src="/SMGMT/config/js/form.js"></script>
<script type="text/javascript" src="/SMGMT/config/js/pages/form_elements.js"></script>



</body>



</html>