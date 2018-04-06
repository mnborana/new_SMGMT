<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.servletStore.transportation.vehicle.model.VehiclePOJO"%>
<%@page import="com.servletStore.transportation.vehicle.model.VehicleImpl"%>
<%@page import="com.servletStore.transportation.vehicle.model.VehicleDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.servletStore.transportation.conductor.model.ConductorImpl"%>
<%@page import="com.servletStore.transportation.conductor.model.ConductorDAO"%>
<%@page import="com.servletStore.transportation.conductor.model.ConductorPOJO"%>
<%@page import="java.util.List"%>
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
                                    Add Conductor
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
                                    <li class="active breadcrumb-item">Add Conductor</li>
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
                                        Conductor Details
                                    </div>
                                    <div class="card-block m-t-35">
                                     <%
                                     
                                     			boolean insert=true;
                                    			//String id=null,veh_no="",name="",temp="",perm="",dob="",phone="",btn_val="Add Conductor";
                                    			ConductorPOJO vp=null;
                                    			 VehicleDAO vd=new VehicleImpl();
                                    			 ConductorDAO cd=new ConductorImpl();
                                                 List<VehiclePOJO> veh_list=vd.getVehicleDetails();
                                                 List<ConductorPOJO> cond_list=cd.getConductorDetails();
                                                 System.out.println("APAPAPAP");
                                                 int ap1=0;
                                                 //ArrayList<String> al1=new ArrayList();
                                                 //ArrayList<String> al2=new ArrayList();
                                                 
                                               	ArrayList<Integer> al1_id=new ArrayList();
    				                        	ArrayList<Integer> al2_id=new ArrayList();
		                                    	HashMap<Integer,String> hm=new HashMap(); 
                                               	while(ap1<veh_list.size())
                                                 {
                                                 	VehiclePOJO vp1=veh_list.get(ap1);
                                               		System.out.println("A: "+vp1.getId()+" P:"+vp1.getVeh_no());
                                                 	hm.put(vp1.getId(), vp1.getVeh_no());
                                                 	al1_id.add(vp1.getId());
                                                 	ap1++;
                                                 }                                    
                                                 ap1=0;
                                                 while(ap1<cond_list.size())
                                                 {
                                                 	ConductorPOJO p=cond_list.get(ap1);
                                                 	al2_id.add(p.getVeh_id());
                                                 	ap1++;
                                                 }
                                                 boolean flag=true;
                                                 ArrayList<String> al3=new ArrayList();
                                                 ArrayList<Integer> al3_id=new ArrayList();
                                                 for(int i=0;i<al1_id.size();i++)
                                                 {     
                                                 	flag=true;
                                                 	for(int j=0;j<al2_id.size();j++)
                                                 	{
                                                 		if(al1_id.get(i).equals(al2_id.get(j)))
                                                 		{                                    			
                                                 			flag=false;
                                                 			break;
                                                 		}                                    			
                                                 	}
                                                 	if(flag)
                                                 	{
                                                 	
             	                                    	al3_id.add(al1_id.get(i));
                                                 	}
                                                 } 
                                                 for(int j=0;j<al3_id.size();j++)
                                             	{
                                             		al3.add(hm.get(al3_id.get(j)));
                                             		System.out.println("Id : "+al3_id.get(j)+" Name : "+al3.get(j));
                                             	}
						                %>
                                        <form action="/SMGMT/Conductor" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                                        
                                        <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                  <label for="required2" class="col-form-label">Vehicle No.*</label>
                                                </div>
                                                <div class="col-lg-4">
                                                	<select class="form-control chzn-select" tabindex="2" id="required2" name="vehicle_no" >
                                                	    <option disabled selected>Choose a Vehicle</option>
                                                	    <%
                                                	    	for(int i=0;i<al3_id.size();i++)
                                                			{
                                                	    %>
	                                                	    	<option value="<%=al3_id.get(i)%>"><%=al3.get(i)%></option>
                                                	    <%
                                                	    	}
                                                	    %>
                                                	</select>
                                          	 		</div>
                                          	 		   <span id="vehicle_msg" style="color: red;display: none">this field is required</span>
                                            </div>
                                            
                                            
                                        
                                            <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                    <label for="required2" class="col-form-label">Name*</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input type="text" id="required2" name="driver_name"  value=" " class="form-control" onkeyup="this.value=this.value.toUpperCase();" onkeypress="return IsCharacter(event,'error');" ondrop="return false;" onpaste="return false;" onkeyup="this.value=this.value.toUpperCase();" required>
                                                </div>
                                              <span id="error" style="color: red;display: none">Only Characters allowed</span>
                                                
                                            </div>
                                         
                                         
                                             <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label for="email2" class="col-form-label">Present Address </label>
                                                </div>
                                                <div class="col-lg-4">
                                                     <textarea id="autosize1" class="form-control" cols="15" rows="3" name="temp_addrs" onkeyup="this.value=this.value.toUpperCase();" onkeydown="show_checkbox('autosize1')" onfocus="uncheck('check_disable')"></textarea>
                                                    
                                                </div>
                                              
                                            </div>
                                            
                                            
                                            <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label for="email2" class="col-form-label">Permanent Address </label>
                                                </div>
                                                <div class="col-lg-4">
                                                     <textarea id="autosize2" class="form-control" cols="15" rows="3" name="perm_addrs" onkeyup="this.value=this.value.toUpperCase();"  onfocus="hide_checkbox(this)"></textarea>
                                                    
                                                </div>
                                                <div class="col-lg-4" id="hide_check">
                                                    <label class="custom-control custom-checkbox">
                                                        <input type="checkbox" id="check_disable" class="custom-control-input" onclick="copy('autosize1','autosize2')">
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description"><strong>Same As Above</strong></span>
                                                    </label>
                                                    </div>
                                              
                                            </div>
                                            
                                            
                                           
                                            <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label class="col-form-label">Date of Birth *</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input type="text" class="form-control form_val_popup_dp3" value="" name="dob" placeholder="YYYY-MM-DD"/ required>
                                                </div>
                                            </div>
                                           
                                           
                                           <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                    <label for="digits" class="col-form-label">Mobile No *</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input type="text" id="digits" name="digit1" value=" " maxlength="10" class="form-control" onkeypress="return IsNumeric(event,'err');" ondrop="return false;" onpaste="return false;" required>
                                                </div>
                                              <span id="err" style="color: red;display: none">Only digits allowed</span>
                                                
                                            </div>
                                            
                                            <div class="form-actions form-group row">
                                                <div class="col-lg-4 push-lg-4">
                                                    <input type="submit" value="Add Conductor" name="add_conductor_btn" class="btn btn-primary" onclick="validateVehicle()">
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
            
            	VIEW Conductor MODAL
            
             -->
            
           
           <div class="modal fade pullDown" id="view" role="dialog" aria-labelledby="modalLabelnews">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header bg-warning">
                                <h4 class="modal-title text-white" id="modalLabelnews">Update Vehicle Details</h4>
                            </div>
                            <div class="modal-body">
                              <form action="/SMGMT/Conductor" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                                             
                                            <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                  <label for="required2" class="col-form-label">Vehicle No.*</label>
                                                </div>                                               
                                                
                                            <div class="col-lg-4">
                                            <input type="hidden" id="view_Updateid" name="UpdateId">
                                                <select class="form-control" id="view_mod_required22" name="mod_vehicle_no" required readonly></select>                                                	                                                	    
                                            </div>
                                            </div>
                                            <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                    <label for="required2" class="col-form-label">Name*</label>
                                                </div>
                                                <div class="col-lg-4"> 
                                                                                               
                                                    <input type="text" id="view_mod_required2" name="mod_driver_name"  value="" class="form-control" required readonly >
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label for="email2" class="col-form-label">Present Address </label>
                                                </div>
                                                <div class="col-lg-4">
                                                     <textarea id="view_mod_autosize1" class="form-control" cols="15" rows="3" name="mod_temp_addrs" onkeydown="show_checkbox('mod_autosize1')" onfocus="uncheck('mod_check_disable')" readonly></textarea>
                                                    
                                                </div>
                                              
                                            </div>
                                            
                                            
                                            <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label for="email2" class="col-form-label">Permanent Address </label>
                                                </div>
                                                <div class="col-lg-4">
                                                     <textarea id="view_mod_autosize2" class="form-control" cols="15" rows="3" name="mod_perm_addrs" onfocus="hide_checkbox(this)" readonly></textarea>
                                                    
                                                </div>
                                                
                                             </div>
                                            
                                            <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label class="col-form-label">Date of Birth *</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input type="text" class="form-control form_val_popup_dp3" id="view_mod_date" name="mod_dob" value="" placeholder="YYYY-MM-DD"/ required readonly>
                                                </div>
                                            </div>
                                           
                                           <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                    <label for="required2" class="col-form-label">Phone No*</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input type="text" id="view_mod_phone" name="mod_digits_only" value="" class="form-control" required readonly>
                                                </div>
                                            </div>
                                            
                          				  <div class="modal-footer">
                         					 <button class="btn  btn-warning" data-dismiss="modal" onclick="setFlag()">OK</button>
				                           </div>
				                           
				                             </form>      
                                      
                          			  		</div>
				                        </div>
				                    </div>
				                </div>
                
                <!-- modal end -->
                    
            
            
            
            
            
            
             <!-- 
            
            	UPDATE Conductor MODAL
            
             -->
            
           
           <div class="modal fade pullDown" id="update" role="dialog" aria-labelledby="modalLabelnews">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header bg-warning">
                                <h4 class="modal-title text-white" id="modalLabelnews">Update Vehicle Details</h4>
                            </div>
                            <div class="modal-body">
                              <form action="/SMGMT/Conductor" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                                             
                                            <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                  <label for="required2" class="col-form-label">Vehicle No.*</label>
                                                </div>                                               
                                                
                                            <div class="col-lg-4">
                                            <input type="hidden" id="Updateid" name="UpdateId">
                                                <select class="form-control" id="mod_required22" name="mod_vehicle_no" required>
                                                      	<%
                                                	    	for(int j=0;j<al3_id.size();j++)
                                                			{
                                                	    %>
	                                                	    	<option value="<%=al3_id.get(j)%>"><%=al3.get(j)%></option>
                                                	    <%
                                                	    	}
                                                	    %>
                                                </select>
                                            </div>
                                               
                                            
                                            </div>
                                            
                                       
                                        
                                            <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                    <label for="required2" class="col-form-label">Name*</label>
                                                </div>
                                                <div class="col-lg-4"> 
                                                                                               
                                                    <input type="text" id="mod_required2" name="mod_driver_name"  value="" class="form-control" required >
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label for="email2" class="col-form-label">Present Address </label>
                                                </div>
                                                <div class="col-lg-4">
                                                     <textarea id="mod_autosize1" class="form-control" cols="15" rows="3" name="mod_temp_addrs" onkeydown="show_checkbox('mod_autosize1')" onfocus="uncheck('mod_check_disable')"></textarea>
                                                    
                                                </div>
                                              
                                            </div>
                                            
                                            
                                            <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label for="email2" class="col-form-label">Permanent Address </label>
                                                </div>
                                                <div class="col-lg-4">
                                                     <textarea id="mod_autosize2" class="form-control" cols="15" rows="3" name="mod_perm_addrs" onfocus="hide_checkbox(this)"></textarea>
                                                    
                                                </div>
                                                
                                                <div class="col-lg-4" id="mod_hide_check">
                                                    <label class="custom-control custom-checkbox">
                                                        <input type="checkbox" id="mod_check_disable" class="custom-control-input" onclick="copy('mod_autosize1','mod_autosize2')">
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description"><strong>Same As Above</strong></span>
                                                    </label>
                                                    </div>
                                              
                                              
                                            </div>
                                            
                                            
                                            <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label class="col-form-label">Date of Birth *</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input type="text" class="form-control form_val_popup_dp3" id="mod_date" name="mod_dob" value="" placeholder="YYYY-MM-DD"/ required>
                                                </div>
                                            </div>
                                           
                                           <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                    <label for="required2" class="col-form-label">Phone No*</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input type="text" id="mod_phone" name="mod_digits_only" value="" class="form-control" required >
                                                </div>
                                            </div>
                                            
                          				  <div class="modal-footer">
                         					   <button class="btn  btn-success" type="submit" name="updateConductor">Submit</button>
                         				       <button class="btn  btn-warning" data-dismiss="modal" onclick="setFlag()">Close</button>
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
	                                            <th class="sorting_asc wid-2" tabindex="0" rowspan="1" colspan="1">Sr. No</th>
                                                <th class="sorting_asc wid-10" tabindex="0" rowspan="1" colspan="1">Vehicle No.</th>
                                                <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">Name</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Temp. Address</th>                                                                                                
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Phone No.</th>
                                                <th class="sorting wid-15" tabindex="0" rowspan="1" colspan="1">Status</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Actions</th>
                                            </tr>
                                            </thead>
                                             <%
													ConductorDAO conductorDAO=new ConductorImpl();
													//request.setAttribute("display_vehicle_details", vehicleDAO.getVehicleDetails());
                                                    List<ConductorPOJO> ap=conductorDAO.getConductorDetails();
										 			int i=0;
										 			System.out.print(">>>>>>>>>>>>AP : "+ap.size());
										 	%>
                                            <tbody>
                                            <%
                                            	while(i<ap.size())
                                            	{
                                            %>
                                            	<tr role="row" class="even">
	                                            	<td class="sorting_1"><%=i+1%></td>
                                            		<td><%=ap.get(i).getVeh_no() %></td>
                                            		<td><%=ap.get(i).getName() %></td>
                                            		<td><%=ap.get(i).getTemp_addrs() %></td>
                                            		<td class="center"><%=ap.get(i).getPhone_no() %></td>
                                            		<td class="center">Approved</td>
                                            		<td><a data-placement="top" data-toggle="modal" title="View" href="#view" onclick="searchConductor(<%=ap.get(i).getId()%>,'view_Updateid','view_mod_required22','view_mod_required2','view_mod_autosize1','view_mod_autosize2','view_mod_date','view_mod_phone')">
                                            		<i class="fa fa-eye text-success"></i></a>&nbsp; &nbsp;
                                            		<a class="edit" data-placement="top" data-toggle="modal" title="Edit" href="#update" onclick="searchConductor(<%=ap.get(i).getId()%>,'Updateid','mod_required22','mod_required2','mod_autosize1','mod_autosize2','mod_date','mod_phone')">
                                            		<i class="fa fa-pencil text-warning"></i></a>&nbsp; &nbsp;
                                            		<a class="delete hidden-xs hidden-sm"  data-placement="top" title="Delete" href="/SMGMT/Conductor?del_id=<%= ap.get(i).getId()%>">
                                            		<i class="fa fa-trash text-danger"></i></a></td>
                                            		
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

 <script type="text/javascript" src="/SMGMT/config/js/jquery.min.js"></script>
      
	<script>   
	/* $(document).ready(function(){  
	        $("#hide_check").hide();  
	    });  */
	    
	    var specialKeys = new Array();
	    specialKeys.push(8); //Backspace
	    function IsNumeric(e,msg) {
	        var keyCode = e.which ? e.which : e.keyCode
	        var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1);
	        document.getElementById(msg).style.display = ret ? "none" : "inline";
	        return ret;
	    }


	    function IsCharacter(e,msg)
	    { 
	    	 var keyCode = e.which ? e.which : e.keyCode
	    			    var ret = ((keyCode > 64 && keyCode < 91) ||(keyCode > 96 && keyCode < 123)||(keyCode==8)|| specialKeys.indexOf(keyCode) != -1);
	    			    document.getElementById(msg).style.display = ret ? "none" : "inline";
	    			   // alert(ret)
	    			    return ret;
	    }
	function show_checkbox(ap)
	{  		
		var a=document.getElementById(ap).value.trim();
		//alert(a);
		if(a!="")
		{
			//p.value=a;
			$("#hide_check").show(); 
		}
	}  
	function uncheck(ap)
	{
		document.getElementById(ap).checked=false;
	}
	function copy(ap1,ap2)
	{
		document.getElementById(ap2).value="";
		document.getElementById(ap2).value=document.getElementById(ap1).value;
		//document.getElementById("check_disable").disabled=true;
		
	}
	var flag=true;
	var x,option;
	
	function searchConductor(id,Updateid,mod_required22,mod_required2,mod_autosize1,mod_autosize2,mod_date,mod_phone) {
		//document.write("AP");
		
		var xhttp;
		xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {				
				var demoStr = this.responseText.split("`");	
				document.getElementById(Updateid).value = demoStr[0];	
								
				//document.getElementById("mod_required22").value = demoStr[1];
				document.getElementById(mod_required2).value = demoStr[2];
				document.getElementById(mod_autosize1).value = demoStr[3];
				document.getElementById(mod_autosize2).value = demoStr[4];				
				document.getElementById(mod_date).value = demoStr[5];
				document.getElementById(mod_phone).value = demoStr[6];	
				
				x = document.getElementById(mod_required22);
				option = document.createElement("option");
				option.text = demoStr[1];
				option.value =demoStr[7];
				if(flag)
				{	
					x.add(option,0);
					x.selectedIndex="0";					
					flag=false;	
				}
			}
		}
			
		xhttp.open("POST","/SMGMT/Conductor?id="+id, true);
		xhttp.send();
	}
	function setFlag()
	{
		x.remove(0);		
		flag=true;
	}
	
	function validateVehicle()
	{
		//vehicle_msg
		//alert("APAPAOUT")
		if(document.getElementById("required2").selectedIndex==0)
		{
			//alert("APAPA")
			document.getElementById("vehicle_msg").style.display="block";
			//return false;
		}	
		
	}
	</script>

	<script type="text/javascript" src="/SMGMT/config/js/components.js"></script>
<script type="text/javascript" src="/SMGMT/config/js/custom.js"></script>
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

<script type="text/javascript" src="/SMGMT/config/js/form.js"></script>
<script type="text/javascript" src="/SMGMT/config/js/pages/form_elements.js"></script>


</body>
</html>
</body>
</html>