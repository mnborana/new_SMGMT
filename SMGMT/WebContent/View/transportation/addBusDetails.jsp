<%@ page import="com.servletStore.transportation.assignroute.model.*" %>
<%@page import="com.servletStore.transportation.vehicle.model.VehicleDAO"%>
<%@page import="com.servletStore.transportation.assignroute.model.AssignRouteDAO"%>
<%@page import="com.servletStore.transportation.assignroute.model.AssignRoutePOJO"%>
<%@page import="com.servletStore.transportation.vehicle.model.VehiclePOJO"%>
<%@page import="com.servletStore.transportation.assignroute.model.AssignRouteImpl"%>
<%@page import="com.servletStore.transportation.vehicle.model.VehicleImpl"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
  top: 0;/*
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
                                    Details
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
                                    <li class="active breadcrumb-item">details</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </header>
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
                                        <form class="form-horizontal  login_validator" id="myForm">
                                            <div class="form-group row">
                                            <div class="col-lg-4  text-lg-right">
                                                    <label for="required2" class="col-form-label">Search Field*</label>
                                                     <input type="hidden" id="Updateid" name="UpdateId">
                                                </div>
                                                <div class="col-lg-4">
                                                    <input type="text"  name="search1" id="myInput" value="MH-22-43-22" class="form-control" required >
                                                </div>
                                                <div class="col-lg-4 text-lg-right">
                                                
                                                <div class="left_align custom-controls-stacked">
                                                 <div class="col-lg-4 text-lg-right">
                                                   
                                                </div>
                                               
                                               
                                                    <label class="custom-control custom-radio">
                                                        <input name="radio3" type="radio" id="r1" value=1 class="custom-control-input" onclick="searchByVehicle();"  checked>
                                                        
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description">By Vehicle Number</span>
                                                    </label>
                                                    <label class="custom-control custom-radio">
                                                        <input name="radio3" type="radio" id="r2" value=2 class="custom-control-input" onclick="searchByDest();">
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description">By Destination</span>
                                                    </label>
                                                    
                                                   
                                                </div>
                                            </div>
                                        </div>
                                           
                                            <div class="form-actions form-group row">
                                                <div class="col-lg-4 push-lg-4">
                                                  <!--   <hidden input type="submit" value="Validate" class="btn btn-primary">
 -->                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div> <!-- /.col-lg-12 -->
                        </div> <!-- /.row -->
                    </div> <!-- /.inner -->
                </div> <!-- /.outer -->
            
            
            <div class="outer">
                    <div class="inner bg-container">
                        <div class="card">
                            <div class="card-header bg-white">
                                User Grid
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
                                                
                                            </tr>
                                            </thead>
                                            
                                           
                                           		 <tbody id="showtable">
                                            		
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
                <!-- Modal -->
                <div class="modal fade" id="search_modal" tabindex="-1" role="dialog" aria-hidden="true">
                    <form>
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span class="float-right" aria-hidden="true">&times;</span>
                                </button>
                                <div class="input-group search_bar_small">
                                    <input type="text" class="form-control" placeholder="Search..." name="search">
                                    <span class="input-group-btn">
							        <button class="btn btn-secondary" type="submit"><i class="fa fa-search"></i></button>
							      </span>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
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

<script type="text/javascript">
       function searchByVehicle(ee) {
   		//document.write("AP");
   		  var ch1=$('input[name=radio3]:checked', '#myForm').val(); 
   		var  vehicleNo=document.getElementById("myInput").value;
   	//	var ch = document.forms[0].elements["radio3"];
   		//var ch =$('input[name="radio3"]:checked').val();
   		var xhttp;   		
   		xhttp = new XMLHttpRequest();
   		xhttp.onreadystatechange = function() {
   			if (this.readyState == 4 && this.status == 200) {
   			
   				var demoStr = this.responseText.split("~");	
   				
   				//var cnt=1;
   				var i=0;
   				
   				var row="<table>";
   				row+="<tr><th>Route name</th><th>Destination</th><th>fee</th></tr>";
   				var tr="";
   				
   				for(;demoStr[i];)
   					{
   					if(demoStr[i].equals(demoStr[i+1]))
   						{
   						i++;
						row+="</td><td>"+demoStr[i]+"</td>";
   						}
   						
						i++;
						row+="</td><td>"+demoStr[i]+"</td>";
						i++;
						row+="</td><td>"+demoStr[i]+"</td></tr>";
						i++;
   						/* tr+="<tr><td rowspan="+(J+1)+">";
   								J++;
   								tr+=demo[j]+"</td>"
   							}else{
   								tr+="<tr><td rowspan="+(J+1)+">";
   								J++;
   								tr+=demo[j]+"</td>"
   							}
   							row+="<tr><td>"+demo[j];
   							j++
   							
   							row+="</td><tr><td>"+demo[j];
   	   						j++;
   	   						
   	   						row+="</td><tr><td>"+demo[j];
	   						j++;
   	   							
   							
   						}
   					/* if(j==j){
							
						} */
   					 
   					 
   					/*  j=demoStr[i];
   						i++; */
   						
   					//var routeName = demoStr.split("#");
   						//alert(routeName.length);
   						//var routeName=demoStr[i];
   						/* row+="<tr><td rowspan=''>"+demoStr[i];
   						i++;
   						
   						
   						row+="</td><tr><td>"+demoStr[i];
   						i++;
   						
   						row+="</td><td>"+demoStr[i]+"</td></tr>";
   						i++; */
   						
   						
   						
   						
   						//cnt++;

   					}
   				row+="</table>"
   				document.getElementById("showtable").innerHTML=row;
   				
   				 
   				}
   			};
   		xhttp.open("POST","/SMGMT/Search?vehicleNo="+vehicleNo+"&ch1="+ch1, true);
   		xhttp.send();
   	}


   	
       
       function searchByDest(ee) {
      		//document.write("AP");
      		var  dest=document.getElementById("myInput").value;
      		 var ch1=$('input[name=radio3]:checked', '#myForm').val(); 
      		var xhttp;   		
      		xhttp = new XMLHttpRequest();
      		xhttp.onreadystatechange = function() {
      			if (this.readyState == 4 && this.status == 200) {
      			
      				var demoStr = this.responseText.split(",");	
      				//var cnt=1;
      				var i=0;
      				var row="<table border=1>";
      				row+="<tr><th>Vehicle No</th><th>Route Name</th></tr>";
      				row+="<tr><td rowspan=30>"+demoStr[0];
      				for(;demoStr[i];)
      					{
      						i++;
      						row+="</td><td>"+demoStr[i]+"</td></tr>";
      						i++;
   						//cnt++;

      					}
      				row+="</table>"
      				document.getElementById("showtable").innerHTML=row;
      				
      				 
      				}
      			};
      		xhttp.open("POST","/SMGMT/Search?dest="+dest+"&ch1="+ch1, true);
      		xhttp.send();
      	}

       
       
       
       
       


   </script>
</body>

</html>