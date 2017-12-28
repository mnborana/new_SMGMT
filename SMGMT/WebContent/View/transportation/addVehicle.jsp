<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.servletStore.transportation.vehicle.model.VehicleImpl"%>
<%@page import="com.servletStore.transportation.vehicle.model.VehicleDAO"%>
<%@page import="com.servletStore.transportation.vehicle.model.VehiclePOJO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
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
                                    Add Vehicle
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
                                    <li class="active breadcrumb-item">Add Vehicle</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </header>
                
             <!-- start your code from here  -->  
              <%
              	String name="AP";
              %>
                <div class="outer">
                    <div class="inner bg-container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="card">
                                    <div class="card-header bg-white">
                                        <i class="fa fa-file-text-o"></i>
                                        Information about Vehicle
                                    </div>
                                    <div class="card-block m-t-35">
                                  
                                        <form action="/SMGMT/Vehicle" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                                        
                                         <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                  <label for="required2" class="col-form-label">Vehicle Type</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input type="text" id="required2" name="vehicle_type" type="text" value=" "  tabindex="1" class="form-control" autofocus>                                                   
                                                    
                                                </div>
                                            </div>
                                            
                                            
                                        
                                            <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                    <label class="col-form-label">Vehicle No. *</label>
                                                </div>
                                                <div class="col-lg-1" >
                                                <input class="form-control" id="first" type="text" value="" name="mh" maxlength="2" tabindex="2" width="3" placeholder="xx" onkeyup="{movetoNext(this, 'second');this.value=this.value.toUpperCase();}" required>
                                            </div>
                                            <div class="col-lg-1" >
                                                <input class="form-control focused_input" id="second" type="text" value="" name="tt" maxlength="2" tabindex="3" placeholder="xx" onkeyup="movetoNext(this, 'third')" required>
                                            </div>
                                            <div class="col-lg-1">
                                                <input class="form-control focused_input" type="text" id="third" value="" name="m" maxlength="2" tabindex="4" placeholder="xx" onkeyup="{movetoNext(this, 'fourth');this.value=this.value.toUpperCase();}" required>
                                            </div>
                                            <div class="col-lg-1">
                                                <input class="form-control focused_input" type="text" id="fourth" value="" name="fofe" maxlength="4" tabindex="5" placeholder="xxxx" required>
                                            </div>
                                            </div>
                                          
                                         
                                            
                                            <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label class="col-form-label">No. of Seats </label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input name="seats_no" value=" " type="text" class="form-control"  tabindex="6" placeholder="No. of seats"/>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label  class="col-form-label">Maximum Allowed </label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input name="max_allowed" value=" " type="text" class="form-control focused_input" tabindex="7" placeholder="Maximum Allowed Seats"/>
                                                </div>
                                            </div>                                                                                                                              
                                           
                                            <div class="form-actions form-group row">
                                                <div class="col-lg-4 push-lg-4">
                                                    <input type="submit" value="Add Vehicle" class="btn btn-primary" name="add_vehicle_btn">
                                                </div>
                                            </div>
                                        </form>
                                      
                                    </div>
                                </div>
                            </div> <!-- /.col-lg-12 -->
                        </div> <!-- /.row -->
                    </div> <!-- /.inner -->
                </div> <!-- /.outer -->
            
            
            <!-- 
            
            	UPDATE VEHICLE MODAL
            
             -->
            
           
           <div class="modal fade pullDown" id="update" role="dialog" aria-labelledby="modalLabelnews">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header bg-warning">
                                <h4 class="modal-title text-white" id="modalLabelnews">Update Vehicle Details</h4>
                            </div>
                            <div class="modal-body">
                              <form action="/SMGMT/Vehicle" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                                             <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                  <label for="required2" class="col-form-label">Vehicle Type</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input type="text" id="required59" name="vehicle_type" type="text" value=" "  class="form-control">                                                   
                                                    <input type="hidden" id="Updateid" name="UpdateId">
                                                </div>
                                            </div>
                                            
                                            
                                              <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                    <label class="col-form-label">Vehicle No. *</label>
                                                </div>
                                                <div class="col-lg-2">
                                                <input class="form-control" id="mod_first" type="text" value="" name="mh" maxlength="2" tabindex="11" width="3" required>
                                            </div>
                                            <div class="col-lg-2">
                                                <input class="form-control focused_input" id="mod_second" type="text" value="" name="tt" maxlength="2" tabindex="12" required>
                                            </div>
                                            <div class="col-lg-2">
                                                <input class="form-control focused_input" type="text" id="mod_third" value="" name="m" maxlength="2" tabindex="13"  required>
                                            </div>
                                            <div class="col-lg-2">
                                                <input class="form-control focused_input" type="text" id="mod_fourth" value="" name="fofe" maxlength="4" tabindex="14" required>
                                            </div>
                                            </div>
                                            
                                            
                                            
                                              <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label class="col-form-label">No. of Seats </label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input name="mod_seats_no" id="mod_seats_no" value=" " type="text" class="form-control" placeholder="No. of seats"/>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label  class="col-form-label">Maximum Allowed </label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input name="mod_max_allowed" id="mod_max_allowed" value=" " type="text" class="form-control focused_input" placeholder="Maximum Allowed Seats"/>
                                                </div>
                                            </div>                                                                                                                              
                                            
                                           
                          				  <div class="modal-footer">
                         					   <button class="btn  btn-success" type="submit" name="updateVehicle">Submit</button>
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
                                <h4 class="modal-title text-white" id="modalLabelnews">View Vehicle Details</h4>
                            </div>
                            <div class="modal-body">
                              <form action="/SMGMT/Vehicle" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                                             <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                  <label for="required2" class="col-form-label">Vehicle Type</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input type="text" id="view_required59" name="vehicle_type" type="text" value=" "  class="form-control" readonly>                                                   
                                                    <input type="hidden" id="view_Updateid" name="UpdateId">
                                                </div>
                                            </div>
                                            
                                            
                                              <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                    <label class="col-form-label">Vehicle No. *</label>
                                                </div>
                                                <div class="col-lg-1">
                                                <input class="class="w-25 p-3" style="background-color: #eee;"  id="view_mod_first" type="text" value="" size=2 name="mh" maxlength="2"  width="1" required readonly>
                                            </div>
                                            <div class="col-lg-1">
                                                <input class="class="w-25 p-3" style="background-color: #eee;" id="view_mod_second" type="text" size=2 value="" name="tt" maxlength="2" tabindex="12" required readonly>
                                            </div>
                                            <div class="col-lg-1">
                                                <input class="class="w-25 p-3" style="background-color: #eee;" type="text" id="view_mod_third" value=""  size=2 name="m" maxlength="2" tabindex="13"  required readonly>
                                            </div>
                                            <div class="col-lg-1">
                                                <input class="class="w-20 p-1" style="background-color: #eee;" type="text" id="view_mod_fourth" value="" name="fofe" maxlength="4" tabindex="14" required readonly>
                                            </div>
                                            </div>
                                            
                                            
                                            
                                              <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label class="col-form-label">No. of Seats </label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input name="mod_seats_no" id="view_mod_seats_no" value=" " type="text" class="form-control" placeholder="No. of seats" readonly />
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label  class="col-form-label">Maximum Allowed </label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input name="mod_max_allowed" id="view_mod_max_allowed" value=" " type="text" class="form-control focused_input" placeholder="Maximum Allowed Seats" readonly/>
                                                </div>
                                            </div>                                                                                                                              
                                            
                                           
                          				  <div class="modal-footer">                         					   
                         				       <button class="btn  btn-warning" data-dismiss="modal">OK</button>
				                           </div>
				                           
				                             </form>      
                                      
                          			  		</div>
				                        </div>
				                    </div>
				                </div>
                
                <!-- modal end -->
            
            
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
                                                <th class="sorting_asc wid-2" tabindex="0" rowspan="1" colspan="1">Id</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Vehicle No</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">No. of Seats</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Max. Allowed</th>
                                                <th class="sorting wid-20" tabindex="0" rowspan="1" colspan="1">Vehicle Type</th>                                                                                                
                                                <th class="sorting wid-15" tabindex="0" rowspan="1" colspan="1">Status</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Actions</th>
                                            </tr>
                                            </thead>
                                            <%
													VehicleDAO vehicleDAO=new VehicleImpl();
													//request.setAttribute("display_vehicle_details", vehicleDAO.getVehicleDetails());
                                                    List<VehiclePOJO> ap=vehicleDAO.getVehicleDetails();
										 			int i=0;
										 			
											%>
                                            <tbody>
                                            <%
                                            	while(i<ap.size())
                                            	{
                                            %>
                                            		<tr role="row" class="even">
                                            		<td class="sorting_1"><%=ap.get(i).getId() %></td>
                                            		<td><%=ap.get(i).getVeh_no() %></td>
                                            		<td><%=ap.get(i).getNo_seats() %></td>
                                            		<td><%=ap.get(i).getMax_seats() %></td>
                                            		<td class="center"><%=ap.get(i).getVeh_type() %></td>                                            		
                                            		<td class="center">Approved</td>
                                            		<td>
                                            			<a data-toggle="modal" data-placement="top" title="View User" href="#view" onclick="searchVehicle(<%=ap.get(i).getId()%>,'view_Updateid','view_mod_first','view_mod_second','view_mod_third','view_mod_fourth','view_mod_seats_no','view_mod_max_allowed','view_required59')">
                                            			<i class="fa fa-eye text-success"></i>
                                            			</a>&nbsp; &nbsp;
                                            			
                                            			<a class="edit" data-placement="top" data-toggle="modal" title="Edit" href="#update" onclick="searchVehicle(<%=ap.get(i).getId()%>,'Updateid','mod_first','mod_second','mod_third','mod_fourth','mod_seats_no','mod_max_allowed','required59')">
                                            			<i class="fa fa-pencil text-warning"></i>
                                            			</a>&nbsp; &nbsp;
                                            			<a class="delete hidden-xs hidden-sm" data-toggle="tooltip" data-placement="top" title="Delete" href="/SMGMT/Vehicle?del_id=<%= ap.get(i).getId()%>" onclick="return confirm('Are you sure you want to delete this Vehicle details?');">
                                            			<i class="fa fa-trash text-danger"></i>
                                            			</a>
                                            			</td>
                                            		</tr>
                                            		
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
       
        
<!-- /#wrap -->
<script type="text/javascript">
	
	function movetoNext(current, nextFieldID) {
		if (current.value.length >= current.maxLength) {
		document.getElementById(nextFieldID).focus();
		}
		}

	
	function searchVehicle(id,id_name,fir,sec,thi,fou,seat,max,type) {
		//document.write("AP");
		//alert("Name : "+sec);
		var xhttp;
		xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				
				var demoStr = this.responseText.split(",");				
				document.getElementById(id_name).value = demoStr[0];
				document.getElementById(fir).value = demoStr[1];
				//document.getElementById("view_mod_first").value = "AP";
				document.getElementById(sec).value = demoStr[2];
				document.getElementById(thi).value = demoStr[3];
				document.getElementById(fou).value = demoStr[4];				
				document.getElementById(seat).value = demoStr[5];
				document.getElementById(max).value = demoStr[6];
				document.getElementById(type).value = demoStr[7];				
				 
				}
			};
		xhttp.open("POST","/SMGMT/Vehicle?id="+id, true);
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

