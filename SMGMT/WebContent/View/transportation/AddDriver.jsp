<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashSet"%>
<%@page import="com.servletStore.transportation.vehicle.model.VehicleDAO"%>
<%@page import="com.servletStore.transportation.vehicle.model.VehicleImpl"%>
<%@page import="com.servletStore.transportation.vehicle.model.VehiclePOJO"%>
<%@page import="com.servletStore.transportation.driver.model.DriverImpl"%>
<%@page import="com.servletStore.transportation.driver.model.DriverDAO"%>
<%@page import="com.servletStore.transportation.driver.model.DriverPOJO"%>
<%@page import="java.util.List"%>
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
                                    Add Driver
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
                                    <li class="active breadcrumb-item">Add Driver</li>
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
                                        Information about Driver
                                    </div>
                                    <div class="card-block m-t-35">
                                    
                                    <%                                    
                                    //String id="",vehicle_no="",name="",temp_add="",perm_add="",dob="",pno="",lno="",btn_val="Add Driver";
                                    //DriverPOJO dp=null;
                                    VehicleDAO vd=new VehicleImpl();
                                    DriverDAO d=new DriverImpl();
                                    List<VehiclePOJO> veh_list=vd.getVehicleDetails();
                                    List<DriverPOJO> dri_list=d.getDriverDetails();
                                    int ap1=0;
                                    //ArrayList<String> al1=new ArrayList();
                                    //ArrayList<String> al2=new ArrayList();
                                    ArrayList<Integer> al1_id=new ArrayList();
                                    ArrayList<Integer> al2_id=new ArrayList();
                                    HashMap<Integer,String> hm=new HashMap();                            
                                    while(ap1<veh_list.size())
                                    {
                                    	VehiclePOJO vp=veh_list.get(ap1);
                                    	//al1.add(vp.getId());
                                    	hm.put(vp.getId(), vp.getVeh_no());
                                    	al1_id.add(vp.getId());
                                    	ap1++;
                                    }                                    
                                    ap1=0;
                                    while(ap1<dri_list.size())
                                    {
                                    	DriverPOJO p=dri_list.get(ap1);
                                    	//al2.add(p.getVeh_no());
                                    	al2_id.add(p.getVeh_id());
                                    	ap1++;
                                    }
                                    System.out.println("List 1 :"+al1_id);
                                    System.out.println("List 2 :"+al2_id);
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
	                                    	//al3.add(al1.get(i));
                                    	}                                    	
                                    }    
                                    
                                	for(int j=0;j<al3_id.size();j++)
                                	{
                                		al3.add(hm.get(al3_id.get(j)));
                                		System.out.println("Id : "+al3_id.get(j)+" Name : "+al3.get(j));
                                	}
                                	
                                    %>
                                        <form action="/SMGMT/Driver" method="post" class="form-horizontal login_validator" id="form_block_validator">
                                        
                                         <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                  <label for="required2" class="col-form-label">Vehicle No.*</label>
                                                </div>
                                                
                                                <div class="col-lg-4">
                                                	<select class="form-control chzn-select" tabindex="2" id="required2" name="vehicle_no">
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
                                            </div>
                                            
                                            
                                        
                                            <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                    <label for="required2" class="col-form-label">Name*</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input type="text" id="required2" name="driver_name"  value="" class="form-control" required >
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label for="email2" class="col-form-label">Present Address </label>
                                                </div>
                                                <div class="col-lg-4">
                                                     <textarea id="autosize1" class="form-control" cols="15" rows="3" name="temp_addrs" onkeydown="show_checkbox('autosize1')" onfocus="uncheck('check_disable')"></textarea>
                                                    
                                                </div>
                                              
                                            </div>
                                            
                                            
                                            <div class="form-group row">
                                                <div class="col-lg-4 text-lg-right">
                                                    <label for="email2" class="col-form-label">Permanent Address </label>
                                                </div>
                                                <div class="col-lg-4">
                                                     <textarea id="autosize2" class="form-control" cols="15" rows="3" name="perm_addrs" ></textarea>
                                                    
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
                                                    <input type="text" class="form-control form_val_popup_dp3" name="dob" value="" placeholder="YYYY-MM-DD" required/>
                                                </div>
                                            </div>
                                           
                                           <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                    <label for="required2" class="col-form-label">Phone No*</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input type="text" id="required2" name="digits_only" value="" class="form-control" required >
                                                </div>
                                            </div>
                                            
                                            
                                            <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                    <label for="required2" class="col-form-label">License Number*</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input type="text" id="required2" name="license"  value=""  class="form-control" required>
                                                </div>
                                            </div>
                                            
                                            
                                            
                                           
                                            <div class="form-actions form-group row">
                                                <div class="col-lg-4 push-lg-4">
                                                    <input type="submit" value="Add Driver" name="add_driver_btn" class="btn btn-primary">
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
	                                            <th class="sorting_asc wid-2" tabindex="0" rowspan="1" colspan="1">Id</th>
                                                <th class="sorting wid-20" tabindex="0" rowspan="1" colspan="1">Vehicle No.</th>
                                                <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">Name</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Temp. Address</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Phone No.</th>
                                                <th class="sorting wid-15" tabindex="0" rowspan="1" colspan="1">Status</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Actions</th>
                                            </tr>
                                            </thead>
                                             <%
													DriverDAO driverDAO=new DriverImpl();
													//request.setAttribute("display_vehicle_details", vehicleDAO.getVehicleDetails());
                                                    List<DriverPOJO> ap=driverDAO.getDriverDetails();
										 			int i=0;
										 			//out.print("AP : "+ap.size());
										 			
											%>
                                            <tbody>
                                            <%
                                            	while(i<ap.size())
                                            	{
                                            %>
                                            	<tr role="row" class="even">
	                                            	<td><%=ap.get(i).getId() %></td>
                                            		<td><%=ap.get(i).getVeh_no() %></td>
                                            		<td><%=ap.get(i).getName() %></td>
                                            		<td><%=ap.get(i).getTemp_addrs() %></td>
                                            		<td class="center"><%=ap.get(i).getPhone_no() %></td>
                                            		<td class="center">Approved</td>
                                            		<td>
                                            		<a data-placement="top" data-toggle="modal" title="View" href="#view" onclick="searchDriver(<%=ap.get(i).getId()%>,'view_Updateid','view_mod_required22','view_mod_required2','view_mod_autosize1','view_mod_autosize2','view_mod_date','view_mod_phone','view_mod_licen')">
                                            			<i class="fa fa-eye text-success"></i>
                                            		</a>&nbsp; &nbsp;
                                            		<a class="edit" data-placement="top" data-toggle="modal" title="Edit" href="#update" onclick="searchDriver(<%=ap.get(i).getId()%>,'Updateid','mod_required22','mod_required2','mod_autosize1','mod_autosize2','mod_date','mod_phone','mod_licen')">
                                            		<i class="fa fa-pencil text-warning"></i>
                                            		</a>
                                            		&nbsp; &nbsp;
                                            		<a class="delete hidden-xs hidden-sm" data-toggle="tooltip" data-placement="top" title="Delete" href="/SMGMT/Driver?del_id=<%=ap.get(i).getId() %>" onclick="return confirm('Are you sure you want to delete this item?');">
                                            	<i class="fa fa-trash text-danger"></i>
                                            		</a>
                                            		</td>
                                            		
                                            		<%
                                            			i++;
	                                            	}
                                           		%>
                                           		</tr>
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
                
                
                   
             <!-- 
            
            	UPDATE DRIVER MODAL
            
             -->
                
                  <div class="modal fade pullDown" id="update" role="dialog" aria-labelledby="modalLabelnews">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header bg-warning">
                                <h4 class="modal-title text-white" id="modalLabelnews">Update Vehicle Details</h4>
                            </div>
                            <div class="modal-body">
                              <form action="/SMGMT/Driver" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                                             
                                             
                                             <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                  <label for="required2" class="col-form-label">Vehicle No.*</label>
                                                </div>                                               
                                                
                                            	
                                            	<div class="col-lg-4">
                                            	<input type="hidden" id="Updateid" name="UpdateId">
                                                	<select class="form-control chzn-select" tabindex="2" id="mod_required22" name="mod_vehicle_no">
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
                                                     <textarea id="mod_autosize2" class="form-control" cols="15" rows="3" name="mod_perm_addrs"></textarea>
                                                    
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
                                            
                                            
                                            <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                    <label for="required2" class="col-form-label">License Number*</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input type="text" id="mod_licen" name="mod_license"  value=""  class="form-control" required>
                                                </div>
                                            </div>  
                                            
                                            
                                           
                          				  <div class="modal-footer">
                         					   <button class="btn  btn-success" type="submit" name="updateDriver">Submit</button>
                         				       <button class="btn  btn-warning" data-dismiss="modal" onclick="setFlag()">Close</button>
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
                                <h4 class="modal-title text-white" id="modalLabelnews">View Driver Details</h4>
                            </div>
                            <div class="modal-body">
                              <form action="/SMGMT/Driver" method="post" class="form-horizontal  login_validator" id="form_block_validator">
                                             
                                             
                                             <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                  <label for="required2" class="col-form-label">Vehicle No.*</label>
                                                </div>                                               
                                                
                                            	<div class="col-lg-4">
                                            		<input type="hidden" id="view_Updateid" name="UpdateId" readonly>
                                            		<select class="form-control" id="view_mod_required22" name="mod_vehicle_no" required readonly>                                                	    
                                            	    </select>
                                            	</div>
                                            </div>
                                          
                                            <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                    <label for="required2" class="col-form-label">Name*</label>
                                                </div>
                                                <div class="col-lg-4">                                                 
                                                    <input type="text" id="view_mod_required2" name="mod_driver_name"  value="" class="form-control" required readonly>
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
                                                     <textarea id="view_mod_autosize2" class="form-control" cols="15" rows="3" name="mod_perm_addrs" readonly></textarea>
                                                    
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
                                            
                                            
                                            <div class="form-group row">
                                                <div class="col-lg-4  text-lg-right">
                                                    <label for="required2" class="col-form-label">License Number*</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input type="text" id="view_mod_licen" name="mod_license"  value=""  class="form-control" required readonly>
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
                
                
                
                
                
                
            </div>
            
            
            </div> <!-- /#content -->
        </div>
        
       <!--wrapper-->
       
        
        
<!-- /#wrap -->
<script type="text/javascript" src="/SMGMT/config/js/jquery.min.js"></script>

	<script>   
	
	$(document).ready(function(){  
	        $("#hide_check").hide();  
	       
	    }); 
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
	
	function searchDriver(id,Updateid,mod_required22,mod_required2,mod_autosize1,mod_autosize2,mod_date,mod_phone,mod_licen) 
	{
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
				document.getElementById(mod_licen).value = demoStr[7];
				
				//alert(demoStr[1]);
				x = document.getElementById(mod_required22);
				option = document.createElement("option");
				option.text =demoStr[1];
				option.value =demoStr[8];
				if(flag)
				{	
					//alert("IN"+option.text);
					x.add(option,0);
					x.selectedIndex="0";					
					flag=false;	
				}
				
				}
		}
			
		xhttp.open("POST","/SMGMT/Driver?id="+id, true);
		xhttp.send();
	}	
	
	function setFlag()
	{
		x.remove(0);		
		flag=true;
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