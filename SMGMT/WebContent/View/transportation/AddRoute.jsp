<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="com.servletStore.transportation.route.model.RouteImpl"%>
<%@page import="com.servletStore.transportation.route.model.RouteDAO"%>
<%@page import="com.servletStore.transportation.route.model.RoutePOJO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta charset="UTF-8">
    <title>Driver Information| Admire</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="/SMGMT/config/img/xlogo1.ico.pagespeed.ic.ONh6qx31g4.html"/>
    <!-- global styles-->
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_jquery-validation-engine,_css,_validationEngine.jquery.css+vendors,_datepicker,_css,_bootstrap-datepicker.min.css+vendors,_datepicker,_css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_select2,_css,_select2.min.css+css,_pages,_dataTables.bootstrap.css+css,_pages,_tables.css.pagespeed.cc._6lRWz19bZ.css"/>

    <!-- end of global styles-->
   
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
                                    Add Route
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
                                    <li class="active breadcrumb-item">Add Route</li>
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
                                        Route Details
                                    </div>
                                    <div class="card-block m-t-35">
                                      
   
                                    <%
                                    
                                    String id="",route_code="",route_name="",btn_val="Add Route";
                                    RoutePOJO rp=null;
                                    RouteDAO rd=new RouteImpl();                                    
                                    List<RoutePOJO> route_list=rd.getRouteDetails();
                                    //List<DriverPOJO> dri_list=d.getDriverDetails();
                                    int ap1=0;
                                    if(route_list.size()>=1)
                                    {                                    	
                                       	route_code=String.valueOf(route_list.get(route_list.size()-1).getId()+1);
                                       	id=route_code;
                                    }
                                    else
                                    {
                                    	id="1";
                                    	route_code="1";
                                    }
                                    //ArrayList<String> al2=new ArrayList();
                                   
                                    %>





 										<form action="/SMGMT/Route?id=<%=id %>" class="form-horizontal  login_validator" method="post" id="form_block_validator">
                                        
                                      
                                            
                                                                   
                                            <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                    <label for="required2" class="col-form-label">Route Code*</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input type="text" id="required_code" name="route_code" value="<%=route_code%>" class="form-control focused_input" placeholder="route code"  autofocus required readonly>
                                                </div>
                                            </div>
                                           
                                           <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                    <label for="required2" class="col-form-label">Route name *</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input type="text" id="required2" name="route_name" value="<%=route_name%>" class="form-control focused_input" placeholder="route Name" required onkeyup="this.value=this.value.toUpperCase();checkRouteName(this.value);">                                                     
                                                </div>
                                                <div class="col-lg-4">
                                                     <strong id="warning"></strong>
                                                </div>
                                                 
                                            </div>
                                            
                                            
                                           
                                           
                                            <div class="form-actions form-group row">
                                                <div class="col-lg-4 push-lg-4">
                                                    <input type="submit" value="<%=btn_val %>" class="btn btn-primary" name="add_route_btn" id="route_btn_id">
                                                </div>
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
                                                <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">ID</th>
                                                <th class="sorting_asc wid-20" tabindex="0" rowspan="1" colspan="1">Route Code</th>
                                                <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">Route Name</th>
                                                
                                               <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">Action</th>
                                                
                                            </tr>
                                            </thead>
                                             <%
													RouteDAO routeDAO=new RouteImpl();
													//request.setAttribute("display_vehicle_details", vehicleDAO.getVehicleDetails());
                                                    List<RoutePOJO> ap=routeDAO.getRouteDetails();
										 			int i=0;
										 			//out.print("AP : "+ap.size());
										 			
											%>
                                            <tbody>
                                            <%
                                            	while(i<ap.size())
                                            	{
                                            %>
                                            	<tr role="row" class="even">
		                                      		<td class="sorting_1"><%=ap.get(i).getId()%></td>
                                            		<td><%=ap.get(i).getRoute_code()%></td>
                                            		<td><%=ap.get(i).getRoute_name() %></td>
                                            		
                                            		<td>
                                            		<a data-toggle="modal" data-placement="top" title="View Route" href="#view" onclick="searchRoute(<%=ap.get(i).getId()%>,'view_Updateid','view_route_required3','view_route_required2')">
                                            			<i class="fa fa-eye text-success"></i>
                                            			</a>&nbsp; &nbsp;                                            		
                                            		<a class="edit" data-toggle="modal" data-target="#Update" data-placement="top" title="Edit" href="#Update" onclick="searchRoute(<%=ap.get(i).getId()%>,'Updateid','route_required3','route_required2')"><i class="fa fa-pencil text-warning"></i></a>
                                            		&nbsp; &nbsp;<a class="delete hidden-xs hidden-sm" data-toggle="tooltip" data-placement="top" title="Delete"  href=" /SMGMT/RouteADD?del_id=<%=ap.get(i).getId() %>"  onclick="return confirm('Are you sure you want to delete this item?');"><i class="fa fa-trash text-danger"></i></a></td>
                                            		
                                            		<%
                                            			i++;
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
                <!-- Modal -->
                <div class="modal fade" id="search_modal" tabindex="-1" role="dialog" aria-hidden="true">
                    
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
                </div>
            </div>
            
            
            </div> <!-- /#content -->
        </div>
        
        
        
        
         <div class="modal fade pullDown" id="Update" role="dialog" aria-labelledby="modalLabelnews">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header bg-warning">
                                <h4 class="modal-title text-white" id="modalLabelnews">Update Route Details</h4>
                            </div>
                            <div class="modal-body">
                              <form action="/SMGMT/RouteADD" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                                             <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                    <label for="required2" class="col-form-label">Route Code*</label>
                                               <input type="hidden" id="Updateid" name="UpdateId">
                                                </div>
                                                <div class="col-lg-4">
                                                    <input type="text" id="route_required3" name="route_code1" value="<%=route_code%>" class="form-control focused_input" placeholder="route code"  autofocus required>
                                               
                                                </div>
                                            </div>
                                           
                                           <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                    <label for="required2" class="col-form-label">Route name *</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input type="text" id="route_required2" name="route_name1" value="<%=route_name%>" class="form-control focused_input" placeholder="route Name" required onkeyup="this.value=this.value.toUpperCase()">
                                                </div>
                                            </div>
                                            
                                            
                          				  <div class="modal-footer">
                         					   <button class="btn  btn-success" type="submit" name="updateRoute">Submit</button>
                         				       <button class="btn  btn-warning" data-dismiss="modal">Close</button>
				                           </div>
				                           
				                             </form>      
                                      
                          			  		</div>
				                        </div>
				                    </div>
				                </div>
                
                <!-- modal end -->
                   
                   
                <!-- View Modal -->   
                   
               <div class="modal fade pullDown" id="view" role="dialog" aria-labelledby="modalLabelnews">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header bg-warning">
                                <h4 class="modal-title text-white" id="modalLabelnews">Update Route Details</h4>
                            </div>
                            <div class="modal-body">
                              <form action="/SMGMT/RouteADD" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                                             <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                    <label for="required2" class="col-form-label">Route Code*</label>
                                               <input type="hidden" id="view_Updateid" name="UpdateId">
                                                </div>
                                                <div class="col-lg-4">
                                                    <input type="text" id="view_route_required3" name="route_code1" value="<%=route_code%>" class="form-control focused_input" placeholder="route code"  autofocus required readonly>
                                               
                                                </div>
                                            </div>
                                           
                                           <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                    <label for="required2" class="col-form-label">Route name *</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input type="text" id="view_route_required2" name="route_name1" value="<%=route_name%>" class="form-control focused_input" placeholder="route Name" required readonly>
                                                </div>
                                            </div>
                                            
                                            
                          				  <div class="modal-footer">                         					   
                         				       <button class="btn  btn-warning" data-dismiss="modal">Ok</button>
				                           </div>
				                           
				                             </form>      
                                      
                          			  		</div>
				                        </div>
				                    </div>
				                </div>
                
                <!-- modal end -->
                        
            
        
        
        
        
        
        
        
        
        
        
        
        
        
        
       <!--wrapper-->
       
        
        
<!-- /#wrap -->
<script type="text/javascript" src="/SMGMT/config/js/jquery.min.js"></script>
<script type="text/javascript">
	
	function checkRouteName(ap)
	{
		//alert("called : "+ap)
		var xhttp;
		xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				
				//alert(this.responseText);
				if(this.responseText&&document.getElementById("required2").value.length>=1)
					{
						//alert("Exists");
						//document.getElementById("msg").value="Exists";
						$("#warning").text("Exists");			
						document.getElementById("route_btn_id").disabled=true;
						document.getElementById("required2").style.borderColor = "red";
					}
				else
					{
						$("#warning").text("");
						document.getElementById("route_btn_id").disabled=false;
						document.getElementById("required2").style.borderColor = "skyblue";
					}
				
				 
				}
			};
		xhttp.open("POST","/SMGMT/RouteADD?route_name="+ap, true);
		xhttp.send();
	}
	
	function searchRoute(id,Updateid,route_required3,route_required2) {
		//document.write("AP");
		//alert(id);
		var xhttp;
		xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				
				var demoStr = this.responseText.split(",");				
				document.getElementById(Updateid).value = demoStr[0];
				document.getElementById(route_required3).value = demoStr[1];
				document.getElementById(route_required2).value = demoStr[2];
				
				 
				}
			};
		xhttp.open("POST","/SMGMT/RouteADD?id="+id, true);
		xhttp.send();
	}

	

</script>

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